/*
  ･
   *　★
      ･ ｡
        　･　ﾟ☆ ｡
  　　　 *　★ ﾟ･｡ *  ｡
          　　* ☆ ｡･ﾟ*.｡
      　　　ﾟ *.｡☆｡★　･
​
                      `                     .-:::::-.`              `-::---...```
                     `-:`               .:+ssssoooo++//:.`       .-/+shhhhhhhhhhhhhyyyssooo:
                    .--::.            .+ossso+/////++/:://-`   .////+shhhhhhhhhhhhhhhhhhhhhy
                  `-----::.         `/+////+++///+++/:--:/+/-  -////+shhhhhhhhhhhhhhhhhhhhhy
                 `------:::-`      `//-.``.-/+ooosso+:-.-/oso- -////+shhhhhhhhhhhhhhhhhhhhhy
                .--------:::-`     :+:.`  .-/osyyyyyyso++syhyo.-////+shhhhhhhhhhhhhhhhhhhhhy
              `-----------:::-.    +o+:-.-:/oyhhhhhhdhhhhhdddy:-////+shhhhhhhhhhhhhhhhhhhhhy
             .------------::::--  `oys+/::/+shhhhhhhdddddddddy/-////+shhhhhhhhhhhhhhhhhhhhhy
            .--------------:::::-` +ys+////+yhhhhhhhddddddddhy:-////+yhhhhhhhhhhhhhhhhhhhhhy
          `----------------::::::-`.ss+/:::+oyhhhhhhhhhhhhhhho`-////+shhhhhhhhhhhhhhhhhhhhhy
         .------------------:::::::.-so//::/+osyyyhhhhhhhhhys` -////+shhhhhhhhhhhhhhhhhhhhhy
       `.-------------------::/:::::..+o+////+oosssyyyyyyys+`  .////+shhhhhhhhhhhhhhhhhhhhhy
       .--------------------::/:::.`   -+o++++++oooosssss/.     `-//+shhhhhhhhhhhhhhhhhhhhyo
     .-------   ``````.......--`        `-/+ooooosso+/-`          `./++++///:::--...``hhhhyo
                                              `````
   *　
      ･ ｡
　　　　･　　ﾟ☆ ｡
  　　　 *　★ ﾟ･｡ *  ｡
          　　* ☆ ｡･ﾟ*.｡
      　　　ﾟ *.｡☆｡★　･
    *　　ﾟ｡·*･｡ ﾟ*
  　　　☆ﾟ･｡°*. ﾟ
　 ･ ﾟ*｡･ﾟ★｡
　　･ *ﾟ｡　　 *
　･ﾟ*｡★･
 ☆∴｡　*
･ ｡
*/

// SPDX-License-Identifier: MIT OR Apache-2.0

pragma solidity ^0.8.12;

import "@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

import "./libraries/TimeLibrary.sol";

import "./interfaces/internal/INFTMarket230.sol";

import "./NFTCollection.sol";
import "./FETH.sol";
import "./NFTMarket.sol";
import "./NFTDropMarket.sol";
import "./PercentSplitETH.sol";

import "./mixins/shared/Constants.sol";

/**
 * @title Convenience methods to ease integration with other contracts.
 * @notice This will aggregate calls and format the output per the needs of our frontend or other consumers.
 * @author batu-inal & HardlyDifficult
 */
contract FNDMiddleware {
  using AddressUpgradeable for address;
  using AddressUpgradeable for address payable;
  using Strings for uint256;
  using Strings for address;
  using TimeLibrary for uint256;
  using ERC165Checker for address;

  struct Fee {
    uint256 percentInBasisPoints;
    uint256 amountInWei;
  }
  struct FeeWithRecipient {
    uint256 percentInBasisPoints;
    uint256 amountInWei;
    address payable recipient;
  }
  struct RevSplit {
    uint256 relativePercentInBasisPoints;
    uint256 absolutePercentInBasisPoints;
    uint256 amountInWei;
    address payable recipient;
  }

  NFTMarket private immutable market;
  NFTDropMarket private immutable nftDropMarket;
  FETH private immutable feth;
  FNDMiddleware private immutable middlewareTemplate;

  constructor(address payable _market, address payable _nftDropMarket, address payable _feth) {
    market = NFTMarket(_market);
    nftDropMarket = NFTDropMarket(_nftDropMarket);
    feth = FETH(_feth);

    // In the constructor, `this` refers to the implementation address. Everywhere else it'll be the proxy.
    middlewareTemplate = this;
  }

  // solhint-disable-next-line code-complexity
  function getFees(address nftContract, uint256 tokenId, uint256 price)
    external
    view
    returns (
      FeeWithRecipient memory protocol,
      Fee memory creator,
      FeeWithRecipient memory owner,
      RevSplit[] memory creatorRevSplit
    )
  {
    address payable[] memory creatorRecipients;
    uint256[] memory creatorShares;
    {
      bool isDropMarket;
      try IERC721(nftContract).ownerOf(tokenId) returns (address ownerOf) {
        if (ownerOf == address(0)) isDropMarket = true;
        // else NFT minted an owner returns
      } catch {
        // NFT not minted yet - belongs to dropMarket primary sale.
        isDropMarket = true;
      }

      // Note that the protocol fee returned does not account for the referrals (which are not known until sale).
      protocol.recipient = isDropMarket ? nftDropMarket.getFoundationTreasury() : market.getFoundationTreasury();
      {
        (
          protocol.amountInWei,
          creator.amountInWei,
          creatorRecipients,
          creatorShares,
          owner.amountInWei,
          owner.recipient
        ) = isDropMarket
          ? nftDropMarket.getFeesAndRecipients(nftContract, tokenId, price)
          : market.getFeesAndRecipients(nftContract, tokenId, price);
        if (creatorShares.length == 0) {
          creatorShares = new uint256[](creatorRecipients.length);
          if (creatorShares.length == 1) {
            creatorShares[0] = BASIS_POINTS;
          }
        }
      }
      {
        (protocol.percentInBasisPoints, creator.percentInBasisPoints, , , owner.percentInBasisPoints, ) = isDropMarket
          ? nftDropMarket.getFeesAndRecipients(nftContract, tokenId, BASIS_POINTS)
          : market.getFeesAndRecipients(nftContract, tokenId, BASIS_POINTS);
      }
    }

    // Normalize shares to 10%
    {
      uint256 totalShares = 0;
      for (uint256 i = 0; i < creatorShares.length; ++i) {
        // TODO handle ignore if > 100% (like the market would)
        totalShares += creatorShares[i];
      }

      if (totalShares != 0) {
        for (uint256 i = 0; i < creatorShares.length; ++i) {
          creatorShares[i] = (BASIS_POINTS * creatorShares[i]) / totalShares;
        }
      }
    }
    // Count creators and split recipients
    {
      uint256 creatorCount = creatorRecipients.length;
      for (uint256 i = 0; i < creatorRecipients.length; ++i) {
        // Check if the address is a percent split
        if (address(creatorRecipients[i]).isContract()) {
          try this.getSplitShareLength(creatorRecipients[i]) returns (uint256 recipientCount) {
            creatorCount += recipientCount - 1;
          } catch // solhint-disable-next-line no-empty-blocks
          {
            // Not a Foundation percent split
          }
        }
      }
      creatorRevSplit = new RevSplit[](creatorCount);
    }

    // Populate rev splits, including any percent splits
    uint256 revSplitIndex = 0;
    for (uint256 i = 0; i < creatorRecipients.length; ++i) {
      if (address(creatorRecipients[i]).isContract()) {
        try this.getSplitShareLength(creatorRecipients[i]) returns (uint256 recipientCount) {
          uint256 totalSplitShares;
          for (uint256 splitIndex = 0; splitIndex < recipientCount; ++splitIndex) {
            uint256 share = PercentSplitETH(creatorRecipients[i]).getPercentInBasisPointsByIndex(splitIndex);
            totalSplitShares += share;
          }
          for (uint256 splitIndex = 0; splitIndex < recipientCount; ++splitIndex) {
            uint256 splitShare = (PercentSplitETH(creatorRecipients[i]).getPercentInBasisPointsByIndex(splitIndex) *
              BASIS_POINTS) / totalSplitShares;
            splitShare = (splitShare * creatorShares[i]) / BASIS_POINTS;
            creatorRevSplit[revSplitIndex++] = _calcRevSplit(
              price,
              splitShare,
              creator.percentInBasisPoints,
              PercentSplitETH(creatorRecipients[i]).getShareRecipientByIndex(splitIndex)
            );
          }
          continue;
        } catch // solhint-disable-next-line no-empty-blocks
        {
          // Not a Foundation percent split
        }
      }
      {
        creatorRevSplit[revSplitIndex++] = _calcRevSplit(
          price,
          creatorShares[i],
          creator.percentInBasisPoints,
          creatorRecipients[i]
        );
      }
    }

    // Bubble the creator to the first position in `creatorRevSplit`
    {
      address creatorAddress;
      try this.getTokenCreator(nftContract, tokenId) returns (address _creatorAddress) {
        creatorAddress = _creatorAddress;
      } catch // solhint-disable-next-line no-empty-blocks
      {

      }
      if (creatorAddress != address(0)) {
        for (uint256 i = 1; i < creatorRevSplit.length; ++i) {
          if (creatorRevSplit[i].recipient == creatorAddress) {
            (creatorRevSplit[i], creatorRevSplit[0]) = (creatorRevSplit[0], creatorRevSplit[i]);
            break;
          }
        }
      }
    }
  }

  /**
   * @notice Checks who the seller for an NFT is, checking both markets or returning the current owner.
   */
  function getSellerOrOwnerOf(address nftContract, uint256 tokenId)
    external
    view
    returns (address payable ownerOrSeller)
  {
    ownerOrSeller = market.getSellerOf(nftContract, tokenId);
    if (ownerOrSeller == address(0)) {
      ownerOrSeller = nftDropMarket.getSellerOf(nftContract, tokenId);
      if (ownerOrSeller == address(0)) {
        ownerOrSeller = payable(IERC721(nftContract).ownerOf(tokenId));
      }
    }
  }

  /**
   * @notice Gets the owners for the given tokens in a collection. If it's escrowed in the Foundation market, the
   * account which listed it for sale will be returned.
   * @return ownerOrSellers This array will be the same length as the provided tokenIds. Any invalid tokens will
   * be returned as address(0).
   * @dev There is an upper limit to how many tokens may be queried at a time, which may differ depending on the RPC
   * provider used.
   */
  function getSellerOrOwnersFromCollection(address nftContract, uint256[] calldata tokenIds)
    external
    view
    returns (address payable[] memory ownerOrSellers)
  {
    ownerOrSellers = new address payable[](tokenIds.length);
    for (uint256 i = 0; i < tokenIds.length; ++i) {
      try middlewareTemplate.getSellerOrOwnerOf(nftContract, tokenIds[i]) returns (address payable ownerOrSeller) {
        ownerOrSellers[i] = ownerOrSeller;
      } catch // solhint-disable-next-line no-empty-blocks
      {
        // If the token has not been minted or since been burned, we'll return the default address(0) as the owner.
      }
    }
  }

  /**
   * @notice Gets the owners for the given NFTs. If it's escrowed in the Foundation market, the
   * account which listed it for sale will be returned.
   * @param nftContracts The NFT contracts to check. There must be one per tokenId provided.
   * @param tokenIds The NFT IDs to check. There must be one per nftContract provided.
   * @return ownerOrSellers This array will be the same length as the provided tokenIds. Any invalid tokens will
   * be returned as address(0).
   * @dev There is an upper limit to how many tokens may be queried at a time, which may differ depending on the RPC
   * provider used.
   */
  function getSellerOrOwnersOf(address[] calldata nftContracts, uint256[] calldata tokenIds)
    external
    view
    returns (address payable[] memory ownerOrSellers)
  {
    require(nftContracts.length == tokenIds.length, "NFTs and tokenIds must be the same length");
    ownerOrSellers = new address payable[](tokenIds.length);
    for (uint256 i = 0; i < tokenIds.length; ++i) {
      try middlewareTemplate.getSellerOrOwnerOf(nftContracts[i], tokenIds[i]) returns (address payable ownerOrSeller) {
        ownerOrSellers[i] = ownerOrSeller;
      } catch // solhint-disable-next-line no-empty-blocks
      {
        // If the token has not been minted or since been burned, we'll return the default address(0) as the owner.
      }
    }
  }

  function getSplitShareLength(address payable recipient) external view returns (uint256 count) {
    count = PercentSplitETH(recipient).getShareLength{ gas: READ_ONLY_GAS_LIMIT }();
  }

  function getTokenCreator(address nftContract, uint256 tokenId) external view returns (address creatorAddress) {
    try market.internalGetTokenCreator{ gas: READ_ONLY_GAS_LIMIT }(nftContract, tokenId) returns (
      address payable _creator
    ) {
      return _creator;
    } catch {
      // Try old method for backwards compatibility.
      // TODO: Deprecate after NFTMarket v2.4.0 upgrade.
      try INFTMarket230(address(market)).getTokenCreator{ gas: READ_ONLY_GAS_LIMIT }(nftContract, tokenId) returns (
        address payable _creator
      ) {
        return _creator;
      } catch // solhint-disable-next-line no-empty-blocks
      {
        // Fall through
      }
    }

    // 7th priority: owner from contract or override
    try IOwnable(nftContract).owner{ gas: READ_ONLY_GAS_LIMIT }() returns (address _owner) {
      if (_owner != address(0)) {
        return _owner;
      }
    } catch // solhint-disable-next-line no-empty-blocks
    {
      // Fall through
    }
  }

  /**
   * @notice Checks an NFT to confirm it will function correctly with our marketplace.
   * @dev This should be called with as `call` to simulate the tx; never `sendTransaction`.
   * @return 0 if the NFT is supported, otherwise a hash of the error reason.
   */
  function probeNFT(address nftContract, uint256 tokenId) external payable returns (bytes32) {
    if (!nftContract.supportsInterface(type(IERC721).interfaceId)) {
      return keccak256("Not an ERC721");
    }
    RevSplit[] memory creatorRevSplit;
    try this.getFees(nftContract, tokenId, BASIS_POINTS) returns (
      FeeWithRecipient memory,
      Fee memory,
      FeeWithRecipient memory,
      RevSplit[] memory _creatorRevSplit
    ) {
      creatorRevSplit = _creatorRevSplit;
    } catch {
      return keccak256("Failed to getFees");
    }
    if (creatorRevSplit.length == 0) {
      return keccak256("No royalty recipients");
    }
    for (uint256 i = 0; i < creatorRevSplit.length; ++i) {
      address recipient = creatorRevSplit[i].recipient;
      if (recipient == address(0)) {
        return keccak256("address(0) recipient");
      }
      // Sending > 1 to help confirm when the recipient is a contract forwarding to other addresses
      // Silk Road by Ezra Miller requires > 100 wei to when testing payments
      // solhint-disable-next-line avoid-low-level-calls
      (bool success, ) = recipient.call{ value: 1_000, gas: SEND_VALUE_GAS_LIMIT_MULTIPLE_RECIPIENTS }("");
      if (!success) {
        return keccak256("Recipient not receivable");
      }
    }

    return 0x0;
  }

  /// Deprecated, please use `getAccountInfoV2`
  function getAccountInfo(address account)
    external
    view
    returns (uint256 ethBalance, uint256 availableFethBalance, uint256 lockedFethBalance, string memory)
  {
    (ethBalance, availableFethBalance, lockedFethBalance) = getAccountInfoV2(account);
  }

  function getAccountInfoV2(address account)
    public
    view
    returns (uint256 ethBalance, uint256 availableFethBalance, uint256 lockedFethBalance)
  {
    ethBalance = account.balance;
    availableFethBalance = feth.balanceOf(account);
    lockedFethBalance = feth.totalBalanceOf(account) - availableFethBalance;
  }

  /**
   * @notice Retrieves details about the current state of an NFT in the FND Market.
   * @param nftContract The address of the NFT contract.
   * @param tokenId The id of the NFT.
   * @return owner The account which currently holds the NFT or has listed it for sale.
   * @return isInEscrow True if the NFT is currently held in escrow by the Market (for an auction or buy price).
   * @return auctionBidder The current highest bidder for the auction, or address(0) if there's not an active auction.
   * @return auctionEndTime The time at which this auction will not accept any new bids,
   *                        this is `0` until the first bid is placed.
   * @return auctionPrice The latest price of the NFT in this auction.
   *                      This is set to the reserve price, and then to the highest bid once the auction has started.
   *                      Returns `0` if there's no auction for this NFT.
   * @return auctionId The id of the auction, or 0 if no auction is found.
   * @return buyPrice The price at which you could buy this NFT.
   *                  Returns max uint256 if there is no buy price set for this NFT (since a price of 0 is supported).
   * @return offerAmount The amount being offered for this NFT.
   *                     Returns `0` if there is no offer or the most recent offer has expired.
   * @return offerBuyer The address of the buyer that made the current highest offer.
   *                    Returns `address(0)` if there is no offer or the most recent offer has expired.
   * @return offerExpiration The timestamp that the current highest offer expires.
   *                         Returns `0` if there is no offer or the most recent offer has expired.
   */
  function getNFTDetails(address nftContract, uint256 tokenId)
    public
    view
    returns (
      address owner,
      bool isInEscrow,
      address auctionBidder,
      uint256 auctionEndTime,
      uint256 auctionPrice,
      uint256 auctionId,
      uint256 buyPrice,
      uint256 offerAmount,
      address offerBuyer,
      uint256 offerExpiration
    )
  {
    (owner, buyPrice) = market.getBuyPrice(nftContract, tokenId);
    (offerBuyer, offerExpiration, offerAmount) = market.getOffer(nftContract, tokenId);
    auctionId = market.getReserveAuctionIdFor(nftContract, tokenId);
    if (auctionId != 0) {
      NFTMarketReserveAuction.ReserveAuction memory auction = market.getReserveAuction(auctionId);
      auctionEndTime = auction.endTime;
      auctionPrice = auction.amount;
      auctionBidder = auction.bidder;
      owner = auction.seller;
    }

    if (owner == address(0)) {
      owner = payable(IERC721(nftContract).ownerOf(tokenId));
      isInEscrow = false;
    } else {
      isInEscrow = true;
    }
  }

  /**
   * @notice Retrieves details about the current state of an NFT in the FND Market as a string.
   * @dev This API is for investigations & convenience, it is not meant to be consumed by an app directly.
   *      Future upgrades may not be backwards compatible.
   */
  // solhint-disable-next-line code-complexity
  function getNFTDetailString(address nftContract, uint256 tokenId) external view returns (string memory details) {
    (
      address owner,
      bool isInEscrow,
      address auctionBidder,
      uint256 auctionEndTime,
      uint256 auctionPrice,
      uint256 auctionId,
      uint256 buyPrice,
      uint256 offerAmount,
      address offerBuyer,
      uint256 offerExpiration
    ) = getNFTDetails(nftContract, tokenId);
    details = owner.toHexString();
    if (isInEscrow) {
      if (auctionEndTime > 0) {
        if (!auctionEndTime.hasExpired()) {
          // Active auction
          details = string.concat(
            details,
            " has it in active auction going for ",
            _getETHString(auctionPrice),
            ", bid from ",
            auctionBidder.toHexString(),
            " and ends in ",
            _getDeltaTimeString(auctionEndTime - block.timestamp),
            " [auctionId: ",
            auctionId.toString(),
            "]"
          );
        } else {
          // Auction ended, pending finalization
          details = string.concat(
            details,
            " sold it in auction for ",
            _getETHString(auctionPrice),
            " to ",
            auctionBidder.toHexString(),
            " ",
            _getDeltaTimeString(block.timestamp - auctionEndTime),
            " ago [pending settlement / auctionId: ",
            auctionId.toString(),
            "]"
          );
        }
      } else {
        // Buy now and/or reserve price
        details = string.concat(details, " listed for ");
        if (buyPrice < type(uint256).max) {
          details = string.concat(details, "buy now at ", _getETHString(buyPrice));
        }
        if (buyPrice < type(uint256).max && auctionPrice > 0) {
          details = string.concat(details, " or ");
        }
        if (auctionPrice > 0) {
          details = string.concat(
            details,
            "reserve price of ",
            _getETHString(auctionPrice),
            " [auctionId: ",
            auctionId.toString(),
            "]"
          );
        }
      }

      if (offerAmount > 0) {
        // With an offer too
        details = string.concat(
          details,
          " with an offer of ",
          _getOfferString(offerAmount, offerBuyer, offerExpiration)
        );
      }
    } else if (offerAmount > 0) {
      // Just an offer
      details = string.concat(details, " has an offer for ", _getOfferString(offerAmount, offerBuyer, offerExpiration));
    } else {
      // Nothing
      details = string.concat(details, " has not listed nor gotten an offer");
    }
  }

  function _calcRevSplit(uint256 price, uint256 share, uint256 creatorRevBP, address payable recipient)
    private
    pure
    returns (RevSplit memory)
  {
    uint256 absoluteShare = (share * creatorRevBP) / BASIS_POINTS;
    uint256 amount = (absoluteShare * price) / BASIS_POINTS;
    return RevSplit(share, absoluteShare, amount, recipient);
  }

  // solhint-disable-next-line code-complexity
  function _getDeltaTimeString(uint256 timeRemaining) private pure returns (string memory delta) {
    uint256 secondsRemaining = timeRemaining;
    // Days
    if (timeRemaining >= 1 days) {
      uint256 day = secondsRemaining / (1 days);
      if (day == 1) {
        delta = "1 day";
      } else {
        delta = string.concat(day.toString(), " days");
      }
      secondsRemaining -= day * 1 days;
      if (secondsRemaining == 0) {
        return delta;
      } else {
        delta = string.concat(delta, " ");
      }
    }
    // Hours
    if (timeRemaining >= 1 hours) {
      uint256 hrs = secondsRemaining / (1 hours);
      if (hrs == 1) {
        delta = string.concat(delta, "1 hour");
      } else {
        delta = string.concat(delta, hrs.toString(), " hours");
      }
      secondsRemaining -= hrs * 1 hours;
      if (secondsRemaining == 0) {
        return delta;
      } else {
        delta = string.concat(delta, " ");
      }
    }
    // Minutes
    if (timeRemaining >= 1 minutes) {
      uint256 mins = secondsRemaining / (1 minutes);
      if (mins == 1) {
        delta = string.concat(delta, "1 min");
      } else {
        delta = string.concat(delta, mins.toString(), " mins");
      }
      secondsRemaining -= mins * 1 minutes;
      if (secondsRemaining == 0) {
        return delta;
      } else {
        delta = string.concat(delta, " ");
      }
    }
    // Seconds
    if (secondsRemaining == 1) {
      delta = string.concat(delta, "1 sec");
    } else {
      delta = string.concat(delta, secondsRemaining.toString(), " secs");
    }
  }

  // solhint-disable-next-line code-complexity
  function _getETHString(uint256 amount) private pure returns (string memory eth) {
    string memory amountString = amount.toString();
    uint256 printedCount = 0;
    if (bytes(amountString).length > 18) {
      for (uint256 i = 0; i < bytes(amountString).length - 18; ++i) {
        bytes memory byteArray = new bytes(1);
        byteArray[0] = bytes(amountString)[i];
        eth = string.concat(eth, string(byteArray));
        printedCount++;
      }
    } else {
      eth = "0";
    }
    uint256 endingZeros = 0;
    for (uint256 i = bytes(amountString).length - 1; i > 0; --i) {
      if (bytes(amountString)[i] == bytes("0")[0]) {
        ++endingZeros;
      } else {
        break;
      }
    }
    if (endingZeros < 18) {
      eth = string.concat(eth, ".");

      if (bytes(amountString).length < 18) {
        // add leading zeros
        for (uint256 i = 0; i < 18 - bytes(amountString).length; ++i) {
          eth = string.concat(eth, "0");
        }
      }
      for (; printedCount < bytes(amountString).length - endingZeros; ++printedCount) {
        bytes memory byteArray = new bytes(1);
        byteArray[0] = bytes(amountString)[printedCount];
        eth = string.concat(eth, string(byteArray));
      }
    }

    eth = string.concat(eth, " ETH");
  }

  function _getOfferString(uint256 amount, address buyer, uint256 expiration)
    private
    view
    returns (string memory offer)
  {
    offer = string.concat(
      _getETHString(amount),
      " from ",
      buyer.toHexString(),
      " that expires in ",
      _getDeltaTimeString(expiration - block.timestamp)
    );
  }

  function _substring(string memory str, uint256 startIndex, uint256 endIndex)
    private
    pure
    returns (bytes memory result)
  {
    bytes memory strBytes = bytes(str);
    result = new bytes(endIndex - startIndex);
    for (uint256 i = startIndex; i < endIndex; ++i) {
      result[i - startIndex] = strBytes[i];
    }
  }
}