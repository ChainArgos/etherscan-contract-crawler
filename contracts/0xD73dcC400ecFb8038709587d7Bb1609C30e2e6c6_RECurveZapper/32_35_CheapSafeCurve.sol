// SPDX-License-Identifier: reup.cash
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./CheapSafeERC20.sol";
import "./CheapSafeCall.sol";

using CheapSafeERC20 for IERC20;

library CheapSafeCurve
{
    error AddCurveLiquidityFailed();
    error NoPoolTokensMinted();
    error RemoveCurveLiquidityOneCoinCallFailed();
    error InsufficientTokensReceived();

    function safeAddLiquidityCore(address pool, IERC20 poolToken, bytes memory data)
        private
        returns (uint256 poolTokenAmount)
    {
        uint256 balance = poolToken.balanceOf(address(this));
        if (!CheapSafeCall.call(pool, data)) { revert AddCurveLiquidityFailed(); }
        uint256 newBalance = poolToken.balanceOf(address(this));
        if (newBalance <= balance) { revert NoPoolTokensMinted(); }
        unchecked { return newBalance - balance; }
    }

    function safeAddLiquidity(address pool, IERC20 poolToken, uint256[2] memory amounts, uint256 minMintAmount)
        internal
        returns (uint256 poolTokenAmount)
    {
        return safeAddLiquidityCore(pool, poolToken, abi.encodeWithSignature("add_liquidity(uint256[2],uint256)", amounts, minMintAmount));
    }

    function safeAddLiquidity(address pool, IERC20 poolToken, uint256[3] memory amounts, uint256 minMintAmount)
        internal
        returns (uint256 poolTokenAmount)
    {
        return safeAddLiquidityCore(pool, poolToken, abi.encodeWithSignature("add_liquidity(uint256[3],uint256)", amounts, minMintAmount));
    }

    function safeAddLiquidity(address pool, IERC20 poolToken, uint256[4] memory amounts, uint256 minMintAmount)
        internal
        returns (uint256 poolTokenAmount)
    {
        return safeAddLiquidityCore(pool, poolToken, abi.encodeWithSignature("add_liquidity(uint256[4],uint256)", amounts, minMintAmount));
    }

    function safeRemoveLiquidityOneCoin(address pool, IERC20 token, uint256 tokenIndex, uint256 amount, uint256 minReceived, address receiver)
        internal
        returns (uint256 amountReceived)
    {
        uint256 balance = token.balanceOf(address(this));
        if (!CheapSafeCall.call(pool, abi.encodeWithSignature("remove_liquidity_one_coin(uint256,int128,uint256)", amount, int128(int256(tokenIndex)), 0))) { revert RemoveCurveLiquidityOneCoinCallFailed(); }
        uint256 newBalance = token.balanceOf(address(this));
        if (newBalance < balance + minReceived) { revert InsufficientTokensReceived(); }
        unchecked { amountReceived = newBalance - balance; }
        if (receiver != address(this))
        {
            token.safeTransfer(receiver, amountReceived);
        }
    }
}