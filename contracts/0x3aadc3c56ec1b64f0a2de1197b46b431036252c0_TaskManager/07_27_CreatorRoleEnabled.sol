/*
 * This file is part of the Qomet Technologies contracts (https://github.com/qomet-tech/contracts).
 * Copyright (c) 2022 Qomet Technologies (https://qomet.tech)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
// SPDX-License-Identifier: GNU General Public License v3.0

pragma solidity 0.8.1;

import "./AdminRoleEnabled.sol";

/// @author Kam Amini <[email protected]>
///
/// @notice Use at your own risk
abstract contract CreatorRoleEnabled is AdminRoleEnabled {

    mapping (address => bool) private _creators;

    uint internal _nrOfCreators;

    event CreatorAdded(address account);
    event CreatorRemoved(address account);

    modifier onlyCreator() {
        require(_isCreator(msg.sender), "CRE: not creator");
        _;
    }

    modifier onlyCreatorOrAdmin() {
        require(_isCreator(msg.sender) || _isAdmin(msg.sender),
                "CRE: not creator nor admin");
        _;
    }

    constructor() {
        _nrOfCreators = 0;
    }

    function isCreator(address account) external view
      onlyAdmin
      returns (bool)
    {
        return _isCreator(account);
    }

    function addCreator(uint256 adminTaskId, address account) external
      onlyAdmin
      taskMustExist(adminTaskId)
      taskMustBeAdministrative(adminTaskId)
      taskMustNotBeFinalized(adminTaskId)
      taskMustBeApproved(adminTaskId)
    {
        _addCreator(account);
        _finalizeTask(adminTaskId, "");
    }

    function removeCreator(uint256 adminTaskId, address account) external
      onlyAdmin
      taskMustExist(adminTaskId)
      taskMustBeAdministrative(adminTaskId)
      taskMustNotBeFinalized(adminTaskId)
      taskMustBeApproved(adminTaskId)
    {
        _removeCreator(account);
        _finalizeTask(adminTaskId, "");
    }

    function _isCreator(address account) internal view returns (bool) {
        return _creators[account];
    }

    function _addCreator(address account) internal {
        require(account != address(0), "CRE: zero account");
        require(!_creators[account], "CRE: is creator");
        _creators[account] = true;
        _nrOfCreators += 1;
        emit CreatorAdded(account);
    }

    function _removeCreator(address account) internal {
        require(account != address(0), "CRE: zero account");
        require(_creators[account], "CRE: not creator");
        _creators[account] = false;
        _nrOfCreators -= 1;
        emit CreatorRemoved(account);
    }
}