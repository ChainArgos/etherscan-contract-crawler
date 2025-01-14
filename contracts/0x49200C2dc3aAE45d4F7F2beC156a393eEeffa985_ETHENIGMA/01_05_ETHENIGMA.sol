// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The ETH Enigma - ETH Denver 2023
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                     //
//                                                                                                                                                                                     //
//                                                                                                                                                                                     //
//                                                                                                                                                                                     //
//               .              __.....__                     __.....__                .                          __.....__        _..._   .--.          __  __   ___                  //
//             .'|          .-''         '.               .-''         '.            .'|                      .-''         '.    .'     '. |__|  .--./) |  |/  `.'   `.                //
//         .| <  |         /     .-''"'-.  `.            /     .-''"'-.  `.      .| <  |                     /     .-''"'-.  `. .   .-.   ..--. /.''\\  |   .-.  .-.   '               //
//       .' |_ | |        /     /________\   \          /     /________\   \   .' |_ | |                    /     /________\   \|  '   '  ||  || |  | | |  |  |  |  |  |    __         //
//     .'     || | .'''-. |                  |          |                  | .'     || | .'''-.             |                  ||  |   |  ||  | \`-' /  |  |  |  |  |  | .:--.'.       //
//    '--.  .-'| |/.'''. \\    .-------------'          \    .-------------''--.  .-'| |/.'''. \            \    .-------------'|  |   |  ||  | /("'`   |  |  |  |  |  |/ |   \ |      //
//       |  |  |  /    | | \    '-.____...---.           \    '-.____...---.   |  |  |  /    | |             \    '-.____...---.|  |   |  ||  | \ '---. |  |  |  |  |  |`" __ | |      //
//       |  |  | |     | |  `.             .'             `.             .'    |  |  | |     | |              `.             .' |  |   |  ||__|  /'""'.\|__|  |__|  |__| .'.''| |      //
//       |  '.'| |     | |    `''-...... -'                 `''-...... -'      |  '.'| |     | |                `''-...... -'   |  |   |  |     ||     ||               / /   | |_     //
//       |   / | '.    | '.                                                    |   / | '.    | '.                               |  |   |  |     \'. __//                \ \._,\ '/     //
//       `'-'  '---'   '---'                                                   `'-'  '---'   '---'                              '--'   '--'      `'---'                  `--'  `"      //
//                                                                                                                                                                                     //
//                                                                                                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract ETHENIGMA is ERC1155Creator {
    constructor() ERC1155Creator("The ETH Enigma - ETH Denver 2023", "ETHENIGMA") {}
}