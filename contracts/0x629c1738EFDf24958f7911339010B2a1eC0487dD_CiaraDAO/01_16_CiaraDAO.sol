/*
    Copyright 2021 Project Galaxy.
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    SPDX-License-Identifier: Apache License, Version 2.0
*/

pragma solidity 0.7.6;

import "ERC721.sol";
import "Ownable.sol";
import "IStarNFT.sol";

contract CiaraDAO is ERC721, IStarNFT, Ownable {
    using SafeMath for uint256;

    /* ============ Events ============ */
    event EventMinterAdded(address indexed newMinter);
    event EventMinterRemoved(address indexed oldMinter);

    /* ============ Modifiers ============ */
    /**
     * Only minter.
     */
    modifier onlyMinter() {
        require(minters[msg.sender], "Must be minter");
        _;
    }

    /* ============ Enums ================ */
    /* ============ Structs ============ */
    /* ============ State Variables ============ */

    // Mint and burn star.
    mapping(address => bool) public minters;

    uint256 public TOTAL_SUPPLY = 110;

    uint256 private _starCount;

    /* ============ Constructor ============ */
    constructor() ERC721("CiaraDAO", "CIARADAO") {}

    /* ============ External Functions ============ */
    function mint(address account, uint256 powah)
        external
        override
        onlyMinter
        returns (uint256)
    {
        require(_starCount < TOTAL_SUPPLY, "Total supply reached");
        _starCount++;
        uint256 sID = _starCount;

        _mint(account, sID);
        return sID;
    }

    function mintBatch(
        address account,
        uint256 amount,
        uint256[] calldata powahArr
    ) external override onlyMinter returns (uint256[] memory) {
        require(_starCount + amount <= TOTAL_SUPPLY, "Total supply reached");
        uint256[] memory ids = new uint256[](amount);
        for (uint256 i = 0; i < ids.length; i++) {
            _starCount++;
            ids[i] = _starCount;
            _mint(account, ids[i]);
        }
        return ids;
    }

    function burn(address account, uint256 id) external override onlyMinter {
        require(false, "Disallow burn");
    }

    function burnBatch(address account, uint256[] calldata ids)
        external
        override
        onlyMinter
    {
        require(false, "Disallow burn");
    }

    /* ============ External Getter Functions ============ */
    function isOwnerOf(address account, uint256 id)
        public
        view
        override
        returns (bool)
    {
        address owner = ownerOf(id);
        return owner == account;
    }

    function getNumMinted() external view override returns (uint256) {
        return _starCount;
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        require(id <= _starCount, "NFT does not exist");
        if (bytes(baseURI()).length == 0) {
            return "";
        } else {
            return string(abi.encodePacked(baseURI(), uint2str(id), ".json"));
        }
    }


    /* ============ Internal Functions ============ */
    /* ============ Private Functions ============ */

    /**
     * PRIVILEGED MODULE FUNCTION. Sets a new baseURI for all token types.
     */
    function setURI(string memory newURI) external onlyOwner {
        _setBaseURI(newURI);
    }

    /**
     * PRIVILEGED MODULE FUNCTION. Add a new minter.
     */
    function addMinter(address minter) external onlyOwner {
        require(minter != address(0), "Minter must not be null address");
        require(!minters[minter], "Minter already added");
        minters[minter] = true;
        emit EventMinterAdded(minter);
    }

    /**
     * PRIVILEGED MODULE FUNCTION. Remove a old minter.
     */
    function removeMinter(address minter) external onlyOwner {
        require(minters[minter], "Minter does not exist");
        delete minters[minter];
        emit EventMinterRemoved(minter);
    }

    /* ============ Util Functions ============ */

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bStr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - (_i / 10) * 10));
            bytes1 b1 = bytes1(temp);
            bStr[k] = b1;
            _i /= 10;
        }
        return string(bStr);
    }
}