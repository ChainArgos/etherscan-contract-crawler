// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

enum Side {
    Buy,
    Sell
}
enum SignatureVersion {
    Single,
    Bulk
}

struct Fee {
    uint16 rate;
    address recipient;
}

struct Order {
    address trader;
    Side side;
    address matchingPolicy;
    address collection;
    uint256 tokenId;
    uint256 amount;
    address paymentToken;
    uint256 price;
    uint256 listingTime;
    uint256 expirationTime;
    Fee[] fees;
    uint256 salt;
    bytes extraParams;
}

struct Input {
    Order order;
    uint8 v;
    bytes32 r;
    bytes32 s;
    bytes extraSignature;
    SignatureVersion signatureVersion;
    uint256 blockNumber;
}