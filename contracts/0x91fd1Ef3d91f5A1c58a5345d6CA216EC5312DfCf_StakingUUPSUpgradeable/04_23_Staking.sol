// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.14;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "./interfaces/IYieldFarmingV1Staking.sol";

contract Staking is IYieldFarmingV1Staking, Initializable, ReentrancyGuardUpgradeable {
    using SafeERC20Upgradeable for IERC20Upgradeable;

    uint128 constant private BASE_MULTIPLIER = uint128(1 * 10 ** 18);

    // important: never change the order, type or remove variables
    // it's safe only to add new variables at the end to avoid any storage bugs

    // timestamp for the epoch 1
    // everything before that is considered epoch 0 which won't have a reward but allows for the initial stake
    uint256 public epoch1Start;

    // duration of each epoch
    uint256 public epochDuration;

    // holds the current balance of the user for each token
    mapping(address => mapping(address => uint256)) private balances;

    // for each token, we store the total pool size
    mapping(address => mapping(uint256 => Pool)) private poolSize;

    // balanceCheckpoints[user][token][]
    mapping(address => mapping(address => Checkpoint[])) private balanceCheckpoints;

    mapping(address => uint128) private lastWithdrawEpochId;

    event Deposit(address indexed user, address indexed tokenAddress, uint256 amount);
    event Withdraw(address indexed user, address indexed tokenAddress, uint256 amount);
    event ManualEpochInit(address indexed caller, uint128 indexed epochId, address[] tokens);
    event ManualEpochInitToken(address indexed caller, uint128 indexed epochId, address tokenAddress);
    event InitAllEpochs(address indexed caller, address[] tokens);
    event InitAllEpochsToken(address indexed caller, address tokenAddress);
    event EmergencyWithdraw(address indexed user, address indexed tokenAddress, uint256 amount);

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(StakingConfig memory cfg) public initializer {
        __Staking_init(cfg);
    }

    function __Staking_init(StakingConfig memory cfg) internal onlyInitializing {
        __ReentrancyGuard_init();
        __Staking_init_unchained(cfg);
    }

    function __Staking_init_unchained(StakingConfig memory cfg) internal onlyInitializing {
        epoch1Start = cfg.epoch1Start;
        epochDuration = cfg.epochDuration;
    }

    /*
     * Stores `amount` of `tokenAddress` tokens for the `user` into the vault
     */
    function deposit(address tokenAddress, uint256 amount) public nonReentrant {
        require(amount > 0, "Staking: Amount must be > 0");

        IERC20Upgradeable token = IERC20Upgradeable(tokenAddress);
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= amount, "Staking: Token allowance too small");

        balances[msg.sender][tokenAddress] = balances[msg.sender][tokenAddress] + amount;

        token.safeTransferFrom(msg.sender, address(this), amount);

        // epoch logic
        uint128 currentEpoch = getCurrentEpoch();
        uint128 currentMultiplier = currentEpochMultiplier();

        if (!epochIsInitialized(tokenAddress, currentEpoch)) {
            initAllEpochsToken(tokenAddress);
        }

        // update the next epoch pool size
        Pool storage pNextEpoch = poolSize[tokenAddress][currentEpoch + 1];
        pNextEpoch.size = token.balanceOf(address(this));
        pNextEpoch.set = true;

        Checkpoint[] storage checkpoints = balanceCheckpoints[msg.sender][tokenAddress];

        uint256 balanceBefore = getEpochUserBalance(msg.sender, tokenAddress, currentEpoch);

        // if there's no checkpoint yet, it means the user didn't have any activity
        // we want to store checkpoints both for the current epoch and next epoch because
        // if a user does a withdraw, the current epoch can also be modified and
        // we don't want to insert another checkpoint in the middle of the array as that could be expensive
        if (checkpoints.length == 0) {
            checkpoints.push(Checkpoint(currentEpoch, currentMultiplier, 0, amount));

            // next epoch => multiplier is 1, epoch deposits is 0
            checkpoints.push(Checkpoint(currentEpoch + 1, BASE_MULTIPLIER, amount, 0));
        } else {
            uint256 last = checkpoints.length - 1;

            // the last action happened in an older epoch (e.g. a deposit in epoch 3, current epoch is >=5)
            if (checkpoints[last].epochId < currentEpoch) {
                uint128 multiplier = computeNewMultiplier(
                    getCheckpointBalance(checkpoints[last]),
                    BASE_MULTIPLIER,
                    amount,
                    currentMultiplier
                );
                checkpoints.push(Checkpoint(currentEpoch, multiplier, getCheckpointBalance(checkpoints[last]), amount));
                checkpoints.push(Checkpoint(currentEpoch + 1, BASE_MULTIPLIER, balances[msg.sender][tokenAddress], 0));
            }
            // the last action happened in the previous epoch
            else if (checkpoints[last].epochId == currentEpoch) {
                checkpoints[last].multiplier = computeNewMultiplier(
                    getCheckpointBalance(checkpoints[last]),
                    checkpoints[last].multiplier,
                    amount,
                    currentMultiplier
                );
                checkpoints[last].newDeposits = checkpoints[last].newDeposits + amount;

                checkpoints.push(Checkpoint(currentEpoch + 1, BASE_MULTIPLIER, balances[msg.sender][tokenAddress], 0));
            }
            // the last action happened in the current epoch
            else {
                if (last >= 1 && checkpoints[last - 1].epochId == currentEpoch) {
                    checkpoints[last - 1].multiplier = computeNewMultiplier(
                        getCheckpointBalance(checkpoints[last - 1]),
                        checkpoints[last - 1].multiplier,
                        amount,
                        currentMultiplier
                    );
                    checkpoints[last - 1].newDeposits = checkpoints[last - 1].newDeposits + amount;
                }

                checkpoints[last].startBalance = balances[msg.sender][tokenAddress];
            }
        }

        uint256 balanceAfter = getEpochUserBalance(msg.sender, tokenAddress, currentEpoch);

        poolSize[tokenAddress][currentEpoch].size = poolSize[tokenAddress][currentEpoch].size + (balanceAfter - balanceBefore);

        emit Deposit(msg.sender, tokenAddress, amount);
    }

    /*
     * Removes the deposit of the user and sends the amount of `tokenAddress` back to the `user`
     */
    function withdraw(address tokenAddress, uint256 amount) public nonReentrant {
        require(balances[msg.sender][tokenAddress] >= amount, "Staking: balance too small");

        balances[msg.sender][tokenAddress] = balances[msg.sender][tokenAddress] - amount;

        IERC20Upgradeable token = IERC20Upgradeable(tokenAddress);
        token.safeTransfer(msg.sender, amount);

        // epoch logic
        uint128 currentEpoch = getCurrentEpoch();

        lastWithdrawEpochId[tokenAddress] = currentEpoch;

        if (!epochIsInitialized(tokenAddress, currentEpoch)) {
            initAllEpochsToken(tokenAddress);
        }

        // update the pool size of the next epoch to its current balance
        Pool storage pNextEpoch = poolSize[tokenAddress][currentEpoch + 1];
        pNextEpoch.size = token.balanceOf(address(this));
        pNextEpoch.set = true;

        Checkpoint[] storage checkpoints = balanceCheckpoints[msg.sender][tokenAddress];
        uint256 last = checkpoints.length - 1;

        // note: it's impossible to have a withdraw and no checkpoints because the balance would be 0 and revert

        // there was a deposit in an older epoch (more than 1 behind [eg: previous 0, now 5]) but no other action since then
        if (checkpoints[last].epochId < currentEpoch) {
            checkpoints.push(Checkpoint(currentEpoch, BASE_MULTIPLIER, balances[msg.sender][tokenAddress], 0));

            poolSize[tokenAddress][currentEpoch].size = poolSize[tokenAddress][currentEpoch].size - amount;
        }
        // there was a deposit in the `epochId - 1` epoch => we have a checkpoint for the current epoch
        else if (checkpoints[last].epochId == currentEpoch) {
            checkpoints[last].startBalance = balances[msg.sender][tokenAddress];
            checkpoints[last].newDeposits = 0;
            checkpoints[last].multiplier = BASE_MULTIPLIER;

            poolSize[tokenAddress][currentEpoch].size = poolSize[tokenAddress][currentEpoch].size - amount;
        }
        // there was a deposit in the current epoch
        else {
            Checkpoint storage currentEpochCheckpoint = checkpoints[last - 1];

            uint256 balanceBefore = getCheckpointEffectiveBalance(currentEpochCheckpoint);

            // in case of withdraw, we have 2 branches:
            // 1. the user withdraws less than he added in the current epoch
            // 2. the user withdraws more than he added in the current epoch (including 0)
            if (amount < currentEpochCheckpoint.newDeposits) {
                uint128 avgDepositMultiplier = uint128(
                    (balanceBefore - currentEpochCheckpoint.startBalance) * BASE_MULTIPLIER / currentEpochCheckpoint.newDeposits
                );

                currentEpochCheckpoint.newDeposits = currentEpochCheckpoint.newDeposits - amount;

                currentEpochCheckpoint.multiplier = computeNewMultiplier(
                    currentEpochCheckpoint.startBalance,
                    BASE_MULTIPLIER,
                    currentEpochCheckpoint.newDeposits,
                    avgDepositMultiplier
                );
            } else {
                currentEpochCheckpoint.startBalance = currentEpochCheckpoint.startBalance - (amount - currentEpochCheckpoint.newDeposits);
                currentEpochCheckpoint.newDeposits = 0;
                currentEpochCheckpoint.multiplier = BASE_MULTIPLIER;
            }

            uint256 balanceAfter = getCheckpointEffectiveBalance(currentEpochCheckpoint);

            poolSize[tokenAddress][currentEpoch].size = poolSize[tokenAddress][currentEpoch].size - (balanceBefore - balanceAfter);

            checkpoints[last].startBalance = balances[msg.sender][tokenAddress];
        }

        emit Withdraw(msg.sender, tokenAddress, amount);
    }

    /*
     * manualEpochInit can be used by anyone to initialize an epoch based on the previous one
     * This is only applicable if there was no action (deposit/withdraw) in the current epoch.
     * Any deposit and withdraw will automatically initialize the current and next epoch.
     */
    function manualEpochInit(address[] memory tokens, uint128 epochId) public {
        for (uint256 i = 0; i < tokens.length; i++) {
            _initEpochForToken(tokens[i], epochId);
        }

        emit ManualEpochInit(msg.sender, epochId, tokens);
    }

    function manualEpochInitToken(address token, uint128 epochId) public {
        _initEpochForToken(token, epochId);

        emit ManualEpochInitToken(msg.sender, epochId, token);
    }

    function initAllEpochs(address[] memory tokens) public {
        for (uint256 i = 0; i < tokens.length; i++) {
            _initAllEpochsForToken(tokens[i]);
        }

        emit InitAllEpochs(msg.sender, tokens);
    }

    function initAllEpochsToken(address token) public {
        _initAllEpochsForToken(token);

        emit InitAllEpochsToken(msg.sender, token);
    }

    function emergencyWithdraw(address tokenAddress) public {
        require((getCurrentEpoch() - lastWithdrawEpochId[tokenAddress]) >= 10, "At least 10 epochs must pass without success");

        uint256 totalUserBalance = balances[msg.sender][tokenAddress];
        require(totalUserBalance > 0, "Amount must be > 0");

        balances[msg.sender][tokenAddress] = 0;

        IERC20Upgradeable token = IERC20Upgradeable(tokenAddress);
        token.safeTransfer(msg.sender, totalUserBalance);

        emit EmergencyWithdraw(msg.sender, tokenAddress, totalUserBalance);
    }

    /*
     * Returns the valid balance of a user that was taken into consideration in the total pool size for the epoch
     * A deposit will only change the next epoch balance.
     * A withdraw will decrease the current epoch (and subsequent) balance.
     */
    function getEpochUserBalance(address user, address token, uint128 epochId) public view returns (uint256) {
        Checkpoint[] storage checkpoints = balanceCheckpoints[user][token];

        // if there are no checkpoints, it means the user never deposited any tokens, so the balance is 0
        if (checkpoints.length == 0 || epochId < checkpoints[0].epochId) {
            return 0;
        }

        uint256 min = 0;
        uint256 max = checkpoints.length - 1;

        // shortcut for blocks newer than the latest checkpoint == current balance
        if (epochId >= checkpoints[max].epochId) {
            return getCheckpointEffectiveBalance(checkpoints[max]);
        }

        // binary search of the value in the array
        while (max > min) {
            uint256 mid = (max + min + 1) / 2;
            if (checkpoints[mid].epochId <= epochId) {
                min = mid;
            } else {
                max = mid - 1;
            }
        }

        return getCheckpointEffectiveBalance(checkpoints[min]);
    }

    /*
     * Returns the amount of `token` that the `user` has currently staked
     */
    function balanceOf(address user, address token) public view returns (uint256) {
        return balances[user][token];
    }

    /*
     * Returns the id of the current epoch derived from block.timestamp
     */
    function getCurrentEpoch() public view returns (uint128) {
        if (block.timestamp < epoch1Start) {
            return 0;
        }

        return uint128((block.timestamp - epoch1Start) / epochDuration + 1);
    }

    /*
     * Returns the total amount of `tokenAddress` that was locked from beginning to end of epoch identified by `epochId`
     */
    function getEpochPoolSize(address tokenAddress, uint128 epochId) public view returns (uint256) {
        // Premises:
        // 1. it's impossible to have gaps of uninitialized epochs
        // - any deposit or withdraw initialize the current epoch which requires the previous one to be initialized
        if (epochIsInitialized(tokenAddress, epochId)) {
            return poolSize[tokenAddress][epochId].size;
        }

        // epochId not initialized and epoch 0 not initialized => there was never any action on this pool
        if (!epochIsInitialized(tokenAddress, 0)) {
            return 0;
        }

        // epoch 0 is initialized => there was an action at some point but none that initialized the epochId
        // which means the current pool size is equal to the current balance of token held by the staking contract
        IERC20Upgradeable token = IERC20Upgradeable(tokenAddress);
        return token.balanceOf(address(this));
    }

    /*
     * Returns the percentage of time left in the current epoch
     */
    function currentEpochMultiplier() public view returns (uint128) {
        uint128 currentEpoch = getCurrentEpoch();
        uint256 currentEpochEnd = epoch1Start + currentEpoch * epochDuration;
        uint256 timeLeft = currentEpochEnd - block.timestamp;
        uint128 multiplier = uint128(timeLeft * BASE_MULTIPLIER / epochDuration);

        return multiplier;
    }

    function computeNewMultiplier(uint256 prevBalance, uint128 prevMultiplier, uint256 amount, uint128 currentMultiplier) public pure returns (uint128) {
        uint256 prevAmount = prevBalance * prevMultiplier / BASE_MULTIPLIER;
        uint256 addAmount = amount * currentMultiplier / BASE_MULTIPLIER;
        uint128 newMultiplier = uint128((prevAmount + addAmount) * BASE_MULTIPLIER / (prevBalance + amount));

        return newMultiplier;
    }

    /*
     * Checks if an epoch is initialized, meaning we have a pool size set for it
     */
    function epochIsInitialized(address token, uint128 epochId) public view returns (bool) {
        return poolSize[token][epochId].set;
    }

    function _initEpochForToken(address token, uint128 epochId) internal {
        require(epochId <= getCurrentEpoch(), "can't init a future epoch");

        Pool storage p = poolSize[token][epochId];

        if (epochId == 0) {
            p.size = uint256(0);
            p.set = true;
        } else {
            require(!epochIsInitialized(token, epochId), "Staking: epoch already initialized");
            require(epochIsInitialized(token, epochId - 1), "Staking: previous epoch not initialized");

            p.size = poolSize[token][epochId - 1].size;
            p.set = true;
        }
    }

    function _initAllEpochsForToken(address token) internal {
        uint128 currentEpoch = getCurrentEpoch();

        for (uint128 epochId = 0; epochId <= currentEpoch; epochId++) {
            Pool storage p = poolSize[token][epochId];

            if (!p.set) {
                p.set = true;

                if (epochId == 0) {
                    p.size = uint256(0);
                } else {
                    p.size = poolSize[token][epochId - 1].size;
                }
            }
        }
    }

    function getCheckpointBalance(Checkpoint memory c) internal pure returns (uint256) {
        return c.startBalance + c.newDeposits;
    }

    function getCheckpointEffectiveBalance(Checkpoint memory c) internal pure returns (uint256) {
        return getCheckpointBalance(c) * c.multiplier / BASE_MULTIPLIER;
    }

    /**
    * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}