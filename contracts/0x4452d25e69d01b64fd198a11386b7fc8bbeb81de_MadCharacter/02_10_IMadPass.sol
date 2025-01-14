// SPDX-License-Identifier: MIT
//
//  ███████████  █████         █████████     █████████  █████   ████ █████       ██████████ ██████   ██████    ███████    ██████   █████
// ░░███░░░░░███░░███         ███░░░░░███   ███░░░░░███░░███   ███░ ░░███       ░░███░░░░░█░░██████ ██████   ███░░░░░███ ░░██████ ░░███ 
//  ░███    ░███ ░███        ░███    ░███  ███     ░░░  ░███  ███    ░███        ░███  █ ░  ░███░█████░███  ███     ░░███ ░███░███ ░███ 
//  ░██████████  ░███        ░███████████ ░███          ░███████     ░███        ░██████    ░███░░███ ░███ ░███      ░███ ░███░░███░███ 
//  ░███░░░░░███ ░███        ░███░░░░░███ ░███          ░███░░███    ░███        ░███░░█    ░███ ░░░  ░███ ░███      ░███ ░███ ░░██████ 
//  ░███    ░███ ░███      █ ░███    ░███ ░░███     ███ ░███ ░░███   ░███      █ ░███ ░   █ ░███      ░███ ░░███     ███  ░███  ░░█████ 
//  ███████████  ███████████ █████   █████ ░░█████████  █████ ░░████ ███████████ ██████████ █████     █████ ░░░███████░   █████  ░░█████
// ░░░░░░░░░░░  ░░░░░░░░░░░ ░░░░░   ░░░░░   ░░░░░░░░░  ░░░░░   ░░░░ ░░░░░░░░░░░ ░░░░░░░░░░ ░░░░░     ░░░░░    ░░░░░░░    ░░░░░    ░░░░░ 
//                                                                                                                                      
// BLACKLEMON: https://github.com/BlackLemon-wtf 
// =======================================================================================================================================
//
//    █████████    █████████   ██████████   ██████   ██████    ███████     █████████     █████    ███████   
//   ███░░░░░███  ███░░░░░███ ░░███░░░░███ ░░██████ ██████   ███░░░░░███  ███░░░░░███   ░░███   ███░░░░░███ 
//  ███     ░░░  ░███    ░███  ░███   ░░███ ░███░█████░███  ███     ░░███░███    ░░░     ░███  ███     ░░███
// ░███          ░███████████  ░███    ░███ ░███░░███ ░███ ░███      ░███░░█████████     ░███ ░███      ░███
// ░███          ░███░░░░░███  ░███    ░███ ░███ ░░░  ░███ ░███      ░███ ░░░░░░░░███    ░███ ░███      ░███
// ░░███     ███ ░███    ░███  ░███    ███  ░███      ░███ ░░███     ███  ███    ░███    ░███ ░░███     ███ 
//  ░░█████████  █████   █████ ██████████   █████     █████ ░░░███████░  ░░█████████  ██ █████ ░░░███████░  
//   ░░░░░░░░░  ░░░░░   ░░░░░ ░░░░░░░░░░   ░░░░░     ░░░░░    ░░░░░░░     ░░░░░░░░░  ░░ ░░░░░    ░░░░░░░                                                                                                          
//
// CADMOS.IO: https://github.com/CADMOS-SAL
// ==========================================================================================================
// ==================================================  IMadPass  ============================================
// ==========================================================================================================

pragma solidity 0.8.7;

import "@openzeppelin/contracts/interfaces/IERC1155.sol";

interface IMadPass is IERC1155 {
    function burn(
        address from,
        uint256 id,
        uint256 amount
    ) external;
}