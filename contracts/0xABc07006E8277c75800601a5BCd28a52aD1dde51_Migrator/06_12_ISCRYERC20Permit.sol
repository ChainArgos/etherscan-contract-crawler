// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0;

import './ISCRYERC20.sol';

interface ISCRYERC20Permit is ISCRYERC20 {
    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;
}