// SPDX-License-Identifier: MIT
//
//             ▄▄               .▄▄                                                }▄   ▄▄
//  ███▀▀▀██▄  ▀█"              ▐██                             ▄█▀▀▀██▄   ▀▀▀▀▀   ╟██ ╙▀█
//  ███   ╟██⌐ ██▌ █▄▄▀▀██ ▄██▀▀███ ,█▀▀▀▀█▄           ╓█▀╙█   ╫██,   ╙└  ▄█▀▀▀██  ╟██ ▐██ ╓█▀▀▀██─
//  ███▀▀▀██▄  ██▌ ██▌  └ ██▌   ╟██ ╟██▄▄,,      ▄#ª▄,ª╣█ªM     ▀██████▄ ██▌ ▄▄ ██ ╟██ ╞██ ███▄▄,,
//  ███    ███ ██▌ ██▌    ███   ╟██  ,╙╙▀███    ██  ▐█⌐╟█       ▄   '╙██b██▌ ▀▀ ██¬╟██ ╞██  ,╙▀▀██▌
//  ███▄▄▄██▀^ ██▌ ██▌     ▀██▄█▀╙█ "██▄▄▄█▀    ╙█▄╓█▀ ╟█      ╙▀██▄▄██▀  ▀██▄▄█▀─ ╟██ ╞██ ▀██▄▄██▀
//
//  Migrated Birds of Solis Smart Contracts created by Ryan Meyers (@sreyeMnayR) - beautifulcode.eth
//
//  The world will be saved by beauty. Generosity attracts generosity.

pragma solidity ^0.8.19;

import "./BirdsBase.sol";

contract BirdsOfSolis is BirdsBase {
    uint private animatedBirds = 0;
    uint public constant MAX_ANIMATED_BIRDS = 20;
    error NoMoreBirds();
    error NotABird();

    constructor(
        string memory name_,
        string memory symbol_,
        address signer_,
        address vault_,
        address royalties_
    ) BirdsBase(name_, symbol_, signer_, vault_) {
        _mintConsecutive(vault_, 2_002);
        _setDefaultRoyalty(royalties_, 1_000);
        _setMigratedBaseURI(
            "ipfs://bafybeifcgbshpbhktuuevnnix2npqlwhnkehwtsx35clc4nuyixkr5pjpy/"
        );
        _setUnmigratedBaseURI(
            "ipfs://bafybeib56p2gkh7tgafru54xiovuegb57dadwozernzduvj5xf5kkyhcy4/"
        );
    }

    /// @notice Migrate a Birds of Solis NFT from Solana to Ethereum
    /// @dev The complexities of multiple tokenIds in a signature weren't worth the cost
    /// @param wallet The Ethereum account to which the NFT will be migrated
    /// @param tokenId The tokenId (0-2021) of the migrating bird
    /// @param signature An EIP-712 signed, typed message generated by the _signer account
    function freeBird(
        address wallet,
        uint256 tokenId,
        bytes calldata signature
    ) external {
        if (!verify(signature, wallet, tokenId)) {
            revert BadSignature();
        }
        if (tokenId > 2001) {
            revert NotABird();
        }
        _transfer(vault, wallet, tokenId);
        emit MetadataUpdate(tokenId);
    }


    /// @notice Batch-migrate a bunch of Birds of Solis NFTs from Solana to Ethereum 
    /// @dev May only be called by the contract owner
    /// @param wallet The Ethereum account to which the NFTs will be migrated
    /// @param tokenIds The tokenIds (0-2021) of the migrating birds
    function batchMigrate(
        address wallet,
        uint256[] calldata tokenIds
    ) external onlyOwner {
        uint len = tokenIds.length;
        for (uint i = 0; i < len; ) {
            if (tokenIds[i] > 2001) {
                revert NotABird();
            }
            _transfer(vault, wallet, tokenIds[i]);
            unchecked {
                i++;
            }
        }
        emit BatchMetadataUpdate(0, 2001+animatedBirds);
    }


    /// @notice Airdrop an animated Birds of Solis NFT
    /// @dev May only be called by the contract owner; Max 20
    /// @param wallet The Ethereum account to which the NFT will be migrated
    function airdropAnimated(address wallet) external onlyOwner {
        if (animatedBirds >= MAX_ANIMATED_BIRDS) {
            revert NoMoreBirds();
        }
        unchecked {
            animatedBirds++;
        }
        _safeMint(wallet, 2001 + animatedBirds);
    }
}