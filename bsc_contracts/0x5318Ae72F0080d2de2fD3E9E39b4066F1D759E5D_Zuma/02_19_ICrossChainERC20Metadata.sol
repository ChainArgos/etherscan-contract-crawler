// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../ICrossChainERC20.sol";

/**
 * @dev Interface for the optional metadata functions from the CrossChainERC20 standard.
 *
 */
interface ICrossChainERC20Metadata is ICrossChainERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}