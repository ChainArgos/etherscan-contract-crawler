// SPDX-License-Identifier: BlueOak-1.0.0
pragma solidity 0.8.17;

import "@openzeppelin/contracts-upgradeable/governance/utils/IVotesUpgradeable.sol";

interface IStRSRVotes is IVotesUpgradeable {
    /// @return The current era
    function currentEra() external view returns (uint256);

    /// @return The era at a past block number
    function getPastEra(uint256 blockNumber) external view returns (uint256);

    /// Stakes an RSR `amount` on the corresponding RToken and allows to delegate
    /// votes from the sender to `delegatee` or self
    function stakeAndDelegate(uint256 amount, address delegatee) external;
}