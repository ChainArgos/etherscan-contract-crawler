// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

import {IERC20Detailed} from '../dependencies/openzeppelin/contracts/IERC20Detailed.sol';
import {ILendingPoolAddressesProvider} from '../interfaces/ILendingPoolAddressesProvider.sol';
import {IUiPoolDataProviderV3} from './interfaces/IUiPoolDataProviderV3.sol';
import {ILendingPool} from '../interfaces/ILendingPool.sol';
import {IViniumOracle} from './interfaces/IViniumOracle.sol';
import {IViToken} from '../interfaces/IViToken.sol';
import {IVariableVdToken} from '../interfaces/IVariableVdToken.sol';
import {IStableVdToken} from '../interfaces/IStableVdToken.sol';
import {WadRayMath} from '../protocol/libraries/math/WadRayMath.sol';
import {ReserveConfiguration} from '../protocol/libraries/configuration/ReserveConfiguration.sol';
import {UserConfiguration} from '../protocol/libraries/configuration/UserConfiguration.sol';
import {DataTypes} from '../protocol/libraries/types/DataTypes.sol';
import {IChainlinkAggregator} from '../interfaces/IChainlinkAggregator.sol';
import {DefaultReserveInterestRateStrategy} from '../protocol/lendingpool/DefaultReserveInterestRateStrategy.sol';
import {IERC20DetailedBytes} from './interfaces/IERC20DetailedBytes.sol';
import {ILendingRateOracle} from '../interfaces/ILendingRateOracle.sol';

contract UiPoolDataProviderV2V3 is IUiPoolDataProviderV3 {
  using WadRayMath for uint256;
  using ReserveConfiguration for DataTypes.ReserveConfigurationMap;
  using UserConfiguration for DataTypes.UserConfigurationMap;

  IChainlinkAggregator public immutable networkBaseTokenPriceInUsdProxyAggregator;
  IChainlinkAggregator public immutable marketReferenceCurrencyPriceInUsdProxyAggregator;
  uint256 public constant ETH_CURRENCY_UNIT = 1 ether;
  address public constant MKRAddress = 0x88128fd4b259552A9A1D457f435a6527AAb72d42;

  constructor(
    IChainlinkAggregator _networkBaseTokenPriceInUsdProxyAggregator,
    IChainlinkAggregator _marketReferenceCurrencyPriceInUsdProxyAggregator
  ) public {
    networkBaseTokenPriceInUsdProxyAggregator = _networkBaseTokenPriceInUsdProxyAggregator;
    marketReferenceCurrencyPriceInUsdProxyAggregator = _marketReferenceCurrencyPriceInUsdProxyAggregator;
  }

  function getInterestRateStrategySlopes(
    DefaultReserveInterestRateStrategy interestRateStrategy,
    ILendingPoolAddressesProvider provider,
    address reserve
  ) internal view returns (InterestRates memory) {
    InterestRates memory interestRates;
    interestRates.variableRateSlope1 = interestRateStrategy.variableRateSlope1();
    interestRates.variableRateSlope2 = interestRateStrategy.variableRateSlope2();
    interestRates.stableRateSlope1 = interestRateStrategy.stableRateSlope1();
    interestRates.stableRateSlope2 = interestRateStrategy.stableRateSlope2();
    interestRates.baseVariableBorrowRate = interestRateStrategy.baseVariableBorrowRate();
    interestRates.optimalUsageRatio = interestRateStrategy.OPTIMAL_UTILIZATION_RATE();

    interestRates.baseStableBorrowRate = ILendingRateOracle(provider.getLendingRateOracle())
      .getMarketBorrowRate(reserve);

    return interestRates;
  }

  function getReservesList(ILendingPoolAddressesProvider provider)
    public
    view
    override
    returns (address[] memory)
  {
    ILendingPool lendingPool = ILendingPool(provider.getLendingPool());
    return lendingPool.getReservesList();
  }

  function getReservesData(ILendingPoolAddressesProvider provider)
    public
    view
    override
    returns (AggregatedReserveData[] memory, BaseCurrencyInfo memory)
  {
    IViniumOracle oracle = IViniumOracle(provider.getPriceOracle());
    ILendingPool lendingPool = ILendingPool(provider.getLendingPool());
    address[] memory reserves = lendingPool.getReservesList();
    AggregatedReserveData[] memory reservesData = new AggregatedReserveData[](reserves.length);

    for (uint256 i = 0; i < reserves.length; i++) {
      AggregatedReserveData memory reserveData = reservesData[i];
      reserveData.underlyingAsset = reserves[i];

      // reserve current state
      DataTypes.ReserveData memory baseData = lendingPool.getReserveData(
        reserveData.underlyingAsset
      );
      reserveData.liquidityIndex = baseData.liquidityIndex;
      reserveData.variableBorrowIndex = baseData.variableBorrowIndex;
      reserveData.liquidityRate = baseData.currentLiquidityRate;
      reserveData.variableBorrowRate = baseData.currentVariableBorrowRate;
      reserveData.stableBorrowRate = baseData.currentStableBorrowRate;
      reserveData.lastUpdateTimestamp = baseData.lastUpdateTimestamp;
      reserveData.viTokenAddress = baseData.viTokenAddress;
      reserveData.stableVdTokenAddress = baseData.stableVdTokenAddress;
      reserveData.variableVdTokenAddress = baseData.variableVdTokenAddress;
      reserveData.interestRateStrategyAddress = baseData.interestRateStrategyAddress;
      reserveData.priceInMarketReferenceCurrency = oracle.getAssetPrice(
        reserveData.underlyingAsset
      );
      reserveData.priceOracle = oracle.getSourceOfAsset(reserveData.underlyingAsset);

      reserveData.availableLiquidity = IERC20Detailed(reserveData.underlyingAsset).balanceOf(
        reserveData.viTokenAddress
      );
      (
        reserveData.totalPrincipalStableDebt,
        ,
        reserveData.averageStableRate,
        reserveData.stableDebtLastUpdateTimestamp
      ) = IStableVdToken(reserveData.stableVdTokenAddress).getSupplyData();
      reserveData.totalScaledVariableDebt = IVariableVdToken(reserveData.variableVdTokenAddress)
        .scaledTotalSupply();

      if (address(reserveData.underlyingAsset) == address(MKRAddress)) {
        bytes32 symbol = IERC20DetailedBytes(reserveData.underlyingAsset).symbol();
        bytes32 name = IERC20DetailedBytes(reserveData.underlyingAsset).name();
        reserveData.symbol = bytes32ToString(symbol);
        reserveData.name = bytes32ToString(name);
      } else {
        reserveData.symbol = IERC20Detailed(reserveData.underlyingAsset).symbol();
        reserveData.name = IERC20Detailed(reserveData.underlyingAsset).name();
      }

      (
        reserveData.baseLTVasCollateral,
        reserveData.reserveLiquidationThreshold,
        reserveData.reserveLiquidationBonus,
        reserveData.decimals,
        reserveData.reserveFactor
      ) = baseData.configuration.getParamsMemory();
      (
        reserveData.isActive,
        reserveData.isFrozen,
        reserveData.borrowingEnabled,
        reserveData.stableBorrowRateEnabled
      ) = baseData.configuration.getFlagsMemory();
      reserveData.usageAsCollateralEnabled = reserveData.baseLTVasCollateral != 0;

      InterestRates memory interestRates = getInterestRateStrategySlopes(
        DefaultReserveInterestRateStrategy(reserveData.interestRateStrategyAddress),
        provider,
        reserveData.underlyingAsset
      );

      reserveData.variableRateSlope1 = interestRates.variableRateSlope1;
      reserveData.variableRateSlope2 = interestRates.variableRateSlope2;
      reserveData.stableRateSlope1 = interestRates.stableRateSlope1;
      reserveData.stableRateSlope2 = interestRates.stableRateSlope2;
      reserveData.baseStableBorrowRate = interestRates.baseStableBorrowRate;
      reserveData.baseVariableBorrowRate = interestRates.baseVariableBorrowRate;
      reserveData.optimalUsageRatio = interestRates.optimalUsageRatio;
    }

    BaseCurrencyInfo memory baseCurrencyInfo;
    baseCurrencyInfo.networkBaseTokenPriceInUsd = networkBaseTokenPriceInUsdProxyAggregator
      .latestAnswer();
    baseCurrencyInfo.networkBaseTokenPriceDecimals = networkBaseTokenPriceInUsdProxyAggregator
      .decimals();

    try oracle.BASE_CURRENCY_UNIT() returns (uint256 baseCurrencyUnit) {
      if (ETH_CURRENCY_UNIT == baseCurrencyUnit) {
        baseCurrencyInfo.marketReferenceCurrencyUnit = ETH_CURRENCY_UNIT;
        baseCurrencyInfo
          .marketReferenceCurrencyPriceInUsd = marketReferenceCurrencyPriceInUsdProxyAggregator
          .latestAnswer();
      } else {
        baseCurrencyInfo.marketReferenceCurrencyUnit = baseCurrencyUnit;
        baseCurrencyInfo.marketReferenceCurrencyPriceInUsd = int256(baseCurrencyUnit);
      }
    } catch (
      bytes memory /*lowLevelData*/
    ) {
      baseCurrencyInfo.marketReferenceCurrencyUnit = ETH_CURRENCY_UNIT;
      baseCurrencyInfo
        .marketReferenceCurrencyPriceInUsd = marketReferenceCurrencyPriceInUsdProxyAggregator
        .latestAnswer();
    }

    return (reservesData, baseCurrencyInfo);
  }

  function getUserReservesData(ILendingPoolAddressesProvider provider, address user)
    external
    view
    override
    returns (UserReserveData[] memory, uint8)
  {
    ILendingPool lendingPool = ILendingPool(provider.getLendingPool());
    address[] memory reserves = lendingPool.getReservesList();
    DataTypes.UserConfigurationMap memory userConfig = lendingPool.getUserConfiguration(user);

    UserReserveData[] memory userReservesData = new UserReserveData[](
      user != address(0) ? reserves.length : 0
    );

    for (uint256 i = 0; i < reserves.length; i++) {
      DataTypes.ReserveData memory baseData = lendingPool.getReserveData(reserves[i]);

      // user reserve data
      userReservesData[i].underlyingAsset = reserves[i];
      userReservesData[i].scaledViTokenBalance = IViToken(baseData.viTokenAddress).scaledBalanceOf(
        user
      );
      userReservesData[i].usageAsCollateralEnabledOnUser = userConfig.isUsingAsCollateral(i);

      if (userConfig.isBorrowing(i)) {
        userReservesData[i].scaledVariableDebt = IVariableVdToken(baseData.variableVdTokenAddress)
          .scaledBalanceOf(user);
        userReservesData[i].principalStableDebt = IStableVdToken(baseData.stableVdTokenAddress)
          .principalBalanceOf(user);
        if (userReservesData[i].principalStableDebt != 0) {
          userReservesData[i].stableBorrowRate = IStableVdToken(baseData.stableVdTokenAddress)
            .getUserStableRate(user);
          userReservesData[i].stableBorrowLastUpdateTimestamp = IStableVdToken(
            baseData.stableVdTokenAddress
          ).getUserLastUpdated(user);
        }
      }
    }

    // Return 0 to be compatible with v3 userEmodeCategoryId return
    return (userReservesData, 0);
  }

  function bytes32ToString(bytes32 _bytes32) public pure returns (string memory) {
    uint8 i = 0;
    while (i < 32 && _bytes32[i] != 0) {
      i++;
    }
    bytes memory bytesArray = new bytes(i);
    for (i = 0; i < 32 && _bytes32[i] != 0; i++) {
      bytesArray[i] = _bytes32[i];
    }
    return string(bytesArray);
  }
}