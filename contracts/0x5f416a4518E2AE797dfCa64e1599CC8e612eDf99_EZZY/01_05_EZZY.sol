// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: EASYSTYLE
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////
//                                                              //
//                                                              //
//       ('-.     .-') _    .-') _             ('-.             //
//     _(  OO)   (  OO) )  (  OO) )          _(  OO)            //
//    (,------.,(_)----. ,(_)----.   ,-.-') (,------.           //
//     |  .---'|       | |       |   |  |OO) |  .---'           //
//     |  |    '--.   /  '--.   /    |  |  \ |  |               //
//    (|  '--. (_/   /   (_/   /     |  |(_/(|  '--.            //
//     |  .--'  /   /___  /   /___  ,|  |_.' |  .--'            //
//     |  `---.|        ||        |(_|  |    |  `---.           //
//     `------'`--------'`--------'  `--'    `------' <3<3<3    //
//                                                              //
//                                                              //
//////////////////////////////////////////////////////////////////


contract EZZY is ERC1155Creator {
    constructor() ERC1155Creator("EASYSTYLE", "EZZY") {}
}