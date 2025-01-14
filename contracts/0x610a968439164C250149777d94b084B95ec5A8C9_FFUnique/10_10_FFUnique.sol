// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  ██████████████████████████████████████████████████████████████████████████████
  █████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█████████████████████
  █████████████████████░░ F U T U R E S    F A C T O R Y ░░█████████████████████
  █████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█████████████████████
  █████████████████████░░░░░░░░░░░░░░███░░██████████░░░░░░░█████████████████████
  █████████████████████░░░░░░░░░░███████░░███░░░░███░░░░░░░█████████████████████
  █████████████████████░░░░░░░░░░░░░░███░░███░░░░███░░░░░░░█████████████████████
  █████████████████████░░░░░░░██████████░░██████████░░░░░░░█████████████████████
  █████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█████████████████████
  █████████████████████░░░░░░░██████████░░██████████░░░░░░░█████████████████████
  █████████████████████░░░░░░░███░░░░███░░███░░░░░░░░░░░░░░█████████████████████
  █████████████████████░░░░░░░███░░░░███░░███████░░░░░░░░░░█████████████████████
  █████████████████████░░░░░░░██████████░░███░░░░░░░░░░░░░░█████████████████████
  █████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█████████████████████
  ██████████████████████████████████████████████████████████████████████████████
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

import '@openzeppelin-contracts/token/ERC721/ERC721.sol';

contract FFUnique is ERC721 {
  string ipfsURI;
  string openSeaContractURI;

  constructor(
    string memory dropName,
    string memory dropSymbol,
    string memory dropIpfsURI,
    string memory dropOpenSeaContractURI,
    address recipient
  ) ERC721(dropName, dropSymbol) {
    ipfsURI = dropIpfsURI;
    openSeaContractURI = dropOpenSeaContractURI;
    _mint(recipient, 1);
  }

  function tokenURI(uint256 tokenId)
    public
    view
    override
    returns (string memory)
  {
    return ipfsURI;
  }

  function contractURI() public view returns (string memory) {
    return openSeaContractURI;
  }
}