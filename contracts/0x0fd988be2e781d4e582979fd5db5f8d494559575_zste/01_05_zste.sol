// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: zs test
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                //
//                                                                                                                                //
//     ________  ___  ___  ________  _______   ________  ________   ________  ________  _____ ______   ________  ___              //
//    |\   ____\|\  \|\  \|\   __  \|\  ___ \ |\   __  \|\   ___  \|\   __  \|\   __  \|\   _ \  _   \|\   __  \|\  \             //
//    \ \  \___|\ \  \\\  \ \  \|\  \ \   __/|\ \  \|\  \ \  \\ \  \ \  \|\  \ \  \|\  \ \  \\\__\ \  \ \  \|\  \ \  \            //
//     \ \_____  \ \  \\\  \ \   ____\ \  \_|/_\ \   _  _\ \  \\ \  \ \  \\\  \ \   _  _\ \  \\|__| \  \ \   __  \ \  \           //
//      \|____|\  \ \  \\\  \ \  \___|\ \  \_|\ \ \  \\  \\ \  \\ \  \ \  \\\  \ \  \\  \\ \  \    \ \  \ \  \ \  \ \  \____      //
//        ____\_\  \ \_______\ \__\    \ \_______\ \__\\ _\\ \__\\ \__\ \_______\ \__\\ _\\ \__\    \ \__\ \__\ \__\ \_______\    //
//       |\_________\|_______|\|__|     \|_______|\|__|\|__|\|__| \|__|\|_______|\|__|\|__|\|__|     \|__|\|__|\|__|\|_______|    //
//       \|_________|                                                                                                             //
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract zste is ERC721Creator {
    constructor() ERC721Creator("zs test", "zste") {}
}