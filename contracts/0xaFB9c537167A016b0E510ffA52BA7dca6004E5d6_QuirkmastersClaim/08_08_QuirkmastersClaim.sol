// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

import "@flair-sdk/contracts/access/ownable/OwnableInternal.sol";
import "@flair-sdk/contracts/token/ERC1155/extensions/mintable/IERC1155MintableExtension.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

/**
 * @title Quirkmasters ERC1155 Conditional Minting
 * @notice Mint ERC1155 tokens if sender owns a specific ERC721.
 *
 * @custom:type eip-2535-facet
 * @custom:category NFTs
 * @custom:required-dependencies IERC1155MintableExtension
 */
contract QuirkmastersClaim is OwnableInternal {
    bytes32 internal constant STORAGE_SLOT = keccak256("v1.Quirkies.contracts.storage.QuirkmastersClaim");
    bytes32 internal constant STORAGE_SLOTB = keccak256("v2.Quirkling.contracts.storage.QuirkmastersClaim");
    function layout() internal pure returns (Layout storage l) {
        bytes32 slot = STORAGE_SLOT;
        assembly {
            l.slot := slot
        }
    }
    function layoutb() internal pure returns (Layoutb storage lb) {
        bytes32 slotb = STORAGE_SLOTB;
        assembly {
            lb.slot := slotb
        }
    }

    /**
     * (1) Define state variables
     *
     * We must put all contract "state" variables in the Layout struct.
     * This storage pattern enables modularization using the EIP-2325 Diamond Standard.
     *
     *  To learn more about this pattern, see the following resources:
     *  - https://eips.ethereum.org/EIPS/eip-2325
     *  - https://eip2535diamonds.substack.com
     */
    struct Layout {
        address targetERC721ContractAddress;
        uint256 maxAllowancePerERC721;
        mapping(uint256 => uint256) tokensToMintedAmount;
    }
    struct Layoutb {
        address targetERC721ContractAddressB;
        uint256 maxAllowancePerERC721B;
        mapping(uint256 => uint256) tokensToMintedAmountB;
    }

    /**
     * (2) Define custom functions
     *
     * You can put privileged functions (using Ownable or role-based AccessControl) here.
     */
    function setTargetERC721(address target) external onlyOwner {
        layout().targetERC721ContractAddress = target;
    }
    function setTargetERC721B(address targetB) external onlyOwner {
        layoutb().targetERC721ContractAddressB = targetB;
    }

    function setMaxAllowancePerERC721(uint256 allowance) external onlyOwner {
        layout().maxAllowancePerERC721 = allowance;
    }
    function setMaxAllowancePerERC721B(uint256 allowanceB) external onlyOwner {
        layoutb().maxAllowancePerERC721B = allowanceB;
    }

    function checkClaimedERC721(
        uint256 ownedTokenId
        ) external view returns (uint256 claimedAmount ){
            Layout storage l = layout();
            claimedAmount = l.tokensToMintedAmount[ownedTokenId];
    }
    function checkClaimedERC721B(
        uint256 ownedTokenIdB
        ) external view returns (uint256 claimedAmountB ){
            Layoutb storage lb = layoutb();
            claimedAmountB = lb.tokensToMintedAmountB[ownedTokenIdB];
    }

    function claimByERC721(
        uint256 ownedTokenId, // Token ID in ERC721 collection.
        uint256 claimTokenId, // Token ID in ERC1155 to be minted.
        uint256 count // How many of this ERC1155 token to mint?
    ) external {
        Layout storage l = layout();

        require(IERC721(l.targetERC721ContractAddress).ownerOf(ownedTokenId) == _msgSender(), "MAX_ALLOWANCE");

        l.tokensToMintedAmount[ownedTokenId] += count;

        require(l.tokensToMintedAmount[ownedTokenId] <= l.maxAllowancePerERC721, "MAX_ALLOWANCE");

        IERC1155MintableExtension(address(this)).mintByFacet(_msgSender(), claimTokenId, count, "");
    }
    function claimByERC721B(
        uint256 ownedTokenIdB, // Token ID in ERC721 collection.
        uint256 claimTokenIdB, // Token ID in ERC1155 to be minted.
        uint256 countB // How many of this ERC1155 token to mint?
    ) external {
        Layoutb storage lb = layoutb();

        require(IERC721(lb.targetERC721ContractAddressB).ownerOf(ownedTokenIdB) == _msgSender(), "MAX_ALLOWANCE");

        lb.tokensToMintedAmountB[ownedTokenIdB] += countB;

        require(lb.tokensToMintedAmountB[ownedTokenIdB] <= lb.maxAllowancePerERC721B, "MAX_ALLOWANCE");

        IERC1155MintableExtension(address(this)).mintByFacet(_msgSender(), claimTokenIdB, countB, "");
    }
}