// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IToken {

    function burned(address _user, uint256 _amount) external;
    
}