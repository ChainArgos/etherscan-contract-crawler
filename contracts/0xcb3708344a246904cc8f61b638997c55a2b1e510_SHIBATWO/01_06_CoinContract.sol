// SPDX-License-Identifier: MIT
import "./ERC20.sol";

pragma solidity ^0.8.4;
contract SHIBATWO is ERC20, Ownable {
    constructor() ERC20("Shiba Inu 2.0", "SHIB2.0") {
        _mint(msg.sender, 4_010_000_000_000 * 10**uint(decimals()));
    }
}