// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IWeth {
    function deposit() external payable;

    function withdraw(uint amount) external;
}