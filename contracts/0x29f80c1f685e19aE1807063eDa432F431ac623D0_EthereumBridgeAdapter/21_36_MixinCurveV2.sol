// SPDX-License-Identifier: Apache-2.0
/*

  Copyright 2020 ZeroEx Intl.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/

pragma solidity ^0.6.5;
pragma experimental ABIEncoderV2;

import "@0x/contracts-utils/contracts/src/v06/errors/LibRichErrorsV06.sol";
import "@0x/contracts-erc20/contracts/src/v06/LibERC20TokenV06.sol";
import "@0x/contracts-erc20/contracts/src/v06/IERC20TokenV06.sol";
import "@0x/contracts-utils/contracts/src/v06/LibSafeMathV06.sol";

contract MixinCurveV2 {
    using LibERC20TokenV06 for IERC20TokenV06;
    using LibSafeMathV06 for uint256;
    using LibRichErrorsV06 for bytes;

    struct CurveBridgeDataV2 {
        address curveAddress;
        bytes4 exchangeFunctionSelector;
        int128 fromCoinIdx;
        int128 toCoinIdx;
    }

    function _tradeCurveV2(
        IERC20TokenV06 sellToken,
        IERC20TokenV06 buyToken,
        uint256 sellAmount,
        bytes memory bridgeData
    ) internal returns (uint256 boughtAmount) {
        // Decode the bridge data to get the Curve metadata.
        CurveBridgeDataV2 memory data = abi.decode(bridgeData, (CurveBridgeDataV2));
        sellToken.approveIfBelow(data.curveAddress, sellAmount);

        uint256 beforeBalance = buyToken.balanceOf(address(this));
        (bool success, bytes memory resultData) = data.curveAddress.call(
            abi.encodeWithSelector(
                data.exchangeFunctionSelector,
                data.fromCoinIdx,
                data.toCoinIdx,
                // dx
                sellAmount,
                // min dy
                1
            )
        );
        if (!success) {
            resultData.rrevert();
        }

        return buyToken.balanceOf(address(this)).safeSub(beforeBalance);
    }
}