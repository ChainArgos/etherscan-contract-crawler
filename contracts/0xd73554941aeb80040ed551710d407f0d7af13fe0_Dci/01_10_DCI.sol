// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "./ERC721A.sol";
import "./ERC721AQueryable.sol";

interface iStaking {
    function mintAndStake(address owner, uint256[] calldata tokenIds) external;
}

contract Dci is ERC721AQueryable, Ownable {
    iStaking public StakingContract;

    uint256 public constant RESERVE_SUPPLY = 300;
    uint256 public MAX_SUPPLY = 4700;

    uint256 public WL_PRICE = 0.049 ether;
    uint256 public PUBLIC_PRICE = 0.049 ether;

    uint256 public MINT_LIMIT = 20;
    uint256 public TRANSACTION_LIMIT = 2;

    bool public isPublicSaleActive = false;
    bool public isPresaleActive = false;

    bool _revealed = false;

    string private baseURI = "";

    bytes32 presaleRoot;
    bytes32 freemintRoot;

    struct UserPurchaseInfo {
        uint256 presaleMinted;
        uint256 freeMinted;
    }

    mapping(address => UserPurchaseInfo) public userPurchase;
    mapping(address => uint256) addressBlockBought;

    address public constant ADDRESS_1 =
        0xc7b3A745d3250b2Dd7d8693f8DF7b6e0C4A4DbFE; // Owner
    address public constant ADDRESS_2 =
        0xc9b5553910bA47719e0202fF9F617B8BE06b3A09; //RL

    address signer;
    mapping(bytes32 => bool) public usedDigests;
    mapping(uint256 => bool) public burnt;

    constructor() ERC721A("Dci", "DCI") {}

    modifier isSecured(uint8 mintType) {
        require(
            addressBlockBought[msg.sender] < block.timestamp,
            "CANNOT_MINT_ON_THE_SAME_BLOCK"
        );
        require(tx.origin == msg.sender, "CONTRACTS_NOT_ALLOWED_TO_MINT");

        if (mintType == 1) {
            require(isPublicSaleActive, "PUBLIC_MINT_IS_NOT_YET_ACTIVE");
        }

        if (mintType == 2) {
            require(isPresaleActive, "PRESALE_MINT_IS_NOT_YET_ACTIVE");
        }
        if (mintType == 3) {
            require(isPresaleActive, "FREE_MINT_IS_NOT_YET_ACTIVE");
        }

        _;
    }

    modifier supplyMintLimit(uint256 numberOfTokens) {
        require(
            numberOfTokens + totalSupply() <= MAX_SUPPLY,
            "NOT_ENOUGH_SUPPLY"
        );
        require(
            numberOfTokens + numberMinted(msg.sender) <= MINT_LIMIT,
            "EXCEED_MINT_LIMIT"
        );
        require(
            numberOfTokens <= TRANSACTION_LIMIT,
            "EXCEEDING_MAXIMUM_AMOUNT_PER_TRANSACTION"
        );
        _;
    }

    //Essential
    function mint(
        uint256 numberOfTokens,
        uint64 expireTime,
        bytes memory sig,
        uint256 mintType
    ) external payable isSecured(1) supplyMintLimit(numberOfTokens) {
        bytes32 digest = keccak256(
            abi.encodePacked(msg.sender, expireTime, numberOfTokens)
        );
        require(isAuthorized(sig, digest), "CONTRACT_MINT_NOT_ALLOWED");
        require(block.timestamp <= expireTime, "EXPIRED_SIGNATURE");
        require(!usedDigests[digest], "SIGNATURE_LOOPING_NOT_ALLOWED");

        require(msg.value == PUBLIC_PRICE * numberOfTokens, "INVALID_AMOUNT");
        addressBlockBought[msg.sender] = block.timestamp;
        usedDigests[digest] = true;
        if (mintType == 0) {
            _mint(msg.sender, numberOfTokens);
        } else if (mintType == 1) {            
            _mint(msg.sender, numberOfTokens);
            stake(msg.sender, numberOfTokens);
        }
    }

    function presaleMint(
        bytes32[] memory proof,
        uint256 numberOfTokens,
        uint256 maxMint,
        uint256 mintType
    ) external payable isSecured(2) supplyMintLimit(numberOfTokens) {
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender, maxMint));
        require(MerkleProof.verify(proof, presaleRoot, leaf), "PROOF_INVALID");
        require(
            userPurchase[msg.sender].presaleMinted + numberOfTokens <= maxMint,
            "EXCEED_ALLOCATED_MINT_LIMIT"
        );
        require(msg.value == WL_PRICE * numberOfTokens, "INVALID_AMOUNT");
        addressBlockBought[msg.sender] = block.timestamp;
        userPurchase[msg.sender].presaleMinted += numberOfTokens;
         if (mintType == 0) {
            _mint(msg.sender, numberOfTokens);
        } else if (mintType == 1) {
            _mint(msg.sender, numberOfTokens);
            stake(msg.sender, numberOfTokens);
        }
    }

    function freeMint(
        bytes32[] memory proof,
        uint256 numberOfTokens,
        uint256 maxMint,
        uint256 mintType
    ) external isSecured(3) supplyMintLimit(numberOfTokens) {
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender, maxMint));
        require(MerkleProof.verify(proof, freemintRoot, leaf), "PROOF_INVALID");
        require(
            userPurchase[msg.sender].freeMinted + numberOfTokens <= maxMint,
            "EXCEED_ALLOCATED_MINT_LIMIT"
        );
        addressBlockBought[msg.sender] = block.timestamp;
        userPurchase[msg.sender].freeMinted += numberOfTokens;
       if (mintType == 0) {
            _mint(msg.sender, numberOfTokens);
        } else if (mintType == 1) {
            _mint(msg.sender, numberOfTokens);
            stake(msg.sender, numberOfTokens);
        }
    }

    function devMint(address[] memory _addresses, uint256[] memory quantities)
        external
        onlyOwner
    {
        require(_addresses.length == quantities.length, "WRONG_PARAMETERS");
        uint256 totalTokens = 0;
        for (uint256 i = 0; i < quantities.length; i++) {
            totalTokens += quantities[i];
        }
        require(totalTokens + totalSupply() <= MAX_SUPPLY, "NOT_ENOUGH_SUPPLY");
        for (uint256 i = 0; i < _addresses.length; i++) {
            _safeMint(_addresses[i], quantities[i]);
        }
    }

    function stake(address owner, uint256 numberOfTokens) internal {
        uint256 totalSupply = totalSupply();
            uint256 count = 0;
            uint256[] memory tokenIds = new uint256[](numberOfTokens);
            for (
                uint256 i = totalSupply - numberOfTokens;
                i < totalSupply;
                i++
            ) {
                tokenIds[count] = i;
                count += 1;
            } 
        StakingContract.mintAndStake(owner, tokenIds);
    }

    //Essential
    function setBaseURI(string calldata URI) external onlyOwner {
        baseURI = URI;
    }

    function reveal(bool revealed, string calldata _baseURI) public onlyOwner {
        _revealed = revealed;
        baseURI = _baseURI;
    }

    //Essential
    function setPublicSaleStatus() external onlyOwner {
        isPublicSaleActive = !isPublicSaleActive;
    }

    function setPreSaleStatus() external onlyOwner {
        isPresaleActive = !isPresaleActive;
    }

    //Essential

    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No balance to withdraw");
        payable(ADDRESS_2).transfer((balance * 2500) / 10000);
        payable(ADDRESS_1).transfer(address(this).balance);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override(ERC721A, IERC721A)
        returns (string memory)
    {
        if (_revealed) {
            return string(abi.encodePacked(baseURI, Strings.toString(tokenId)));
        } else {
            return string(abi.encodePacked(baseURI));
        }
    }

    function numberMinted(address owner) public view returns (uint256) {
        return _numberMinted(owner);
    }

    function setPreSaleRoot(bytes32 _presaleRoot) external onlyOwner {
        presaleRoot = _presaleRoot;
    }

    function setFreeMintRoot(bytes32 _freemintRoot) external onlyOwner {
        freemintRoot = _freemintRoot;
    }

    function setSigner(address _signer) external onlyOwner {
        signer = _signer;
    }

    function isAuthorized(bytes memory sig, bytes32 digest)
        private
        view
        returns (bool)
    {
        return ECDSA.recover(digest, sig) == signer;
    }

    //Passed as wei
    function setPublicPrice(uint256 _publicPrice) external onlyOwner {
        PUBLIC_PRICE = _publicPrice;
    }

    //Passed as wei
    function setPresalePrice(uint256 _wlPrice) external onlyOwner {
        WL_PRICE = _wlPrice;
    }

    function decreaseSupply(uint256 _maxSupply) external onlyOwner {
        require(_maxSupply < MAX_SUPPLY, "CANT_INCREASE_SUPPLY");
        MAX_SUPPLY = _maxSupply;
    }

    function setMintLimit(uint256 _mintLimit) external onlyOwner {
        MINT_LIMIT = _mintLimit;
    }

    function setTransactionLimit(uint256 _transactionLimit) external onlyOwner {
        TRANSACTION_LIMIT = _transactionLimit;
    }

    function setStakingContract(address _contractAddress) external onlyOwner {
        StakingContract = iStaking(_contractAddress);
    }

    function burn(
        uint256 _tokenId,
        uint64 expireTime,
        bytes memory sig
    ) external {
        bytes32 digest = keccak256(
            abi.encodePacked(msg.sender, expireTime, _tokenId, "burn")
        );
        require(isAuthorized(sig, digest), "TX_NOT_AUTHORIZED");
        require(block.timestamp <= expireTime, "EXPIRED_SIGNATURE");
        require(!usedDigests[digest], "SIGNATURE_LOOPING_NOT_ALLOWED");
        require(!burnt[_tokenId], "TOKEN_ALREADY_BURNT");
        burnt[_tokenId] = true;
        _burn(_tokenId);
    }
}