// SPDX-License-Identifier: CC0-1.0
pragma solidity >=0.7.0 <0.9.0;
import { IERC165, ERC165 } from "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

/// @title EIP-721 Metadata Update Extension
interface IERC4906 is IERC165 {
	/// @dev This event emits when the metadata of a token is changed.
	/// So that the third-party platforms such as NFT market could
	/// timely update the images and related attributes of the NFT.
	event MetadataUpdate(uint256 _tokenId);

	/// @dev This event emits when the metadata of a range of tokens is changed.
	/// So that the third-party platforms such as NFT market could
	/// timely update the images and related attributes of the NFTs.
	event BatchMetadataUpdate(uint256 _fromTokenId, uint256 _toTokenId);
}