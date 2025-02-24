// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./ERC721A.sol";
import "./Ownable.sol";
import "./Strings.sol";

contract TheToadz is ERC721A, Ownable {
    using Strings for uint256;

    uint256 public maxSupply = 5555;
    uint256 public cost = 0.006 ether;
    uint256 public maxPerTx = 6;
    uint256 public maxFree = 1;
    bool public sale;

    string public baseURI;
    mapping(address => uint256) private _mintedFreeAmount;

    error SaleNotActive();
    error MaxSupplyReached();
    error MaxPerTxReached();
    error NotEnoughETH();

    constructor(string memory initbaseURI) ERC721A("The Toadz", "TT") {
        baseURI = initbaseURI;
    }

    function mint(uint256 _amount) external payable {
        if (!sale) revert SaleNotActive();

        uint256 _cost = (msg.value == 0 &&
            (_mintedFreeAmount[msg.sender] + _amount <= maxFree))
            ? 0
            : cost;

        if (_amount > maxPerTx) revert MaxPerTxReached();
        if (msg.value < _cost * _amount) revert NotEnoughETH();
        if (_totalMinted() + _amount > maxSupply) revert MaxSupplyReached();

        if (_cost == 0) {
            _mintedFreeAmount[msg.sender] += _amount;
        }

        _mint(msg.sender, _amount);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return string(abi.encodePacked(baseURI, tokenId.toString(), ".json"));
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function _startTokenId() internal view virtual override returns (uint256) {
        return 1;
    }

    function setBaseURI(string memory uri) public onlyOwner {
        baseURI = uri;
    }

    function startSale() external onlyOwner {
        sale = !sale;
    }

    function setCost(uint256 _cost) external onlyOwner {
        cost = _cost;
    }

    function setMaxFreeMint(uint256 _maxFree) external onlyOwner {
        maxFree = _maxFree;
    }

    function airdrop(address receiver, uint256 _amount) external onlyOwner {
        _safeMint(receiver, _amount);
    }

    function withdraw() external onlyOwner {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }
}