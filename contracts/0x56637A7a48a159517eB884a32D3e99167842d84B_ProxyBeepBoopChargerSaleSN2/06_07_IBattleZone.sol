// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

interface IBattleZone {
    event Deposit(
        address indexed staker,
        address contractAddress,
        uint256 tokensAmount
    );
    event Withdraw(
        address indexed staker,
        address contractAddress,
        uint256 tokensAmount
    );
    event AutoDeposit(
        address indexed contractAddress,
        uint256 tokenId,
        address indexed owner
    );
    event WithdrawStuckERC721(
        address indexed receiver,
        address indexed tokenAddress,
        uint256 indexed tokenId
    );

    function deposit(
        address contractAddress,
        uint256[] memory tokenIds,
        uint256[] memory tokenRarities,
        bytes calldata signature
    ) external;

    function withdraw(
        address contractAddress,
        uint256[] memory tokenIds,
        bytes calldata signature
    ) external;

    function getAccumulatedAmount(
        address staker
    ) external view returns (uint256);

    function getStakerTokens(
        address staker
    )
        external
        view
        returns (
            uint256[] memory,
            uint256[] memory,
            uint256[] memory,
            uint256[] memory,
            uint256[] memory
        );

    function getStakerYield(address staker) external view returns (uint256);

    function depositFor(
        address contractAddress,
        address address_,
        uint256[] memory tokenIds
    ) external;

    function acceleratedUserYield(
        address address_
    ) external view returns (uint256);

    function setAcceleratedYield(address user, uint256 days_) external;

    function ownerOf(
        address contractAddress,
        uint256 tokenId
    ) external view returns (address);

    function powerCoreYield(uint256 botId) external view returns (uint256);
}