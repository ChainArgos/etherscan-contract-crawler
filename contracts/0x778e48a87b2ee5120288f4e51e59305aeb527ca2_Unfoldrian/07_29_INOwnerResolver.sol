// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

interface INOwnerResolver {
    function ownerOf(uint256 nid) external view returns (address);

    function balanceOf(address account) external view returns (uint256);

    function nOwned(address owner) external view returns (uint256[] memory);
}