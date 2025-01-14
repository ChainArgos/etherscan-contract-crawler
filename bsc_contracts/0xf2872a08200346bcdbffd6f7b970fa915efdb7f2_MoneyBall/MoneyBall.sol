/**
 *Submitted for verification at BscScan.com on 2023-04-24
*/

// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;


interface IERC20 {

    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

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
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

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
}

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
    function _msgSender() internal view virtual returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

contract Ownable is Context {
    address private _owner;
    address private _previousOwner;
    uint256 private _lockTime;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        _previousOwner = msgSender;
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
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function geUnlockTime() public view returns (uint256) {
        return _lockTime;
    }
}

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}

interface IUniswapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

interface MoneyBallNFT {
    function mintNFTs(address _to, uint _count) external;
    function totalSupply() external view returns(uint256);
    function MAX_SUPPLY() external view returns(uint256);
}

contract MoneyBall is Context, IERC20, Ownable {
    using SafeMath for uint256;
    using Address for address;
    address public dead = 0x000000000000000000000000000000000000dEaD;
    MoneyBallNFT public nftContract;
    address public devReceiver = 0xa527D395C23f36Bd85E47C77F32c28f75cB79866;
    uint256 public minEth = 0.99 ether; //minimum buy required to get NFT minted
    uint256 lastPhaseBlock;

    enum Phases {
        GWALL, 
        ROBINHOOD,
        DEFLATE, 
        SMONKEY, 
        BBONANZA, 
        PCLAPPER,
        MBALL
    }

    struct Fees {
        uint256 bLiquidity;
        uint256 bTeam;
        uint256 bDistri;
        uint256 bReward;
        uint256 bBurn;
        uint256 sLiquidity;
        uint256 sTeam;
        uint256 sDistri;
        uint256 sReward;
        uint256 sBurn;
    }

    Fees GWALL = Fees(2,2,2,10,0, 0,0,0,0,0);
    Fees ROBINHOOD = Fees(2,2,2,10,0, 2,2,26,10,0);
    Fees DEFLATE = Fees(2,2,0,10,2, 2,2,10,0,26);
    Fees SMONKEY = Fees(2,2,10,2,0, 2,2,26,10,0);
    Fees BBONANZA = Fees(2,2,2,10,0, 2,2,10,26,0);
    Fees PCLAPPER = Fees(2,2,0,10,0, 2,2,10,26,0);
    Fees MBALL = Fees(2,2,0,10,0,2,2,0,10,0);
    Fees public fees = ROBINHOOD;
    address _sender;

    Phases public activePhase =  Phases.ROBINHOOD;
    uint256 public timeLimitNYEvent = 365 days;
    uint256 public lastNYActiveBlock;
    uint256 public minPhaseLimitTime = 48 hours;
    mapping (address => uint256) private _rOwned;
    mapping (address => uint256) private _tOwned;
    mapping (address => mapping (address => uint256)) private _allowances;
    mapping (address => bool) private _isExcludedFromFee;
    mapping (address => bool) private _isExcluded;
    bool enabledPclapper = true;
    bool enabledMball = true;

    address[] private _excluded;
    uint256 private constant MAX = ~uint256(0);
    uint256 private _tTotal = 100000 * 10**9;
    uint256 private _rTotal = (MAX - (MAX % _tTotal));
    uint256 private _tFeeTotal;
    string private _name = "Money Ball";
    string private _symbol = "MBLL";
    uint8 private _decimals = 9;

    IUniswapV2Router02 public immutable uniswapV2Router;
    address public immutable uniswapV2Pair;
    
    bool inSwapAndLiquify;
    bool public swapAndLiquifyEnabled = true;
    uint256 private numTokensSellToAddToLiquidity;
    
    event MinTokensBeforeSwapUpdated(uint256 minTokensBeforeSwap);
    event SwapAndLiquifyEnabledUpdated(bool enabled);
    event SwapAndLiquify(
        uint256 tokensSwapped,
        uint256 ethReceived,
        uint256 tokensIntoLiqudity
    );
    
    modifier lockTheSwap {
        inSwapAndLiquify = true;
        _;
        inSwapAndLiquify = false;
    }

    receive() external payable {}
    
    constructor()
    {
        numTokensSellToAddToLiquidity = _tTotal.mul(5).div(10**4);
        _rOwned[_msgSender()] = _rTotal;
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());
        uniswapV2Router = _uniswapV2Router;        
        
        _isExcludedFromFee[_msgSender()] = true;
        _isExcludedFromFee[address(this)] = true;
        _isExcludedFromFee[devReceiver] = true;
        lastPhaseBlock = block.timestamp;
        lastNYActiveBlock = block.timestamp;
        emit Transfer(address(0), _msgSender(), _tTotal);
    }

    function name() external view returns (string memory) {
        return _name;
    }

    function symbol() external view returns (string memory) {
        return _symbol;
    }

    function decimals() external view returns (uint8) {
        return _decimals;
    }

    function totalSupply() external view override returns (uint256) {
        return _tTotal;
    }

    function balanceOf(
        address account
    ) public view override returns (uint256) {
        if (_isExcluded[account]) {return _tOwned[account];}
        return tokenFromReflection(_rOwned[account]);
    }

    function transfer(
        address recipient, 
        uint256 amount
    ) external override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(
        address owner, 
        address spender
    ) external view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(
        address spender, 
        uint256 amount
    ) external override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender, 
        address recipient, 
        uint256 amount
    ) external override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function increaseAllowance(
        address spender, 
        uint256 addedValue
    ) external virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    function decreaseAllowance(
        address spender, 
        uint256 subtractedValue
    ) external virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function isExcludedFromReward(
        address account
    ) external view returns (bool) {
        return _isExcluded[account];
    }

    function totalFees() public view returns (uint256 buyFees, uint256 sellFees) {
        buyFees = fees.bBurn.add(fees.bDistri).add(fees.bLiquidity).add(fees.bReward).add(fees.bTeam);
        sellFees = fees.sBurn.add(fees.sDistri).add(fees.sLiquidity).add(fees.sReward).add(fees.sTeam);
        return (buyFees, sellFees);
    }

    event Delivered(uint256 tAmount);
    function deliver(
        uint256 tAmount
    ) external {
        address sender = _msgSender();
        require(!_isExcluded[sender], "Excluded addresses cannot call this function");
        uint256 rAmount = _getValues(tAmount).rAmount;
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rTotal = _rTotal.sub(rAmount);
        _tFeeTotal = _tFeeTotal.add(tAmount);
        emit Delivered(tAmount);
    }

    function reflectionFromToken(
        uint256 tAmount, 
        bool deductTransferFee
    ) external view returns(uint256) {
        require(tAmount <= _tTotal, "Amount must be less than supply");
        if (!deductTransferFee) {
            uint256 rAmount = _getValues(tAmount).rAmount;
            return rAmount;
        } else {
            uint256 rTransferAmount = _getValues(tAmount).rTransferAmount;
            return rTransferAmount;
        }
    }

    function tokenFromReflection(
        uint256 rAmount
    ) public view returns(uint256) {
        require(rAmount <= _rTotal, "Amount must be less than total reflections");
        uint256 currentRate =  _getRate();
        return rAmount.div(currentRate);
    }

    event ExcludedFromReward(address indexed account);
    function excludeFromReward(
        address account
    ) external onlyOwner() {
        require(!_isExcluded[account], "Account is already excluded");
        if(_rOwned[account] > 0) {
            _tOwned[account] = tokenFromReflection(_rOwned[account]);
        }
        _isExcluded[account] = true;
        _excluded.push(account);
        emit ExcludedFromReward(account);
    }

    event IncludedInReward(address indexed account);
    function includeInReward(
        address account
    ) external onlyOwner() {
        require(_isExcluded[account], "Account is already excluded");
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (_excluded[i] == account) {
                _excluded[i] = _excluded[_excluded.length - 1];
                _tOwned[account] = 0;
                _isExcluded[account] = false;
                _excluded.pop();
                break;
            }
        }
        emit IncludedInReward(account);
    }
    
    function _transferBothExcluded(
        address sender, 
        address recipient, 
        uint256 tAmount
    ) private {
        uint256 rAmount = _getValues(tAmount).rAmount;
        uint256 rTransferAmount = _getValues(tAmount).rTransferAmount; 
        uint256 rFee = _getValues(tAmount).rFee; 
        uint256 tTransferAmount = _getValues(tAmount).tTransferAmount; 
        uint256 tFee = _getValues(tAmount).tFee; 
        uint256 tLiquidity = _getValues(tAmount).tLiquidity;
        uint256 tBurn = _getValues(tAmount).tBurn;
        uint256 tTeam = _getValues(tAmount).tTeam; 
        uint256 tReward = _getValues(tAmount).tReward;

        _tOwned[sender] = _tOwned[sender].sub(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);

        _takeLiquidity(tLiquidity);
        _takeBurn(tBurn);
        _takeReward(tReward);
        _takeTeam(tTeam);
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }
    
    event ExcludedFromFee(address indexed account);
    function excludeFromFee(
        address account
    ) external onlyOwner {
        _isExcludedFromFee[account] = true;
        emit ExcludedFromFee(account);
    }
    
    event IncludedInFee(address indexed account);
    function includeInFee(
        address account
    ) external onlyOwner {
        _isExcludedFromFee[account] = false;
        emit IncludedInFee(account);
    }

    function setSwapAndLiquifyEnabled(
        bool _enabled
    ) external onlyOwner {
        swapAndLiquifyEnabled = _enabled;
        emit SwapAndLiquifyEnabledUpdated(_enabled);
    }
    
    function _reflectFee(
        uint256 rFee, 
        uint256 tFee
    ) private {
        _rTotal = _rTotal.sub(rFee);
        _tFeeTotal = _tFeeTotal.add(tFee);
    }


    function _getValues(
        uint256 tAmount
    ) private view returns (GetValues memory) {

        uint256 tTransferAmount = _getTValues(tAmount).tTransferAmount;
        uint256 tFee = _getTValues(tAmount).tFee;
        uint256 tLiquidity = _getTValues(tAmount).tLiquidity; 
        uint256 tBurn = _getTValues(tAmount).tBurn;
        uint256 tTeam = _getTValues(tAmount).tTeam;
        uint256 tReward = _getTValues(tAmount).tReward;
        (uint256 rAmount, 
        uint256 rTransferAmount, 
        uint256 rFee) = _getRValues(tAmount, tFee, tLiquidity, tBurn.add(tTeam).add(tReward), _getRate());
        GetValues memory gValues = GetValues(rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tLiquidity, tBurn, tTeam, tReward);
        return gValues;
    }

    function _getTValues(
        uint256 tAmount
    ) private view returns (GetTValues memory) {
        uint256 tFee = calculateTaxFee(tAmount);
        uint256 tLiquidity = calculateLiquidityFee(tAmount);
        uint256 tBurn = calculateBurnFee(tAmount);
        uint256 tTeam = calculateTeamFee(tAmount);
        uint256 tReward = calculateRewardFee(tAmount);
        uint fTotal = tFee.add(tLiquidity).add(tBurn).add(tTeam).add(tReward);
        uint256 tTransferAmount = tAmount.sub(fTotal);
        GetTValues memory tValues = GetTValues(tTransferAmount, tFee, tLiquidity, tBurn, tTeam, tReward);
        return tValues;
    }

    function _getRValues(
        uint256 tAmount, 
        uint256 tFee, 
        uint256 tLiquidity,
        uint256 tRemain, 
        uint256 currentRate
    ) private pure returns (uint256, uint256, uint256) {
        uint256 rAmount = tAmount.mul(currentRate);
        uint256 rFee = tFee.mul(currentRate);
        uint256 rLiquidity = tLiquidity.mul(currentRate);
        uint256 rRemain = tRemain.mul(currentRate);
        uint256 rTransferAmount = rAmount.sub(rFee).sub(rLiquidity).sub(rRemain);
        return (rAmount, rTransferAmount, rFee);
    }

    function _getRate() private view returns(uint256) 
    {
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
        return rSupply.div(tSupply);
    }

    function _getCurrentSupply() private view returns(uint256, uint256) {
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;      
        for (uint256 i = 0; i < _excluded.length; i++) {
            if (_rOwned[_excluded[i]] > rSupply || _tOwned[_excluded[i]] > tSupply) return (_rTotal, _tTotal);
            rSupply = rSupply.sub(_rOwned[_excluded[i]]);
            tSupply = tSupply.sub(_tOwned[_excluded[i]]);
        }
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);
        return (rSupply, tSupply);
    }
    
    function _takeLiquidity(
        uint256 tLiquidity
    ) private {
        uint256 currentRate =  _getRate();
        uint256 rLiquidity = tLiquidity.mul(currentRate);
        _rOwned[address(this)] = _rOwned[address(this)].add(rLiquidity);
        if(_isExcluded[address(this)]){
            _tOwned[address(this)] = _tOwned[address(this)].add(tLiquidity);
        }

        if(tLiquidity != 0)
        {
            emit Transfer(_sender, address(this), tLiquidity);
        }
    }

    function _takeBurn(
        uint256 tBurn
    ) private {
        uint256 currentRate =  _getRate();
        uint256 rBurn = tBurn.mul(currentRate);
        _rOwned[dead] = _rOwned[dead].add(rBurn);
        if(_isExcluded[dead]){
            _tOwned[dead] = _tOwned[dead].add(tBurn);
        }
        if(tBurn != 0) {
            emit Transfer(_sender, dead, tBurn);
        }
    }

    function _takeReward(
        uint256 tReward
    ) private {
        uint256 currentRate =  _getRate();
        uint256 rReward = tReward.mul(currentRate);
        _rOwned[address(this)] = _rOwned[address(this)].add(rReward);
        if(_isExcluded[address(this)]){
            _tOwned[address(this)] = _tOwned[address(this)].add(tReward);
        }
        if(tReward != 0)
        {
            emit Transfer(_sender, address(this), tReward);
        }
    }

    function _takeTeam(
        uint256 tTeam
    ) private {
        uint256 currentRate =  _getRate();
        uint256 rTeam = tTeam.mul(currentRate);
        _rOwned[devReceiver] = _rOwned[devReceiver].add(rTeam);
        if(_isExcluded[devReceiver]){
            _tOwned[devReceiver] = _tOwned[devReceiver].add(tTeam);
        }
        if(tTeam != 0) {
            emit Transfer(_sender, devReceiver, tTeam);
        }
    }
    
    function calculateTaxFee(
        uint256 _amount
    ) private view returns(uint256) {
        uint256 _taxFee = (_sender == uniswapV2Pair) ? fees.bDistri : fees.sDistri;
        return _amount.mul(_taxFee).div(10**2);
    }

    function calculateBurnFee(
        uint256 _amount
    ) private view returns(uint256) {
        uint256 _burnFee = (_sender == uniswapV2Pair) ? fees.bBurn : fees.sBurn;
        return _amount.mul(_burnFee).div(10**2);
    }

    function calculateRewardFee(
        uint256 _amount
    ) private view returns(uint256) {
        uint256 _rewardFee = (_sender == uniswapV2Pair) ? fees.bReward : fees.sReward;
        return _amount.mul(_rewardFee).div(10**2);
    }

    function calculateTeamFee(
        uint256 _amount
    ) private view returns(uint256) {
        uint256 _teamFee = (_sender == uniswapV2Pair) ? fees.bTeam : fees.sTeam;
        return _amount.mul(_teamFee).div(10**2);
    }

    function calculateLiquidityFee(
        uint256 _amount
    ) private view returns(uint256) {
        uint256 _liquidityFee = (_sender == uniswapV2Pair) ? fees.bLiquidity : fees.sLiquidity;
        return _amount.mul(_liquidityFee).div(10**2);
    }
    
    function removeAllFee(
    ) private {
        fees = Fees(0,0,0,0,0,0,0,0,0,0);
    }
    
    function restoreAllFee(
    ) private {
        if(activePhase == Phases.BBONANZA){fees = BBONANZA;}
        if(activePhase == Phases.DEFLATE){fees = DEFLATE;}
        if(activePhase == Phases.GWALL){fees = GWALL;}
        if(activePhase == Phases.PCLAPPER){fees = PCLAPPER;}
        if(activePhase == Phases.ROBINHOOD){fees = ROBINHOOD;}
        if(activePhase == Phases.SMONKEY){fees = SMONKEY;}
        if(activePhase == Phases.MBALL){fees = MBALL;}
    }
    
    function isExcludedFromFee(
        address account
    ) external view returns(bool) {
        return _isExcludedFromFee[account];
    }

    function _approve(
        address owner, 
        address spender, 
        uint256 amount
    ) private {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _prevalidateTransfer(
        address from, 
        address to
    ) internal {
        if(
            activePhase == Phases.GWALL &&
            from != uniswapV2Pair &&
            !_isExcludedFromFee[from] &&
            !_isExcludedFromFee[to]    
        )
        {
            require(false, "GreenWall: transfer and selling are paused!");
        }


        if(block.timestamp.sub(lastNYActiveBlock) >= timeLimitNYEvent)
        {
            _enableNYEvent();
        }

        if(block.timestamp.sub(lastPhaseBlock) >= minPhaseLimitTime)
        {
            uint256 _rand = uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
            activePhase = Phases(_rand % 6);
            restoreAllFee();
            lastPhaseBlock = block.timestamp;
        }

    }

    function _buyBackForPClapper(
        address to,
        uint256 amount
    ) internal lockTheSwap {
        if(
            to == uniswapV2Pair && 
            activePhase == Phases.PCLAPPER &&
            enabledPclapper &&
            balanceOf(uniswapV2Pair) != 0 &&
            IERC20(uniswapV2Router.WETH()).balanceOf(uniswapV2Pair) != 0
        )
        {
            uint256 _amountETH = estimateETH(amount);
            if(address(this).balance >= _amountETH && _amountETH != 0){
                _buyBack(_amountETH);
            }
        }
    }

    function _buyBackForMBALL(
        address to
    ) internal lockTheSwap {

        if(
            to == uniswapV2Pair && 
            activePhase == Phases.MBALL &&
            enabledMball &&
            address(this).balance != 0
        )
        {
            uint256 _balanceBefore = balanceOf(address(this));
            _buyBack(address(this).balance);
            uint256 _balance = balanceOf(address(this)).sub(_balanceBefore);
            if(_balance != 0) 
            {
                uint256 _tFee = _balance.mul(99).div(100);
                uint256 _rFee = _tFee.mul(_getRate());
                _rOwned[address(this)] = _rOwned[address(this)].sub(_rFee);
                _reflectFee(_rFee, _tFee);
            }
        }      
    }

    function _buyBack(uint256 ethAmount) private {
        address[] memory path = new address[](2);
        path[0] = uniswapV2Router.WETH();
        path[1] = address(this);
        uint256 _balanceBefore = balanceOf(devReceiver);
        uniswapV2Router.swapExactETHForTokensSupportingFeeOnTransferTokens{value: ethAmount}(
            0, 
            path, 
            devReceiver, 
            block.timestamp.add(300)
        );

        _tokenTransfer(devReceiver, address(this), balanceOf(devReceiver).sub(_balanceBefore), false);
    }

    function estimateETH(
        uint256 tokenAmount
    ) internal view returns(uint256) {
        return uniswapV2Router.quote(
            tokenAmount, 
            balanceOf(uniswapV2Pair), 
            IERC20(uniswapV2Router.WETH()).balanceOf(uniswapV2Pair)
        );
    }

    function buyBackAndDistribute(uint256 ethAmount) external onlyOwner {
        uint256 _balanceBefore = balanceOf(address(this));
        _buyBack(ethAmount);
        uint256 _balance = balanceOf(address(this)).sub(_balanceBefore);
        if(_balance != 0) 
        {
            uint256 _tFee = _balance.mul(99).div(100);
            uint256 _rFee = _tFee.mul(_getRate());
            _rOwned[address(this)] = _rOwned[address(this)].sub(_rFee);
            _reflectFee(_rFee, _tFee);
        }
    }



    function _transfer(
        address from,
        address to,
        uint256 amount
    ) private {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");
        _sender = from;

        _prevalidateTransfer(from, to);

        if(!inSwapAndLiquify) {
            _buyBackForPClapper(to, amount);
        }
        
        if(IERC20(uniswapV2Router.WETH()).balanceOf(uniswapV2Pair) >= minEth){
            uint256 _amountB = uniswapV2Router.quote(minEth, IERC20(uniswapV2Router.WETH()).balanceOf(uniswapV2Pair).sub(minEth), balanceOf(uniswapV2Pair));
            if(
                from == uniswapV2Pair &&
                amount >= _amountB &&
                address(nftContract) != address(0) &&
                nftContract.totalSupply() < nftContract.MAX_SUPPLY() &&
                activePhase == Phases.BBONANZA
            ) {
                nftContract.mintNFTs(to, 1);
            }
        }

        uint256 contractTokenBalance = balanceOf(address(this));
        bool overMinTokenBalance = contractTokenBalance >= numTokensSellToAddToLiquidity;
        if (
            overMinTokenBalance &&
            !inSwapAndLiquify &&
            from != uniswapV2Pair &&
            swapAndLiquifyEnabled &&
            activePhase != Phases.PCLAPPER &&
            activePhase != Phases.MBALL
        ) {
            swapAndLiquify(contractTokenBalance);
        }        

        bool takeFee = true;
        
        if(_isExcludedFromFee[from] || _isExcludedFromFee[to]){
            takeFee = false;
        }
        
        _tokenTransfer(from,to,amount,takeFee);

        if(!inSwapAndLiquify) {
            _buyBackForMBALL(to);
        }

        _sender = address(this);
    }

    function swapAndLiquify(
        uint256 contractTokenBalance
    ) private lockTheSwap {

        (uint256 _buyFees, uint256 _sellFees) = totalFees();
        uint256 _liquidityFee = fees.bLiquidity.add(fees.sLiquidity);
        uint256 tForL = contractTokenBalance.mul(_liquidityFee).div(_buyFees.add(_sellFees));
        uint256 tForReward = contractTokenBalance.sub(tForL);
        swapTokensForEth(tForReward);
        uint256 half = tForL.div(2);
        uint256 otherHalf = tForL.sub(half);
        uint256 initialBalance = address(this).balance;
        swapTokensForEth(half);
        uint256 newBalance = address(this).balance.sub(initialBalance);
        addLiquidity(otherHalf, newBalance);
        emit SwapAndLiquify(half, newBalance, otherHalf);
    }

    function swapTokensForEth(
        uint256 tokenAmount
    ) private {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );
    }

    function addLiquidity(
        uint256 tokenAmount, 
        uint256 ethAmount
    ) private {
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            owner(),
            block.timestamp
        );
    }

    function _tokenTransfer(
        address sender, 
        address recipient, 
        uint256 amount,
        bool takeFee
    ) private {
        if(!takeFee){
            removeAllFee();        
        }

        if (_isExcluded[sender] && !_isExcluded[recipient]) {
            _transferFromExcluded(sender, recipient, amount);
        } else if (!_isExcluded[sender] && _isExcluded[recipient]) {
            _transferToExcluded(sender, recipient, amount);
        } else if (!_isExcluded[sender] && !_isExcluded[recipient]) {
            _transferStandard(sender, recipient, amount);
        } else if (_isExcluded[sender] && _isExcluded[recipient]) {
            _transferBothExcluded(sender, recipient, amount);
        } else {
            _transferStandard(sender, recipient, amount);
        }
        
        if(!takeFee){
            restoreAllFee();
        }
    }

    function _transferStandard(
        address sender, 
        address recipient, 
        uint256 tAmount
    ) private {
        uint256 rAmount = _getValues(tAmount).rAmount;
        uint256 rTransferAmount = _getValues(tAmount).rTransferAmount; 
        uint256 rFee = _getValues(tAmount).rFee; 
        uint256 tTransferAmount = _getValues(tAmount).tTransferAmount; 
        uint256 tFee = _getValues(tAmount).tFee;
        uint256 tLiquidity = _getValues(tAmount).tLiquidity; 
        uint256 tBurn = _getValues(tAmount).tBurn;
        uint256 tTeam = _getValues(tAmount).tTeam;
        uint256 tReward = _getValues(tAmount).tReward;
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);

        _takeLiquidity(tLiquidity);
        _takeBurn(tBurn);
        _takeReward(tReward);
        _takeTeam(tTeam);
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferToExcluded(
        address sender, 
        address recipient, 
        uint256 tAmount
    ) private {
        uint256 rAmount = _getValues(tAmount).rAmount;
        uint256 rTransferAmount = _getValues(tAmount).rTransferAmount; 
        uint256 rFee = _getValues(tAmount).rFee; 
        uint256 tTransferAmount = _getValues(tAmount).tTransferAmount; 
        uint256 tFee = _getValues(tAmount).tFee;
        uint256 tLiquidity = _getValues(tAmount).tLiquidity; 
        uint256 tBurn = _getValues(tAmount).tBurn;
        uint256 tTeam = _getValues(tAmount).tTeam;
        uint256 tReward = _getValues(tAmount).tReward;

        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);           
        _takeLiquidity(tLiquidity);
        _takeBurn(tBurn);
        _takeReward(tReward);
        _takeTeam(tTeam);
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function _transferFromExcluded(
        address sender, 
        address recipient, 
        uint256 tAmount
    ) private {
        uint256 rAmount = _getValues(tAmount).rAmount;
        uint256 rTransferAmount = _getValues(tAmount).rTransferAmount; 
        uint256 rFee = _getValues(tAmount).rFee; 
        uint256 tTransferAmount = _getValues(tAmount).tTransferAmount; 
        uint256 tFee = _getValues(tAmount).tFee;
        uint256 tLiquidity = _getValues(tAmount).tLiquidity; 
        uint256 tBurn = _getValues(tAmount).tBurn;
        uint256 tTeam = _getValues(tAmount).tTeam;
        uint256 tReward = _getValues(tAmount).tReward;
        _tOwned[sender] = _tOwned[sender].sub(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);   
        _takeLiquidity(tLiquidity);
        _takeBurn(tBurn);
        _takeReward(tReward);
        _takeTeam(tTeam);
        _reflectFee(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    event ActivatePhase(Phases phase);
    function activatePhase(
        Phases phase
    )  external onlyOwner {
        require(
            phase != Phases.MBALL, 
            "MBLL: can not use this method to activate new year event.");
        activePhase = phase;
        restoreAllFee();
        lastPhaseBlock = block.timestamp;
        emit ActivatePhase(phase);
    }

    event UpdatedFees(Fees _fees, Phases phase);
    function updateFees(
        Fees memory _fees, 
        Phases phase
    ) external onlyOwner {
        if(phase == Phases.BBONANZA){BBONANZA =_fees;}
        if(phase == Phases.DEFLATE){DEFLATE =_fees;}
        if(phase == Phases.GWALL){GWALL =_fees;}
        if(phase == Phases.PCLAPPER){PCLAPPER =_fees;}
        if(phase == Phases.ROBINHOOD){ROBINHOOD =_fees;}
        if(phase == Phases.SMONKEY){SMONKEY =_fees;}
        emit UpdatedFees(_fees, phase);
    } 

    event UpdatedNFTDetails(address indexed _nftContract);
    function updateNFTDetails(
        address _nftContract
    ) external onlyOwner {
        nftContract = MoneyBallNFT(_nftContract);
        emit UpdatedNFTDetails(_nftContract);
    }

    event WithdrawnETH(uint256 amount);
    function withdrawETH(
        uint256 _amount
    ) external onlyOwner {
        payable(owner()).transfer(_amount);
        emit WithdrawnETH(_amount);
    }

    event EnabledNYEvent(Phases phase);
    function enableNewYearEvent() 
    external onlyOwner {
        _enableNYEvent();
    }

    function _enableNYEvent() internal {
        activePhase = Phases.MBALL;
        restoreAllFee();
        lastPhaseBlock = block.timestamp;
        minPhaseLimitTime = 24 hours;
        lastNYActiveBlock = block.timestamp;
        emit EnabledNYEvent(Phases.MBALL);
    }

    event UpdatedPhaseLimitTime(uint256 _minPhaseLimitTime);
    function updateMinPhaseLimitTime(
        uint256 _minPhaseLimitTime
    ) external onlyOwner {
        minPhaseLimitTime = _minPhaseLimitTime;
        emit UpdatedPhaseLimitTime(_minPhaseLimitTime);
    }

    event UpdatedEnabledMethods(bool _enablePclapper, bool _enableMball);
    function updateEnableMethods(
        bool _enablePclapper, 
        bool _enableMball
    ) external onlyOwner {
        enabledPclapper = _enablePclapper;
        enabledMball = _enableMball;
        emit UpdatedEnabledMethods(_enablePclapper, _enableMball);
    }


    struct GetValues {
        uint256 rAmount;
        uint256 rTransferAmount;
        uint256 rFee;
        uint256 tTransferAmount;
        uint256 tFee;
        uint256 tLiquidity;
        uint256 tBurn;
        uint256 tTeam;
        uint256 tReward;
    }

    struct GetTValues {
        uint256 tTransferAmount;
        uint256 tFee;
        uint256 tLiquidity;
        uint256 tBurn;
        uint256 tTeam;
        uint256 tReward;
    }
}