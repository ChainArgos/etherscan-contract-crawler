// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: webzero
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////
//                    //
//                    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//    ▓▓▓▓▓▓▓▓▒▒▒▒    //
//                    //
//                    //
////////////////////////


contract web0 is ERC721Creator {
    constructor() ERC721Creator("webzero", "web0") {}
}