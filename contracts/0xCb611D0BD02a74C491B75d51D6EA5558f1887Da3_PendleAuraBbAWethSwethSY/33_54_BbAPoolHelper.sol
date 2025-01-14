// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.17;

import "../../../../../libraries/TokenHelper.sol";
import "../../../../../../interfaces/Balancer/IVault.sol";
import "./LinearPreview.sol";

abstract contract BbAPoolHelper is TokenHelper {
    address private constant BALANCER_VAULT = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
    bytes private constant EMPTY_BYTES = abi.encode();

    LinearPreview public immutable linearPreviewHelper;

    constructor(LinearPreview _linearPreviewHelper) {
        linearPreviewHelper = _linearPreviewHelper;
    }

    function _safeApproveInfVault(address token) internal {
        _safeApproveInf(token, BALANCER_VAULT);
    }

    function joinExitPool(
        address receiver,
        bytes32 poolId,
        address tokenIn,
        address tokenOut,
        uint256 amountIn
    ) internal returns (uint256 amountOut) {
        return
            IVault(BALANCER_VAULT).swap{ value: (tokenIn == NATIVE ? amountIn : 0) }(
                IVault.SingleSwap({
                    poolId: poolId,
                    kind: IVault.SwapKind.GIVEN_IN,
                    assetIn: IAsset(tokenIn),
                    assetOut: IAsset(tokenOut),
                    amount: amountIn,
                    userData: EMPTY_BYTES
                }),
                IVault.FundManagement({
                    sender: address(this),
                    fromInternalBalance: false,
                    recipient: payable(receiver),
                    toInternalBalance: false
                }),
                0,
                block.timestamp
            );
    }
}

abstract contract BbAWethHelper is BbAPoolHelper {
    address internal constant BB_A_WETH = 0x60D604890feaa0b5460B28A424407c24fe89374a;
    address internal constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address internal constant WA_WETH = 0x59463BB67dDD04fe58ED291ba36C26d99A39fbc6;
    bytes32 internal constant BB_A_WETH_POOL_ID =
        bytes32(0x60d604890feaa0b5460b28a424407c24fe89374a0000000000000000000004fc);

    constructor(LinearPreview _linearPreviewHelper) BbAPoolHelper(_linearPreviewHelper) {
        _safeApproveInfVault(WETH);
        _safeApproveInfVault(WA_WETH);
    }

    function _depositBbAWeth(address tokenIn, uint256 amountDep)
        internal
        virtual
        returns (uint256 amountOut)
    {
        amountOut = joinExitPool(address(this), BB_A_WETH_POOL_ID, tokenIn, BB_A_WETH, amountDep);
    }

    function _redeemBbAWeth(
        address receiver,
        address tokenOut,
        uint256 amountRedeem
    ) internal virtual returns (uint256 amountTokenOut) {
        amountTokenOut = joinExitPool(
            receiver,
            BB_A_WETH_POOL_ID,
            BB_A_WETH,
            tokenOut,
            amountRedeem
        );
    }

    function _previewDepositBbAWeth(address tokenIn, uint256 amountDep)
        internal
        view
        virtual
        returns (uint256 amountOut)
    {
        return
            linearPreviewHelper.joinExitPoolPreview(
                BB_A_WETH_POOL_ID,
                tokenIn == NATIVE ? WETH : tokenIn,
                BB_A_WETH,
                amountDep
            );
    }

    function _previewRedeemBbAWeth(address tokenOut, uint256 amountRedeem)
        internal
        view
        returns (uint256 amountOut)
    {
        return
            linearPreviewHelper.joinExitPoolPreview(
                BB_A_WETH_POOL_ID,
                BB_A_WETH,
                tokenOut == NATIVE ? WETH : tokenOut,
                amountRedeem
            );
    }
}