// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

import "./StakingRewards.sol";

///@title StakingRewardsFactory
///@notice Contract which creates double rewarded pools to stake
contract StakingRewardsFactory is Ownable {

    // inmutables
    

    address public rewardsToken1; //  Token address (XCB contract)
    address public rewardsToken2;
    uint public poolGenesis; //  timestamp to begin with rewards

    address[] public stakingTokens; // address array for each staked token address which the contract has been deployed for

    struct StakingRewardsInfo {
        address pool; 
        address stakingToken;
        address rewardType1;
        address rewardType2;
        uint rewardAmount1;
        uint rewardAmount2;
        uint duration;
        uint depositFee;
        uint poolMaxCap;
        uint userMaxCap;
        address feeRecipient;
    }


     //maps every pool address with info about the pool/staked token
    mapping(address => StakingRewardsInfo) public poolInfoByStakingToken;

    constructor(
        address _rewardsToken1, //Token address (XCB contract)
        address _rewardsToken2,
        uint _poolGenesis
    ) Ownable() {
        require(_poolGenesis >= block.timestamp, "StakingRewardsFactory::constructor: genesis too soon");

        rewardsToken1 = _rewardsToken1;
        rewardsToken2 = _rewardsToken2;
        poolGenesis = _poolGenesis;
    }

    ///// permissioned functions

    function deploy(address stakingToken, uint rewardAmount1, uint rewardAmount2,
        uint256 rewardsDuration, uint depositFee, uint poolMaxCap, uint userMaxCap, address feeRecipient) public onlyOwner {

        StakingRewardsInfo storage info = poolInfoByStakingToken[stakingToken];
        require(info.pool == address(0), "StakingRewardsFactory::deploy: already deployed");

        info.pool = address(new StakingRewards(/*_rewardsDistribution=*/ address(this), depositFee, poolMaxCap, userMaxCap, feeRecipient, rewardsToken1, rewardsToken2, stakingToken));
        info.rewardAmount1 = rewardAmount1;
        info.rewardAmount2 = rewardAmount2;
        info.stakingToken = stakingToken;
        info.rewardType1 = rewardsToken1;
        info.rewardType2 = rewardsToken2;
        info.duration = rewardsDuration;
        info.depositFee = depositFee;
        info.poolMaxCap = poolMaxCap;
        info.userMaxCap = userMaxCap;
        info.feeRecipient = feeRecipient;
        stakingTokens.push(info.stakingToken);
    }

    function update(address stakingToken, uint rewardAmount1, uint rewardAmount2, uint256 rewardsDuration) public onlyOwner {
        StakingRewardsInfo storage info = poolInfoByStakingToken[stakingToken];
        require(info.pool != address(0), "StakingRewardsFactory::update: not deployed");

        info.rewardAmount1 = rewardAmount1;
        info.rewardAmount2 = rewardAmount2;
        info.duration = rewardsDuration;
    }

    function updateFee(address stakingToken, uint256 depositFee) public onlyOwner {
        StakingRewardsInfo storage info = poolInfoByStakingToken[stakingToken];
        require(info.pool != address(0), "StakingRewardsFactory::update: not deployed");
        StakingRewards(info.pool).updateFee(depositFee);

        info.depositFee = depositFee;
    }

    function updatePoolMaxCap(address stakingToken, uint256 poolMaxCap) public onlyOwner {
        StakingRewardsInfo storage info = poolInfoByStakingToken[stakingToken];
        require(info.pool != address(0), "StakingRewardsFactory::update: not deployed");
        StakingRewards(info.pool).updatePoolMaxCap(poolMaxCap);

        info.poolMaxCap = poolMaxCap;
    }

    function updateUserMaxCap(address stakingToken, uint256 userMaxCap) public onlyOwner {
        StakingRewardsInfo storage info = poolInfoByStakingToken[stakingToken];
        require(info.pool != address(0), "StakingRewardsFactory::update: not deployed");
        StakingRewards(info.pool).updateUserMaxCap(userMaxCap);

        info.userMaxCap = userMaxCap;
    }

    function updateRecipient(address stakingToken, address feeRecipient) public onlyOwner {
        StakingRewardsInfo storage info = poolInfoByStakingToken[stakingToken];
        require(info.pool != address(0), "StakingRewardsFactory::update: not deployed");
        StakingRewards(info.pool).updateRecipient(feeRecipient);

        info.feeRecipient = feeRecipient;
    }

    ///// permissionless functions

    function notifyRewardAmounts() public {
        require(stakingTokens.length > 0, "StakingRewardsFactory::notifyRewardAmounts: called before any deploys");
        for (uint i = 0; i < stakingTokens.length; i++) {
            notifyRewardAmount(stakingTokens[i]);
        }
    }

    // notify reward amount for an individual staking token.
    // 

    function notifyRewardAmount(address stakingToken) public {
        require(block.timestamp >= poolGenesis, "StakingRewardsFactory::notifyRewardAmount: not ready");

        StakingRewardsInfo storage info = poolInfoByStakingToken[stakingToken];
        require(info.pool != address(0), "StakingRewardsFactory::notifyRewardAmount: not deployed");

        if (info.rewardAmount1 > 0 && info.rewardAmount2 > 0 && info.duration > 0) {
            uint rewardAmount1 = info.rewardAmount1;
            uint rewardAmount2 = info.rewardAmount2;
            uint256 duration = info.duration;
            info.rewardAmount1 = 0;
            info.rewardAmount2 = 0;
            info.duration = 0;

            require(
                IERC20(info.rewardType1).transfer(info.pool, rewardAmount1),
                "StakingRewardsFactory::notifyRewardAmount: transfer failed"
            );

            require(
                IERC20(info.rewardType2).transfer(info.pool, rewardAmount2),
                "StakingRewardsFactory::notifyRewardAmount: transfer failed"
            );
            StakingRewards(info.pool).notifyRewardAmount(rewardAmount1, rewardAmount2, duration);

        }
    }

    function pullExtraTokens(address token, uint256 amount) external onlyOwner {
        require(token != rewardsToken1 && token != rewardsToken2, "StakingRewardsFactory: can not pull rewards tokens");
        
        IERC20(token).transfer(msg.sender, amount);
    }
}