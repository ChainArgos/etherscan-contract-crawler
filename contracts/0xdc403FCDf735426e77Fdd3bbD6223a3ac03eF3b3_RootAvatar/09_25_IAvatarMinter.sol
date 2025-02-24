// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IAvatarMinter {
    function allocatedAvatars(uint256 tokenId) external view returns (address);
}