// SPDX-License-Identifier: MIT
pragma solidity 0.7.5;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {IRoyaltyFeeRegistry} from "./interfaces/IRoyaltyFeeRegistry.sol";

/**
 * @title RoyaltyFeeRegistry
 * @notice It is a royalty fee registry for the Helixmeta exchange.
 */
contract RoyaltyFeeRegistry is IRoyaltyFeeRegistry, Ownable {
    struct FeeInfo {
        address setter;
        address receiver;
        uint256 fee;
    }

    // Limit (if enforced for fee royalty in percentage (10,000 = 100%)
    uint256 public royaltyFeeLimit;

    mapping(address => FeeInfo) private _royaltyFeeInfoCollection;
    mapping(address => mapping(uint256 => FeeInfo))
        private _royaltyFeeInfoNFTCollection;

    event NewRoyaltyFeeLimit(uint256 royaltyFeeLimit);
    event RoyaltyFeeUpdate(
        address indexed collection,
        address indexed setter,
        address indexed receiver,
        uint256 fee
    );

    event NFTRoyaltyFeeUpdate(
        uint256 indexed tokenId,
        address indexed setter,
        address indexed receiver,
        uint256 fee
    );

    /**
     * @notice Constructor
     * @param _royaltyFeeLimit new royalty fee limit (500 = 5%, 1,000 = 10%)
     */
    constructor(uint256 _royaltyFeeLimit) {
        require(_royaltyFeeLimit <= 9500, "Owner: Royalty fee limit too high");
        royaltyFeeLimit = _royaltyFeeLimit;
    }

    /**
     * @notice Update royalty info for collection
     * @param _royaltyFeeLimit new royalty fee limit (500 = 5%, 1,000 = 10%)
     */
    function updateRoyaltyFeeLimit(uint256 _royaltyFeeLimit)
        external
        override
        onlyOwner
    {
        require(_royaltyFeeLimit <= 9500, "Owner: Royalty fee limit too high");
        royaltyFeeLimit = _royaltyFeeLimit;

        emit NewRoyaltyFeeLimit(_royaltyFeeLimit);
    }

    /**
     * @notice Update royalty info for collection
     * @param collection address of the NFT contract
     * @param setter address that sets the receiver
     * @param receiver receiver for the royalty fee
     * @param fee fee (500 = 5%, 1,000 = 10%)
     */
    function updateRoyaltyInfoForCollection(
        address collection,
        address setter,
        address receiver,
        uint256 fee
    ) external override onlyOwner {
        require(fee <= royaltyFeeLimit, "Registry: Royalty fee too high");
        _royaltyFeeInfoCollection[collection] = FeeInfo({
            setter: setter,
            receiver: receiver,
            fee: fee
        });

        emit RoyaltyFeeUpdate(collection, setter, receiver, fee);
    }

    /**
     * @notice Update royalty info for collection
     * @param collection address of the NFT contract
     * @param tokenId string number tokenId gen
     * @param setter address that sets the receiver
     * @param receiver receiver for the royalty fee
     * @param fee fee (500 = 5%, 1,000 = 10%)
     */
    function updateRoyaltyInfoForNFTCollection(
        address collection,
        uint256 tokenId,
        address setter,
        address receiver,
        uint256 fee
    ) external override onlyOwner {
        require(fee <= royaltyFeeLimit, "Registry: Royalty fee too high");
        _royaltyFeeInfoNFTCollection[collection][tokenId] = FeeInfo({
            setter: setter,
            receiver: receiver,
            fee: fee
        });

        emit NFTRoyaltyFeeUpdate(tokenId, setter, receiver, fee);
    }

    /**
     * @notice Calculate royalty info for a collection address and a sale gross amount
     * @param collection collection address
     * @param amount amount
     * @return receiver address and amount received by royalty recipient
     */
    function royaltyInfo(
        address collection,
        uint256 amount,
        uint256 tokenId
    ) external view override returns (address, uint256) {
        if (
            _royaltyFeeInfoNFTCollection[collection][tokenId].receiver !=
            address(0)
        ) {
            return (
                _royaltyFeeInfoNFTCollection[collection][tokenId].receiver,
                (amount *
                    _royaltyFeeInfoNFTCollection[collection][tokenId].fee) /
                    10000
            );
        }
        return (
            _royaltyFeeInfoCollection[collection].receiver,
            (amount * _royaltyFeeInfoCollection[collection].fee) / 10000
        );
    }

    /**
     * @notice View royalty info for a collection address
     * @param collection collection address
     */
    function royaltyFeeInfoCollection(address collection)
        external
        view
        override
        returns (
            address,
            address,
            uint256
        )
    {
        return (
            _royaltyFeeInfoCollection[collection].setter,
            _royaltyFeeInfoCollection[collection].receiver,
            _royaltyFeeInfoCollection[collection].fee
        );
    }

     /**
     * @notice View royalty info for a collection address
     * @param collection collection address
     * @param tokenId uint256
     */
    function royaltyFeeInfoNFTCollection(address collection, uint256 tokenId)
        external
        view
        override
        returns (
            address,
            address,
            uint256
        )
    {
        return (
            _royaltyFeeInfoNFTCollection[collection][tokenId].setter,
            _royaltyFeeInfoNFTCollection[collection][tokenId].receiver,
            _royaltyFeeInfoNFTCollection[collection][tokenId].fee
        );
    }
}