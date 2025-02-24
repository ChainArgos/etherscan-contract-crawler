// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";

contract SetInMergeERC721 is IERC2981, ERC721Enumerable, Ownable {

    event ReferralMint(uint64 indexed refCode, address minter);

    constructor(string memory storageProtocol) ERC721("Set In Merge", "SIM") {
        manager = msg.sender;
        royaltyReceiver = msg.sender;
        metadataStorageProtocol = storageProtocol;
    }

    Counters.Counter public counter;

    uint256 public startTimestamp;
    uint256 public endTimestamp;

    mapping(uint256 => MintInfo) private mintInfo;

    uint256 public transitionBlock;

    struct MintInfo {
        uint256 blockNumber;
        bool isPoS;
    }

    struct TokenInfo {
        uint256 blockNumber;
        bool isPoS;
        uint256 position;
    }

    string public metadataStorageProtocol;

    string public prerevealPoWMetadata;
    string public prerevealPoSMetadata;

    // position => hash
    mapping(uint256 => string) public powMetadata;
    mapping(uint256 => string) public posMetadata;

    /**
     * The manager is allowed to:
     *  - Opening mint
     *  - Closing mint
     *  - Setting transitionBlock (the block when the merge happened, 1-st PoS block)
     *  - Manipulating tokens metadata hashes
     *  - Self-destructing (effectively locking the collection from any future changes)
     */
    address public manager;
    address public royaltyReceiver;

    uint public royaltyFraction = 1000;

    /**
     * Only manager access
     */

    modifier onlyManager() {
        require(manager == msg.sender, "SIM: only manager can access");
        _;
    }

    function setStartTimestamp(uint256 start) external onlyManager {
        startTimestamp = start;
    }

    function setEndTimestamp(uint256 end) external onlyManager {
        require(end > startTimestamp, "SIM: mint end timestamp should be greater than start timestamp");
        endTimestamp = end;
    }

    function setPoSMetadataHashes(
        uint256[] memory positions,
        string[] memory hashes) external onlyManager {
        require(
            positions.length == hashes.length,
            "SIM: arrays should have equal size"
        );
        
        for (uint256 i = 0; i < positions.length; i++) {
            posMetadata[positions[i]] = hashes[i];
        }
    }

    function setPoWMetadataHashes(
        uint256[] memory positions,
        string[] memory hashes
    ) external onlyManager {
        require(
            positions.length == hashes.length,
            "SIM: arrays should have equal size"
        );

        for (uint256 i = 0; i < positions.length; i++) {
            powMetadata[positions[i]] = hashes[i];
        }
    }

    function setMetadataStorageProtocol(string memory protocol)
        external
        onlyManager
    {
        metadataStorageProtocol = protocol;
    }

    function setPrerevealMetadata(
        string memory powMetadataHash,
        string memory posMetadataHash
    ) external onlyManager {
        prerevealPoWMetadata = powMetadataHash;
        prerevealPoSMetadata = posMetadataHash;
    }

    function setTransitionBlock(uint256 transitionBlockNumber)
        external
        onlyManager
    {
        transitionBlock = transitionBlockNumber;
    }

    function setRoyaltyData(address _royaltyReceiver, uint _royaltyFraction) external onlyManager {
        royaltyReceiver = _royaltyReceiver;
        royaltyFraction = _royaltyFraction;
    }

    function changeManager(address newManager) external onlyManager {
        manager = newManager;
    }

    // sets manager to zero address hence effectively locking collection from any changes future
    function setInMerge() external onlyManager {
        manager = address(0);
    }

    /**
     * Public access
     */

    function isMergeHappened() public view returns (bool) {
        return block.difficulty > 2**64;
    }

    function isMintOpen() public view returns (bool) {
        if (startTimestamp == 0) {
            return false;
        }
        uint256 currentTimestamp = block.timestamp;
        if (currentTimestamp >= startTimestamp && endTimestamp == 0) {
            return true;
        } else if (
            currentTimestamp >= startTimestamp &&
            currentTimestamp <= endTimestamp
        ) {
            return true;
        } else {
            return false;
        }
    }

    function isRevealed() public view returns (bool) {
        return transitionBlock != 0;
    }

    function mint() public {
        require(msg.sender == tx.origin, "SIM: only EOA is allowed to mint");
        require(isMintOpen(), "SIM: mint is closed");

        Counters.increment(counter);
        uint256 tokenId = Counters.current(counter);

        mintInfo[tokenId] = MintInfo(block.number, isMergeHappened());
        _mint(msg.sender, tokenId);
    }

    function referralMint(uint64 refCode) external {
        mint();
        emit ReferralMint(refCode, msg.sender);
    }

    function tokenInfo(uint256 tokenId) public view returns (TokenInfo memory) {
        _requireMinted(tokenId);
        uint256 blockNumber = mintInfo[tokenId].blockNumber;
        bool isPoS = mintInfo[tokenId].isPoS;

        if (!isRevealed()) {
            return TokenInfo(blockNumber, isPoS, 0);
        }

        uint256 position = isPoS
            ? blockNumber - transitionBlock + 1
            : transitionBlock - blockNumber;

        return TokenInfo(blockNumber, isPoS, position);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        TokenInfo memory info = tokenInfo(tokenId);

        string memory prerevealHash = info.isPoS
            ? prerevealPoSMetadata
            : prerevealPoWMetadata;
        string memory metadataHash = info.isPoS
            ? posMetadata[info.position]
            : powMetadata[info.position];

        if (info.position == 0 || bytes(metadataHash).length == 0) {
            return
                string(
                    abi.encodePacked(metadataStorageProtocol, prerevealHash)
                );
        } else {
            return
                string(abi.encodePacked(metadataStorageProtocol, metadataHash));
        }
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721Enumerable, IERC165) returns (bool) {

        return interfaceId == type(IERC2981).interfaceId || super.supportsInterface(interfaceId);
    }

    function royaltyInfo(uint256 _tokenId, uint256 _salePrice) public view virtual override returns (address, uint256) {

        uint256 royaltyAmount = (_salePrice * royaltyFraction) / 10000;
        return (royaltyReceiver, royaltyAmount);
    }
}