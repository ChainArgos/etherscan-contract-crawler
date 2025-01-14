/**
 *Submitted for verification at Etherscan.io on 2023-05-02
*/

/**
Telegram: t.me/pepeape_eth
Twitter: https://twitter.com/pepeapeeth?
*/

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}

contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) internal _balances;

    mapping(address => mapping(address => uint256)) internal _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The defaut value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount)
        public
        virtual
        override
        returns (bool)
    {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender)
        public
        view
        virtual
        override
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _transfer(sender, recipient, amount);
        
        _approve(sender, _msgSender(), currentAllowance - amount);

        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue)
        public
        virtual
        returns (bool)
    {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        virtual
        returns (bool)
    {
        uint256 currentAllowance = _allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        _approve(_msgSender(), spender, currentAllowance - subtractedValue);

        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        _balances[sender] = senderBalance - amount;
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
    }

    /** This function will be used to generate the total supply
    * while deploying the contract
    *
    * This function can never be called again after deploying contract
    */
    function _tokengeneration(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: transfer to the zero address");
        _totalSupply = amount;
        _balances[account] = amount;
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
}

library Address {
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        _setOwner(_msgSender());
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

interface IFactory {
    function createPair(address tokenA, address tokenB) external returns (address pair);
}

interface IRouter {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);

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

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;
}

contract PepeApe is ERC20, Ownable {
    using Address for address payable;

    IRouter private router;
    address public pair;

    bool private _inSwap = false;
    bool private LpProvider = false;
    bool public tradingEnabled = false;

    uint256 private ThresholdTokens = 3e5 * 10**18;
    uint256 public maxWalletLimit = 2e6 * 10**18;

    uint256 private kill_block;
    uint256 private deadline = 1;
    uint256 private Earlytaxes = 99;

    address public marketingWallet = 0x076cbc45049574f1f421d27fA54cc42E3588b27b;
	address public constant deadWallet = 0x000000000000000000000000000000000000dEaD;

    struct Taxes {
        uint256 marketing;
        uint256 liquidity;
    }

    Taxes private buytaxes = Taxes(3, 1);
    Taxes private sellTaxes = Taxes(3, 1);

   uint256 public BuyFees = buytaxes.marketing + buytaxes.liquidity;
   uint256 public SellFees = sellTaxes.marketing + sellTaxes.liquidity;

    mapping(address => bool) public exemptFee;

    modifier lockTheSwap() {
        if (!_inSwap) {
            _inSwap = true;
            _;
            _inSwap = false;
        }
    }

    constructor() ERC20("PepeApe", "PAPE") {
        _tokengeneration(msg.sender, 1e8 * 10**decimals());

        if (block.chainid == 56){
     router = IRouter(0x10ED43C718714eb63d5aA57B78B54704E256024E);
     }
      else if(block.chainid == 1){
          router = IRouter(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
      }
      else if(block.chainid == 42161){
           router = IRouter(0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506);
      }
      else if (block.chainid == 97){
     router = IRouter(0xD99D1c33F9fC3444f8101754aBC46c52416550D1);
     }
        address _pair = IFactory(router.factory()).createPair(address(this), router.WETH());
        require(_pair != address(0), "Generated Pair Address cannot be zero");
        router = router;
        pair = _pair;
        
        exemptFee[address(this)] = true;
        exemptFee[msg.sender] = true;
        exemptFee[marketingWallet] = true;
        exemptFee[deadWallet] = true;
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _approve(sender, _msgSender(), currentAllowance - amount);

        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue)
        public
        override
        returns (bool)
    {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue)
        public
        override
        returns (bool)
    {
        uint256 currentAllowance = _allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        _approve(_msgSender(), spender, currentAllowance - subtractedValue);

        return true;
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal override {
        require(amount > 0, "Transfer amount must be greater than zero");

        if (!exemptFee[sender] && !exemptFee[recipient]) {
            require(tradingEnabled, "Trading not enabled");
        }

        if (sender == pair && !exemptFee[recipient]) {
            require(balanceOf(recipient) + amount <= maxWalletLimit,
                "You are exceeding maxWalletLimit"
            );
        }

        if (sender != pair && !exemptFee[recipient] && !exemptFee[sender]) {
           
            if (recipient != pair) {
                require(balanceOf(recipient) + amount <= maxWalletLimit,
                    "You are exceeding maxWalletLimit"
                );
            }
        }
       
        uint256 swapfee;
        uint256 fee;
        Taxes memory currentTaxes;

        bool useEarlyFee = !exemptFee[sender] &&
            !exemptFee[recipient] &&
            block.number < kill_block + deadline;

        if (exemptFee[sender] || exemptFee[recipient])
            fee = 0;

        else if (recipient == pair && !useEarlyFee) { 
            swapfee = sellTaxes.liquidity + sellTaxes.marketing;
            currentTaxes = sellTaxes;
        
        } else if (sender == pair && recipient != address(router) && !useEarlyFee) { 
            swapfee = buytaxes.liquidity + buytaxes.marketing;
            currentTaxes = buytaxes;
        
        } else if (useEarlyFee) {
            swapfee = Earlytaxes;
        }

        fee = (amount * swapfee) / 100;

       if(sender != pair && recipient != pair) { 
          fee = 0;
       }
        
        if (LpProvider && sender != pair) Liquify(swapfee, currentTaxes);

        super._transfer(sender, recipient, amount - fee);
        if (fee > 0) {
    
            if (swapfee > 0) {
                uint256 feeAmount = (amount * swapfee) / 100;
                super._transfer(sender, address(this), feeAmount);
            }

        }
    }

    function Liquify(uint256 swapfee, Taxes memory swapTaxes) private lockTheSwap {

        if(swapfee == 0){
            return;
        }

        uint256 contractBalance = balanceOf(address(this));
        if (contractBalance >= ThresholdTokens) {
            if (ThresholdTokens > 1) {
                contractBalance = ThresholdTokens;
            }

            uint256 denominator = swapfee * 2;
            uint256 Liquiditytokens = (contractBalance * swapTaxes.liquidity) / denominator;
            uint256 AmountToSwap = contractBalance - Liquiditytokens;

            uint256 initialBalance = address(this).balance;

            swapTokensForETH(AmountToSwap);

            uint256 deltaBalance = address(this).balance - initialBalance;
            uint256 unitBalance = deltaBalance / (denominator - swapTaxes.liquidity);
            uint256 LiquidityEth = unitBalance * swapTaxes.liquidity;

            if (LiquidityEth  > 0) {
                addLiquidity(Liquiditytokens, LiquidityEth);
            }

            uint256 marketingAmt = unitBalance * 2 * swapTaxes.marketing;
            if (marketingAmt > 0) {
                payable(marketingWallet).sendValue(marketingAmt);
            }

        }
    }

    function swapTokensForETH(uint256 tokenAmount) private {
        require(tokenAmount > 0, "Amount should be greater than zero");
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = router.WETH();

        _approve(address(this), address(router), tokenAmount);

        router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0,
            path,
            address(this),
            block.timestamp
        );
    }

    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        _approve(address(this), address(router), tokenAmount);

        // add the liquidity
        router.addLiquidityETH{ value: ethAmount }(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            owner(),
            block.timestamp
        );
    }

    function updateLiquidityProvide(bool _state) external onlyOwner {
        LpProvider = _state;
    }

    function updateThreshold(uint256 _liquidityThreshold) external onlyOwner {
        ThresholdTokens = _liquidityThreshold * 10**decimals();
    }

    function SetBuyTaxes( uint256 _marketing, uint256 _liquidity ) external onlyOwner {
        buytaxes = Taxes(_marketing, _liquidity);
    }

    function SetSellTaxes( uint256 _marketing, uint256 _liquidity ) external onlyOwner {
        sellTaxes = Taxes(_marketing, _liquidity);
    }

    function EnableTrading() external onlyOwner {
        require(!tradingEnabled, "Cannot re-enable trading");
        tradingEnabled = true;
        LpProvider = true;
        kill_block = block.number;
    }

    function UpdateDeadline(uint256 _deadline) external onlyOwner {
        require(!tradingEnabled, "Can't change when trading has started");
        require(_deadline < 5,"Deadline should be less than 5 Blocks");
        deadline = _deadline;
    }

    function UpdateMarketingWallet(address _newWallet) external onlyOwner {
        require(_newWallet != address(0),"Fee Address cannot be zero address");
        require(_newWallet != address(this),"Fee Addy cannot be CA");
        marketingWallet = _newWallet;
        exemptFee[_newWallet] = true;
    }

    function ExemptFee(address _address, bool state) external onlyOwner {
        require(_address != address(0), "Address cannot be the zero address");
        exemptFee[_address] = state;
    }

    function MultiExemptFee(address[] memory _accounts, bool _state) external onlyOwner {
        for (uint256 i = 0; i < _accounts.length; i++) {
            require(_accounts[i] != address(0), "Address cannot be the zero address");
            exemptFee[_accounts[i]] = _state;
        }
    }

    function SetMaxTxLimit(uint256 maxWallet) external onlyOwner {
        require(maxWallet >= 1e5, "Cannot set max wallet amount lower than 0.1%");
        maxWalletLimit = maxWallet * 10**decimals(); 
    }
    
    function rescueETH() external {
        uint256 contractETHBalance = address(this).balance;
        require(contractETHBalance > 0, "Amount should be greater than zero");
        require(contractETHBalance <= address(this).balance, "Insufficient Amount");
        payable(owner()).sendValue(contractETHBalance);
    }

    function rescueERC20Tokens(address _tokenAddy, uint256 _amount) external {
        require(_tokenAddy != address(this), "Owner can't claim contract's balance of its own tokens");
        require(_amount > 0, "Amount should be greater than zero");
        require(_amount <= IERC20(_tokenAddy).balanceOf(address(this)), "Insufficient Amount");
        IERC20(_tokenAddy).transfer(owner(), _amount);
    }

    // fallbacks
    receive() external payable {}
}