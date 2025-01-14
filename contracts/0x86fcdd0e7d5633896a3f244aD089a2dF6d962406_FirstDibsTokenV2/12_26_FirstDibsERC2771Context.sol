// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import '@openzeppelin/contracts/utils/Context.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

/**
 * @dev Context variant with ERC2771 support.
 * copy/paste from https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/metatx/ERC2771Context.sol
 * but added a "setTrustedForwarder" function so we can deploy the forwarder contract after the token contract
 */
abstract contract FirstDibsERC2771Context is Context, Ownable {
    address private _trustedForwarder;

    constructor(address trustedForwarder) {
        _trustedForwarder = trustedForwarder;
    }

    function setTrustedForwarder(address trustedForwarder) external onlyOwner {
        _trustedForwarder = trustedForwarder;
    }

    function isTrustedForwarder(address forwarder) public view virtual returns (bool) {
        return forwarder == _trustedForwarder;
    }

    function _msgSender() internal view virtual override returns (address sender) {
        if (isTrustedForwarder(msg.sender)) {
            // The assembly code is more direct than the Solidity version using `abi.decode`.
            assembly {
                sender := shr(96, calldataload(sub(calldatasize(), 20)))
            }
        } else {
            return super._msgSender();
        }
    }

    function _msgData() internal view virtual override returns (bytes calldata) {
        if (isTrustedForwarder(msg.sender)) {
            return msg.data[:msg.data.length - 20];
        } else {
            return super._msgData();
        }
    }
}