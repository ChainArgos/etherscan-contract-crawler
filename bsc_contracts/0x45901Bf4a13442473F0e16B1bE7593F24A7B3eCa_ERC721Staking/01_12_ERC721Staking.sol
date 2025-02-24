// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

/**
 * @title ERC721 Staking Smart Contract
 *
 * @author andreitoma8
 *
 * @notice This contract uses a simple principle to alow users to stake ERC721 Tokens and earn ERC20 Reward Tokens distributed by the owner of the contract.
 * Each time a user stakes or withdraws a new Token Id, the contract will store the time of the transaction and the amount of ERC20 Reward Tokens that the user has earned up to that point
 * (based on the amount of time that has passed since the last transaction, the amount of Tokens staked and the amount of ERC20 Reward Tokens distributed per hour so that the amount of ERC20
 * Reward Tokens earned by the user is always distributed accounting for how many ERC721 Tokens he has staked at that particular moment.
 * The user can claim the ERC20 Reward Tokens at any time by calling the claimRewards function.
 *
 * @dev The contract is built to be compatible with most ERC721 and ERC20 tokens.
 */
contract ERC721Staking is Ownable, ReentrancyGuard, Pausable {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    /**
     * @dev The ERC20 Reward Token that will be distributed to stakers.
     */
    IERC20 public immutable rewardsToken;

    /**
     * @dev The ERC721 Collection that will be staked.
     */
    IERC721 public immutable nftCollection;

    uint256 constant SECONDS_IN_HOUR = 3600;

    /**
     * @dev Struct that holds the staking details for each user.
     */
    struct Staker {
        /**
         * @dev The array of Token Ids staked by the user.
         */
        uint256[] stakedTokenIds;
        /**
         * @dev The time of the last update of the rewards.
         */
        uint256 timeOfLastUpdate;
        /**
         * @dev The amount of ERC20 Reward Tokens that have not been claimed by the user.
         */
        uint256 unclaimedRewards;
    }

    /**
     * @dev The amount of ERC20 Reward Tokens accrued per hour.
     */
    uint256 public rewardsPerHour = 1000000000000000000; // 1 ZCR

    /**
     * @dev Mapping of stakers to their staking info.
     */
    mapping(address => Staker) public stakers;

    /**
     * @dev Mapping of Token Id to staker address.
     */
    mapping(uint256 => address) public stakerAddress;

    /**
     * @dev Array of stakers addresses.
     */
    address[] public stakersArray;

    /**
     * @dev Mapping of stakers addresses to their index in the stakersArray.
     */
    mapping(address => uint256) public stakerToArrayIndex;

    /**
     * @notice Mapping of Token Id to it's index in the staker's stakedTokenIds array.
     */
    mapping(uint256 => uint256) public tokenIdToArrayIndex;

    /**
     * @notice Constructor function that initializes the ERC20 and ERC721 interfaces.
     * @param _nftCollection - The address of the ERC721 Collection. -> 0xCc10aDE57c9C9DB73f2365EA2d8B6418Ed5673A0
     * @param _rewardsToken - The address of the ERC20 Reward Token. -> 0x2E40565771cf2BF8622C41CDd85701519F22418A
     */
    constructor(IERC721 _nftCollection, IERC20 _rewardsToken) {
        nftCollection = _nftCollection;
        rewardsToken = _rewardsToken;
    }

    /**
     * @notice Function used to stake ERC721 Tokens.
     * @param _tokenIds - The array of Token Ids to stake.
     * @dev Each Token Id must be approved for transfer by the user before calling this function.
     */
    function stake(uint256[] calldata _tokenIds) external whenNotPaused {
        Staker storage staker = stakers[msg.sender];

        if (staker.stakedTokenIds.length > 0) {
            updateRewards(msg.sender);
        } else {
            stakersArray.push(msg.sender);
            stakerToArrayIndex[msg.sender] = stakersArray.length - 1;
            staker.timeOfLastUpdate = block.timestamp;
        }

        uint256 len = _tokenIds.length;
        for (uint256 i; i < len; ++i) {
            require(nftCollection.ownerOf(_tokenIds[i]) == msg.sender, "Can't stake tokens you don't own!");

            nftCollection.transferFrom(msg.sender, address(this), _tokenIds[i]);

            staker.stakedTokenIds.push(_tokenIds[i]);
            tokenIdToArrayIndex[_tokenIds[i]] = staker.stakedTokenIds.length - 1;
            stakerAddress[_tokenIds[i]] = msg.sender;
        }
    }

    /**
     * @notice Function used to withdraw ERC721 Tokens.
     * @param _tokenIds - The array of Token Ids to withdraw.
     */
    function withdraw(uint256[] calldata _tokenIds) external nonReentrant {
        Staker storage staker = stakers[msg.sender];
        require(staker.stakedTokenIds.length > 0, "You have no tokens staked");
        updateRewards(msg.sender);

        uint256 lenToWithdraw = _tokenIds.length;
        for (uint256 i; i < lenToWithdraw; ++i) {
            require(stakerAddress[_tokenIds[i]] == msg.sender);

            uint256 index = tokenIdToArrayIndex[_tokenIds[i]];
            uint256 lastTokenIndex = staker.stakedTokenIds.length - 1;
            if (index != lastTokenIndex) {
                staker.stakedTokenIds[index] = staker.stakedTokenIds[lastTokenIndex];
                tokenIdToArrayIndex[staker.stakedTokenIds[index]] = index;
            }
            staker.stakedTokenIds.pop();

            delete stakerAddress[_tokenIds[i]];

            nftCollection.transferFrom(address(this), msg.sender, _tokenIds[i]);
        }

        if (staker.stakedTokenIds.length == 0) {
            uint256 index = stakerToArrayIndex[msg.sender];
            uint256 lastStakerIndex = stakersArray.length - 1;
            if (index != lastStakerIndex) {
                stakersArray[index] = stakersArray[lastStakerIndex];
                stakerToArrayIndex[stakersArray[index]] = index;
            }
            stakersArray.pop();
        }
    }

    /**
     * @notice Function used to claim the accrued ERC20 Reward Tokens.
     */
    function claimRewards() external {
        Staker storage staker = stakers[msg.sender];

        uint256 rewards = calculateRewards(msg.sender) + staker.unclaimedRewards;
        require(rewards > 0, "You have no rewards to claim");

        staker.timeOfLastUpdate = block.timestamp;
        staker.unclaimedRewards = 0;

        rewardsToken.safeTransfer(msg.sender, rewards);
    }

    /**
     * @notice Function used to set the amount of ERC20 Reward Tokens accrued per hour.
     * @param _newValue - The new value of the rewardsPerHour variable.
     * @dev Because the rewards are calculated passively, the owner has to first update the rewards
     * to all the stakers, witch could result in very heavy load and expensive transactions or
     * even reverting due to reaching the gas limit per block.
     */
    function setRewardsPerHour(uint256 _newValue) public onlyOwner {
        address[] memory _stakers = stakersArray;

        uint256 len = _stakers.length;
        for (uint256 i; i < len; ++i) {
            updateRewards(_stakers[i]);
        }

        rewardsPerHour = _newValue;
    }

    /**
     * @notice Function used to get the info for a user: the Token Ids staked and the available rewards.
     * @param _user - The address of the user.
     * @return _stakedTokenIds - The array of Token Ids staked by the user.
     * @return _availableRewards - The available rewards for the user.
     */
    function userStakeInfo(address _user)
        public
        view
        returns (uint256[] memory _stakedTokenIds, uint256 _availableRewards)
    {
        return (stakers[_user].stakedTokenIds, availableRewards(_user));
    }

    /**
     * @notice Function used to get the available rewards for a user.
     * @param _user - The address of the user.
     * @return _rewards - The available rewards for the user.
     * @dev This includes both the rewards stored but not claimed and the rewards accumulated since the last update.
     */
    function availableRewards(address _user) internal view returns (uint256 _rewards) {
        Staker memory staker = stakers[_user];

        if (staker.stakedTokenIds.length == 0) {
            return staker.unclaimedRewards;
        }

        _rewards = staker.unclaimedRewards + calculateRewards(_user);
    }

    /**
     * @notice Function used to calculate the rewards for a user.
     * @return _rewards - The rewards for the user.
     */
    function calculateRewards(address _staker) internal view returns (uint256 _rewards) {
        Staker memory staker = stakers[_staker];
        /*
        uint256 _totalnft = nftCollection.balanceOf(address(this));
        uint256 _myporc = 1 / (_totalnft / staker.stakedTokenIds.length);

        return (
            ((((block.timestamp - staker.timeOfLastUpdate) * _myporc)) * rewardsPerHour)
                / SECONDS_IN_HOUR
        );
        */

        uint256 _totalnft = nftCollection.balanceOf(address(this));
        uint256 _newrewardsPerHour = rewardsPerHour.div(_totalnft);

        //return (((((block.timestamp - staker.timeOfLastUpdate) * staker.stakedTokenIds.length)) * rewardsPerHour) / SECONDS_IN_HOUR);
        return (((((block.timestamp - staker.timeOfLastUpdate) * staker.stakedTokenIds.length)) * _newrewardsPerHour) / SECONDS_IN_HOUR);
    }

    /**
     * @notice Function used to update the rewards for a user.
     * @param _staker - The address of the user.
     */
    function updateRewards(address _staker) internal {
        Staker storage staker = stakers[_staker];

        staker.unclaimedRewards += calculateRewards(_staker);
        staker.timeOfLastUpdate = block.timestamp;
    }
    /**
     * @dev staking.
     */
    function withdrawRest() external onlyOwner {
      uint256 zcrBal = rewardsToken.balanceOf(address(this));
      require(rewardsToken.transfer(msg.sender, zcrBal), "The transfer failed");
    }    

    /**
     * @dev Pause staking.
     */
    function pause() external onlyOwner {
        _pause();
    }

    /**
     * @dev Resume staking.
     */
    function unpause() external onlyOwner {
        _unpause();
    }
}