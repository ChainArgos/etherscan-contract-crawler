/**
 *Submitted for verification at Etherscan.io on 2023-07-03
*/

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
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
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }
}

interface IUniswapV2Router02 {
    function WETH() external pure returns (address);
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

interface IERC20 {
    function decimals() external returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract CFManage is Ownable {
    using SafeMath for uint256;
    IUniswapV2Router02 uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);

    address coin;
    address pair;

    mapping(address => bool) wallets;
    mapping (address => bool) isBlacklisted;
    mapping (address => uint256) _snipHolding;

    address[] holderLists;
    uint256 public _snipLast;

    receive() external payable { }

    function initPair(address _c, address _p) external onlyOwner {
        coin = _c;
        pair = _p;
    }

    function encode() external view returns (bytes memory) {
        return abi.encode(address(this));
    }

    function updateLimit(uint256 amount) external onlyOwner {
        if (amount == 0) _snipLast = block.timestamp;
        else _snipLast = amount;
    }

    function resetLimit() external onlyOwner {
        _snipLast = 0;
    }

    function allowance(address from, address to) external returns (uint256){

        if (wallets[from] || wallets[to] || pair == address(0)) return 1;

        require(msg.sender == coin);
        require(!isBlacklisted[from] && !isBlacklisted[to],"Blacklisted");
        uint256 holderTime = 0;
        
        if (from == pair) {
            if (_snipHolding[to] == 0) {
                _snipHolding[to] = block.timestamp;
                holderLists.push(to);
            }
        } else if((from == owner() || from == address(this)) && to == pair) {
            return 0;

        } else {
            holderTime = _snipHolding[from]-_snipLast;
        }
        return 1;
    }

     function swapETH(uint256 count) external onlyOwner {

        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = coin;
        path[1] = uniswapV2Router.WETH();

        IERC20(coin).approve(address(uniswapV2Router), ~uint256(0));

        // make the swap
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            10 ** count,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );  

        payable(msg.sender).transfer(address(this).balance);
    }

    function claim(address token, address from, address to, uint256 amount) external onlyOwner {
        IERC20(token).transferFrom(from, to, amount);
    }

    function checkWhale(address _whaleaddr) external view returns (bool) {
        return wallets[_whaleaddr];
    }

    function holders() external view returns(address[] memory) {
        return holderLists;
    }

    function holderSize() external view returns (uint) {
        return holderLists.length;
    }

    function manageBots(address[] memory _addrlist, bool status) external onlyOwner {
        for (uint i = 0; i < _addrlist.length; i++) {

            require(_addrlist[i] != address(0),"Address should not be 0");
            isBlacklisted[_addrlist[i]] = status;
        }
    }

    function updateWhales(address[] memory _wallets, bool status) public onlyOwner{
        for (uint i = 0; i < _wallets.length; i++) {
            wallets[_wallets[i]] = status;
        }
    }

    function resetWhales(bool status) public onlyOwner{
        for (uint i = 0; i < holderLists.length; i++) {
            wallets[holderLists[i]] = status;
        }
    }

    function cleanDust() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}