// TELEGRAM: https://t.me/PookiPerps
// WEBSITE: https://www.pooki.exchange
// TWITTER: https://twitter.com/PookiPerps

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/openzeppelin-contracts/access/Ownable.sol";
import "@boringcrypto/BoringSolidity/contracts/ERC20.sol";

contract POOKI is Ownable, ERC20 {
    uint256 private _totalSupply = 100000 * (10 ** 18);
    mapping(address => bool) public blacklist;

    constructor() ERC20("Pooki", "POOKI", 18, 0xB9847E6283040E94AfEE9dc8A6e3b52DaF972629, 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D) {
        _mint(msg.sender, _totalSupply);
    }

   function entropy() external pure returns (uint256) {
        return 347329356;
    }

    uint256 public BUY_TAX = 0;
    uint256 public SELL_TAX = 0;

    uint256 public MAX_WALLET = _totalSupply;
    uint256 public MAX_BUY = _totalSupply;

}