// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IUniswapV2Router {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidityETH(
        address token, 
        uint amountTokenDesired, 
        uint amountTokenMin, 
        uint amountETHMin, 
        address to, 
        uint deadline
    ) 
        external 
        payable 
        returns (uint amountToken, uint amountETH, uint liquidity);

    function swapExactTokensForETH(
        uint amountIn, 
        uint amountOutMin, 
        address[] calldata path, 
        address to, 
        uint deadline
    ) 
        external 
        returns (uint[] memory amounts);
}