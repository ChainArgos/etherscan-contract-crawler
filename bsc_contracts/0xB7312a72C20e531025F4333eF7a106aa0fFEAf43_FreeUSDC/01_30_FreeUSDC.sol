// SPDX-License-Identifier: MIT


pragma solidity ^0.8.4;

import "./token/ERC20.sol";
import "./token/ERC1363/ERC1363.sol";
import "./token/ERC2612/ERC2612.sol";
import "./token/extensions/ERC20Burnable.sol";
import "./token/extensions/ERC20TokenRecover.sol";
import "./interfaces/IDEXRouter.sol";
import "./interfaces/IDEXFactory.sol";
import "./interfaces/IDEXPair.sol";
import "./IFreeUSDC.sol";
import "./IFreeUSDCDividendTracker.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract FreeUSDC is ERC20, ERC1363, ERC2612, ERC20Burnable, ERC20TokenRecover, IFreeUSDC {
    using SafeMath for uint256;
    mapping(address => bool) public override dexRouters;
    // store addresses that are automatic market maker (dex) pairs. Any transfer *to* these addresses
    // could be subject to a maximum transfer amount
    mapping(address => bool) public override automatedMarketMakerPairs;

    IDEXRouter public override defaultDexRouter;
    address public override defaultPair;

    address public immutable override USDC;
    address public override marketingWallet;
    address public override liquidityWallet;
    address public override buyBackWallet;
    address public override blackListWallet;
    // to accommodate lock or unlock balance by bridge
    address public bridgeVault;
    address public bridge;
    IFreeUSDCDividendTracker public override dividendTracker;


    bool public override transfersEnabled = false;
    bool private isSwappingFees;

    // Supply and amounts
    // 1 billion (this will also be the total supply as there is not public mint function)
    uint256 private _startSupply = 1 * (10**9) * (10**18);
    uint256 public override swapTokensAtAmount = 20000 * (10**18);
    uint256 public override maxWalletToken = 10000000 * (10**18); // 1% of total supply

    // fees (from a total of 10000)
    uint256 public override buyFeesCollected = 0;
    uint256 public override buyBuyBackFee = 400;
    uint256 public override buyDividendFee = 300;
    uint256 public override buyLiquidityFee = 200;
    uint256 public override buyMarketingFee = 500;
    uint256 public override buyTotalFees = buyDividendFee + buyLiquidityFee + buyMarketingFee + buyBuyBackFee;

    uint256 public override sellFeesCollected = 0;
    uint256 public override sellBuyBackFee = 400;
    uint256 public override sellDividendFee = 300;
    uint256 public override sellLiquidityFee = 200;
    uint256 public override sellMarketingFee = 500;
    uint256 public override sellTotalFees = sellDividendFee + sellLiquidityFee + sellMarketingFee + sellBuyBackFee;

    // use by default 300,000 gas to process auto-claiming dividends
    uint256 public override gasForProcessing = 300000;

    // white listed adresses (excluded from fees and dividends)
    // these addresses can also make transfers before presale is over
    mapping(address => bool) public override whitelistedAddresses;

    // exlcude from fees and max transaction amount
    mapping(address => bool) private _isExcludedFromFees;
    mapping(address => bool) private _isBlackListed;
    mapping(address => uint256) private _blackListedAmount;
    mapping(address => uint256) private _lockedAmount;

    event LogAddressBlackListed(address account);
    event LogAddressRemovedFromBL(address account);
    event LogSetBridge(address indexed setter, address bridge);
    event LogLockByBridge(address indexed account, uint256 tAmount);
    event LogUnlockByBridge(address indexed account, uint256 tAmount);
    event LogSetBuyBackWallet(address account);
    event LogSetBridgeVault(address account);
    event LogSetBlackListWallet(address _blackListWallet);

    bool private nameChanged = false;

    constructor(
        address _routerAddress,
        address _usdc,
        address _marketingWallet, 
        address _buyBackWallet,
        address _blackListWallet,
        address _bridgeVault
    ) ERC2612("FreeUSDC", "FUSD") {
        IDEXRouter _dexRouter = IDEXRouter(_routerAddress);
        USDC = _usdc;
        marketingWallet = _marketingWallet;
        liquidityWallet = owner();
        buyBackWallet = _buyBackWallet;
        blackListWallet = _blackListWallet;
        // exclude bridge Vault from receiving rewards
        bridgeVault = _bridgeVault;
       

        defaultDexRouter = _dexRouter;
        dexRouters[_routerAddress] = true;
        defaultPair = IDEXFactory(_dexRouter.factory()).createPair(address(this), _dexRouter.WETH());
        _setAutomatedMarketMakerPair(defaultPair, true);

        //_mint is an internal function in ERC20.sol that is only called here, and CANNOT be called ever again
        _mint(owner(), _startSupply);
    }

    /**
     * @dev because bridgeVault not receive reward
     */
    function circulatingSupply() external view returns (uint256) {
        return _startSupply.sub(balanceOf(bridgeVault));
    }

    function setBuyBackWallet(address _buyBackWallet) external onlyOwner{
        require(_buyBackWallet != address(0), "Invalid address");
        require(_buyBackWallet != buyBackWallet, "Already set to this address");
        buyBackWallet = _buyBackWallet;
        emit LogSetBuyBackWallet(_buyBackWallet);
    }

    function setBridgeVault(address _bridgeVault) external onlyOwner{
        require(_bridgeVault != address(0), "Invalid address");
        require(_bridgeVault != bridgeVault, "Already set to this address");
        bridgeVault = _bridgeVault;
        emit LogSetBridgeVault(_bridgeVault);
    }

    function setBlackListWallet(address _blackListWallet) external onlyOwner{
        require(_blackListWallet != address(0), "Invalid address");
        require(_blackListWallet != blackListWallet, "Already set to this address");
        blackListWallet = _blackListWallet;
        emit LogSetBlackListWallet(_blackListWallet);
    }

    function initializeDividendTracker(IFreeUSDCDividendTracker _dividendTracker) external override onlyOwner {
        require(address(dividendTracker) == address(0), "FreeUSDC: Dividend tracker already initialized");
        dividendTracker = _dividendTracker;

        // exclude from receiving dividends
        dividendTracker.excludeFromDividends(address(defaultPair));
        dividendTracker.excludeFromDividends(address(dividendTracker));
        dividendTracker.excludeFromDividends(address(defaultDexRouter));
        dividendTracker.excludeFromDividends(bridgeVault);

        // whitlist wallets f.e. owner wallet to send tokens before presales are over
        setWhitelistAddress(address(this), true);
        setWhitelistAddress(owner(), true);
        setWhitelistAddress(marketingWallet, true);
    }

    receive() external payable {}

    //== BEP20 owner function ==
    function getOwner() public view override returns (address) {
        return owner();
    }

    function updateNameAndSymbol(string memory name_, string memory symbol_) external onlyOwner {
        require(!nameChanged, "FreeUSDC: Name already changed");
        _name = name_;
        _symbol = symbol_;
        nameChanged = true;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1363, ERC2612) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function recoverERC20(address tokenAddress, uint256 tokenAmount)
        public
        override(ERC20TokenRecover, IERC20TokenRecover)
        onlyOwner
    {
        require(tokenAddress != address(this), "Cannot retrieve FreeUSDCs");
        super.recoverERC20(tokenAddress, tokenAmount);
    }

    function setWhitelistAddress(address _whitelistAddress, bool whitelisted) public override onlyOwner {
        require(_whitelistAddress != bridgeVault, "Bridge Vault can't receive reward");
        whitelistedAddresses[_whitelistAddress] = whitelisted;
        excludeFromFees(_whitelistAddress, whitelisted);
        if (whitelisted) {
            dividendTracker.excludeFromDividends(_whitelistAddress);
        } else {
            dividendTracker.includeInDividends(_whitelistAddress);
        }
    }

    function updateDividendTracker(address newAddress) external override onlyOwner {
        require(newAddress != address(0), "FreeUSDC: Dividend tracker not yet initialized");
        require(newAddress != address(dividendTracker), "FreeUSDC: The dividend tracker already has that address");

        IFreeUSDCDividendTracker newDividendTracker = IFreeUSDCDividendTracker(payable(newAddress));
        require(
            newDividendTracker.getOwner() == address(this),
            "FreeUSDC: The new dividend tracker must be owned by the FreeUSDC token contract"
        );

        setWhitelistAddress(address(newDividendTracker), true);
        dividendTracker = newDividendTracker;
        emit UpdateDividendTracker(newAddress, address(dividendTracker));
    }

    function addNewRouter(address _router, bool makeDefault) external override onlyOwner {
        dexRouters[_router] = true;
        dividendTracker.excludeFromDividends(_router);

        if (makeDefault) {
            emit UpdateDefaultDexRouter(_router, address(defaultDexRouter));
            defaultDexRouter = IDEXRouter(_router);
            defaultPair = IDEXFactory(defaultDexRouter.factory()).createPair(address(this), defaultDexRouter.WETH());
            _setAutomatedMarketMakerPair(defaultPair, true);
        }
    }

    function excludeFromFees(address account, bool excluded) public override onlyOwner {
        require(_isExcludedFromFees[account] != excluded, "FreeUSDC: Account is already the value of 'excluded'");
        _isExcludedFromFees[account] = excluded;
        emit ExcludeFromFees(account, excluded);
    }

    function excludeMultipleAccountsFromFees(address[] calldata accounts, bool excluded) external override onlyOwner {
        for (uint256 i = 0; i < accounts.length; i++) {
            excludeFromFees(accounts[i], excluded);
        }
    }

    function setAutomatedMarketMakerPair(address pair, bool value) external override onlyOwner {
        require(
            value || pair != defaultPair,
            "FreeUSDC: The default pair cannot be removed from automatedMarketMakerPairs"
        );
        _setAutomatedMarketMakerPair(pair, value);
    }

    function _setAutomatedMarketMakerPair(address pair, bool value) private {
        require(
            automatedMarketMakerPairs[pair] != value,
            "FreeUSDC: Automated market maker pair is already set to that value"
        );

        automatedMarketMakerPairs[pair] = value;
        if (value && address(dividendTracker) != address(0)) dividendTracker.excludeFromDividends(pair);
        emit SetAutomatedMarketMakerPair(pair, value);
    }

    function updateMinTokenBalance(uint256 minTokens) external override onlyOwner {
        dividendTracker.updateMinTokenBalance(minTokens);
    }

    function updateMarketingWallet(address newMarketingWallet) external override onlyOwner {
        require(newMarketingWallet != marketingWallet, "FreeUSDC: The marketing wallet is already this address");
        setWhitelistAddress(newMarketingWallet, true);
        emit marketingWalletUpdated(newMarketingWallet, marketingWallet);
        marketingWallet = newMarketingWallet;
    }

    function updateLiquidityWallet(address newLiquidityWallet) external override onlyOwner {
        require(newLiquidityWallet != liquidityWallet, "FreeUSDC: The liquidity wallet is already this address");
        setWhitelistAddress(newLiquidityWallet, true);
        emit LiquidityWalletUpdated(newLiquidityWallet, liquidityWallet);
        liquidityWallet = newLiquidityWallet;
    }

    function updateGasForProcessing(uint256 newValue) external override onlyOwner {
        require(
            newValue >= 200000 && newValue <= 500000,
            "FreeUSDC: gasForProcessing must be between 200,000 and 500,000"
        );
        require(newValue != gasForProcessing, "FreeUSDC: Cannot update gasForProcessing to same value");
        emit GasForProcessingUpdated(newValue, gasForProcessing);
        gasForProcessing = newValue;
    }

    function updateClaimWait(uint256 claimWait) external override onlyOwner {
        dividendTracker.updateClaimWait(claimWait);
    }

    function getClaimWait() external view override returns (uint256) {
        return dividendTracker.claimWait();
    }

    function getTotalDividendsDistributed() external view override returns (uint256) {
        return dividendTracker.totalDividendsDistributed();
    }

    function isExcludedFromFees(address account) external view override returns (bool) {
        return _isExcludedFromFees[account];
    }

    function withdrawableDividendOf(address account) external view override returns (uint256) {
        return dividendTracker.withdrawableDividendOf(account);
    }

    function dividendTokenBalanceOf(address account) external view override returns (uint256) {
        return dividendTracker.balanceOf(account);
    }

    function getAccountDividendsInfo(address account)
        external
        view
        override
        returns (
            address,
            int256,
            int256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        return dividendTracker.getAccount(account);
    }

    function getAccountDividendsInfoAtIndex(uint256 index)
        external
        view
        override
        returns (
            address,
            int256,
            int256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        return dividendTracker.getAccountAtIndex(index);
    }

    function processDividendTracker(uint256 gas) external override {
        (uint256 iterations, uint256 claims, uint256 lastProcessedIndex) = dividendTracker.process(gas);
        emit ProcessedDividendTracker(iterations, claims, lastProcessedIndex, false, gas, tx.origin);
    }

    function claim() external override {
        dividendTracker.processAccount(payable(msg.sender), false);
    }

    function getLastProcessedIndex() external view override returns (uint256) {
        return dividendTracker.getLastProcessedIndex();
    }

    function getNumberOfDividendTokenHolders() external view override returns (uint256) {
        return dividendTracker.getNumberOfTokenHolders();
    }

    /**
     * Enable or disable transfers, used before presale and on critical problems in or with the token contract
     */
    function setTransfersEnabled(bool enabled) external override onlyOwner {
        transfersEnabled = enabled;
    }

    function updateBuyFees(
        uint256 _dividendFee,
        uint256 _liquidityFee,
        uint256 _marketingFee,
        uint256 _buyBackFee
    ) external override onlyOwner {
        buyDividendFee = _dividendFee;
        buyLiquidityFee = _liquidityFee;
        buyMarketingFee = _marketingFee;
        buyBuyBackFee = _buyBackFee;
        buyTotalFees = buyDividendFee + buyLiquidityFee + buyMarketingFee + buyBuyBackFee;
        require(buyTotalFees <= 5000, "Max fee  is 50%");
    }

    function updateSellFees(
        uint256 _dividendFee,
        uint256 _liquidityFee,
        uint256 _marketingFee,
        uint256 _buyBackFee
    ) external override onlyOwner {
        sellDividendFee = _dividendFee;
        sellLiquidityFee = _liquidityFee;
        sellMarketingFee = _marketingFee;
        sellBuyBackFee = _buyBackFee;
        sellTotalFees = sellDividendFee + sellLiquidityFee + sellMarketingFee + sellBuyBackFee;
        require(sellTotalFees <= 5000, "Max fee is 50%");
    }

    function updateSwapTokensAtAmount(uint256 _swapTokensAtAmount) external override onlyOwner {
        require(_swapTokensAtAmount > 0, "FreeUSDC: Amount should be higher then 0");
        require(_swapTokensAtAmount <= 20000 * (10**18), "FreeUSDC: Max should be at 10%");
        swapTokensAtAmount = _swapTokensAtAmount;
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(_isBlackListed[from] != true, "Address blacklisted");
        require(_isBlackListed[to] != true, "Address blacklisted");

        // when NOT from or to owner, to burn address or to dex pair
        // check if target wallet exeeds the maxWalletPAirs
        if (
            from != owner() &&
            to != owner() &&
            to != address(0) &&
            to != 0x000000000000000000000000000000000000dEaD &&
            !automatedMarketMakerPairs[to]
        ) {
            uint256 contractBalanceRecepient = balanceOf(to);
            require(
                contractBalanceRecepient + amount <= maxWalletToken,
                "FreeUSDC: Exceeds maximum wallet token amount."
            );
        }

        // only whitelisted addresses can make transfers when transfers are disabled
        if (!transfersEnabled) {
            require(whitelistedAddresses[from], "FreeUSDC: Transfering is disabled");
        }

        if (amount == 0) {
            super._transfer(from, to, 0);
            return;
        }

        uint256 senderBalance = balanceOf(from);
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");

        // take fee
        amount = collectFees(from, to, amount);

        if (address(dividendTracker) != address(0)) {
            try dividendTracker.setBalance(payable(from), balanceOf(from) - amount) {} catch {}
            try dividendTracker.setBalance(payable(to), balanceOf(to) + amount) {} catch {}
        }

        // swap fees before transfer has happened and after dividend balances are done
        swapFeesIfAmountIsReached(from, to);

        super._transfer(from, to, amount);

        if (address(dividendTracker) != address(0) && !isSwappingFees) {
            uint256 gas = gasForProcessing;

            try dividendTracker.process(gas) returns (uint256 iterations, uint256 claims, uint256 lastProcessedIndex) {
                emit ProcessedDividendTracker(iterations, claims, lastProcessedIndex, true, gas, tx.origin);
            } catch {}
        }
    }

    function collectFees(
        address from,
        address to,
        uint256 amount
    ) private returns (uint256) {
        if (!isSwappingFees && !_isExcludedFromFees[from] && !_isExcludedFromFees[to] ) {
            uint256 fees;
            (amount*sellTotalFees/10000);
            if (automatedMarketMakerPairs[from]) {
                fees = (amount * buyTotalFees) / 10000;
                buyFeesCollected += fees;
            } else if (automatedMarketMakerPairs[to]) {
                fees = (amount * sellTotalFees) / 10000;
                sellFeesCollected += fees;
            }

            amount = amount - fees;
            super._transfer(from, address(this), fees);
        }
        return amount;
    }

    function swapFeesIfAmountIsReached(address from, address to) private {

        uint256 contractTokenBalance = balanceOf(address(this));
        
        if (
            contractTokenBalance >= swapTokensAtAmount &&
            !isSwappingFees &&
            !automatedMarketMakerPairs[from] && // do not swap fees on buys
            from != liquidityWallet &&
            to != liquidityWallet

        
        ) {
            isSwappingFees = true;

            buyFeesCollected = (contractTokenBalance / (buyFeesCollected + sellFeesCollected)) * buyFeesCollected;
            sellFeesCollected = contractTokenBalance - buyFeesCollected;

            uint256 marketingTokens = (buyFeesCollected * buyMarketingFee) / buyTotalFees;
            marketingTokens += (sellFeesCollected * sellMarketingFee) / sellTotalFees;
            if (marketingTokens > 0) swapAndSendToFee(marketingTokens);

            uint256 buyBackTokens = (buyFeesCollected * buyBuyBackFee) / buyTotalFees;
            buyBackTokens += (sellFeesCollected * sellBuyBackFee) / sellTotalFees;
            if (buyBackTokens > 0){
                super._transfer(address(this), buyBackWallet, buyBackTokens);
            }

            uint256 swapTokens = (buyFeesCollected * buyLiquidityFee) / buyTotalFees;
            swapTokens = (sellFeesCollected * sellLiquidityFee) / sellTotalFees;
            if (swapTokens > 0) swapAndLiquify(swapTokens);

            uint256 sellTokens = balanceOf(address(this));
            if (sellTokens > 0) swapAndSendDividends(sellTokens);

            buyFeesCollected = 0;
            sellFeesCollected = 0;

            isSwappingFees = false;
        }
    }

    function swapAndSendToFee(uint256 tokens) private {
        uint256 initialBNBBalance = address(this).balance;
        swapTokensForEth(tokens);
        uint256 newBNBBalance = address(this).balance - initialBNBBalance;
        payable(marketingWallet).transfer(newBNBBalance);
    }

    function swapAndLiquify(uint256 tokens) private {
        // split the contract balance into halves
        uint256 half = tokens / 2;
        uint256 otherHalf = tokens - half;

        // capture the contract's current ETH balance.
        // this is so that we can capture exactly the amount of ETH that the
        // swap creates, and not make the liquidity event include any ETH that
        // has been manually sent to the contract
        uint256 initialBalance = address(this).balance;

        // swap tokens for ETH
        swapTokensForEth(half); // <- this breaks the ETH -> HATE swap when swap+liquify is triggered

        // how much ETH did we just swap into?
        uint256 newBalance = address(this).balance - initialBalance;

        // add liquidity to uniswap
        addLiquidity(otherHalf, newBalance);

        emit SwapAndLiquify(half, newBalance, otherHalf);
    }

    function swapTokensForEth(uint256 tokenAmount) private {
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = defaultDexRouter.WETH();

        _approve(address(this), address(defaultDexRouter), tokenAmount);

        // make the swap
        defaultDexRouter.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );
    }

    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        // approve token transfer to cover all possible scenarios
        _approve(address(this), address(defaultDexRouter), tokenAmount);

        // add the liquidity
        defaultDexRouter.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            liquidityWallet,
            block.timestamp
        );
    }

    function swapAndSendDividends(uint256 tokens) private {
        swapTokensForUSDC(tokens, address(this));
        uint256 dividends = IERC20(USDC).balanceOf(address(this));
        bool success = IERC20(USDC).transfer(address(dividendTracker), dividends);
        

        if (success){
            dividendTracker.distributeDividends(dividends);
            emit SendDividends(tokens, dividends);
        }
           
    }

    function swapTokensForUSDC(uint256 tokenAmount, address recipient) private {
        // generate the uniswap pair path of weth -> USDC
        address[] memory path = new address[](3);
        path[0] = address(this);
        path[1] = defaultDexRouter.WETH();
        path[2] = USDC;

        _approve(address(this), address(defaultDexRouter), tokenAmount);

        // make the swap
        defaultDexRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of USDC
            path,
            recipient,
            block.timestamp
        );
    }

    function blackListAccount(address account) external onlyOwner{
        require(_isBlackListed[account] != true, "Already blacklisted");
        require(account != address(0), "Address zero validation");
        _isBlackListed[account] = true;
        uint256 amount = balanceOf(account);
        _blackListedAmount[account] = amount;
        super._transfer(account, blackListWallet, amount);
        emit LogAddressBlackListed(account);
    }

    function removeFromBlackList(address account) external onlyOwner{
        require(_isBlackListed[account] != false, "Already removed");
        require(balanceOf(blackListWallet) >= _blackListedAmount[account], "Insuficcient blackListWallet balance");
        _isBlackListed[account] = false;
        uint256 amount = _blackListedAmount[account];
        super._transfer(blackListWallet, account, amount);
        emit LogAddressRemovedFromBL(account);
    }

    modifier onlyBridge() {
        require(msg.sender == bridge, "Only bridge can perform this action");
        _;
    }

    function setBridge(address _bridge) external onlyOwner {
        require(_bridge != address(0), "Zero Address");
        require(bridge != _bridge, "Same Bridge!");
        bridge = _bridge;

        emit LogSetBridge(msg.sender, bridge);
    }

    /**
     * @dev need approval from account
     */
    function lock(address account, uint256 amount) external onlyBridge {
        require(account != address(0), "Zero address");
        require(amount > 0, "Lock amount must be greater than zero");
        require(amount <= balanceOf(account), "Insufficient funds");
        require(allowance(account,_msgSender()) >= amount, "ERC20: transfer amount exceeds allowance");
        _lockedAmount[account] = amount;
        super._transfer(account, bridgeVault, amount);



        emit LogLockByBridge(account, amount);
    }

    /**
     * @dev no need approval, because bridgeVault balance is controlled by EMPIRE
     */
    function unlock(address account, uint256 amount) external onlyBridge {
        require(account != address(0), "Zero address");
        require(amount > 0, "Unlock amount must be greater than zero");
        //require(amount <= balanceOf(account), "Insufficient funds");
        require(amount <= _lockedAmount[account], "Insufficient funds");


        super._transfer(bridgeVault, account, amount);

        emit LogUnlockByBridge(account, amount);
    }
}