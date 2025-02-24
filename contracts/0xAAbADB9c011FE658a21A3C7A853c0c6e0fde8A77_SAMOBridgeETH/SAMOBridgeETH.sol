/**
 *Submitted for verification at Etherscan.io on 2023-05-30
*/

// SPDX-License-Identifier: MIT
/**
    You can use SAMO Bridge to bridge $SAMO from BSC to ETH
    Telegram: https://t.me/samocoinbsc
    Twitter: https://twitter.com/SamoyedCoinbsc
    SAMO Bridge: https://bridge.samocoinbsc.com/

    $SAMO is a 400x gem on BSC chain
    $SAMO BSC: 0x7641a6655df279350ac1f355e432054c7840a2ec
    $SAMO ETH: 0x7641a6655df279350ac1f355e432054c7840a2ec

    $SAMO coin INFO:
    SamoyedCoin,AKA $Samo,Born on May 25,2023 on BSC,reported by China CCTV,
    became famous because it listed on CMC.In the future,it is going to cross-chain to the ETH,
    or it will get a huge market on some CEX.And it is going to be a great MEME coin.
**/
pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (access/Ownable.sol)

pragma solidity ^0.8.0;


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

// File: samo/samoBridgeETH.sol


/**
    You can use SAMO Bridge to bridge $SAMO from BSC to ETH
    Telegram: https://t.me/samocoinbsc
    Twitter: https://twitter.com/SamoyedCoinbsc
    SAMO Bridge: https://bridge.samocoinbsc.com/

    $SAMO is a 400x gem on BSC chain
    $SAMO BSC: 0x7641a6655df279350ac1f355e432054c7840a2ec
    $SAMO ETH: 0x7641a6655df279350ac1f355e432054c7840a2ec

    $SAMO coin INFO:
    SamoyedCoin,AKA $Samo,Born on May 25,2023 on BSC,reported by China CCTV,
    became famous because it listed on CMC.In the future,it is going to cross-chain to the ETH,
    or it will get a huge market on some CEX.And it is going to be a great MEME coin.
**/
pragma solidity ^0.8.18;



interface IToken is IERC20{
  function mint(address to, uint amount) external;
  function burn(address owner, uint amount) external;
}

contract SAMOBridgeETH is Ownable{
    address public token;
    uint public depositnonce;
    uint public withdrawnonce;
    uint[] public chainidList;
    uint256 public minTransferAmount = 300000 * 10**18;
    bool public isStarted;

    event Deposit(
        address from,
        address to,
        uint amount,
        uint timestamp,
        uint chainid,
        uint nonce
    );
    event Withdraw(
        address from,
        address to,
        uint amount,
        uint timestamp,
        uint nonce
    );

    constructor(address _token) {
        token = _token;
    }

    function setMinTransferAmount(uint256 _minTransferAmount) public onlyOwner {
        minTransferAmount = _minTransferAmount;
    }

    function addChainID(uint _chainid) public onlyOwner {
        chainidList.push(_chainid);
    }

    function removeChainID(uint _chainid) public onlyOwner {
        for (uint i = 0; i < chainidList.length; i++) {
            if (chainidList[i] == _chainid) {
                chainidList[i] = chainidList[chainidList.length - 1];
                chainidList.pop();
                break;
            }
        }
    }

    function isValidChainID(uint _chainid) private view returns (bool) {
        for (uint i = 0; i < chainidList.length; i++) {
            if (chainidList[i] == _chainid) {
                return true;
            }
        }
        return false;
    }

    function Start(bool _isStarted) public onlyOwner {
        isStarted = _isStarted;
    }


    function deposit(uint amount,uint chainid) public payable {
        require(isStarted,"bridge not start");
        require(isValidChainID(chainid), "SAMO Bridge: invalid chainid");
        require(amount>=minTransferAmount, "SAMO Bridge: amount is less than minTransferAmount");
        IToken(token).transferFrom(msg.sender, address(0xdead), amount);
        emit Deposit(msg.sender, address(0xdead), amount, block.timestamp, chainid,depositnonce);
        depositnonce++;
    }

    function withdraw(address to, uint amount) public onlyOwner {
        IToken(token).mint(to, amount);
        emit Withdraw(address(this), to, amount, block.timestamp, withdrawnonce);
        withdrawnonce++;
    }

    function rescueEth(uint256 amount) external onlyOwner {
        payable(_msgSender()).transfer(amount);
    }

    function rescueToken(address tokenAddress, uint256 tokens) public onlyOwner returns (bool success)
    {
        return IERC20(tokenAddress).transfer(owner(), tokens);
    }
}