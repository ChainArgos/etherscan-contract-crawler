// SPDX-License-Identifier: AGPL-3.0

pragma solidity 0.8.15;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165Storage.sol";

import "./ERC721AMinterExtension.sol";

import {IERC721OwnerMintExtension} from "../../ERC721/extensions/ERC721OwnerMintExtension.sol";

/**
 * @dev Extension to allow owner to mint directly without paying.
 */
abstract contract ERC721AOwnerMintExtension is
    IERC721OwnerMintExtension,
    Initializable,
    Ownable,
    ERC165Storage,
    ERC721AMinterExtension
{
    function __ERC721AOwnerMintExtension_init() internal onlyInitializing {
        __ERC721AOwnerMintExtension_init_unchained();
    }

    function __ERC721AOwnerMintExtension_init_unchained()
        internal
        onlyInitializing
    {
        _registerInterface(type(IERC721OwnerMintExtension).interfaceId);
    }

    /* ADMIN */

    function mintByOwner(address to, uint256 count) external onlyOwner {
        _mintTo(to, count);
    }

    function mintByOwner(address[] calldata tos, uint256[] calldata counts)
        external
        onlyOwner
    {
        for (uint256 i = 0; i < tos.length; i++) {
            _mintTo(tos[i], counts[i]);
        }
    }

    /* PUBLIC */

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC165Storage, ERC721ACollectionMetadataExtension)
        returns (bool)
    {
        return ERC165Storage.supportsInterface(interfaceId);
    }
}