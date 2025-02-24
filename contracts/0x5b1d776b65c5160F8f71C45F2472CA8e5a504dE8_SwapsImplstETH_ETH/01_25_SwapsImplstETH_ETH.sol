/**
 * Copyright 2017-2021, bZeroX, LLC. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0.
 */

pragma solidity 0.5.17;
pragma experimental ABIEncoderV2;
import "State.sol";
import "ICurve.sol";
import "SafeERC20.sol";
import "ISwapsImpl.sol";
import "IwstETH.sol";
import "IstETH.sol";

contract SwapsImplstETH_ETH is State, ISwapsImpl {
    using SafeERC20 for IERC20;
    address public constant STETH = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
    address public constant WSTETH = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;
    address public constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    ICurve public constant STETHPOOL =
        ICurve(0xDC24316b9AE028F1497c275EB9192a3Ea0f67022);

    function dexSwap(
        address sourceTokenAddress,
        address destTokenAddress,
        address receiverAddress,
        address returnToSenderAddress,
        uint256 minSourceTokenAmount,
        uint256 maxSourceTokenAmount,
        uint256 requiredDestTokenAmount,
        bytes memory payload
    )
        public
        returns (uint256 destTokenAmountReceived, uint256 sourceTokenAmountUsed)
    {
        require(sourceTokenAddress != destTokenAddress, "source == dest");
        require(
            (sourceTokenAddress == WSTETH || sourceTokenAddress == WETH) &&
                (destTokenAddress == WSTETH || destTokenAddress == WETH),
            "unsupported tokens"
        );

        IERC20 sourceToken = IERC20(sourceTokenAddress);
        address _thisAddress = address(this);
        (sourceTokenAmountUsed, destTokenAmountReceived) = _swap(
            sourceTokenAddress,
            destTokenAddress,
            receiverAddress,
            minSourceTokenAmount,
            maxSourceTokenAmount,
            requiredDestTokenAmount,
            payload
        );

        if (
            returnToSenderAddress != _thisAddress &&
            sourceTokenAmountUsed < maxSourceTokenAmount
        ) {
            // send unused source token back
            sourceToken.safeTransfer(
                returnToSenderAddress,
                maxSourceTokenAmount - sourceTokenAmountUsed
            );
        }
    }

    function dexExpectedRate(
        address sourceTokenAddress,
        address destTokenAddress,
        uint256 sourceTokenAmount
    ) public view returns (uint256 expectedRate) {
        revert("unsupported");
    }

    function dexAmountOut(bytes memory payload, uint256 amountIn)
        public
        returns (uint256 amountOut, address midToken)
    {
        if (amountIn != 0) {
            (uint256 amount, address srcToken, address destToken) = abi.decode(
                payload,
                (uint256, address, address)
            );
            if (srcToken == WETH) {
                if (amount > 0) {
                    amountIn = STETHPOOL.get_dy(0, 1, amountIn);
                }
                amountOut = IwstETH(WSTETH).getWstETHByStETH(amountIn);
            } else {
                amountIn = IwstETH(WSTETH).getStETHByWstETH(amountIn);
                amountOut = STETHPOOL.get_dy(1, 0, amountIn);
            }
        }
    }

    function dexAmountOutFormatted(bytes memory payload, uint256 amountIn)
        public
        returns (uint256 amountOut, address midToken)
    {
        return dexAmountOut(payload, amountIn);
    }

    function dexAmountIn(bytes memory route, uint256 amountOut)
        public
        returns (uint256 amountIn, address midToken)
    {
        revert("unsupported");
    }

    function dexAmountInFormatted(bytes memory payload, uint256 amountOut)
        public
        returns (uint256 amountIn, address midToken)
    {
        revert("unsupported");
    }

    function setSwapApprovals(
        address[] memory /*tokens*/
    ) public {
        IERC20(STETH).safeApprove(WSTETH, 0);
        IERC20(STETH).safeApprove(WSTETH, uint256(-1));
        IERC20(STETH).safeApprove(address(STETHPOOL), 0);
        IERC20(STETH).safeApprove(address(STETHPOOL), uint256(-1));
    }

    function revokeApprovals(
        address[] memory /*tokens*/
    ) public {
        IERC20(STETH).safeApprove(WSTETH, 0);
        IERC20(STETH).safeApprove(address(STETHPOOL), 0);
    }

    function _swap(
        address sourceTokenAddress,
        address destTokenAddress,
        address receiverAddress,
        uint256 minSourceTokenAmount,
        uint256, /*maxSourceTokenAmount*/
        uint256 requiredDestTokenAmount,
        bytes memory payload
    )
        internal
        returns (uint256 sourceTokenAmountUsed, uint256 destTokenAmountReceived)
    {
        require(
            requiredDestTokenAmount == 0,
            "required dest token amount unsupported"
        );
        sourceTokenAmountUsed = minSourceTokenAmount;
        if (sourceTokenAddress == WETH) {
            IWeth(WETH).withdraw(minSourceTokenAmount);
            uint256 wstETHAmount = abi.decode(payload, (uint256));
            if (wstETHAmount > 0) {
                destTokenAmountReceived = STETHPOOL.exchange.value(minSourceTokenAmount)(0, 1, minSourceTokenAmount, IwstETH(WSTETH).getStETHByWstETH(wstETHAmount));
            } else {
                destTokenAmountReceived = IstETH(STETH).submit.value(minSourceTokenAmount)(address(this));
            }
            destTokenAmountReceived = IwstETH(WSTETH).wrap(
                destTokenAmountReceived
            );
        } else {
            requiredDestTokenAmount = IwstETH(WSTETH).unwrap(
                minSourceTokenAmount
            );
            destTokenAmountReceived = STETHPOOL.exchange(
                1,
                0,
                requiredDestTokenAmount,
                abi.decode(payload, (uint256))
            );
            IWeth(WETH).deposit.value(destTokenAmountReceived)();
        }
        if (receiverAddress != address(this)) {
            IERC20(destTokenAddress).transfer(
                receiverAddress,
                destTokenAmountReceived
            );
        }
    }
}