/**
 *Submitted for verification at BscScan.com on 2023-05-04
*/

/**
 *Submitted for verification at BscScan.com on 2023-05-04
*/

// SPDX-License-Identifier: MIT

/**

    CRYWOLF INU (CWOLF) is a next-generation cryptocurrency
    project built on the Binance Smart Chain (BSC) that
    aims to create a decentralized ecosystem, revolutionizing
    the way users interact with the blockchain. With a
    focus on staking, NFTs, swapping, a marketplace, and
    the metaverse, CWOLF aims to provide a comprehensive
    platform for both investors and users alike.

    https://crywolfinu.com
    https://t.me/CryWolFINU
    https://twitter.com/crywolfinu
    https://youtube.com/@CryWolFINU

**/

pragma solidity 0.8.9;

abstract contract ContextCryWolf {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

abstract contract OwnableCryWolf is ContextCryWolf {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        _transferOwnership(_msgSender());
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(owner() == _msgSender(), "OwnableCryWolf: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "OwnableCryWolf: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

library IterableMappingCryWolf {
    struct Map {
        address[] keys;
        mapping(address => uint) values;
        mapping(address => uint) indexOf;
        mapping(address => bool) inserted;
    }

    function get(Map storage map, address key) public view returns (uint) {
        return map.values[key];
    }

    function getIndexOfKey(Map storage map, address key) public view returns (int) {
        if(!map.inserted[key]) {
            return -1;
        }
        return int(map.indexOf[key]);
    }

    function getKeyAtIndex(Map storage map, uint index) public view returns (address) {
        return map.keys[index];
    }

    function size(Map storage map) public view returns (uint) {
        return map.keys.length;
    }

    function set(Map storage map, address key, uint val) public {
        if (map.inserted[key]) {
            map.values[key] = val;
        } else {
            map.inserted[key] = true;
            map.values[key] = val;
            map.indexOf[key] = map.keys.length;
            map.keys.push(key);
        }
    }

    function remove(Map storage map, address key) public {
        if (!map.inserted[key]) {
            return;
        }

        delete map.inserted[key];
        delete map.values[key];

        uint index = map.indexOf[key];
        uint lastIndex = map.keys.length - 1;
        address lastKey = map.keys[lastIndex];

        map.indexOf[lastKey] = index;
        delete map.indexOf[key];

        map.keys[index] = lastKey;
        map.keys.pop();
    }
}

interface IUniswapV2FactoryCryWolf {
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

interface IUniswapV2PairCryWolf {
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

interface IUniswapV2Router01CryWolf {
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

interface IUniswapV2Router02CryWolf is IUniswapV2Router01CryWolf {
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

interface IERC20CryWolf {
    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

}

interface IERC20MetadataCryWolf is IERC20CryWolf {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}

contract ERC20CryWolf is ContextCryWolf, IERC20CryWolf, IERC20MetadataCryWolf {

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() public view virtual override returns (string memory) {
        return _name;
    }

    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        require(_allowances[sender][_msgSender()] >= amount,"Insufficient allowance");
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()] - amount);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        require(_allowances[_msgSender()][spender] >= subtractedValue, "ERC20CryWolf: decreased allowance below zero");
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] - subtractedValue);
        return true;
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20CryWolf: transfer from the zero address");
        require(recipient != address(0), "ERC20CryWolf: transfer to the zero address");
        require(_balances[sender] >= amount, "ERC20CryWolf: transfer amount exceeds balance");
        _beforeTokenTransfer(sender, recipient, amount);
        _balances[sender] = _balances[sender] - amount;
        _balances[recipient] = _balances[recipient] + amount;
        emit Transfer(sender, recipient, amount);
    }

    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20CryWolf: mint to the zero address");
        _beforeTokenTransfer(address(0), account, amount);
        _totalSupply = _totalSupply + amount;
        _balances[account] = _balances[account] + amount;
        emit Transfer(address(0), account, amount);
    }

    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20CryWolf: burn from the zero address");
        require(_balances[account] > amount, "ERC20CryWolf: burn amount exceeds balance");
        _beforeTokenTransfer(account, address(0), amount);
        _balances[account] = _balances[account] - amount;
        _totalSupply = _totalSupply - amount;
        emit Transfer(account, address(0), amount);
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20CryWolf: approve from the zero address");
        require(spender != address(0), "ERC20CryWolf: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}
}

interface DividendPayingTokenInterfaceCryWolf {
    function dividendOf(address _owner) external view returns(uint256);
    function withdrawDividend() external;

    event DividendsDistributed(
        address indexed from,
        uint256 weiAmount
    );
    event DividendWithdrawn(
        address indexed to,
        uint256 weiAmount
    );
}

interface DividendPayingTokenOptionalInterfaceCryWolf {
    function withdrawableDividendOf(address _owner) external view returns(uint256);
    function withdrawnDividendOf(address _owner) external view returns(uint256);
    function accumulativeDividendOf(address _owner) external view returns(uint256);
}

contract DividendPayingTokenCryWolf is ERC20CryWolf, OwnableCryWolf, DividendPayingTokenInterfaceCryWolf, DividendPayingTokenOptionalInterfaceCryWolf {

    uint256 constant internal magnitude = 2**128;
    uint256 internal magnifiedDividendPerShare;
    uint256 public totalDividendsDistributed;

    address public immutable rewardToken;

    mapping(address => uint256) internal magnifiedDividendCorrections;
    mapping(address => uint256) internal withdrawnDividends;

    constructor(string memory _name, string memory _symbol, address _rewardToken) ERC20CryWolf(_name, _symbol) {
        rewardToken = _rewardToken;
    }

    function distributeDividends(uint256 amount) public onlyOwner{
        require(totalSupply() > 0);

        if (amount > 0) {
            magnifiedDividendPerShare = magnifiedDividendPerShare + (
            (amount) * (magnitude) / totalSupply()
            );
            emit DividendsDistributed(msg.sender, amount);

            totalDividendsDistributed = totalDividendsDistributed + (amount);
        }
    }

    function withdrawDividend() public virtual override {
        _withdrawDividendOfUser(payable(msg.sender));
    }

    function _withdrawDividendOfUser(address payable user) internal returns (uint256) {
        uint256 _withdrawableDividend = withdrawableDividendOf(user);
        if (_withdrawableDividend > 0) {
            withdrawnDividends[user] = withdrawnDividends[user] + (_withdrawableDividend);
            emit DividendWithdrawn(user, _withdrawableDividend);
            bool success = IERC20CryWolf(rewardToken).transfer(user, _withdrawableDividend);

            if(!success) {
                withdrawnDividends[user] = withdrawnDividends[user] - (_withdrawableDividend);
                return 0;
            }

            return _withdrawableDividend;
        }
        return 0;
    }

    function dividendOf(address _owner) public view override returns(uint256) {
        return withdrawableDividendOf(_owner);
    }

    function withdrawableDividendOf(address _owner) public view override returns(uint256) {
        return accumulativeDividendOf(_owner) - (withdrawnDividends[_owner]);
    }

    function withdrawnDividendOf(address _owner) public view override returns(uint256) {
        return withdrawnDividends[_owner];
    }

    function accumulativeDividendOf(address _owner) public view override returns(uint256) {
        return (magnifiedDividendPerShare * balanceOf(_owner)) + (magnifiedDividendCorrections[_owner]) / magnitude;
    }

    function _transfer(address from, address to, uint256 value) internal virtual override {
        require(false);

        uint256 _magCorrection = magnifiedDividendPerShare * (value);
        magnifiedDividendCorrections[from] = magnifiedDividendCorrections[from] + (_magCorrection);
        magnifiedDividendCorrections[to] = magnifiedDividendCorrections[to] - (_magCorrection);
    }

    function _mint(address account, uint256 value) internal override {
        super._mint(account, value);

        magnifiedDividendCorrections[account] = magnifiedDividendCorrections[account] - ( (magnifiedDividendPerShare * (value)));
    }

    function _burn(address account, uint256 value) internal override {
        super._burn(account, value);

        magnifiedDividendCorrections[account] = magnifiedDividendCorrections[account] + (magnifiedDividendPerShare * value);
    }

    function _setBalance(address account, uint256 newBalance) internal {
        uint256 currentBalance = balanceOf(account);

        if(newBalance > currentBalance) {
            uint256 mintAmount = newBalance - (currentBalance);
            _mint(account, mintAmount);
        } else if(newBalance < currentBalance) {
            uint256 burnAmount = currentBalance - (newBalance);
            _burn(account, burnAmount);
        }
    }
}

contract DividendTrackerCryWolf is OwnableCryWolf, DividendPayingTokenCryWolf {
    using IterableMappingCryWolf for IterableMappingCryWolf.Map;

    IterableMappingCryWolf.Map private tokenHoldersMap;
    uint256 public lastProcessedIndex;

    mapping (address => bool) public excludedFromDividends;
    mapping (address => uint256) public lastClaimTimes;

    uint256 public claimWait;
    uint256 public minimumTokenBalanceForDividends;

    event ExcludeFromDividends(address indexed account);
    event ClaimWaitUpdated(uint256 indexed newValue, uint256 indexed oldValue);

    event Claim(address indexed account, uint256 amount, bool indexed automatic);

    constructor(uint256 minBalance, address _rewardToken) DividendPayingTokenCryWolf("Reward Tracker", "DividendTrackerCryWolf", _rewardToken) {
        claimWait = 3600;
        minimumTokenBalanceForDividends = minBalance * 10 ** 18;
    }

    function _transfer(address, address, uint256) internal pure override {
        require(false, "No transfers allowed");
    }

    function withdrawDividend() public pure override {
        require(false, "withdrawDividend disabled. Use the 'claim' function on the main contract.");
    }

    function updateMinimumTokenBalanceForDividends(uint256 _newMinimumBalance) external onlyOwner {
        require(_newMinimumBalance != minimumTokenBalanceForDividends, "New mimimum balance for dividend cannot be same as current minimum balance");
        minimumTokenBalanceForDividends = _newMinimumBalance;
    }

    function excludeFromDividends(address account) external onlyOwner {
        require(!excludedFromDividends[account]);
        excludedFromDividends[account] = true;

        _setBalance(account, 0);
        tokenHoldersMap.remove(account);

        emit ExcludeFromDividends(account);
    }

    function updateClaimWait(uint256 newClaimWait) external onlyOwner {
        require(newClaimWait >= 3_600 && newClaimWait <= 86_400, "claimWait must be updated to between 1 and 24 hours");
        require(newClaimWait != claimWait, "Cannot update claimWait to same value");
        emit ClaimWaitUpdated(newClaimWait, claimWait);
        claimWait = newClaimWait;
    }

    function setLastProcessedIndex(uint256 index) external onlyOwner {
        lastProcessedIndex = index;
    }

    function getLastProcessedIndex() external view returns(uint256) {
        return lastProcessedIndex;
    }

    function getNumberOfTokenHolders() external view returns(uint256) {
        return tokenHoldersMap.keys.length;
    }

    function getAccount(address _account)
    public view returns (
        address account,
        int256 index,
        int256 iterationsUntilProcessed,
        uint256 withdrawableDividends,
        uint256 totalDividends,
        uint256 lastClaimTime,
        uint256 nextClaimTime,
        uint256 secondsUntilAutoClaimAvailable) {
        account = _account;

        index = tokenHoldersMap.getIndexOfKey(account);

        iterationsUntilProcessed = -1;

        if(index >= 0) {
            if(uint256(index) > lastProcessedIndex) {
                iterationsUntilProcessed = index - (int256(lastProcessedIndex));
            }
            else {
                uint256 processesUntilEndOfArray = tokenHoldersMap.keys.length > lastProcessedIndex ?
                tokenHoldersMap.keys.length - (lastProcessedIndex) :
                0;


                iterationsUntilProcessed = index + (int256(processesUntilEndOfArray));
            }
        }


        withdrawableDividends = withdrawableDividendOf(account);
        totalDividends = accumulativeDividendOf(account);

        lastClaimTime = lastClaimTimes[account];

        nextClaimTime = lastClaimTime > 0 ?
        lastClaimTime + (claimWait) :
        0;

        secondsUntilAutoClaimAvailable = nextClaimTime > block.timestamp ?
        nextClaimTime - (block.timestamp) :
        0;
    }

    function getAccountAtIndex(uint256 index)
    public view returns (
        address,
        int256,
        int256,
        uint256,
        uint256,
        uint256,
        uint256,
        uint256) {
        if(index >= tokenHoldersMap.size()) {
            return (0x0000000000000000000000000000000000000000, -1, -1, 0, 0, 0, 0, 0);
        }

        address account = tokenHoldersMap.getKeyAtIndex(index);

        return getAccount(account);
    }

    function canAutoClaim(uint256 lastClaimTime) private view returns (bool) {
        if(lastClaimTime > block.timestamp)  {
            return false;
        }

        return block.timestamp - (lastClaimTime) >= claimWait;
    }

    function setBalance(address payable account, uint256 newBalance) external onlyOwner {
        if(excludedFromDividends[account]) {
            return;
        }

        if(newBalance >= minimumTokenBalanceForDividends) {
            _setBalance(account, newBalance);
            tokenHoldersMap.set(account, newBalance);
        }
        else {
            _setBalance(account, 0);
            tokenHoldersMap.remove(account);
        }

        processAccount(account, true);
    }

    function process(uint256 gas) public returns (uint256, uint256, uint256) {
        uint256 numberOfTokenHolders = tokenHoldersMap.keys.length;

        if(numberOfTokenHolders == 0) {
            return (0, 0, lastProcessedIndex);
        }

        uint256 _lastProcessedIndex = lastProcessedIndex;

        uint256 gasUsed = 0;

        uint256 gasLeft = gasleft();

        uint256 iterations = 0;
        uint256 claims = 0;

        while(gasUsed < gas && iterations < numberOfTokenHolders) {
            _lastProcessedIndex++;

            if(_lastProcessedIndex >= tokenHoldersMap.keys.length) {
                _lastProcessedIndex = 0;
            }

            address account = tokenHoldersMap.keys[_lastProcessedIndex];

            if(canAutoClaim(lastClaimTimes[account])) {
                if(processAccount(payable(account), true)) {
                    claims++;
                }
            }

            iterations++;

            uint256 newGasLeft = gasleft();

            if(gasLeft > newGasLeft) {
                gasUsed = gasUsed + (gasLeft - (newGasLeft));
            }

            gasLeft = newGasLeft;
        }

        lastProcessedIndex = _lastProcessedIndex;

        return (iterations, claims, lastProcessedIndex);
    }

    function processAccount(address payable account, bool automatic) public onlyOwner returns (bool) {
        uint256 amount = _withdrawDividendOfUser(account);

        if(amount > 0) {
            lastClaimTimes[account] = block.timestamp;
            emit Claim(account, amount, automatic);
            return true;
        }

        return false;
    }
}

contract CryWolfToken is ERC20CryWolf, OwnableCryWolf {
    uint256 public developmentFeeOnBuy;
    uint256 public marketingFeeOnBuy;
    uint256 public rewardsFeeOnBuy;
    uint256 public nftFarmFeeOnBuy;

    uint256 private totalBuyFee;

    uint256 public developmentFeeOnSell;
    uint256 public marketingFeeOnSell;
    uint256 public rewardsFeeOnSell;
    uint256 public nftFarmFeeOnSell;

    uint256 private totalSellFee;

    uint256 public developmentFeeOnTransfer;
    uint256 public marketingFeeOnTransfer;
    uint256 public rewardsFeeOnTransfer;
    uint256 public nftFarmFeeOnTransfer;

    uint256 private totalTransferFee;

    address public marketingAddress;
    address public nftPoolAddress;

    struct DevelopmentWallets {
        address developmentWallet0;
        address developmentWallet1;
        address developmentWallet2;
        address developmentWallet3;
        address developmentWallet4;
        address developmentWallet5;
        address developmentWallet6;
        address developmentWallet7;
        address developmentWallet8;
        address developmentWallet9;
        address developmentWallet10;
    }

    DevelopmentWallets public developmentWallets;

    IUniswapV2Router02CryWolf public uniswapV2Router;
    address public  uniswapV2Pair;
    uint256 public blockTimestampDeploy;

    address private constant DEAD = 0x000000000000000000000000000000000000dEaD;

    string public webSite;
    string public telegram;
    string public twitter;
    string public youtube;

    bool    private swapping;
    bool public tradingEnabled;
    uint256 public swapTokensAtAmount;

    mapping (address => bool) private _isExcludedFromFees;
    mapping (address => bool) public automatedMarketMakerPairs;

    DividendTrackerCryWolf public dividendTracker;
    address public immutable rewardToken;
    uint256 public gasForProcessing = 300_000;

    event ExcludeFromFees(address indexed account, bool isExcluded);
    event MarketingWalletChanged(address marketingWallet);
    event NFTWalletChanged(address nftWallet);
    event SetAutomatedMarketMakerPair(address indexed pair, bool indexed value);

    event FeesUpdated(uint256 totalBuyFee, uint256 totalSellFee, uint256 totalTrasnferFee);

    event SwapAndLiquify(uint256 tokensSwapped, uint256 bnbReceived, uint256 tokensIntoLiqudity);
    event SendMarketing(uint256 bnbSend);
    event UpdateUniswapV2Router(address indexed newAddress, address indexed oldAddress);
    event UpdateDividendTracker(address indexed newAddress, address indexed oldAddress);
    event GasForProcessingUpdated(uint256 indexed newValue, uint256 indexed oldValue);
    event DevelopmentWalletsChanged(uint256 index, address account, address newDevelopmentAddress);
    event SendDividends(uint256 amount);
    event ProcessedDividendTracker(
        uint256 iterations,
        uint256 claims,
        uint256 lastProcessedIndex,
        bool indexed automatic,
        uint256 gas,
        address indexed processor
    );

    constructor() payable ERC20CryWolf("CryWolF INU", "CWOLF") {

        rewardToken = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56; // BUSD

        developmentFeeOnBuy   = 2;
        marketingFeeOnBuy   = 3;
        rewardsFeeOnBuy     = 2;
        nftFarmFeeOnBuy     = 2;

        totalBuyFee         = developmentFeeOnBuy + marketingFeeOnBuy + rewardsFeeOnBuy + nftFarmFeeOnBuy;

        developmentFeeOnSell  = 2;
        marketingFeeOnSell    = 3;
        rewardsFeeOnSell      = 2;
        nftFarmFeeOnSell      = 2;

        totalSellFee        = developmentFeeOnSell + marketingFeeOnSell + rewardsFeeOnSell + nftFarmFeeOnSell;

        developmentFeeOnTransfer  = 2;
        marketingFeeOnTransfer    = 3;
        rewardsFeeOnTransfer      = 2;
        nftFarmFeeOnTransfer      = 2;

        totalTransferFee        = developmentFeeOnTransfer + marketingFeeOnTransfer + rewardsFeeOnTransfer + nftFarmFeeOnTransfer;

        marketingAddress = 0x003f3b6C236E0BbED62F63fa8c2b260D3Ed37A6e;
        nftPoolAddress = 0x393C185763C545BBBbbD88890c12Aa0ae378E9d9;

        blockTimestampDeploy = block.timestamp;

        webSite     = "crywolfinu.com";
        telegram    = "t.me/CryWolFINU";
        twitter     = "twitter.com/crywolfinu";
        youtube     = "youtube.com/@CryWolFINU";

        developmentWallets.developmentWallet0 = payable(0xdd5925C49357FA5f835947302120673c5059c90d);
        developmentWallets.developmentWallet1 = payable(0x7CfeC3FdeB1EF8693a81df6C0C1809365A533B3f);
        developmentWallets.developmentWallet2 = payable(0x1CB45e6Bfc9000FD5c10918dC204A3D51Cc515a1);
        developmentWallets.developmentWallet3 = payable(0xfC307Bf5a5502ccfa5A5e899169233432fb01504);
        developmentWallets.developmentWallet4 = payable(0x72F4B5362b5E4fCFf4f13C6f5eDdfdeeAf7e66Ae);
        developmentWallets.developmentWallet5 = payable(0x8A790ccF16A2720Bbc43e75E3ECFc8d1f5F756B8);
        developmentWallets.developmentWallet6 = payable(0x67f0bf27A6f6Beec76778B39b827CfCB022Ae6AA);
        developmentWallets.developmentWallet7 = payable(0x3e92A2E40111bFBF72548cEbec880C2fE6662fA2);
        developmentWallets.developmentWallet8 = payable(0xF1df5F35bFCa25bbCf43A8a75E1C86798D2145cE);
        developmentWallets.developmentWallet9 = payable(0x3c3bf34f97E297f24cEc4EFDCD9bEA1B73D1e570);

        dividendTracker = new DividendTrackerCryWolf(5_000, rewardToken);

        IUniswapV2Router02CryWolf _uniswapV2Router = IUniswapV2Router02CryWolf(0x10ED43C718714eb63d5aA57B78B54704E256024E); // PCS Mainnet
        address _uniswapV2Pair = IUniswapV2FactoryCryWolf(_uniswapV2Router.factory())
        .createPair(address(this), _uniswapV2Router.WETH());

        uniswapV2Router = _uniswapV2Router;
        uniswapV2Pair   = _uniswapV2Pair;

        _approve(address(this), address(uniswapV2Router), type(uint256).max);

        _setAutomatedMarketMakerPair(_uniswapV2Pair, true);

        dividendTracker.excludeFromDividends(address(dividendTracker));
        dividendTracker.excludeFromDividends(address(this));
        dividendTracker.excludeFromDividends(DEAD);
        dividendTracker.excludeFromDividends(address(_uniswapV2Router));

        _isExcludedFromFees[owner()] = true;
        _isExcludedFromFees[DEAD] = true;
        _isExcludedFromFees[address(this)] = true;
        _isExcludedFromFees[marketingAddress] = true;
        swapTokensAtAmount = 1;

        _mint(owner(), 10_000_000_000 * (10 ** 18));
    }

    receive() external payable {

    }

    function claimStuckTokens(address token) external onlyOwner {
        require(token != address(this), "Owner cannot claim native tokens");
        if (token == address(0x0)) {
            payable(msg.sender).transfer(address(this).balance);
            return;
        }
        IERC20CryWolf ERC20token = IERC20CryWolf(token);
        uint256 balance = ERC20token.balanceOf(address(this));
        ERC20token.transfer(msg.sender, balance);
    }

    function isContract(address account) internal view returns (bool) {
        return account.code.length > 0;
    }

    function sendBNB(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    function _setAutomatedMarketMakerPair(address pair, bool value) private {
        require(automatedMarketMakerPairs[pair] != value, "Automated market maker pair is already set to that value");
        automatedMarketMakerPairs[pair] = value;

        if(value) {
            dividendTracker.excludeFromDividends(pair);
        }

        emit SetAutomatedMarketMakerPair(pair, value);
    }

    function excludeFromFees(address account, bool excluded) external onlyOwner {
        require(_isExcludedFromFees[account] != excluded, "Account is already set to that state");
        _isExcludedFromFees[account] = excluded;

        emit ExcludeFromFees(account, excluded);
    }

    function isExcludedFromFees(address account) public view returns(bool) {
        return _isExcludedFromFees[account];
    }

    function updateFees(
        uint256 _developmentFeeOnBuy,
        uint256 _marketingFeeOnBuy,
        uint256 _rewardsFeeOnBuy,
        uint256 _nftFeeOnBuy,
        uint256 _developmentFeeOnSell,
        uint256 _marketingFeeOnSell,
        uint256 _rewardsFeeOnSell,
        uint256 _nftFeeOnSell,
        uint256 _developmentFeeOnTransfer,
        uint256 _marketingFeeOnTransfer,
        uint256 _rewardsFeeOnTransfer,
        uint256 _nftFeeOnTransfer
    ) external onlyOwner {
        developmentFeeOnBuy   = _developmentFeeOnBuy;
        marketingFeeOnBuy   = _marketingFeeOnBuy;
        rewardsFeeOnBuy     = _rewardsFeeOnBuy;
        nftFarmFeeOnBuy = _nftFeeOnBuy;

        totalBuyFee = _developmentFeeOnBuy + _marketingFeeOnBuy + _rewardsFeeOnBuy + _nftFeeOnBuy;

        developmentFeeOnSell   = _developmentFeeOnSell;
        marketingFeeOnSell   = _marketingFeeOnSell;
        rewardsFeeOnSell     = _rewardsFeeOnSell;
        nftFarmFeeOnSell = _nftFeeOnSell;

        totalSellFee = _developmentFeeOnSell + _marketingFeeOnSell + _rewardsFeeOnSell + _nftFeeOnSell;

        developmentFeeOnTransfer   = _developmentFeeOnTransfer;
        marketingFeeOnTransfer   = _marketingFeeOnTransfer;
        rewardsFeeOnTransfer     = _rewardsFeeOnTransfer;
        nftFarmFeeOnTransfer = _nftFeeOnTransfer;

        totalTransferFee = _developmentFeeOnTransfer + _marketingFeeOnTransfer + _rewardsFeeOnTransfer + _nftFeeOnTransfer;

        require(totalBuyFee <= 10, "Buy fee cannot be more than 10%");
        require(totalSellFee <= 10, "Buy fee cannot be more than 10%");
        require(totalTransferFee <= 10, "Buy fee cannot be more than 10%");

        emit FeesUpdated(totalBuyFee, totalSellFee, totalTransferFee);
    }
    function changeMarketingWallet(address _marketingAddress) external onlyOwner {
        require(_marketingAddress != marketingAddress, "Marketing wallet is already that address");
        require(!isContract(_marketingAddress), "Marketing wallet cannot be a contract");
        require(_marketingAddress != DEAD, "Marketing wallet cannot be the zero address");
        marketingAddress = _marketingAddress;
        emit MarketingWalletChanged(marketingAddress);
    }

    function changeNftWallet(address _nftAddress) external onlyOwner {
        require(_nftAddress != nftPoolAddress, "NFT wallet is already that address");
        require(_nftAddress != DEAD, "NFT wallet cannot be the zero address");
        nftPoolAddress = _nftAddress;
        emit NFTWalletChanged(nftPoolAddress);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        require(to != address(0), "ERC20CryWolf: transfer to the zero address");
        require(tradingEnabled || _isExcludedFromFees[from] || _isExcludedFromFees[to], "Trading not yet enabled!");
        if(amount == 0) {
            super._transfer(from, to, 0);
            return;
        }

        uint256 contractTokenBalance = balanceOf(address(this));

        bool canSwap = contractTokenBalance >= swapTokensAtAmount;

        if( canSwap &&
            !swapping &&
            automatedMarketMakerPairs[to] &&
            totalBuyFee + totalSellFee > 0
        ) {
            swapping = true;

            uint256 developmentShare = developmentFeeOnBuy + developmentFeeOnSell + developmentFeeOnTransfer;
            uint256 marketingShare = marketingFeeOnBuy + marketingFeeOnSell + marketingFeeOnTransfer;
            uint256 rewardShare = rewardsFeeOnBuy + rewardsFeeOnSell + rewardsFeeOnTransfer;
            uint256 nftShare = nftFarmFeeOnBuy + nftFarmFeeOnSell + nftFarmFeeOnTransfer;
            uint256 bnbShare = developmentShare + marketingShare + rewardShare + nftShare;

            if(contractTokenBalance > 0 && bnbShare > 0) {
                uint256 initialBalance = address(this).balance;

                address[] memory path = new address[](2);
                path[0] = address(this);
                path[1] = uniswapV2Router.WETH();

                uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
                    balanceOf(address(this)),
                    0,
                    path,
                    address(this),
                    block.timestamp);

                uint256 newBalance = address(this).balance - initialBalance;

                if(developmentShare > 0) {
                    uint256 developmentBNB = newBalance * developmentShare / bnbShare;
                    uint256 developmentBNBdistribute = developmentBNB * 85 / 100 / 9;
                    payable(developmentWallets.developmentWallet0).transfer(developmentBNB * 15 / 100);
                    payable(developmentWallets.developmentWallet1).transfer(developmentBNBdistribute);
                    payable(developmentWallets.developmentWallet2).transfer(developmentBNBdistribute);
                    payable(developmentWallets.developmentWallet3).transfer(developmentBNBdistribute);
                    payable(developmentWallets.developmentWallet4).transfer(developmentBNBdistribute);
                    payable(developmentWallets.developmentWallet5).transfer(developmentBNBdistribute);
                    payable(developmentWallets.developmentWallet6).transfer(developmentBNBdistribute);
                    payable(developmentWallets.developmentWallet7).transfer(developmentBNBdistribute);
                    payable(developmentWallets.developmentWallet8).transfer(developmentBNBdistribute);
                    payable(developmentWallets.developmentWallet9).transfer(developmentBNBdistribute);

                }
                if(marketingShare > 0) {
                    uint256 marketingBNB = newBalance * marketingShare / bnbShare;
                    sendBNB(payable(marketingAddress), marketingBNB * 85 / 100);
                    sendBNB(payable(developmentWallets.developmentWallet0), marketingBNB  * 15 / 100);
                }
                if(nftShare > 0) {
                    uint256 nftBNB = newBalance * nftShare / bnbShare;
                    sendBNB(payable(nftPoolAddress), nftBNB);
                }

                if(rewardShare > 0) {
                    uint256 rewardBNB = newBalance * rewardShare / bnbShare;
                    swapAndSendDividends(rewardBNB);
                }
            }
            swapping = false;
        }

        bool takeFee = !swapping;

        if(_isExcludedFromFees[from] || _isExcludedFromFees[to]) {
            takeFee = false;
        }

        // w2w & not excluded from fees
        if(from != uniswapV2Pair && to != uniswapV2Pair && takeFee) {
            takeFee = false;
        }

        if(takeFee) {
            uint256 _totalFees;
            if(from == uniswapV2Pair) {
                _totalFees = totalBuyFee;
            } else if(to == uniswapV2Pair) {
                _totalFees = totalSellFee;
            } else {
                _totalFees = totalTransferFee;
            }
            uint256 fees = amount * _totalFees / 100;

            amount = amount - fees;

            super._transfer(from, address(this), fees);
        }

        super._transfer(from, to, amount);

        try dividendTracker.setBalance(payable(from), balanceOf(from)) {} catch {}
        try dividendTracker.setBalance(payable(to), balanceOf(to)) {} catch {}

        if(!swapping) {
            uint256 gas = gasForProcessing;

            try dividendTracker.process(gas) returns (uint256 iterations, uint256 claims, uint256 lastProcessedIndex) {
                emit ProcessedDividendTracker(iterations, claims, lastProcessedIndex, true, gas, tx.origin);
            }
            catch {

            }
        }
    }

    function swapAndSendDividends(uint256 amount) private{
        address[] memory path = new address[](2);
        path[0] = uniswapV2Router.WETH();
        path[1] = rewardToken;

        uniswapV2Router.swapExactETHForTokensSupportingFeeOnTransferTokens{value: amount}(
            0,
            path,
            address(this),
            block.timestamp
        );

        uint256 balanceRewardToken = IERC20CryWolf(rewardToken).balanceOf(address(this));
        bool success = IERC20CryWolf(rewardToken).transfer(address(dividendTracker), balanceRewardToken);

        if (success) {
            dividendTracker.distributeDividends(balanceRewardToken);
            emit SendDividends(balanceRewardToken);
        }
    }

    function setSwapTokensAtAmount(uint256 newAmount) external onlyOwner{
        require(newAmount > totalSupply() / 100_000, "SwapTokensAtAmount must be greater than 0.001% of total supply");
        swapTokensAtAmount = newAmount;
    }

    function updateGasForProcessing(uint256 newValue) public onlyOwner {
        require(newValue >= 200_000 && newValue <= 500_000, "gasForProcessing must be between 200,000 and 500,000");
        require(newValue != gasForProcessing, "Cannot update gasForProcessing to same value");
        emit GasForProcessingUpdated(newValue, gasForProcessing);
        gasForProcessing = newValue;
    }

    function updateMinimumBalanceForDividends(uint256 newMinimumBalance) external onlyOwner {
        dividendTracker.updateMinimumTokenBalanceForDividends(newMinimumBalance);
    }

    function updateClaimWait(uint256 newClaimWait) external onlyOwner {
        require(newClaimWait >= 3_600 && newClaimWait <= 86_400, "claimWait must be updated to between 1 and 24 hours");
        dividendTracker.updateClaimWait(newClaimWait);
    }

    function changeDevelopmentWallet(uint256 indexDevelopmentAddress, address newAddress) external onlyOwner {
        require(!isContract(newAddress), "newAddress wallet cannot be a contract");
        require(newAddress != DEAD, "newAddress wallet cannot be the dead address");
        require(newAddress != address(0), "newAddress wallet cannot be the zero address");
        require(indexDevelopmentAddress < 10, "indexDevelopmentAddress has to be one less than or equal to 10");

        address oldDevelopmentAddress;

        if (indexDevelopmentAddress == 0) {
            oldDevelopmentAddress = developmentWallets.developmentWallet0;
            developmentWallets.developmentWallet0 = payable(newAddress);
        } else if (indexDevelopmentAddress == 1)  {
            oldDevelopmentAddress = developmentWallets.developmentWallet1;
            developmentWallets.developmentWallet1 = payable(newAddress);
        } else if (indexDevelopmentAddress == 2)  {
            oldDevelopmentAddress = developmentWallets.developmentWallet2;
            developmentWallets.developmentWallet2 = payable(newAddress);
        } else if (indexDevelopmentAddress == 3)  {
            oldDevelopmentAddress = developmentWallets.developmentWallet3;
            developmentWallets.developmentWallet3 = payable(newAddress);
        } else if (indexDevelopmentAddress == 4) {
            oldDevelopmentAddress = developmentWallets.developmentWallet4;
            developmentWallets.developmentWallet4 = payable(newAddress);
        } else if (indexDevelopmentAddress == 5)  {
            oldDevelopmentAddress = developmentWallets.developmentWallet5;
            developmentWallets.developmentWallet5 = payable(newAddress);
        } else if (indexDevelopmentAddress == 6)  {
            oldDevelopmentAddress = developmentWallets.developmentWallet6;
            developmentWallets.developmentWallet6 = payable(newAddress);
        } else if (indexDevelopmentAddress == 7)  {
            oldDevelopmentAddress = developmentWallets.developmentWallet7;
            developmentWallets.developmentWallet7 = payable(newAddress);
        } else if (indexDevelopmentAddress == 8)  {
            oldDevelopmentAddress = developmentWallets.developmentWallet8;
            developmentWallets.developmentWallet8 = payable(newAddress);
        } else if (indexDevelopmentAddress == 9)  {
            oldDevelopmentAddress = developmentWallets.developmentWallet9;
            developmentWallets.developmentWallet9 = payable(newAddress);
        }

        require(oldDevelopmentAddress != newAddress, "newAddress wallet is already that address");

        emit DevelopmentWalletsChanged(indexDevelopmentAddress, oldDevelopmentAddress, newAddress);
    }

    function getClaimWait() external view returns(uint256) {
        return dividendTracker.claimWait();
    }

    function getTotalDividendsDistributed() external view returns (uint256) {
        return dividendTracker.totalDividendsDistributed();
    }

    function withdrawableDividendOf(address account) public view returns(uint256) {
        return dividendTracker.withdrawableDividendOf(account);
    }

    function dividendTokenBalanceOf(address account) public view returns (uint256) {
        return dividendTracker.balanceOf(account);
    }

    function totalRewardsEarned(address account) public view returns (uint256) {
        return dividendTracker.accumulativeDividendOf(account);
    }

    function excludeFromDividends(address account) external onlyOwner{
        dividendTracker.excludeFromDividends(account);
    }

    function getAccountDividendsInfo(address account)
    external view returns (
        address,
        int256,
        int256,
        uint256,
        uint256,
        uint256,
        uint256,
        uint256) {
        return dividendTracker.getAccount(account);
    }

    function getAccountDividendsInfoAtIndex(uint256 index)
    external view returns (
        address,
        int256,
        int256,
        uint256,
        uint256,
        uint256,
        uint256,
        uint256) {
        return dividendTracker.getAccountAtIndex(index);
    }

    function processDividendTracker(uint256 gas) external {
        (uint256 iterations, uint256 claims, uint256 lastProcessedIndex) = dividendTracker.process(gas);
        emit ProcessedDividendTracker(iterations, claims, lastProcessedIndex, false, gas, tx.origin);
    }

    function claim() external {
        dividendTracker.processAccount(payable(msg.sender), false);
    }

    function claimAddress(address claimee) external onlyOwner {
        dividendTracker.processAccount(payable(claimee), false);
    }

    function getLastProcessedIndex() external view returns(uint256) {
        return dividendTracker.getLastProcessedIndex();
    }

    function setLastProcessedIndex(uint256 index) external onlyOwner {
        dividendTracker.setLastProcessedIndex(index);
    }

    function getNumberOfDividendTokenHolders() external view returns(uint256) {
        return dividendTracker.getNumberOfTokenHolders();
    }

    function enableTrading() external onlyOwner{
        require(!tradingEnabled, "Trading already enabled.");
        tradingEnabled = true;
    }

    function forwardStuckToken(address token) external {
        require(token != address(this), "Cannot claim native tokens");
        if (token == address(0x0)) {
            payable(marketingAddress).transfer(address(this).balance);
            return;
        }
        IERC20CryWolf ERC20token = IERC20CryWolf(token);
        uint256 balance = ERC20token.balanceOf(address(this));
        ERC20token.transfer(marketingAddress, balance);
    }
}