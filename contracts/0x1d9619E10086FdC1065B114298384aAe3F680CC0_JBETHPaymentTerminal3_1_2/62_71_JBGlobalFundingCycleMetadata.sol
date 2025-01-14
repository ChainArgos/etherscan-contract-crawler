// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @custom:member allowSetTerminals A flag indicating if setting terminals should be allowed during this funding cycle.
/// @custom:member allowSetController A flag indicating if setting a new controller should be allowed during this funding cycle.
/// @custom:member pauseTransfers A flag indicating if the project token transfer functionality should be paused during the funding cycle.
struct JBGlobalFundingCycleMetadata {
  bool allowSetTerminals;
  bool allowSetController;
  bool pauseTransfers;
}