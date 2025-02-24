//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GiveawayTruedapp is Ownable {
    struct Lot {
        address collection;
        uint128 id;
        uint128 maxParticipants;
        uint256 endDate;
        uint256 minBalance;
        uint64 stateNumber;
        uint64 lotCount;
        uint128 arrayPosInMeta;
        address exactColletion;
        address winner;
        string imageURL;
        string twitterInfo;
        string discordInfo;
        string password;
        bool closed;
    }

    struct InfoLot {
        address account;
        uint256 lotId;
    }

    struct MyGives {
        uint256 id;
        uint256 isClosed;
        uint256 IdFromAll;
        string myMetaData;
        uint128 maxParticipants;
        uint256 endTime;
    }

    uint64 private _lotsCount;
    uint64 private _maxAmountPart;
    string[] private _meta;
    address private _signer;
    string private _secret;

    mapping(address => uint256) private _countLotsByAddress;
    mapping(address => uint256[]) private _allLotIdByAddress;
    mapping(address => mapping(uint256 => Lot)) private _lotByLotOwnerAndLotId;
    mapping(address => mapping(uint256 => bool)) private _alreadyHasNft;
    mapping(uint256 => address) private _ownerLotByLotId;

    function getMessageHash(address user, uint256 timestamp) public view returns (bytes32) {
        return keccak256(abi.encodePacked(user, timestamp, _secret));
    }

    function getTimestamp() public view returns (uint256) {
        return block.timestamp;
    }

    function lotsCount() external view returns (uint256) {
        return _lotsCount;
    }

    function getAllMeta() external view returns (string[] memory allMeta) {
        allMeta = new string[](_meta.length);
        for (uint256 i = 0; i < _meta.length; i++) {
            allMeta[i] = _meta[i];
        }
    }

    function signer() external view returns (address) {
        return _signer;
    }

    function secret() external view returns (string memory) {
        return _secret;
    }

    function maxAmountPart() external view returns (uint256) {
        return _maxAmountPart;
    }

    function countsLotsByAddress(address account) external view returns (uint256) {
        return _countLotsByAddress[account];
    }

    function allLotIdByAddress(address account) external view returns (uint256[] memory) {
        return _allLotIdByAddress[account];
    }

    function lotByLotOwnerAndLotId(address account, uint256 lotId) external view returns (Lot memory) {
        uint256 idUser = _allLotIdByAddress[account][lotId - 1];
        return _lotByLotOwnerAndLotId[account][idUser];
    }

    function alreadyHasNft(address collection, uint256 id) external view returns (bool) {
        return _alreadyHasNft[collection][id];
    }

    function infoLotByLotId(uint256 id) external view returns (address) {
        return _ownerLotByLotId[id];
    }

    function myGiveaways(address user, uint256 offset, uint256 limit) external view returns (MyGives[] memory givesData) {
        uint256 countLot = _allLotIdByAddress[user].length;
        if (countLot == 0) return new MyGives[](0);
        if (offset > countLot) return new MyGives[](0);
        uint256 to = offset + limit;
        if (countLot < to) to = countLot;
        givesData = new MyGives[](to - offset);
        uint256[] memory allLotId = _allLotIdByAddress[user];
        MyGives[] memory allGives = new MyGives[](countLot);
        for (uint i = 0; i < allLotId.length; i++) {
            Lot memory lot = _lotByLotOwnerAndLotId[user][allLotId[i]];
            uint256 isClosed = lot.closed == true ? 2 : getTimestamp() > lot.endDate ? 1 : 0;
            allGives[i] = MyGives(i + 1, isClosed, lot.lotCount, _meta[lot.arrayPosInMeta], lot.maxParticipants, lot.endDate);
        }
        for (uint i = 0; i < givesData.length; i++) {
            givesData[i] = allGives[offset + i];
        }
    }

    constructor(uint64 maxAmountPart_, string memory secret_) {
        _maxAmountPart = maxAmountPart_;
        _signer = msg.sender;
        _secret = secret_;
    }

    function changeMaxPart(uint64 maxAmountPart_) external onlyOwner {
        _maxAmountPart = maxAmountPart_;
    }

    function changeSigner(address singer_) external onlyOwner {
        _signer = singer_;
    }

    function makeLottery(
        address collection,
        uint128 id,
        uint128 maxParticipants,
        uint256 endDate,
        uint64 stateNumber,
        uint256 minBalance,
        address exactColletion,
        string memory imageURL,
        string memory twitterInfo,
        string memory discordInfo,
        string memory password
    ) external returns (bool) {
        require(collection != address(0), "Collection eq address zero");
        IERC721 nftToken = IERC721(collection);
        address caller = msg.sender;
        require(nftToken.ownerOf(id) == caller, "Not owner of the NFT");
        if (stateNumber == 1) {
            require(minBalance > 0, "MinBalance lt eq zero");
        } else if (stateNumber == 2) {
            require(exactColletion != address(0), "ExactColletion eq zero address");
        } else if (stateNumber == 3) {
            require(minBalance > 0, "MinBalance lt eq zero");
            require(exactColletion != address(0), "ExactColletion eq zero address");
        }
        require(!_alreadyHasNft[collection][id], "Already participating it lottery");
        require(maxParticipants > 1, "MaxParticipants lt one");
        require(endDate > getTimestamp(), "EndDate lt time now");
        _lotsCount++;
        _countLotsByAddress[caller] += 1;
        _allLotIdByAddress[caller].push(_lotsCount);
        _ownerLotByLotId[_lotsCount] = caller;
        Lot storage lot = _lotByLotOwnerAndLotId[caller][_lotsCount];
        lot.collection = collection;
        lot.id = id;
        lot.maxParticipants = maxParticipants;
        lot.endDate = endDate;
        lot.stateNumber = stateNumber;
        lot.minBalance = minBalance;
        lot.exactColletion = exactColletion;
        lot.lotCount = _lotsCount;
        lot.imageURL = imageURL;
        lot.arrayPosInMeta = uint128(_meta.length);
        lot.twitterInfo = twitterInfo;
        lot.discordInfo = discordInfo;
        lot.password = password;
        _alreadyHasNft[collection][id] = true;
        _meta.push(imageURL);
        return true;
    }

    function closeLottery(uint256 id, address winner, uint256 inputTime, bytes memory _sig) external returns (bool) {
        address caller = msg.sender;
        uint256 idUser = _allLotIdByAddress[caller][id - 1];
        require(_ownerLotByLotId[idUser] == caller, "You dont have a lot");
        Lot storage lot = _lotByLotOwnerAndLotId[caller][idUser];
        require(lot.closed == false, "Already done");

        bytes32 message = getMessageHash(caller, inputTime);
        require(verify(message, _sig), "It's not a signer");

        lot.winner = winner;

        IERC721 nftToken = IERC721(lot.collection);
        nftToken.transferFrom(caller, winner, lot.id);
        lot.closed = true;
        _alreadyHasNft[lot.collection][lot.id] = false;
        return true;
    }

    function verify(bytes32 message, bytes memory _sig) internal view returns (bool) {
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(message);
        return (recover(ethSignedMessageHash, _sig) == _signer);
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _sig) internal pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function getEthSignedMessageHash(bytes32 _messageHash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }

    function _split(bytes memory _sig) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(_sig.length == 65, "invalid signature name");

        assembly {
            r := mload(add(_sig, 32))
            s := mload(add(_sig, 64))
            v := byte(0, mload(add(_sig, 96)))
        }
    }
}