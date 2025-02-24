//SPDX-License-Identifier: BUSL-1.1

pragma solidity =0.7.6;
pragma abicoder v2;

import {ICrabStrategyV2} from "../interfaces/ICrabStrategyV2.sol";
import {IWETH9} from "../interfaces/IWETH9.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {Address} from "@openzeppelin/contracts/utils/Address.sol";
import {EIP712} from "@openzeppelin/contracts/drafts/EIP712.sol";
import {ECDSA} from "@openzeppelin/contracts/cryptography/ECDSA.sol";
import {StrategyMath} from "./base/StrategyMath.sol";

contract CrabOTC is EIP712 {
    using StrategyMath for uint256;
    using Address for address payable;

    address public immutable crab;
    address public immutable weth;
    address public immutable controller;
    address public immutable wPowerPerp;
    mapping(address => mapping(uint256 => bool)) public nonces;

    struct Order {
        address initiator;
        address trader;
        uint256 quantity;
        uint256 price;
        bool isBuying;
        uint256 expiry;
        uint256 nonce;
        uint8 v;
        bytes32 r;
        bytes32 s;
    }

    event DepositOTC(
        address indexed depositor,
        uint256 crabAmount,
        uint256 wSqueethAmount,
        uint256 depositedAmount,
        uint256 executedPrice,
        address trader
    );

    event WithdrawOTC(
        address indexed depositor,
        uint256 crabAmount,
        uint256 ethSent,
        uint256 wSqueethAmount,
        uint256 executedPrice,
        address trader
    );

    bytes32 private constant _CRAB_BALANCE_TYPEHASH =
        keccak256(
            "Order(address initiator,address trader,uint256 quantity,uint256 price,bool isBuying,uint256 expiry,uint256 nonce)"
        );

    constructor(address _crab) EIP712("CrabOTC", "2") {
        require(_crab != address(0), "Invalid crab address");

        crab = _crab;
        weth = ICrabStrategyV2(_crab).weth();
        controller = ICrabStrategyV2(_crab).powerTokenController();
        wPowerPerp = ICrabStrategyV2(_crab).wPowerPerp();
        IERC20(ICrabStrategyV2(_crab).wPowerPerp()).approve(_crab, type(uint256).max);
    }

    /**
     * @notice set nonce to true
     * @param _nonce the number to be set true
     */
    function setNonceTrue(uint256 _nonce) external {
        nonces[msg.sender][_nonce] = true;
    }

    /**
     * @dev Deposit into strategy by selling the minted oSqth
     * @param _totalEth Total amount of ETH to deposit value + eth from selling minted oSqth
     * @param _order A signed order to swap the tokens
     */
    function deposit(uint256 _totalEth, Order memory _order) external payable {
        _verifyOrder(_order);
        require(_order.isBuying, "Should be a buy order");

        uint256 depositedEth = msg.value;

        uint256 wSqueethQuantity = _getWSqueethToMint(_totalEth);
        require(_order.quantity >= wSqueethQuantity, "Order quantity is less than needed");

        uint256 wethAmount = wSqueethQuantity.wmul(_order.price);

        IWETH9(weth).transferFrom(_order.trader, address(this), wethAmount);
        IWETH9(weth).withdraw(wethAmount);

        ICrabStrategyV2(crab).deposit{value: _totalEth}();
        uint256 crabAmount = IERC20(crab).balanceOf(address(this));
        IERC20(crab).transfer(_order.initiator, crabAmount);
        IERC20(wPowerPerp).transfer(_order.trader, wSqueethQuantity);

        uint256 excessEth = address(this).balance;

        if (excessEth > uint256(0)) {
            depositedEth = depositedEth.sub(excessEth);
            payable(_order.initiator).sendValue(excessEth);
        }

        emit DepositOTC(_order.initiator, crabAmount, wSqueethQuantity, depositedEth, _order.price, _order.trader);
    }

    /**
     * @dev Withdraw from strategy by buying osqth
     * @param _crabAmount Amount of crab to withdraw
     * @param _order A signed order to swap the tokens
     */
    function withdraw(
        uint256 _crabAmount,
        uint256 _maxPrice,
        Order memory _order
    ) external payable {
        _verifyOrder(_order);
        require(!_order.isBuying, "Should be a sell order");

        uint256 quantity = _getDebtFromStrategyAmount(_crabAmount);
        require(_order.quantity >= quantity, "Order quantity is less than needed");
        require(_order.price <= _maxPrice, "Order price is greater than max Price");

        IERC20(crab).transferFrom(_order.initiator, address(this), _crabAmount);
        IERC20(wPowerPerp).transferFrom(_order.trader, address(this), quantity);

        ICrabStrategyV2(crab).withdraw(_crabAmount);

        uint256 ethToPay = quantity.wmul(_order.price);
        IWETH9(weth).deposit{value: ethToPay}();
        IWETH9(weth).transfer(_order.trader, ethToPay);

        uint256 _withdrawAmount = address(this).balance;

        if (_withdrawAmount > uint256(0)) {
            payable(_order.initiator).sendValue(_withdrawAmount);
        }

        emit WithdrawOTC(_order.initiator, _crabAmount, _withdrawAmount, quantity, _order.price, _order.trader);
    }

    /**
     * @dev set nonce flag of the trader to true
     * @param _trader address of the signer
     * @param _nonce number that is to be traded only once
     */
    function _useNonce(address _trader, uint256 _nonce) internal {
        require(!nonces[_trader][_nonce], "Nonce already used");
        nonces[_trader][_nonce] = true;
    }

    /**
     * @dev Check if the order is valid or not
     * @param _order A signed order to swap the tokens
     */
    function _verifyOrder(Order memory _order) internal {
        require(_order.initiator == msg.sender, "Initiator should be the sender");

        _useNonce(_order.trader, _order.nonce);

        bytes32 structHash = keccak256(
            abi.encode(
                _CRAB_BALANCE_TYPEHASH,
                _order.initiator,
                _order.trader,
                _order.quantity,
                _order.price,
                _order.isBuying,
                _order.expiry,
                _order.nonce
            )
        );

        bytes32 hash = _hashTypedDataV4(structHash);
        address offerSigner = ECDSA.recover(hash, _order.v, _order.r, _order.s);
        require(offerSigner == _order.trader, "Invalid offer signature");
        require(_order.expiry >= block.timestamp, "Order has expired");
    }

    /**
     * @dev For the given amount of eth, gives the wsqueeth to mint
     * @param _ethToDeposit Amount of ETH to deposit
     */
    function _getWSqueethToMint(uint256 _ethToDeposit) internal view returns (uint256) {
        (, , uint256 collatAmount, uint256 shortAmount) = ICrabStrategyV2(crab).getVaultDetails();

        return _ethToDeposit.wmul(shortAmount).wdiv(collatAmount);
    }

    /**
     * @notice get strategy debt amount for a specific strategy token amount
     * @param _strategyAmount strategy amount
     * @return debt amount
     */
    function _getDebtFromStrategyAmount(uint256 _strategyAmount) internal view returns (uint256) {
        (, , , uint256 strategyDebt) = ICrabStrategyV2(crab).getVaultDetails();
        return strategyDebt.wmul(_strategyAmount).wdiv(ICrabStrategyV2(crab).totalSupply());
    }

    /**
     * @notice receive function to allow ETH transfer to this contract
     */
    receive() external payable {
        require(msg.sender == weth || msg.sender == crab, "Cannot receive eth");
    }
}