// SPDX-License-Identifier: GPL-3.0-or-later
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "../vault/IVault.sol";

/**
 * @title IBalancerRelayer
 * @notice Allows safe multicall execution of a relayer's functions
 */
interface IBalancerRelayer {
    function getLibrary() external view returns (address);

    function getVault() external view returns (IVault);

    function multicall(bytes[] calldata data) external payable returns (bytes[] memory results);
}