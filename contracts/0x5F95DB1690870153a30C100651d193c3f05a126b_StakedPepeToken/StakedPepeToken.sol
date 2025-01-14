/**
 *Submitted for verification at Etherscan.io on 2023-05-03
*/

/*
    SPDX-License-Identifier: MIT
    A Bankteller Production
    Pepe Stake
    Copyright 2023
*/

/*
    Pepe Stake - decentralized community staking for Pepe   

    - A store of value backed by PEPE that only goes up in value
    - Mint stPEPE with PEPE ERC20( 0x6982508145454ce325ddbe47a25d4ec3d2311933 )
    - Zero transfer or dev fees
    - Pay a low 5% fee on mint and reedem to fund the internal treasury
    - No pump and dump is possible and single sided liquidity is locked in the contract
    - 100% immutable with zero administrative functions
    - Redeem stPEPE for PEPE anytime
     
    Only at https://pepestake.com

    For more DeFi from BT 

    - ELEPHANT BEP20( 0xE283D0e3B8c102BAdF5E8166B73E02D96d92F688 )
    - Only at https://elephant.money

*/
pragma solidity 0.8.17;

abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint8 private constant _NOT_ENTERED = 1;
    uint8 private constant _ENTERED = 2;

    uint8 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

abstract contract Context is ReentrancyGuard {

    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }

}



/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;
    address private _previousOwner;
    bool private _paused;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event RunStatusUpdated(bool indexed paused);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        address msgSender = _msgSender();
        _owner = msgSender;
        _paused = false;
        emit RunStatusUpdated(_paused);
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Returns if paused status
     */
    function isPaused() public view returns (bool) {
        return _paused;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Throws if called when contract is paused
     */
    modifier isRunning() {
        require(
            _paused == false,
            "Function unavailable because contract is paused"
        );
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
        require(!_paused, "Ownable: contract is paused");
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    /**
     * @dev Pause the contract for functions that check run status
     * Can only be called by the current owner.
     */
    function updateRunStatus(bool paused) public virtual onlyOwner {
        emit RunStatusUpdated(paused);
        _paused = paused;
    }

}

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
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

interface IERC20 {

    function totalSupply() external view returns (uint256);
    
    function symbol() external view returns(string memory);
    
    function name() external view returns(string memory);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);
    
    /**
     * @dev Returns the number of decimal places
     */
    function decimals() external view returns (uint8);

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

contract StakedPepeToken is IERC20, Ownable {

    using SafeMath for uint256;

    // token data
    string private constant _name = "Staked Pepe";
    string private constant _symbol = "stPEPE";
    uint8 private constant _decimals = 18;
    uint256 private constant precision = 10**18;

    uint256  private _total_users; //counts new minters
    uint256  private _total_txs;
    
    IERC20 public immutable underlying;

    uint256 private _totalSupply;

    // balances
    mapping (address => uint256) private _balances;
    mapping (address => uint8) private _users;
    mapping (address => mapping (address => uint256)) private _allowances;

    
    // 5% buy and sell Fees
    uint256 public mintFee        = 95000;            
    uint256 public sellFee        = 95000;            
    uint256 private constant feeDenominator = 10**5;

    constructor() Ownable() {

        // initialize underlying asset; PEPE
        underlying = IERC20( address(0x6982508145454Ce325dDbE47a25d4ec3d2311933) );

    }

    /** Returns the total number of tokens in existence */
    function totalSupply() external view override returns (uint256) { 
        return _totalSupply; 
    }

    /** Returns the number of tokens owned by `account` */
    function balanceOf(address account) public view override returns (uint256) { 
        return _balances[account]; 
    }

    /** Returns the number of tokens `spender` can transfer from `holder` */
    function allowance(address holder, address spender) external view override returns (uint256) { 
        return _allowances[holder][spender]; 
    }
    
    /** Token Name */
    function name() public pure override returns (string memory) {
        return _name;
    }

    /** Token Ticker Symbol */
    function symbol() public pure override returns (string memory) {
        return _symbol;
    }

    /** Tokens decimals */
    function decimals() public pure override returns (uint8) {
        return _decimals;
    }

    /** Approves `spender` to transfer `amount` tokens from caller */
    function approve(address spender, uint256 amount) public override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
  
    /** Transfer Function */
    function transfer(address recipient, uint256 amount) external override nonReentrant returns (bool) {
        return _transferFrom(msg.sender, recipient, amount);
    }

    /** Transfer Function */
    function transferFrom(address sender, address recipient, uint256 amount) external override nonReentrant returns (bool) {
        _allowances[sender][msg.sender] = _allowances[sender][msg.sender].sub(amount, 'Insufficient Allowance');
        return _transferFrom(sender, recipient, amount);
    }
    
    /** Internal Transfer */
    function _transferFrom(address sender, address recipient, uint256 amount) internal returns (bool) {
        // make standard checks
        require(recipient != address(0) && sender != address(0), "Transfer To Zero");
        require(amount > 0, "Transfer Amt Zero");
        // track price change
        uint256 oldPrice = _calculatePrice();
        
        // subtract from sender
        _balances[sender] = _balances[sender].sub(amount, "Insufficient Balance");

        // give reduced amount to receiver
        _balances[recipient] = _balances[recipient].add(amount);

        
        // require price rises
        _requirePriceRises(oldPrice);

        //update globals
        _total_txs += 1;

        // Transfer Event
        emit Transfer(sender, recipient, amount);
        return true;
    }

    /** 
        Mint stPEPE tokens for sender by depositing PEPE into the contract
            Requirements:
                Approval from the PEPE prior to purchase
        
        @param numTokens number of PEPE tokens to mint stPEPE with
        @return tokensMinted number of stPEPE tokens minted
    */
    function mint(uint256 numTokens) external nonReentrant returns (uint256) {
        _checkGarbageCollector(address(this));
        return _mintWithBacking(numTokens, msg.sender);
    }

    /** 
        Mint stPEPE tokens for `recipient` by depositing PEPE into the contract
            Requirements:
                Approval from the PEPE prior to purchase
        
        @param numTokens number of PEPE tokens to mint stPEPE with
        @param recipient Account to receive minted stPEPE tokens
        @return tokensMinted number of stPEPE tokens minted
    */
    function mintTo(uint256 numTokens, address recipient) external nonReentrant returns (uint256) {
        _checkGarbageCollector(address(this));
        return _mintWithBacking(numTokens, recipient);
    }

    /** 
        Burns sender's stPEPE tokens and redeems their value in PEPE
        @param tokenAmount number of stPEPE tokens to redeem, must be greater than 0
    */
    function redeem(uint256 tokenAmount) external nonReentrant returns (uint256) {
        return _sell(msg.sender, tokenAmount, msg.sender);
    }
    
    /** 
        Burns sender's stPEPE tokens and redeems their value in PEPE for `recipient`
        @param tokenAmount number of stPEPE tokens to redeem, must be greater than 0
        @param recipient Recipient of PEPE transfer, must not be address(0)
    */
    function reedemTo(uint256 tokenAmount, address recipient) external nonReentrant returns (uint256) {
        return _sell(msg.sender, tokenAmount, recipient);
    }
    
    /** 
        Allows a user to remove their holdings from the supply 
        DOES NOT REDEEM UNDERLYING ASSET FOR USER
        @param amount number of stPEPE tokens to burn
    */
    function burn(uint256 amount) external nonReentrant {
        // get balance of caller
        uint256 bal = _balances[msg.sender];
        require(bal >= amount && bal > 0, 'Zero Holdings');
        // Track Change In Price
        uint256 oldPrice = _calculatePrice();
       
        // burn tokens from sender + supply
        _burn(msg.sender, amount);
        // require price rises
        _requirePriceRises(oldPrice);
        // Emit Call
        emit Burned(msg.sender, amount);
    }
    
    /** Stake tokens and deposits stPEPE in sender's address; must have prior approval for PEPE */
    function _mintWithBacking(uint256 amount, address recipient) internal returns (uint256) {
        
        // users token balance
        uint256 userTokenBalance = underlying.balanceOf(msg.sender);
        // ensure user has enough to send
        require(userTokenBalance > 0 && amount <= userTokenBalance, 'Insufficient Balance');

        // calculate price change
        uint256 oldPrice = _calculatePrice();

        // amount of underlying
        uint256 amountUnderlying = underlyingBalance();

        // transfer in token
        uint256 received = _transferIn(amount);

        // Handle Minting
        return _mintTo(recipient, received, amountUnderlying, oldPrice);
    }
    
    /** Burns stPEPE tokens and deposits PEPE tokens into recipient's address */
    function _sell(address seller, uint256 tokenAmount, address recipient) internal returns (uint256) {
        require(tokenAmount > 0 && _balances[seller] >= tokenAmount);
        require(seller != address(0) && recipient != address(0));
        
        // calculate price change
        uint256 oldPrice = _calculatePrice();

        // tokens post fee to swap for underlying asset
        uint256 tokensToSwap = tokenAmount.mul(sellFee).div(feeDenominator);

        // value of taxed tokens
        uint256 amountUnderlyingAsset = amountOut(tokensToSwap);

        // burn from sender + supply 
        _burn(seller, tokenAmount);

        // send Tokens to Seller
        require(
            underlying.transfer(recipient, amountUnderlyingAsset), 
            'Underlying Transfer Failure'
        );

        // require price rises
        _requirePriceRises(oldPrice);

        //update globals
        _total_txs += 1;

        // Differentiate Sell
        emit Redeemed(seller, tokenAmount, amountUnderlyingAsset);

        // return token redeemed and amount underlying
        return amountUnderlyingAsset;
    }

    /** Handles minting logic Tto create new stPEPE */
    function _mintTo(address recipient, uint256 received, uint256 totalBacking, uint256 oldPrice) private returns(uint256) {
        
        // find the number of tokens we should mint to keep up with the current price
        uint256 tokensToMintNoTax = _totalSupply == 0 ?
            received : 
            _totalSupply.mul(received).div(totalBacking);
        
        // apply fee to minted tokens to inflate price relative to total supply
        uint256 tokensToMint = tokensToMintNoTax.mul(mintFee).div(feeDenominator);
        
        require(tokensToMint > 0, 'Zero Amount');
        
        // mint to Buyer
        _mint(recipient, tokensToMint);


        // require price rises
        _requirePriceRises(oldPrice);

        //update globals
        _total_txs += 1;

        // differentiate purchase
        emit Minted(recipient, tokensToMint);
        return tokensToMint;
    }

    /** Requires the price of stPEPE to rise for the transaction to conclude */
    function _requirePriceRises(uint256 oldPrice) internal {
        // Calculate Price After Transaction
        uint256 newPrice = _calculatePrice();
        // Require Current Price >= Last Price
        require(newPrice >= oldPrice, 'Price Cannot Fall');
        // Emit The Price Change
        emit PriceChange(oldPrice, newPrice, _totalSupply);
    }

    /** Transfers `desiredAmount` of `token` in and verifies the transaction success */
    function _transferIn(uint256 desiredAmount) internal returns (uint256) {
        uint256 balBefore = underlyingBalance();
        require(
            underlying.transferFrom(msg.sender, address(this), desiredAmount),
            'Failure Transfer From'
        );
        uint256 balAfter = underlyingBalance();
        require(
            balAfter > balBefore,
            'Zero Received'
        );
        return balAfter - balBefore;
    }
    
    /** Mints tokens to the receivers address */
    function _mint(address receiver, uint amount) private {
        //user count is based on whenever a new account has been minted to
        if (_users[receiver] == 0){
            _users[receiver] = 1;
            _total_users += 1;
        }

        _balances[receiver] = _balances[receiver].add(amount);
        _totalSupply = _totalSupply.add(amount);
        emit Transfer(address(0), receiver, amount);
    }
    
    /** Burns `amount` of tokens from `account` */
    function _burn(address account, uint amount) private {
        _balances[account] = _balances[account].sub(amount, 'Insufficient Balance');
        _totalSupply = _totalSupply.sub(amount, 'Negative Supply');
        emit Transfer(account, address(0), amount);
    }

    /** Make sure there are no native tokens in the contract */
    function _checkGarbageCollector(address burnLocation) internal {
        uint256 bal = _balances[burnLocation];
        if (bal > 10**3) {
            // Track Change In Price
            uint256 oldPrice = _calculatePrice();    
            // burn amount
            _burn(burnLocation, bal);
            // Emit Collection
            emit GarbageCollected(bal);
            // Emit Price Difference
            emit PriceChange(oldPrice, _calculatePrice(), _totalSupply);
        }
    }
    
    /** Returns the balance of the underlying asset */
    function underlyingBalance() public view returns (uint256) {
        return underlying.balanceOf(address(this));
    }

    /** Returns the price of stPEPE in PEPE with 18 points of precision */
    function calculatePrice() external view returns (uint256) {
        return _calculatePrice();
    }
    
    /** Returns the current price of 1 token */
    function _calculatePrice() internal view returns (uint256) {
        return _totalSupply == 0 ? 10**18 : (underlyingBalance().mul(precision)).div(_totalSupply);
    }

    /** Returns the amount of stPEPE given numtokens of PEPE; accounting for fees**/
    function estimateMinted(uint256 numTokens) public view returns (uint256) {
        uint balance = underlyingBalance();
        return _totalSupply == 0 ? numTokens.mul(mintFee).div(feeDenominator) : _totalSupply.mul(numTokens).div(balance).mul(mintFee).div(feeDenominator);
    }

    /** Returns the amount of PEPE given numtokens of stPEPE **/
    function estimateRedeemed(uint256 numTokens) public view returns (uint256) {
        return amountOut(numTokens.mul(sellFee).div(feeDenominator));
    }


    /**
        Returns amount of underlying to receive for `numTokens` of stPEPE
     */
    function amountOut(uint256 numTokens) public view returns (uint256) {
        return _calculatePrice().mul(numTokens).div(precision);
    }

    /** Returns the value of `holder`'s holdings */
    function getValueOfHoldings(address holder) public view returns(uint256) {
        return amountOut(_balances[holder]);
    }

    /** Returns basic contract stats **/
    function getInfo() public view returns(uint256 users, uint256 txs, uint256 underlyingSupply, uint256 supply, uint256 price){
        users = _total_users;
        txs = _total_txs;
        underlyingSupply = underlyingBalance();
        supply = _totalSupply;
        price = _calculatePrice();
    } 

    /** Remove dust / airdrop tokens sent to the contract; Housekeeper can burn or recieve the coins*/
    function housekeeping(IERC20 token, bool burnDust) external {
        require(address(token) != address(underlying), 'Cannot withdraw underlying asset');
        require(address(token) != address(0), 'Zero Address');

        uint balance = token.balanceOf(address(this));
        require(balance > 0, 'Zero balance');
        
        address destination = (burnDust) ? address(0x000000000000000000000000000000000000dEaD) : msg.sender;
                
        token.transfer(destination, balance);

        emit DustCollected(address(token), destination, balance);
    }
    
    /** Events **/
    event PriceChange(uint256 previousPrice, uint256 currentPrice, uint256 totalSupply);
    event Burned(address from, uint256 amount);
    event GarbageCollected(uint256 amount);
    event Redeemed(address seller, uint256 amount, uint256 amountUnderlying);
    event Minted(address recipient, uint256 amount);
    event DustCollected(address token, address recipient, uint256 amount);

}