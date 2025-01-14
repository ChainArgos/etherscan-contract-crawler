// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library Utils {
    function getRandom(uint256 tokenId) internal view returns (uint256) {
        return (uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), tokenId))));
    }
}