/*
    Copyright 2021 Set Labs Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

    SPDX-License-Identifier: Apache License, Version 2.0
*/

pragma solidity 0.6.10;
pragma experimental "ABIEncoderV2";

import {IJasperVault} from "../../interfaces/IJasperVault.sol";

interface IDelegatedManager {
    function interactManager(address _module, bytes calldata _encoded) external;

    function initializeExtension() external;

    function transferTokens(
        address _token,
        address _destination,
        uint256 _amount
    ) external;

    function factoryReset(
        uint256 _newFeeSplit,
        uint256 _managerFees,
        uint256 _delay
    ) external;

    function updateOwnerFeeSplit(uint256 _newFeeSplit) external;

    function updateOwnerFeeRecipient(address _newFeeRecipient) external;

    function setMethodologist(address _newMethodologist) external;

    function transferOwnership(address _owner) external;

    function isAllowedAdapter(address _adapter) external view returns (bool);

    function jasperVault() external view returns (IJasperVault);

    function owner() external view returns (address);

    function methodologist() external view returns (address);

    function operatorAllowlist(address _operator) external view returns (bool);

    function assetAllowlist(address _asset) external view returns (bool);

    function useAssetAllowlist() external view returns (bool);

    function isAllowedAsset(address _asset) external view returns (bool);

    function isPendingExtension(
        address _extension
    ) external view returns (bool);

    function isInitializedExtension(
        address _extension
    ) external view returns (bool);

    function getExtensions() external view returns (address[] memory);

    function getOperators() external view returns (address[] memory);

    function getAllowedAssets() external view returns (address[] memory);

    function ownerFeeRecipient() external view returns (address);

    function ownerFeeSplit() external view returns (uint256);

    function subscribeStatus() external view returns (uint256);

    function setSubscribeStatus(uint256) external;

    function getAdapters() external view returns (address[] memory);

    function setBaseFeeAndToken(address _masterToken,uint256 _profitShareFee,uint256 _delay) external;
    function setBaseProperty(string memory _name,string memory _symbol,uint256 _followFee,uint256 _maxFollowFee) external;
    
}