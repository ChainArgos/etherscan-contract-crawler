// SPDX-License-Identifier: MIT

/*********************************
*             -----              *
*             \0,0/              *
*             (= =)              *
*               -                *
 *********************************/

pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "./IOwlDescriptor.sol";

contract NightOwls is ERC721Enumerable, Ownable {
    event SeedUpdated(uint256 indexed tokenId, uint256 seed);

    mapping(uint256 => uint256) internal seeds;
    IOwlDescriptor public descriptor;
    uint256 public maxSupply = 9999;
    uint256 public tokenPrice = 0.002 ether;
    uint256 public freePerTxn = 1;
    bool public minting = true;
    bool public canUpdateSeed = true;

    constructor(IOwlDescriptor newDescriptor) ERC721("NightOwls", "NightOwls") {
        descriptor = newDescriptor;
    }

    function mint(uint32 count) external payable {
        require(minting, "Minting needs to be enabled to start minting");
        require(count <= 100, "Exceeds max per transaction.");
        uint256 nextTokenId = totalSupply();
        unchecked {
            require(nextTokenId + count < maxSupply, "Exceeds max supply.");
        }

        require(msg.value >= tokenPrice * (count - freePerTxn), "1 Free mint per txn, Insufficient eth.");
    
        for (uint32 i; i < count;) {
            seeds[nextTokenId] = generateSeed(nextTokenId);
            _mint(_msgSender(), nextTokenId);
            unchecked { ++nextTokenId; ++i; }
        }
    }

    function setMinting(bool value) external onlyOwner {
        minting = value;
    }

    function setDescriptor(IOwlDescriptor newDescriptor) external onlyOwner {
        descriptor = newDescriptor;
    }

    function withdraw() external payable onlyOwner {
        (bool os,)= payable(owner()).call{value: address(this).balance}("");
        require(os);
    }

    function updateSeed(uint256 tokenId, uint256 seed) external onlyOwner {
        require(canUpdateSeed, "Cannot set the seed");
        seeds[tokenId] = seed;
        emit SeedUpdated(tokenId, seed);
    }

    function disableSeedUpdate() external onlyOwner {
        canUpdateSeed = false;
    }

    function burn(uint256 tokenId) public {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "Not approved to burn.");
        delete seeds[tokenId];
        _burn(tokenId);
    }

    function getSeed(uint256 tokenId) public view returns (uint256) {
        require(_exists(tokenId), "NightOwl does not exist.");
        return seeds[tokenId];
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "NightOwl does not exist.");
        uint256 seed = seeds[tokenId];
        return descriptor.tokenURI(tokenId, seed);
    }

    function generateSeed(uint256 tokenId) private view returns (uint256) {
        uint256 r = random(tokenId);
        uint256 headSeed = 100 * (r % 7 + 10) + ((r >> 48) % 20 + 10);
        uint256 faceSeed = 100 * ((r >> 96) % 6 + 10) + ((r >> 96) % 20 + 10);
        uint256 bodySeed = 100 * ((r >> 144) % 7 + 10) + ((r >> 144) % 20 + 10);
        uint256 legsSeed = 100 * ((r >> 192) % 2 + 10) + ((r >> 192) % 20 + 10);
        return 10000 * (10000 * (10000 * headSeed + faceSeed) + bodySeed) + legsSeed;
    }

    function random(uint256 tokenId) private view returns (uint256 pseudoRandomness) {
        pseudoRandomness = uint256(
            keccak256(abi.encodePacked(blockhash(block.number - 1), tokenId))
        );

        return pseudoRandomness;
    }
}