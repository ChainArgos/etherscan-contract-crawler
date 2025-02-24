// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

interface IRootChainManager {
    function depositFor(
        address user,
        address rootToken,
        bytes calldata depositData
    ) external;
}