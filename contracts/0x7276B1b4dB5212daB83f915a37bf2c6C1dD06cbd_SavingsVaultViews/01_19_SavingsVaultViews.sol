// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.13;

import "lib/openzeppelin-contracts-upgradeable/contracts/token/ERC20/IERC20Upgradeable.sol";
import "lib/openzeppelin-contracts-upgradeable/contracts/interfaces/IERC4626Upgradeable.sol";

import "./external/notional/lib/DateTime.sol";
import { IWrappedfCashComplete } from "./external/notional/interfaces/IWrappedfCash.sol";
import { NotionalViews, MarketParameters } from "./external/notional/interfaces/INotional.sol";
import "./external/notional/interfaces/INotionalV2.sol";

import "./interfaces/ISavingsVaultViewer.sol";
import "./interfaces/ISavingsVaultHarvester.sol";
import "./interfaces/ISavingsVault.sol";
import "./interfaces/ISavingsVaultViews.sol";

/// @title Savings vault helper view functions
/// @notice Contains helper view functions
contract SavingsVaultViews is ISavingsVaultViews {
    /// @inheritdoc ISavingsVaultViews
    function getAPY(ISavingsVaultViewer _savingsVault) external view returns (uint) {
        uint16 currencyId = _savingsVault.currencyId();
        address[2] memory fCashPositions = _savingsVault.getfCashPositions();
        uint8 supportedMaturities = _savingsVault.SUPPORTED_MATURITIES();
        uint numerator;
        uint denominator;
        for (uint i = 0; i < supportedMaturities; i++) {
            IWrappedfCashComplete fCashPosition = IWrappedfCashComplete(fCashPositions[i]);
            uint fCashBalance = fCashPosition.balanceOf(address(_savingsVault));
            if (!fCashPosition.hasMatured() && fCashBalance != 0) {
                // settlement date is the same for 3 and 6 month markets since they both settle at the same time.
                // 3 month market matures while 6 month market rolls to become a 3 month market.
                MarketParameters memory marketParameters = NotionalViews(_savingsVault.notionalRouter()).getMarket(
                    currencyId,
                    fCashPosition.getMaturity(),
                    DateTime.getReferenceTime(block.timestamp) + Constants.QUARTER
                );
                uint assets = fCashPosition.convertToAssets(fCashBalance);
                numerator += marketParameters.oracleRate * assets;
                denominator += assets;
            }
        }
        if (denominator != 0) {
            return numerator / denominator;
        } else {
            return 0;
        }
    }

    /// @inheritdoc ISavingsVaultViews
    function scaleAmount(
        address _savingsVault,
        uint _amount,
        uint _percentage,
        uint _steps
    ) external view returns (uint) {
        (
            uint maturity,
            uint32 minImpliedRate,
            uint16 currencyId,
            INotionalV2 calculationViews
        ) = getHighestYieldMarketParameters(_savingsVault);
        (uint fCashAmount, , ) = calculationViews.getfCashLendFromDeposit(
            currencyId,
            _amount,
            maturity,
            minImpliedRate,
            block.timestamp,
            true
        );
        uint scalingAmount = (fCashAmount * _percentage) / 100;
        for (uint i = 0; i < _steps + 1; i++) {
            try
                calculationViews.getDepositFromfCashLend(
                    currencyId,
                    fCashAmount,
                    maturity,
                    minImpliedRate,
                    block.timestamp
                )
            returns (uint amountUnderlying, uint, uint8, bytes32) {
                return amountUnderlying;
            } catch {
                // If we can scale it further we continue, else we exit the for loop.
                if (fCashAmount >= scalingAmount) {
                    fCashAmount = fCashAmount - scalingAmount;
                } else {
                    break;
                }
            }
        }
        return 0;
    }

    /// @inheritdoc ISavingsVaultViews
    function getMaxDepositedAmount(address _savingsVault) public view returns (uint maxDepositedAmount) {
        maxDepositedAmount += IERC4626Upgradeable(IERC4626Upgradeable(_savingsVault).asset()).balanceOf(_savingsVault);
        address[2] memory fCashPositions = ISavingsVaultViewer(_savingsVault).getfCashPositions();
        uint8 supportedMaturities = ISavingsVaultViewer(_savingsVault).SUPPORTED_MATURITIES();
        for (uint i = 0; i < supportedMaturities; i++) {
            IWrappedfCashComplete fCashPosition = IWrappedfCashComplete(fCashPositions[i]);
            if (fCashPosition.hasMatured()) {
                uint fCashAmount = fCashPosition.balanceOf(address(this));
                if (fCashAmount != 0) {
                    maxDepositedAmount += fCashPosition.previewRedeem(fCashAmount);
                }
            }
        }
    }

    /// @inheritdoc ISavingsVaultViews
    function getHighestYieldMarketParameters(address _savingsVault)
        public
        view
        returns (
            uint maturity,
            uint32 minImpliedRate,
            uint16 currencyId,
            INotionalV2 calculationViews
        )
    {
        (, ISavingsVault.NotionalMarket memory highestYieldMarket) = ISavingsVaultHarvester(_savingsVault)
            .sortMarketsByOracleRate();
        maturity = highestYieldMarket.maturity;
        minImpliedRate = uint32(
            (highestYieldMarket.oracleRate * ISavingsVaultViewer(_savingsVault).maxLoss()) /
                ISavingsVaultViewer(_savingsVault).BP()
        );
        currencyId = ISavingsVaultViewer(_savingsVault).currencyId();
        calculationViews = INotionalV2(ISavingsVaultViewer(_savingsVault).notionalRouter());
    }
}