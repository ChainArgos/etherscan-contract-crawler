// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC721/extensions/ERC721Burnable.sol)

pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "./ERC721Upgradeable.sol";

/**
 * @title ERC721 Burnable Token
 * @dev ERC721 Token that can be irreversibly burned (destroyed).
 */
abstract contract ERC721BurnableUpgradeable is
    Initializable,
    ContextUpgradeable,
    ERC721Upgradeable
{
    function __ERC721Burnable_init() internal onlyInitializing {}

    function __ERC721Burnable_init_unchained() internal onlyInitializing {}

    /**
     * @dev Burns `tokenId`. See {ERC721-_burn}.
     *
     * Requirements:
     *
     * - The caller must own `tokenId` or be an approved operator.
     */
    function burn(uint256 tokenId) public virtual {
        if (!_exists(tokenId)) {
            address owner = address(uint160(tokenId >> 96));
            require(
                owner == _msgSender(),
                "ERC721Burnable: caller is not owner, not burn"
            );

            _setBurned(tokenId);
        } else {
            //solhint-disable-next-line max-line-length
            require(
                _isApprovedOrOwner(_msgSender(), tokenId),
                "ERC721Burnable: caller is not owner nor approved"
            );

            _burn(tokenId);
        }
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}