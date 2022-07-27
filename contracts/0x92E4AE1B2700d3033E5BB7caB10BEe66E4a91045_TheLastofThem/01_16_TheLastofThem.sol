// SPDX-License-Identifier: MIT

/** 
╔════╗╔╗ ╔╗╔═══╗    ╔╗   ╔═══╗╔═══╗╔════╗    ╔═══╗ ╔═══╗    ╔════╗╔╗ ╔╗╔═══╗╔═╗╔═╗
║╔╗╔╗║║║ ║║║╔══╝    ║║   ║╔═╗║║╔═╗║║╔╗╔╗║    ║╔═╗║ ║╔══╝    ║╔╗╔╗║║║ ║║║╔══╝║║╚╝║║
╚╝║║╚╝║╚═╝║║╚══╗    ║║   ║║ ║║║╚══╗╚╝║║╚╝    ║║ ║║ ║╚══╗    ╚╝║║╚╝║╚═╝║║╚══╗║╔╗╔╗║
  ║║  ║╔═╗║║╔══╝    ║║ ╔╗║╚═╝║╚══╗║  ║║      ║║ ║║ ║╔══╝      ║║  ║╔═╗║║╔══╝║║║║║║
 ╔╝╚╗ ║║ ║║║╚══╗    ║╚═╝║║╔═╗║║╚═╝║ ╔╝╚╗     ║╚═╝║╔╝╚╗       ╔╝╚╗ ║║ ║║║╚══╗║║║║║║
 ╚══╝ ╚╝ ╚╝╚═══╝    ╚═══╝╚╝ ╚╝╚═══╝ ╚══╝     ╚═══╝╚══╝       ╚══╝ ╚╝ ╚╝╚═══╝╚╝╚╝╚╝
                                                                                  
                                                                                
*/

pragma solidity >=0.8.9 <0.9.0;

import 'erc721a/contracts/extensions/ERC721AQueryable.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/cryptography/MerkleProof.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';

contract TheLastofThem is ERC721AQueryable, Ownable, ReentrancyGuard {

  using Strings for uint256;

  bytes32 public merkleRoot;
  mapping(address => bool) public whitelistClaimed;
  mapping(address => uint256) public _publicCounter;

  string public uriPrefix = '';
  string public uriSuffix = '.json';
  string public hiddenMetadataUri;
  
  uint256 public cost;
  uint256 public maxSupply;
  uint256 public maxMintAmountPerTx;
  uint256 public maxMintAmountPerW; 
  

  bool public paused = true;
  bool public whitelistMintEnabled = false;
  bool public revealed = true;

  constructor(
    string memory _tokenName,
    string memory _tokenSymbol,
    uint256 _cost,
    uint256 _maxSupply,
    uint256 _maxMintAmountPerTx,
    uint256 _maxMintAmountPerW,
    string memory _hiddenMetadataUri
  ) ERC721A(_tokenName, _tokenSymbol) {
    setCost(_cost);
    _safeMint(msg.sender, 1141);
    maxSupply = _maxSupply;
    setMaxMintAmountPerTx(_maxMintAmountPerTx);
    setMaxMintAmountPerW(_maxMintAmountPerW);
    setHiddenMetadataUri(_hiddenMetadataUri);
  }

  modifier mintCompliance(uint256 _mintAmount) {
    require(_mintAmount > 0 && _mintAmount <= maxMintAmountPerTx, 'Invalid mint amount!');
    require(totalSupply() + _mintAmount <= maxSupply, 'Max supply exceeded!');
    _;
  }

  modifier mintPriceCompliance(uint256 _mintAmount) {
    require(msg.value >= cost * _mintAmount, 'Insufficient funds!');
    _;
  }

  function whitelistMint(uint256 _mintAmount, bytes32[] calldata _merkleProof) public payable mintCompliance(_mintAmount) mintPriceCompliance(_mintAmount) {
    // Verify whitelist requirements
    require(whitelistMintEnabled, 'The whitelist sale is not enabled!');
    require(!whitelistClaimed[_msgSender()], 'Address already claimed!');
    bytes32 leaf = keccak256(abi.encodePacked(_msgSender()));
    require(MerkleProof.verify(_merkleProof, merkleRoot, leaf), 'Invalid proof!');

    whitelistClaimed[_msgSender()] = true;
    _safeMint(_msgSender(), _mintAmount);
  }

  function mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount) mintPriceCompliance(_mintAmount) {
    require(!paused, 'The contract is paused!');
    require(
        _publicCounter[_msgSender()] + _mintAmount <= maxMintAmountPerW,
        "exceeds max per address"
        );
      require(totalSupply() + _mintAmount <= maxSupply, "reached Max Supply");
      
      _publicCounter[_msgSender()] = _publicCounter[_msgSender()] + _mintAmount;
      
      _safeMint(_msgSender(), _mintAmount);
    }
  
  function mintForAddress(uint256 _mintAmount, address _receiver) public mintCompliance(_mintAmount) onlyOwner {
    _safeMint(_receiver, _mintAmount);
  }

  function _startTokenId() internal view virtual override returns (uint256) {
    return 1;
  }

  function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
    require(_exists(_tokenId), 'ERC721Metadata: URI query for nonexistent token');

    if (revealed == false) {
      return hiddenMetadataUri;
    }

    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, _tokenId.toString(), uriSuffix))
        : '';
  }

  function setRevealed(bool _state) public onlyOwner {
    revealed = _state;
  }

  function setCost(uint256 _cost) public onlyOwner {
    cost = _cost;
  }
  function setMaxMintAmountPerW(uint256 _maxMintAmountPerW) public onlyOwner {
      maxMintAmountPerW = _maxMintAmountPerW;
  }
  function setMaxMintAmountPerTx(uint256 _maxMintAmountPerTx) public onlyOwner {
    maxMintAmountPerTx = _maxMintAmountPerTx;
  }

  function setHiddenMetadataUri(string memory _hiddenMetadataUri) public onlyOwner {
    hiddenMetadataUri = _hiddenMetadataUri;
  }

  function setUriPrefix(string memory _uriPrefix) public onlyOwner {
    uriPrefix = _uriPrefix;
  }

  function setUriSuffix(string memory _uriSuffix) public onlyOwner {
    uriSuffix = _uriSuffix;
  }

  function setPaused(bool _state) public onlyOwner {
    paused = _state;
  }

  function setMerkleRoot(bytes32 _merkleRoot) public onlyOwner {
    merkleRoot = _merkleRoot;
  }

  function setWhitelistMintEnabled(bool _state) public onlyOwner {
    whitelistMintEnabled = _state;
  }

  function collectReserves() external onlyOwner {
    require(totalSupply() == 0, "RESERVES TAKEN");

    _mint(msg.sender, 104);
  }

  function withdraw() public onlyOwner nonReentrant {
   
    (bool os, ) = payable(owner()).call{value: address(this).balance}('');
    require(os);
  }

  function _baseURI() internal view virtual override returns (string memory) {
    return uriPrefix;
  }
}