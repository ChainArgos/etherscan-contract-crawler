// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "../interfaces/ILayerZeroReceiver.sol";
import "../interfaces/ILayerZeroUserApplicationConfig.sol";
import "../interfaces/ILayerZeroEndpoint.sol";
import "../util/BytesLib.sol";

/*
 * a generic LzReceiver implementation
 */
abstract contract LzApp is
  Ownable,
  ILayerZeroReceiver,
  ILayerZeroUserApplicationConfig
{
  using BytesLib for bytes;

  ILayerZeroEndpoint public immutable lzEndpoint;
  mapping(uint16 => bytes) public trustedRemoteLookup;
  mapping(uint16 => mapping(uint16 => uint256)) public minDstGasLookup;
  address public precrime;

  event SetPrecrime(address precrime);
  event SetTrustedRemote(uint16 _remoteChainId, bytes _path);
  event SetTrustedRemoteAddress(uint16 _remoteChainId, bytes _remoteAddress);
  event SetMinDstGas(uint16 _dstChainId, uint16 _type, uint256 _minDstGas);

  error InvalidEndpointCaller();
  error InvalidSourceSendingContract();
  error DestinationIsNotTrustedSource();
  error MinGasLimitNotSet();
  error GasLimitIsTooLow();
  error InvalidAdapterParams();
  error NoTrustedPathRecord();
  error InvalidMinGas();

  constructor(address _endpoint) {
    lzEndpoint = ILayerZeroEndpoint(_endpoint);
  }

  function lzReceive(
    uint16 _srcChainId,
    bytes calldata _srcAddress,
    uint64 _nonce,
    bytes calldata _payload
  ) public virtual override {
    // lzReceive must be called by the endpoint for security
    if (_msgSender() != address(lzEndpoint)) {
      revert InvalidEndpointCaller();
    }

    bytes memory trustedRemote = trustedRemoteLookup[_srcChainId];
    // if will still block the message pathway from (srcChainId, srcAddress). should not receive message from untrusted remote.
    if (
      !(_srcAddress.length == trustedRemote.length &&
        trustedRemote.length > 0 &&
        keccak256(_srcAddress) == keccak256(trustedRemote))
    ) {
      revert InvalidSourceSendingContract();
    }

    _blockingLzReceive(_srcChainId, _srcAddress, _nonce, _payload);
  }

  // abstract function - the default behaviour of LayerZero is blocking. See: NonblockingLzApp if you dont need to enforce ordered messaging
  function _blockingLzReceive(
    uint16 _srcChainId,
    bytes memory _srcAddress,
    uint64 _nonce,
    bytes memory _payload
  ) internal virtual;

  function _lzSend(
    uint16 _dstChainId,
    bytes memory _payload,
    address payable _refundAddress,
    address _zroPaymentAddress,
    bytes memory _adapterParams,
    uint256 _nativeFee
  ) internal virtual {
    bytes memory trustedRemote = trustedRemoteLookup[_dstChainId];

    if (trustedRemote.length == 0) {
      revert DestinationIsNotTrustedSource();
    }

    lzEndpoint.send{value: _nativeFee}(
      _dstChainId,
      trustedRemote,
      _payload,
      _refundAddress,
      _zroPaymentAddress,
      _adapterParams
    );
  }

  function _checkGasLimit(
    uint16 _dstChainId,
    uint16 _type,
    bytes memory _adapterParams,
    uint256 _extraGas
  ) internal view virtual {
    uint256 providedGasLimit = _getGasLimit(_adapterParams);
    uint256 minGasLimit = minDstGasLookup[_dstChainId][_type] + _extraGas;

    if (minGasLimit == 0) {
      revert MinGasLimitNotSet();
    }

    if (providedGasLimit < minGasLimit) {
      revert GasLimitIsTooLow();
    }
  }

  function _getGasLimit(
    bytes memory _adapterParams
  ) internal pure virtual returns (uint256 gasLimit) {
    if (_adapterParams.length < 34) {
      revert InvalidAdapterParams();
    }

    assembly {
      gasLimit := mload(add(_adapterParams, 34))
    }
  }

  //---------------------------UserApplication config----------------------------------------
  function getConfig(
    uint16 _version,
    uint16 _chainId,
    address,
    uint256 _configType
  ) external view returns (bytes memory) {
    return lzEndpoint.getConfig(_version, _chainId, address(this), _configType);
  }

  // generic config for LayerZero user Application
  function setConfig(
    uint16 _version,
    uint16 _chainId,
    uint256 _configType,
    bytes calldata _config
  ) external override onlyOwner {
    lzEndpoint.setConfig(_version, _chainId, _configType, _config);
  }

  function setSendVersion(uint16 _version) external override onlyOwner {
    lzEndpoint.setSendVersion(_version);
  }

  function setReceiveVersion(uint16 _version) external override onlyOwner {
    lzEndpoint.setReceiveVersion(_version);
  }

  function forceResumeReceive(
    uint16 _srcChainId,
    bytes calldata _srcAddress
  ) external override onlyOwner {
    lzEndpoint.forceResumeReceive(_srcChainId, _srcAddress);
  }

  // _path = abi.encodePacked(remoteAddress, localAddress)
  // this function set the trusted path for the cross-chain communication
  function setTrustedRemote(
    uint16 _srcChainId,
    bytes calldata _path
  ) external onlyOwner {
    trustedRemoteLookup[_srcChainId] = _path;
    emit SetTrustedRemote(_srcChainId, _path);
  }

  function setTrustedRemoteAddress(
    uint16 _remoteChainId,
    bytes calldata _remoteAddress
  ) external onlyOwner {
    trustedRemoteLookup[_remoteChainId] = abi.encodePacked(
      _remoteAddress,
      address(this)
    );
    emit SetTrustedRemoteAddress(_remoteChainId, _remoteAddress);
  }

  function getTrustedRemoteAddress(
    uint16 _remoteChainId
  ) external view returns (bytes memory) {
    bytes memory path = trustedRemoteLookup[_remoteChainId];
    if (path.length == 0) {
      revert NoTrustedPathRecord();
    }

    return path.slice(0, path.length - 20); // the last 20 bytes should be address(this)
  }

  function setPrecrime(address _precrime) external onlyOwner {
    precrime = _precrime;
    emit SetPrecrime(_precrime);
  }

  function setMinDstGas(
    uint16 _dstChainId,
    uint16 _packetType,
    uint256 _minGas
  ) external onlyOwner {
    if (_minGas == 0) {
      revert InvalidMinGas();
    }

    minDstGasLookup[_dstChainId][_packetType] = _minGas;
    emit SetMinDstGas(_dstChainId, _packetType, _minGas);
  }

  //--------------------------- VIEW FUNCTION ----------------------------------------
  function isTrustedRemote(
    uint16 _srcChainId,
    bytes calldata _srcAddress
  ) external view returns (bool) {
    bytes memory trustedSource = trustedRemoteLookup[_srcChainId];
    return keccak256(trustedSource) == keccak256(_srcAddress);
  }
}