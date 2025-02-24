// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract WorldCupBet {
    // Amount of tokens used for each bet
    uint public immutable FIX_BET_AMOUNT;
    // This timestamp corresponds to 2022-12-03 00:00 UTC
    uint256 constant TOURNAMENT_START = 1670025600;

    struct Bet {
        // Team chosen for the bet
        uint team;
        // True if we already paid the prize to this address
        bool paid;
    }

    IERC20 immutable token;
    address public owner;

    mapping (address => Bet) public bets; // address => (Team, Paid)
    mapping (uint => uint) public betsPerTeam; // Team => Quantity

    bool public winnerTeamDecided = false;
    uint public winnerTeam;
    uint public prizeAmountPerWinner;

    event Betted(address user, uint team);

    // Receives the token address as a parameter
    constructor (IERC20 wDogeAddress, uint betAmount) {
        token = wDogeAddress;
        owner = msg.sender;
        FIX_BET_AMOUNT = betAmount;
    }

    // Modifier to use in functions that only owner can call
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function betsAreOpen() public view returns (bool) {
        return block.timestamp < TOURNAMENT_START;
    }

    function assertTeamIsValid(uint256 team) internal pure {
        require(0 < team && team < 33, "Team must be a number between 1 and 32");
    }

    // This function is called to make a bet. The amount is fixed
    function bet(uint team) public {
        assertTeamIsValid(team);
        require(bets[msg.sender].team==0, "You cannot participate twice");
        require(betsAreOpen(), "Bets are closed");

        bets[msg.sender].team = team;
        betsPerTeam[team]++;

        token.transferFrom(msg.sender, address(this), FIX_BET_AMOUNT);

        emit Betted(msg.sender, team);
    }

    // This function can only be called by the owner and sets the winner of the world cup
    function setWinnerTeam(uint team) public onlyOwner {
        assertTeamIsValid(team);
        require(!betsAreOpen(), "Bets must be closed");

        winnerTeamDecided = true;
        winnerTeam = team;
        uint countWinners = betsPerTeam[team];
        if (countWinners!=0) {
            prizeAmountPerWinner = token.balanceOf(address(this)) / countWinners;
        } else {
            prizeAmountPerWinner = 0;
        }
    }

    // This function must be called by each winner to collect their prize
    function collectPrize() public {
        require(winnerTeamDecided, "Winner of the world cup has not been decided yet");
        require(bets[msg.sender].team == winnerTeam, "Unfortunately you have not betted to the winner team");
        require(!bets[msg.sender].paid, "Already paid to you!");
        bets[msg.sender].paid = true;
        token.transfer(msg.sender, prizeAmountPerWinner);
    }
}