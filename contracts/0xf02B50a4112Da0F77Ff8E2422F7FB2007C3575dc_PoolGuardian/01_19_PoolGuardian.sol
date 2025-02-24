// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.6.12;

import "../proxy/TitanProxy.sol";
import "../storage/PoolStateStorage.sol";

contract PoolGuardian is TitanProxy, PoolStateStorage {
    constructor(address _SAVIOR, address _implementationContract) public TitanProxy(_SAVIOR, _implementationContract) {}
}