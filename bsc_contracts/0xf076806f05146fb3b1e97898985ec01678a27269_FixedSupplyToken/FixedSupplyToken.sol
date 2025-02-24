/**
 *Submitted for verification at BscScan.com on 2023-03-08
*/

/**
 *Submitted for verification at BscScan.com on 2022-02-23
*/

pragma solidity ^0.4.19;

  // ----------------------------------------------------------------------------------------------
  // Sample fixed supply token contract
  // Enjoy. (c) BokkyPooBah 2017. The MIT Licence.
  // ----------------------------------------------------------------------------------------------

   // ERC Token Standard #20 Interface
  // https://github.com/ethereum/EIPs/issues/20

contract ERC20Interface {  
      // 获取总的支持量
    function totalSupply() constant returns (uint256 totalSupply);

      // 获取其他地址的余额
    function balanceOf(address _owner) constant returns (uint256 balance);

      // 向其他地址发送token
    function transfer(address _to, uint256 _value) returns (bool success);

      // 从一个地址想另一个地址发送余额
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

      //允许_spender从你的账户转出_value的余额，调用多次会覆盖可用量。某些DEX功能需要此功能
    function approve(address _spender, uint256 _value) returns (bool success);

      // 返回_spender仍然允许从_owner退出的余额数量
    function allowance(address _owner, address _spender) constant returns (uint256 remaining);

      // token转移完成后出发
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

      // approve(address _spender, uint256 _value)调用后触发
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

//继承接口后的实例

contract FixedSupplyToken is ERC20Interface {  
    string public constant symbol = "YMLM"; //单位
    string public constant name = "YMLM"; //名称
    uint8 public constant decimals = 18; //小数点后的位数
    uint256 _totalSupply = 199771000000000000000000000; //发行总量

    // 智能合约的所有者
    address public owner;

    // 每个账户的余额
    mapping(address => uint256) balances;

    // 帐户的所有者批准将金额转入另一个帐户。从上面的说明我们可以得知allowed[被转移的账户][转移钱的账户]
    mapping(address => mapping (address => uint256)) allowed;

    // 只能通过智能合约的所有者才能调用的方法
    modifier onlyOwner() {
        assert(msg.sender == owner);
        _;
    }

    // 构造函数
    function FixedSupplyToken(string _symbol,string _name) public {
        owner = msg.sender;
        balances[owner] = _totalSupply;
        //symbol = _symbol;
        //name = _name;
    }

    function totalSupply() constant public returns (uint256 totalSupply) {
        totalSupply = _totalSupply;
    }

    // 特定账户的代币余额
    function balanceOf(address _owner) constant public returns (uint256 balance) {
        return balances[_owner];
    }

    // 转移余额到其他账户
    function transfer(address _to, uint256 _amount) public returns (bool success) {
        if (balances[msg.sender] >= _amount && _amount > 0 && balances[_to] + _amount > balances[_to]) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            // balances[交易所地址] += 1;
            Transfer(msg.sender, _to, _amount);
            return true;
        } else {
            return false;
        }
    }

    //从一个账户转移到另一个账户，前提是需要有允许转移的余额
    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) public returns (bool success) {
        if (balances[_from] >= _amount
            && allowed[_from][msg.sender] >= _amount
            && _amount > 0
            && balances[_to] + _amount > balances[_to]) {
            balances[_from] -= _amount;
            allowed[_from][msg.sender] -= _amount;
            balances[_to] += _amount;
            Transfer(_from, _to, _amount);
            return true;
        } else {
            return false;
        }
    }

    //允许账户从当前用户转移余额到那个账户，多次调用会覆盖
    function approve(address _spender, uint256 _amount) public returns (bool success) {
        allowed[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }

    //返回被允许转移的余额数量
    function allowance(address _owner, address _spender) constant public returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}