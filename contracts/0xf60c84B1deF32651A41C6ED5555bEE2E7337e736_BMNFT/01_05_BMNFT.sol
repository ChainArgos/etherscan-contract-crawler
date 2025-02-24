// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Bradley Moon Photography
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////
//                                                                                    //
//                                                                                    //
//                                                                                    //
//    88888888ba   88b           d88     888b      88  88888888888  888888888888      //
//    88      "8b  888b         d888     8888b     88  88                88           //
//    88      ,8P  88`8b       d8'88     88 `8b    88  88                88           //
//    88aaaaaa8P'  88 `8b     d8' 88     88  `8b   88  88aaaaa           88           //
//    88""""""8b,  88  `8b   d8'  88     88   `8b  88  88"""""           88           //
//    88      `8b  88   `8b d8'   88     88    `8b 88  88                88           //
//    88      a8P  88    `888'    88     88     `8888  88                88           //
//    88888888P"   88     `8'     88     88      `888  88                88           //
//                                                                                    //
//                                                                                    //
//                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////


contract BMNFT is ERC721Creator {
    constructor() ERC721Creator("Bradley Moon Photography", "BMNFT") {}
}