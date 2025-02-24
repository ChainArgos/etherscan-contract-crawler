// SPDX-License-Identifier: MIT

/*********************************
*                                *
*               oYo              *
*                                *
 *********************************/

pragma solidity ^0.8.13;

interface IOwlDescriptor {
    function tokenURI(uint256 tokenId, uint256 seed) external view returns (string memory);
}