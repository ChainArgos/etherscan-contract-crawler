/**
 *Submitted for verification at BscScan.com on 2022-11-07
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}



contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    function owner() public view returns (address) {
        return _owner;
    }   
    
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }


    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

}


abstract contract ReentrancyGuard {
   
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

   
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

interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function decimals() external view returns(uint8);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

}



contract ICO is ReentrancyGuard, Context, Ownable {

    mapping (address => uint256) public _contributions;
    mapping (address => uint256) public totalContributions;
    mapping (address => bool) public _whitelisted;
    mapping (address => uint256) public maxPurchase;
    mapping (address => bool) public firstClaim;
    mapping (address => uint256) public claimCount;
    mapping (address => uint256) public claimTime;
    mapping (address => uint256) public purchaseTime;
    mapping (address => uint256) public claimed;
    mapping (address => uint256) public rewardClaimed;
    mapping (address => uint256) public afterFirstClaim;
    mapping (address => uint256) public beforeFirstClaim;


    
    IERC20 public _token;
    uint256 private _tokenDecimals;
    address public _wallet;
    uint256 public _rate;
    uint256 public _weiRaised;
    uint256 public endICO;
    uint256 public minPurchase;
    uint256 public maxPurchasePer;
    uint256 public hardcap;
    uint256 public purchasedTokens;
    uint256 public bnbCollected;
    bool public whitelistPurchase = false;
    uint256 timeToWait;
    

    event TokensPurchased(address  purchaser, uint256 value, uint256 amount);
    constructor (uint256 rate, address wallet, IERC20 token,uint256 _timeToWait)  {
        require(rate > 0, "Pre-Sale: rate is 0");
        require(wallet != address(0), "Pre-Sale: wallet is the zero address");
        require(address(token) != address(0), "Pre-Sale: token is the zero address");
        
        _rate = rate;
        _wallet = wallet;
        _token = token;
        timeToWait = _timeToWait;
        _tokenDecimals = 18 - _token.decimals();
    }
    
    function setWhitelist(address[] memory recipients,uint256[] memory _maxPurchase) public onlyOwner{
        require(recipients.length == _maxPurchase.length);
        for(uint256 i = 0; i < recipients.length; i++){
            _whitelisted[recipients[i]] = true;
            maxPurchase[recipients[i]] = _maxPurchase[i] * (10**18);
        }
    }

    function setBlacklist(address[] memory recipients) public onlyOwner{
        for(uint256 i = 0; i < recipients.length; i++){
            _whitelisted[recipients[i]] = false;
        }
    }
    
    function whitelistAccount(address account) external onlyOwner{
        _whitelisted[account] = true;
    }

    function blacklistAccount(address account) external onlyOwner{
        _whitelisted[account] = false;
    }
    
    
    //Start Pre-Sale
    function startICO(uint256 endDate, uint256 _minPurchase,  uint256 _hardcap) external onlyOwner icoNotActive() {
        require(endDate > block.timestamp, 'duration should be > 0');
        endICO = endDate; 
        minPurchase = _minPurchase;
        hardcap = _hardcap;
        _weiRaised = 0;
    }
    
    function stopICO() external onlyOwner icoActive(){
        endICO = 0;
    }
    
    //Pre-Sale 
    function buyTokens() public payable nonReentrant icoActive{
        uint256 amount = msg.value;
        uint256 weiAmount = amount;
        
        payable(_wallet).transfer(amount);

        uint256 tokens = _getTokenAmount(weiAmount);
        _preValidatePurchase(msg.sender, weiAmount);
        _weiRaised = _weiRaised + weiAmount;
        bnbCollected = bnbCollected + weiAmount;
        purchasedTokens += tokens;
        purchaseTime[msg.sender] = block.timestamp;
        beforeFirstClaim[msg.sender] = beforeFirstClaim[msg.sender] + weiAmount;
        totalContributions[msg.sender] = totalContributions[msg.sender] + weiAmount;
        _contributions[msg.sender] = _contributions[msg.sender] + weiAmount;
        emit TokensPurchased(msg.sender, weiAmount, tokens);
    }


    function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal view {
        require(beneficiary != address(0), "Presale: beneficiary is the zero address");
        require(weiAmount != 0, "Presale: weiAmount is 0");
        require(weiAmount >= minPurchase, 'have to send at least: minPurchase');
        require(_weiRaised + weiAmount <= hardcap, "Exceeding hardcap");
        if(whitelistPurchase){
            require(_whitelisted[beneficiary], "You are not in whitelist");
            if(maxPurchasePer>0){
                require(_contributions[beneficiary] + weiAmount <= maxPurchasePer, "can't buy more than: maxPurchase");
            }else{
                require(_contributions[beneficiary] + weiAmount <= maxPurchase[beneficiary], "can't buy more than: maxPurchase");
            }
        }else{
            require(_contributions[beneficiary] + weiAmount <= maxPurchasePer, "can't buy more than: maxPurchase");
        }
    }


    function calculateVesting(address userAddress)
        public
        view
        returns (uint256)
    {
        uint256 amount = 0;

        if(block.timestamp > timeToWait){
            if(((block.timestamp - timeToWait) / 30 days)==3){
                amount = ((beforeFirstClaim[userAddress] * 20)/100) - claimed[userAddress];
            }else if (((block.timestamp - timeToWait) / 30 days)==4){
                amount = ((beforeFirstClaim[userAddress] * 40)/100) - claimed[userAddress];
            }else if (((block.timestamp - timeToWait) / 30 days)==5){
                amount = ((beforeFirstClaim[userAddress] * 60)/100) - claimed[userAddress];
            }else if (((block.timestamp - timeToWait) / 30 days)>=6){
                amount = ((beforeFirstClaim[userAddress] * 100)/100) - claimed[userAddress];
            }
        }
        
        
        return amount;
    }

    function claim() external nonReentrant{
        require(checkContribution(msg.sender) > 0, "No tokens to claim");
        require(checkContribution(msg.sender) <= IERC20(_token).balanceOf(address(this)), "No enough tokens in contract");
        require( block.timestamp > timeToWait, "You must wait until claim time: timeToWait");
        uint256 amount;

        amount = calculateVesting(msg.sender);
        claimCount[msg.sender]= claimCount[msg.sender]+1;
        _contributions[msg.sender] = _contributions[msg.sender] - amount;
        
        claimed[msg.sender] = claimed[msg.sender] + amount;
        uint256 tokenTransfer = _getTokenAmount(amount);
        require(IERC20(_token).transfer(msg.sender, tokenTransfer));
    }

    

    function checkWhitelist(address account) external view returns(bool){
        return _whitelisted[account];
    }

    function changeWaitTime(uint256 _timeToWait) external onlyOwner returns(bool){
        timeToWait =_timeToWait;
        return true;
    }
    function _getTokenAmount(uint256 weiAmount) internal view returns (uint256) {
        return weiAmount * _rate;
    }

    function _forwardFunds(uint256 amount) external onlyOwner {
        payable(_wallet).transfer(amount);
    }
    
    function checkContribution(address addr) public view returns(uint256){
        uint256 tokensBought = _getTokenAmount(_contributions[addr]);
        return (tokensBought);
    }

    function checkContributionExt(address addr) external view returns(uint256){
        uint256 tokensBought = _getTokenAmount(_contributions[addr]);
        return (tokensBought);
    }

    function switchWhitelistPurchase(bool _turn) external onlyOwner {
        whitelistPurchase = _turn;
    }

    
    function setRate(uint256 newRate) external onlyOwner icoNotActive{
        _rate = newRate;
    }
    
    function setWalletReceiver(address newWallet) external onlyOwner(){
        _wallet = newWallet;
    }

    
     function setMinPurchase(uint256 value) external onlyOwner{
        minPurchase = value;
    }

    function setMaxPurchase(uint256 value) external onlyOwner{
        maxPurchasePer = value;
    }
    
    function setHardcap(uint256 value) external onlyOwner{
        hardcap = value;
    }
    
    function takeTokens(IERC20 tokenAddress) public onlyOwner{
        IERC20 tokenBEP = tokenAddress;
        uint256 tokenAmt = tokenBEP.balanceOf(address(this));
        require(tokenAmt > 0, "BEP-20 balance is 0");
        tokenBEP.transfer(_wallet, tokenAmt);
    }
    
    modifier icoActive() {
        require(endICO > 0 && block.timestamp < endICO && _weiRaised < hardcap, "IDO must be active");
        _;
    }
    
    modifier icoNotActive() {
        require(endICO < block.timestamp, 'IDO should not be active');
        _;
    }
    
}