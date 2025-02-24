pragma solidity 0.8.16;

import {ISpigot} from "./ISpigot.sol";

interface ISpigotedLine {
    /**
     * @notice - Log how many revenue tokens are used to repay debt after claimAndRepay
     *         - dont need to track value like other events because _repay already emits that
     *         - Mainly used to log debt that is paid via Spigot directly vs other sources. Without this event it's a lot harder to parse that offchain.
     */
    event RevenuePayment(address indexed token, uint256 indexed amount);

    error ReservesOverdrawn(address token, uint256 amountAvailable);

    /**
     * @notice - Log how many revenue tokens were traded for credit tokens.
     *         - Differs from RevenuePayment because we trade revenue at different times from repaying with revenue
     * @dev    - Can you use to figure out price of revenue tokens offchain since we only have an oracle for credit tokens
     * @dev    - Revenue tokens may be from reserves or from Spigot revenue.
     */
    event TradeSpigotRevenue(
        address indexed revenueToken,
        uint256 revenueTokenAmount,
        address indexed debtToken,
        uint256 indexed debtTokensBought
    );

    event ReservesChanged(
        address indexed token,
        int256 indexed diff,
        uint256 tokenType // 0 for revenue token, 1 for credit token
    );

    // Borrower functions

    /**
     * @notice - Directly repays a Lender using unused tokens already held by Line with no trading
     * @dev    - callable by `borrower` or first lender in repayment queue
     * @param amount       - amount of unused tokens to use to repay Lender
     * @return             - if function executed successfully
     */
    function useAndRepay(uint256 amount) external returns (bool);

    /**
     * @notice  - Claims revenue tokens from the Spigot, trades them for credit tokens via a Dex aggregator (Ox protocol) and uses the bought credit tokens to repay debt.
     *          - see SpigotedLine._claimAndTrade and SpigotedLineLib.claimAndTrade for more details on Spigot and trading logic
     *          - see LineOfCredit._repay() for more details on repayment logic
     * @dev     - does not trade asset if claimToken = credit.token
     * @dev     - callable by `arbiter`
     * @param claimToken       - The Revenue Token escrowed by Spigot to claim and use to repay debt
     * @param zeroExTradeData  - data generated by the 0x dex API to trade `claimToken` against their exchange contract
     * @return newTokens       - amount of credit tokens claimed or bought during call
     */
    function claimAndRepay(address claimToken, bytes calldata zeroExTradeData) external returns (uint256);

    /**
     *
     * @notice - allows borrower to trade revenue to credit tokens at a favorable price without repaying debt
     *         - sends all bought tokens to `unused` to be repaid later
     *         - see SpigotedLine._claimAndTrade and SpigotedLineLib.claimAndTrade for more details
     * @dev    - ensures first token in repayment queue is being bought
     * @dev    - callable by `arbiter`
     * @param claimToken      - The revenue token escrowed in the Spigot to sell in trade
     * @param zeroExTradeData - 0x API data to use in trade to sell `claimToken` for `credits[ids[0]]`
     * @return tokensBought   - amount of credit tokens bought
     */
    function claimAndTrade(address claimToken, bytes calldata zeroExTradeData) external returns (uint256 tokensBought);

    // Spigot management functions

    /**
     * @notice - allow Line (aka Owner on Spigot) to add new revenue streams to repay credit
     * @dev    - see Spigot.addSpigot()
     * @dev    - callable `arbiter` ONLY
     * @return            - if function call was successful
     */
    function addSpigot(address revenueContract, ISpigot.Setting calldata setting) external returns (bool);

    /**
     * @notice - Sets or resets the whitelisted functions that a Borrower [Operator] is allowed to perform on the revenue generating contracts
     * @dev    - see Spigot.updateWhitelistedFunction()
     * @dev    - callable `arbiter` ONLY
     * @return           - if function call was successful
     */
    function updateWhitelist(bytes4 func, bool allowed) external returns (bool);

    /**
     * @notice - Changes the revenue split between the Treasury and the Line (Owner) based upon the status of the Line of Credit
     * @dev    - callable by anyone
     * @param revenueContract   - spigot to update
     * @return didUpdate        - whether or not split was updated
     */
    function updateOwnerSplit(address revenueContract) external returns (bool);

    /**
     * @notice  - Transfers ownership of the entire Spigot from its then Owner to either the Borrower (if a Line of Credit has been been fully repaid)
     *          - or to the Arbiter (if the Line of Credit is liquidatable).
     * @dev     - callable by borrower + arbiter
     * @param to          - address that caller wants to transfer Spigot ownership to
     * @return bool       - whether or not a Spigot was released
     */
    function releaseSpigot(address to) external returns (bool);

    /**
     * @notice   - sends unused tokens to borrower if REPAID or arbiter if LIQUIDATABLE or INSOLVENT
     *           -  does not send tokens out if line is ACTIVE
     * @dev      - callable by `borrower` or `arbiter`
     * @param to           - address to send swept tokens to
     * @param token        - revenue or credit token to sweep
     * @param amount       - amount of reserve tokens to withdraw/liquidate
     */
    function sweep(address to, address token, uint256 amount) external returns (uint256);

    // getters

    /**
     * @notice - getter for `unusedTokens` mapping which is a private var
     * @param token      - address for an ERC20
     * @return amount    - amount of revenue tokens available to trade for credit tokens or credit tokens availble to repay debt with
     */
    function unused(address token) external returns (uint256);

    /**
     * @notice - Looksup `unusedTokens` + spigot.getOwnerTokens` for how many tokens arbiter must sell in claimAndTrade/Repay
     * @param token      - address for an ERC20 earned as revenue
     * @return amount    - amount of unused + claimable revenue tokens available to trade for credit tokens or credit tokens availble to repay debt with
     */
    function tradeable(address token) external returns (uint256);

    function spigot() external returns (ISpigot);
}