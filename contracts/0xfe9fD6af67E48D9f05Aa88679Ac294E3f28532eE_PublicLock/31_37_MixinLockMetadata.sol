// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/utils/introspection/ERC165StorageUpgradeable.sol";
// import '@openzeppelin/contracts-upgradeable/token/ERC721/extensions/IERC721EnumerableUpgradeable.sol';
import "../UnlockUtils.sol";
import "./MixinKeys.sol";
import "./MixinLockCore.sol";
import "./MixinRoles.sol";

/**
 * @title Mixin for metadata about the Lock.
 * @dev `Mixins` are a design pattern seen in the 0x contracts.  It simply
 * separates logically groupings of code to ease readability.
 */
contract MixinLockMetadata is
  ERC165StorageUpgradeable,
  MixinRoles,
  MixinLockCore,
  MixinKeys
{
  using UnlockUtils for uint;
  using UnlockUtils for address;
  using UnlockUtils for string;

  /// A descriptive name for a collection of NFTs in this contract.Defaults to "Unlock-Protocol" but is settable by lock owner
  string public name;

  /// An abbreviated name for NFTs in this contract. Defaults to "KEY" but is settable by lock owner
  string private lockSymbol;

  // the base Token URI for this Lock. If not set by lock owner, the global URI stored in Unlock is used.
  string private baseTokenURI;

  event LockMetadata(
    string name,
    string symbol,
    string baseTokenURI
  );

  function _initializeMixinLockMetadata(
    string calldata _lockName
  ) internal {
    ERC165StorageUpgradeable.__ERC165Storage_init();
    name = _lockName;
    // registering the optional erc721 metadata interface with ERC165.sol using
    // the ID specified in the standard: https://eips.ethereum.org/EIPS/eip-721
    _registerInterface(0x5b5e139f);
  }

  /**
   * Allows the Lock owner to assign
   * @param _lockName a descriptive name for this Lock.
   * @param _lockSymbol a Symbol for this Lock (default to KEY).
   * @param _baseTokenURI the baseTokenURI for this Lock
   */
  function setLockMetadata(
    string calldata _lockName,
    string calldata _lockSymbol,
    string calldata _baseTokenURI
  ) public {
    _onlyLockManager();

    name = _lockName;
    lockSymbol = _lockSymbol;
    baseTokenURI = _baseTokenURI;

    emit LockMetadata(name, lockSymbol, baseTokenURI);
  }

  /**
   * @dev Gets the token symbol
   * @return string representing the token name
   */
  function symbol() external view returns (string memory) {
    if (bytes(lockSymbol).length == 0) {
      return unlockProtocol.globalTokenSymbol();
    } else {
      return lockSymbol;
    }
  }

  /**  @notice A distinct Uniform Resource Identifier (URI) for a given asset.
   * @param _tokenId The iD of the token  for which we want to retrieve the URI.
   * If 0 is passed here, we just return the appropriate baseTokenURI.
   * If a custom URI has been set we don't return the lock address.
   * It may be included in the custom baseTokenURI if needed.
   * @dev  URIs are defined in RFC 3986. The URI may point to a JSON file
   * that conforms to the "ERC721 Metadata JSON Schema".
   * https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
   */
  function tokenURI(
    uint256 _tokenId
  ) external view returns (string memory) {
    string memory URI;
    string memory tokenId;
    string memory lockAddress = address(this).address2Str();
    string memory seperator;

    if (_tokenId != 0) {
      tokenId = _tokenId.uint2Str();
    } else {
      tokenId = "";
    }

    if (address(onTokenURIHook) != address(0)) {
      uint expirationTimestamp = keyExpirationTimestampFor(
        _tokenId
      );
      return
        onTokenURIHook.tokenURI(
          address(this),
          msg.sender,
          ownerOf(_tokenId),
          _tokenId,
          expirationTimestamp
        );
    }

    if (bytes(baseTokenURI).length == 0) {
      URI = unlockProtocol.globalBaseTokenURI();
      seperator = "/";
    } else {
      URI = baseTokenURI;
      seperator = "";
      lockAddress = "";
    }

    return URI.strConcat(lockAddress, seperator, tokenId);
  }

  function supportsInterface(
    bytes4 interfaceId
  )
    public
    view
    virtual
    override(
      AccessControlUpgradeable,
      ERC165StorageUpgradeable
    )
    returns (bool)
  {
    return super.supportsInterface(interfaceId);
  }

  uint256[1000] private __safe_upgrade_gap;
}