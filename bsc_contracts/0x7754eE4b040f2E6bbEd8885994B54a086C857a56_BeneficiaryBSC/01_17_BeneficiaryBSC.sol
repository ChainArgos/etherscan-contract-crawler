// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "../BeneficiaryBase.sol";

contract BeneficiaryBSC is BeneficiaryBase {
    function UNISWAP_V2_ROUTER() internal pure override returns (IUniswapV2Router02) {
        return IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
    }

    function UNISWAP_FACTORY() internal pure override returns (IUniswapV2Factory) {
        return IUniswapV2Factory(0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73);
    }
}