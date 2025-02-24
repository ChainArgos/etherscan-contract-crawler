// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "solmate/auth/Owned.sol";
import "solmate/tokens/ERC721.sol";

interface PLA {
    function safeTransferFrom(
        address from,
        address to,
        uint256 pepeId,
        bytes calldata data
    ) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 pepeId
    ) external;
}

contract PepeAttack is Owned {
    address public plaAddress;
    address public receiver;

    event Attack(uint256 pepeID, uint256 gooeyID, address attacker);

    constructor(
        address _plaAddress,
        address _receiver
    ) Owned(msg.sender) {
        plaAddress = _plaAddress;
        receiver = _receiver;
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4) {
        // Ensure that the caller of this function is the PLA contract
        require(msg.sender == plaAddress, "Only PLA contract can call onERC721Received");

        // Define the structure of the calldata
        // In this example, we assume that the calldata contains a single uint256 value (gooeyId)
        uint256 gooeyId = abi.decode(data, (uint256));

        // send PLA to receiver
        PLA(plaAddress).safeTransferFrom(address(this), receiver, tokenId);

        emit Attack(tokenId, gooeyId, from);

        return this.onERC721Received.selector;
    }
}