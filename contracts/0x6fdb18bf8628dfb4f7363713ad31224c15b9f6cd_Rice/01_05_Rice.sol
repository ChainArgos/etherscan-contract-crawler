// SPDX-License-Identifier: MIT

/**
RICE IS GOOD WITH EVERYTHING
ESPECIALLY TESTING ERC20 CONTRACTS 🍚 🍙
*/

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * Abstract contract for easy variable access for current and future projects.
 */
abstract contract Project {
    address public marketingWallet = 0x1BA3fe6311131A67d97f20162522490c3648F6e2;
    address public devWallet = 0x1BA3fe6311131A67d97f20162522490c3648F6e2;

    string constant _name = "Rice";
    string constant _symbol = "RCE";
    uint8 constant _decimals = 18;

    uint256 _totalSupply = 1000 * 10**_decimals;
    uint256 _initialSupply = 1000 * 10**_decimals;

    uint256 public _maxTxAmount = (_totalSupply * 10) / 1000; // (_totalSupply * 10) / 1000 [this equals 1%]
    uint256 public _maxWalletToken = (_totalSupply * 10) / 1000; //

    uint256 public buyFee             = 5;
    uint256 public buyTotalFee        = buyFee;

    uint256 public swapLpFee          = 1;
    uint256 public swapMarketing      = 3;
    uint256 public swapTreasuryFee    = 1;
    uint256 public swapTotalFee       = swapMarketing + swapLpFee + swapTreasuryFee;

    uint256 public transFee           = 5;

    uint256 public feeDenominator     = 100;

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

/**
 * MainContract
 */
contract Rice is Project, IERC20, Ownable {
    using SafeMath for uint256;
    event AutoLiquify(uint256 amountETH, uint256 amountBOG);
    address public immutable uniswapV2Pair;
    address public autoLiquidityReceiver;
    address DEAD = 0x000000000000000000000000000000000000dEaD;
    address ZERO = 0x0000000000000000000000000000000000000000;
    mapping (address => uint) private cooldownTimer;
    mapping (address => uint256) _balances;
    mapping (address => mapping (address => uint256)) _allowances;
    mapping (address => bool) isFeeExempt;
    mapping (address => bool) isTxLimitExempt;
    mapping (address => bool) isMaxExempt;
    mapping (address => bool) isTimelockExempt;
    uint8 public cooldownTimerInterval = 10;
    uint256 targetLiquidity = 20;
    uint256 targetLiquidityDenominator = 100;
    uint256 public swapThreshold = _totalSupply * 30 / 10000;
    uint256 public swapAmount = _totalSupply * 30 / 10000;
    bool public tradingOpen = false;
    bool public buyCooldownEnabled = true;
    bool public swapEnabled = true;
    bool inSwap;
    IUniswapV2Router02 public immutable contractRouter;
    modifier swapping() { inSwap = true; _; inSwap = false; }

    constructor () {
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D); //Mainnet & Testnet ETH
         // Create a uniswap pair for this new token
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());

        // set the rest of the contract variables
        contractRouter = _uniswapV2Router;

        _allowances[address(this)][address(contractRouter)] = type(uint256).max;

        isFeeExempt[msg.sender] = true;
        isTxLimitExempt[msg.sender] = true;
        isMaxExempt[msg.sender] = true;

        isTimelockExempt[msg.sender] = true;
        isTimelockExempt[DEAD] = true;
        isTimelockExempt[address(this)] = true;

        isFeeExempt[marketingWallet] = true;
        isMaxExempt[marketingWallet] = true;
        isTxLimitExempt[marketingWallet] = true;

        autoLiquidityReceiver = msg.sender;

        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    receive() external payable { }
    function totalSupply() external view override returns (uint256) { return _totalSupply; }
    function decimals() external pure returns (uint8) { return _decimals; }
    function symbol() external pure returns (string memory) { return _symbol; }
    function name() external pure returns (string memory) { return _name; }
    function getOwner() external view returns (address) { return owner(); }
    function balanceOf(address account) public view override returns (uint256) { return _balances[account]; }
    function allowance(address holder, address spender) external view override returns (uint256) { return _allowances[holder][spender]; }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function approveMax(address spender) external returns (bool) {
        return approve(spender, type(uint256).max);
    }

    function transfer(address recipient, uint256 amount) external override returns (bool) {
        return _transferFrom(msg.sender, recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        if(_allowances[sender][msg.sender] != type(uint256).max){
            _allowances[sender][msg.sender] = _allowances[sender][msg.sender].sub(amount, "Insufficient Allowance");
        }

        return _transferFrom(sender, recipient, amount);
    }

    function setMaxWalletPercent_base1000(uint256 maxWallPercent_base1000) external onlyOwner() {
        _maxWalletToken = (_totalSupply * maxWallPercent_base1000 ) / 1000;
    }
    function setMaxTxPercent_base1000(uint256 maxTXPercentage_base1000) external onlyOwner() {
        _maxTxAmount = (_totalSupply * maxTXPercentage_base1000 ) / 1000;
    }

    function setTxLimit(uint256 amount) external onlyOwner() {
        _maxTxAmount = amount;
    }

// *** 
// Functions for the burning mechanism 
// *** 

    /**
    * Burn an amount of tokens for the current wallet (if they have enough)
    */
    function burnTokens(uint256 amount) external {
        require(_balances[msg.sender] > amount, "Incorrect Amount");
        _basicTransfer(msg.sender, DEAD, amount);
        _totalSupply -= amount;
    }

// *** 
// End functions for the burning mechanism 
// *** 

    function _transferFrom(address sender, address recipient, uint256 amount) internal returns (bool) {
        if(inSwap){ return _basicTransfer(sender, recipient, amount); }

        if(sender != owner() && recipient != owner()){
            require(tradingOpen,"Trading not open yet");
        }

        bool inSell = (recipient == uniswapV2Pair);
        bool inTransfer = (recipient != uniswapV2Pair && sender != uniswapV2Pair);

        if (recipient != address(this) && 
            recipient != address(DEAD) && 
            recipient != uniswapV2Pair && 
            recipient != marketingWallet && 
            recipient != devWallet && 
            recipient != autoLiquidityReceiver
        ){
            uint256 heldTokens = balanceOf(recipient);
            if(!isMaxExempt[recipient]) {
                require((heldTokens + amount) <= _maxWalletToken,"Total Holding is currently limited, you can not buy that much.");
            }
        }

        if (sender == uniswapV2Pair &&
            buyCooldownEnabled &&
            !isTimelockExempt[recipient]
        ){
            require(cooldownTimer[recipient] < block.timestamp,"Please wait for 1min between two buys");
            cooldownTimer[recipient] = block.timestamp + cooldownTimerInterval;
        }

        // Checks max transaction limit
        // but no point if the recipient is exempt
        // this check ensures that someone that is buying and is txnExempt then they are able to buy any amount
        if(!isTxLimitExempt[recipient]) {
            checkTxLimit(sender, amount);
        }

        //Exchange tokens
        _balances[sender] = _balances[sender].sub(amount, "Insufficient Balance");

        uint256 amountReceived = amount;

        // Do NOT take a fee if sender AND recipient are NOT the contract
        // i.e. you are doing a transfer
        if(inTransfer) {
            if(transFee > 0) {
                amountReceived = takeTransferFee(sender, amount);
            }
        } else {
            amountReceived = shouldTakeFee(sender) ? takeFee(sender, amount, inSell) : amount;
            
            if(shouldSwapBack()){ swapBack(); }
        }

        _balances[recipient] = _balances[recipient].add(amountReceived);

        emit Transfer(sender, recipient, amountReceived);
        return true;
    }

    function _basicTransfer(address sender, address recipient, uint256 amount) internal returns (bool) {
        _balances[sender] = _balances[sender].sub(amount, "Insufficient Balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function checkTxLimit(address sender, uint256 amount) internal view {
        require(amount <= _maxTxAmount || isTxLimitExempt[sender], "TX Limit Exceeded");
    }

    function shouldTakeFee(address sender) internal view returns (bool) {
        return !isFeeExempt[sender];
    }

// *** 
// Handle Fees
// *** 

    function takeTransferFee(address sender, uint256 amount) internal returns (uint256) {

        uint256 feeToTake = transFee;
        uint256 feeAmount = amount.mul(feeToTake).mul(100).div(feeDenominator * 100);
        
        _balances[address(this)] = _balances[address(this)].add(feeAmount);
        emit Transfer(sender, address(this), feeAmount);

        return amount.sub(feeAmount);
    }

    function takeFee(address sender, uint256 amount, bool isSell) internal returns (uint256) {

        uint256 feeToTake = isSell ? swapTotalFee : buyTotalFee;
        uint256 feeAmount = amount.mul(feeToTake).mul(100).div(feeDenominator * 100);
        
        _balances[address(this)] = _balances[address(this)].add(feeAmount);
        emit Transfer(sender, address(this), feeAmount);

        return amount.sub(feeAmount);
    }

// *** 
// End Handle Fees
// *** 

    function shouldSwapBack() internal view returns (bool) {
        return msg.sender != uniswapV2Pair
        && !inSwap
        && swapEnabled
        && _balances[address(this)] >= swapThreshold;
    }

    function clearStuckBalance(uint256 amountPercentage) external returns (bool) {
        require(msg.sender == devWallet || msg.sender == marketingWallet, "Not Admin");
        uint256 amountETH = address(this).balance;
        uint256 amountToTransfer = amountETH * amountPercentage / 100;
        require(amountToTransfer > 0, "Amount to transfer must be greater than 0.");
        bool success = payable(marketingWallet).send(amountToTransfer);
        require(success, "Transfer failed");
        return true;
    }

    function clearStuckBalance_sender(uint256 amountPercentage) external returns (bool) {
        require(msg.sender == devWallet || msg.sender == marketingWallet, "Not Admin");
        uint256 amountETH = address(this).balance;
        uint256 amountToTransfer = amountETH * amountPercentage / 100;
        require(amountToTransfer > 0, "Amount to transfer must be greater than 0.");
        (bool success, ) = payable(msg.sender).call{value: amountToTransfer}("");
        require(success, "Transfer failed.");
        return success;
    }

    // switch Trading
    function tradingStatus(bool _status) public onlyOwner {
        tradingOpen = _status;
    }

    // enable cooldown between trades
    function cooldownEnabled(bool _status, uint8 _interval) public onlyOwner {
        buyCooldownEnabled = _status;
        cooldownTimerInterval = _interval;
    }

    function swapBack() internal swapping {
        uint256 dynamicLiquidityFee = isOverLiquified(targetLiquidity, targetLiquidityDenominator) ? 0 : swapLpFee;
        uint256 amountToLiquify = swapAmount.mul(dynamicLiquidityFee).div(swapTotalFee).div(2);
        uint256 amountToSwap = swapAmount.sub(amountToLiquify);

        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = contractRouter.WETH();

        uint256 balanceBefore = address(this).balance;

        contractRouter.swapExactTokensForETHSupportingFeeOnTransferTokens(
            amountToSwap,
            0,
            path,
            address(this),
            block.timestamp
        );

        uint256 amountETH = address(this).balance.sub(balanceBefore);

        uint256 totalETHFee = swapTotalFee.sub(dynamicLiquidityFee.div(2));

        uint256 amountETHLiquidity = amountETH.mul(swapLpFee).div(totalETHFee).div(2);
        uint256 amountETHMarketing = amountETH.mul(swapMarketing).div(totalETHFee);
        uint256 amountETHTreasury = amountETH.mul(swapTreasuryFee).div(totalETHFee);

        (bool tmpSuccess,) = payable(marketingWallet).call{value: amountETHMarketing, gas: 30000}("");
        (tmpSuccess,) = payable(devWallet).call{value: amountETHTreasury, gas: 30000}("");

        // Supress warning msg
        tmpSuccess = false;

        if(amountToLiquify > 0){
            contractRouter.addLiquidityETH{value: amountETHLiquidity}(
                address(this),
                amountToLiquify,
                0,
                0,
                autoLiquidityReceiver,
                block.timestamp
            );
            emit AutoLiquify(amountETHLiquidity, amountToLiquify);
        }
    }

// *** 
// Various exempt functions
// *** 

    function setIsFeeExempt(address holder, bool exempt) external onlyOwner() {
        isFeeExempt[holder] = exempt;
    }

    function setIsMaxExempt(address holder, bool exempt) external onlyOwner() {
        isMaxExempt[holder] = exempt;
    }

    function setIsTxLimitExempt(address holder, bool exempt) external onlyOwner() {
        isTxLimitExempt[holder] = exempt;
    }

    function setIsTimelockExempt(address holder, bool exempt) external onlyOwner() {
        isTimelockExempt[holder] = exempt;
    }

// *** 
// End various exempt functions
// *** 


// ***
// Start fee things
// ***

    function setTransFee(uint256 fee) external onlyOwner() {
        transFee = fee;
    }

    function setSwapFees(uint256 _newSwapLpFee, uint256 _newSwapMarketingFee, uint256 _newSwapTreasuryFee, uint256 _feeDenominator) external onlyOwner() {
        swapLpFee = _newSwapLpFee;
        swapMarketing = _newSwapMarketingFee;
        swapTreasuryFee = _newSwapTreasuryFee;
        swapTotalFee = _newSwapLpFee.add(_newSwapMarketingFee).add(_newSwapTreasuryFee);
        feeDenominator = _feeDenominator;
        require(swapTotalFee < 90, "Fees cannot be that high");
    }

    function setBuyFees(uint256 buyTax) external onlyOwner() {
        buyTotalFee = buyTax;
    }

// ***
// end fee stuff 
// ***

    function setTreasuryFeeReceiver(address _newWallet) external onlyOwner() {
        isFeeExempt[devWallet] = false;
        isFeeExempt[_newWallet] = true;
        devWallet = _newWallet;
    }

    function setMarketingWallet(address _newWallet) external onlyOwner() {
        isFeeExempt[marketingWallet] = false;
        isFeeExempt[_newWallet] = true;

        isMaxExempt[_newWallet] = true;

        marketingWallet = _newWallet;
    }

    function setFeeReceivers(address _autoLiquidityReceiver, address _newMarketingWallet, address _newdevWallet ) external onlyOwner() {

        isFeeExempt[devWallet] = false;
        isFeeExempt[_newdevWallet] = true;
        isFeeExempt[marketingWallet] = false;
        isFeeExempt[_newMarketingWallet] = true;

        isMaxExempt[_newMarketingWallet] = true;

        autoLiquidityReceiver = _autoLiquidityReceiver;
        marketingWallet = _newMarketingWallet;
        devWallet = _newdevWallet;
    }

// ***
// Swap settings
// ***

    function setSwapThresholdAmount(uint256 _amount) external onlyOwner() {
        swapThreshold = _amount;
    }

    function setSwapAmount(uint256 _amount) external onlyOwner() {
        if(_amount > swapThreshold) {
            swapAmount = swapThreshold;
        } else {
            swapAmount = _amount;
        }        
    }

// ***
// End Swap settings
// ***

    function setTargetLiquidity(uint256 _target, uint256 _denominator) external onlyOwner() {
        targetLiquidity = _target;
        targetLiquidityDenominator = _denominator;
    }

    function getCirculatingSupply() public view returns (uint256) {
        return _initialSupply.sub(balanceOf(DEAD)).sub(balanceOf(ZERO));
    }

    function getLiquidityBacking(uint256 accuracy) public view returns (uint256) {
        return accuracy.mul(balanceOf(uniswapV2Pair).mul(2)).div(getCirculatingSupply());
    }

    function isOverLiquified(uint256 target, uint256 accuracy) public view returns (bool) {
        return getLiquidityBacking(accuracy) > target;
    }

    /* Airdrop */
    function airDropCustom(address from, address[] calldata addresses, uint256[] calldata tokens) external onlyOwner {
        require(addresses.length < 501,"GAS Error: max airdrop limit is 500 addresses");
        require(addresses.length == tokens.length,"Mismatch between Address and token count");

        uint256 SCCC = 0;

        for(uint i=0; i < addresses.length; i++){
            SCCC = SCCC + tokens[i];
        }

        require(balanceOf(from) >= SCCC, "Not enough tokens in wallet");

        for(uint i=0; i < addresses.length; i++){
            _basicTransfer(from,addresses[i],tokens[i]);
        }
        
    }

    function airDropFixed(address from, address[] calldata addresses, uint256 tokens) external onlyOwner {

        require(addresses.length < 801,"GAS Error: max airdrop limit is 800 addresses");

        uint256 SCCC = tokens * addresses.length;

        require(balanceOf(from) >= SCCC, "Not enough tokens in wallet");

        for(uint i=0; i < addresses.length; i++){
            _basicTransfer(from,addresses[i],tokens);
        }
    }

    function _infoPage() external pure returns(string memory) {
        return "https://www.halfsupershop.com/";
    }
}