// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.6.0;

import "../../../../contracts/mixins/nftDropMarket/NFTDropMarketFixedPriceSale.sol";

abstract contract $NFTDropMarketFixedPriceSale is NFTDropMarketFixedPriceSale {
    bytes32 public __hh_exposed_bytecode_marker = "hardhat-exposed";

    mapping(uint256 => NFTDropMarketFixedPriceSale.FixedPriceSaleConfig) internal $v_NFTDropMarketFixedPriceSale_FixedPriceSaleConfig;

    event $_mintFromFixedPriceSale_Returned(uint256 arg0);

    event $_distributeFunds_Returned(uint256 arg0, uint256 arg1, uint256 arg2);

    constructor(address payable _treasury, address _feth, uint16 protocolFeeInBasisPoints, address _royaltyRegistry, bool _assumePrimarySale) FoundationTreasuryNode(_treasury) FETHNode(_feth) MarketFees(protocolFeeInBasisPoints, _royaltyRegistry, _assumePrimarySale) {}

    function $feth() external view returns (IFethMarket) {
        return feth;
    }

    function $_createFixedPriceSale(address nftContract,uint256 price,uint256 limitPerAccount,uint256 generalAvailabilityStartTime,uint256 earlyAccessStartTime,bytes32 merkleRoot,string calldata merkleTreeUri) external {
        return super._createFixedPriceSale(nftContract,price,limitPerAccount,generalAvailabilityStartTime,earlyAccessStartTime,merkleRoot,merkleTreeUri);
    }

    function $_mintFromFixedPriceSale(uint256 saleConfig,address nftContract,uint16 count,address payable buyReferrer) external returns (uint256) {
        (uint256 ret0) = super._mintFromFixedPriceSale($v_NFTDropMarketFixedPriceSale_FixedPriceSaleConfig[saleConfig],nftContract,count,buyReferrer);
        emit $_mintFromFixedPriceSale_Returned(ret0);
        return (ret0);
    }

    function $_getSellerOf(address nftContract,uint256 arg1) external view returns (address payable) {
        return super._getSellerOf(nftContract,arg1);
    }

    function $_distributeFunds(address nftContract,uint256 tokenId,address payable seller,uint256 price,address payable buyReferrer,address payable sellerReferrerPaymentAddress,uint16 sellerReferrerTakeRateInBasisPoints) external returns (uint256, uint256, uint256) {
        (uint256 ret0, uint256 ret1, uint256 ret2) = super._distributeFunds(nftContract,tokenId,seller,price,buyReferrer,sellerReferrerPaymentAddress,sellerReferrerTakeRateInBasisPoints);
        emit $_distributeFunds_Returned(ret0, ret1, ret2);
        return (ret0, ret1, ret2);
    }

    function $_sendValueWithFallbackWithdraw(address payable user,uint256 amount,uint256 gasLimit) external {
        return super._sendValueWithFallbackWithdraw(user,amount,gasLimit);
    }

    function $_tryUseFETHBalance(uint256 totalAmount,bool shouldRefundSurplus) external {
        return super._tryUseFETHBalance(totalAmount,shouldRefundSurplus);
    }
}