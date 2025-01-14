// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Night Walk
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////
//                                                                               //
//                                                                               //
//     _____ _     _____ _      _  _____ _     _____ _      ____  _     _  __    //
//    /__ __Y \ /|/  __// \  /|/ \/  __// \ /|/__ __Y \  /|/  _ \/ \   / |/ /    //
//      / \ | |_|||  \  | |\ ||| || |  _| |_||  / \ | |  ||| / \|| |   |   /     //
//      | | | | |||  /_ | | \||| || |_//| | ||  | | | |/\||| |-||| |_/\|   \     //
//      \_/ \_/ \|\____\\_/  \|\_/\____\\_/ \|  \_/ \_/  \|\_/ \|\____/\_|\_\    //
//                                                                               //
//                                                                               //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////


contract thenightwalk is ERC721Creator {
    constructor() ERC721Creator("The Night Walk", "thenightwalk") {}
}