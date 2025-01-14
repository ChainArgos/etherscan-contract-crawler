// SPDX-License-Identifier: None

pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "erc721a/contracts/extensions/ERC721AQueryable.sol";

contract OddFrens is ERC721A, ERC721AQueryable, Ownable {
  uint256 constant EXTRA_MINT_PRICE = 0.005 ether;
  uint256 constant MAX_SUPPLY_PLUS_ONE = 10001;
  uint256 constant MAX_PER_TRANSACTION_PLUS_ONE = 11;

  string tokenBaseUri = "ipfs://Qmeuo6ccQMYWyXUHe65tdybzJv3PYhCykvG9aLQMZSAE23/";

  bool public paused = true;

  address public immutable proxyRegistryAddress;

  mapping(address => uint256) private _freeMintedCount;

  constructor(address _proxyRegistryAddress) ERC721A("Odd Frens", "OF") {
    proxyRegistryAddress = _proxyRegistryAddress;
  }

  function mint(uint256 _quantity) external payable {
    require(!paused, "MINtINg is PauSed");

    uint256 _totalSupply = totalSupply();

    require(_totalSupply + _quantity < MAX_SUPPLY_PLUS_ONE, "ExCEedS SuPPLY");
    require(_quantity < MAX_PER_TRANSACTION_PLUS_ONE, "EXcEEdS MaX PER tX");

    // Free Mints
    uint256 payForCount = _quantity;
    uint256 freeMintCount = _freeMintedCount[msg.sender];

    if (freeMintCount < 1) {
      if (_quantity > 1) {
        payForCount = _quantity - 1;
      } else {
        payForCount = 0;
      }

      _freeMintedCount[msg.sender] = 1;
    }

    require(msg.value >= payForCount * EXTRA_MINT_PRICE, "EthEr sENt is NOT corrEcT");

    _mint(msg.sender, _quantity);
  }

  function freeMintedCount(address owner) external view returns (uint256) {
    return _freeMintedCount[owner];
  }

  function _startTokenId() internal pure override returns (uint256) {
    return 1;
  }

  function _baseURI() internal view override returns (string memory) {
    return tokenBaseUri;
  }

  function isApprovedForAll(address owner, address operator)
    public
    view
    override(ERC721A, IERC721A)
    returns (bool)
  {
    OpenSeaProxyRegistry proxyRegistry = OpenSeaProxyRegistry(
      proxyRegistryAddress
    );

    if (address(proxyRegistry.proxies(owner)) == operator) {
      return true;
    }

    return super.isApprovedForAll(owner, operator);
  }

  function setBaseURI(string calldata _newBaseUri) external onlyOwner {
    tokenBaseUri = _newBaseUri;
  }

  function flipSale() external onlyOwner {
    paused = !paused;
  }

  function collectReserves() external onlyOwner {
    require(totalSupply() == 0, "ReServES aLReaDY TAkEN");

    _mint(msg.sender, 100);
  }

  function withdraw() external onlyOwner {
    require(
      payable(owner()).send(address(this).balance),
      "WIThDRaW UNsucCEssFUl"
    );
  }
}

contract OwnableDelegateProxy {}

contract OpenSeaProxyRegistry {
  mapping(address => OwnableDelegateProxy) public proxies;
}