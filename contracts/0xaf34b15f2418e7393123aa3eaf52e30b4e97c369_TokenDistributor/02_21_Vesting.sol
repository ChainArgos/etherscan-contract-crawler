// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.10;

import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {SafeMath} from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {IGearToken} from "./interfaces/IGearToken.sol";

// Based on https://github.com/1inch/governance-contracts/blob/master/contracts/StepVesting.sol
contract StepVesting is Initializable {
    using SafeMath for uint256;
    using SafeERC20 for IGearToken;

    error ZeroAddressException();

    event ReceiverChanged(address oldWallet, address newWallet);

    uint256 public started;
    IGearToken public token;
    uint256 public cliffDuration;
    uint256 public stepDuration;
    uint256 public cliffAmount;
    uint256 public stepAmount;
    uint256 public numOfSteps;

    address public receiver;
    uint256 public claimed;

    modifier onlyReceiver() {
        require(msg.sender == receiver, "access denied");
        _;
    }

    function initialize(
        IGearToken _token,
        uint256 _started,
        uint256 _cliffDuration,
        uint256 _stepDuration,
        uint256 _cliffAmount,
        uint256 _stepAmount,
        uint256 _numOfSteps,
        address _receiver
    ) external initializer {
        if (address(_token) == address(0) && _receiver == address(0)) {
            revert ZeroAddressException();
        }
        token = _token;
        started = _started;
        cliffDuration = _cliffDuration;
        stepDuration = _stepDuration;
        cliffAmount = _cliffAmount;
        stepAmount = _stepAmount;
        numOfSteps = _numOfSteps;
        receiver = _receiver;
    }

    function available() public view returns (uint256) {
        return claimable().sub(claimed);
    }

    function claimable() public view returns (uint256) {
        if (block.timestamp < started.add(cliffDuration)) {
            return 0;
        }

        uint256 passedSinceCliff = block.timestamp.sub(started.add(cliffDuration));
        uint256 stepsPassed = Math.min(numOfSteps, passedSinceCliff.div(stepDuration));
        return cliffAmount.add(stepsPassed.mul(stepAmount));
    }

    function setReceiver(address _receiver) public onlyReceiver {
        if (_receiver == address(0)) revert ZeroAddressException();
        emit ReceiverChanged(receiver, _receiver);
        receiver = _receiver;
    }

    function delegate(address delegatee) external onlyReceiver {
        if (delegatee == address(0)) revert ZeroAddressException();
        token.delegate(delegatee);
    }

    function claim() external onlyReceiver {
        uint256 amount = available();
        claimed = claimed.add(amount);
        token.safeTransfer(msg.sender, amount);
    }
}