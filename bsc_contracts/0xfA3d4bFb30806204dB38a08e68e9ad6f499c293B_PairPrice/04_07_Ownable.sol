// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SystemAuth.sol";

contract Ownable {

    SystemAuth internal auth;

    modifier onlyOwner () {
        require(msg.sender == auth.getOwner(), "only owner");
        _;
    }

    constructor(address _auth) {
        auth = SystemAuth(_auth);
    }

    function setAuth(address _auth) external {
        require(auth.getOwner() == msg.sender, "owner only");
        require(_auth != address(auth), "auth already");
        auth = SystemAuth(_auth);
    }

    function getAuth() external view returns (address res) {
        res = address(auth);
    }
}