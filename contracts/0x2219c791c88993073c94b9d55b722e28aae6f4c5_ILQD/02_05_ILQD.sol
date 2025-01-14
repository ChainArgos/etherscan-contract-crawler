// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: ILLIQD
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////
//                                                              //
//                                                              //
//     ___  ___       ___       ___  ________  ________         //
//    |\  \|\  \     |\  \     |\  \|\   __  \|\   ___ \        //
//    \ \  \ \  \    \ \  \    \ \  \ \  \|\  \ \  \_|\ \       //
//     \ \  \ \  \    \ \  \    \ \  \ \  \\\  \ \  \ \\ \      //
//      \ \  \ \  \____\ \  \____\ \  \ \  \\\  \ \  \_\\ \     //
//       \ \__\ \_______\ \_______\ \__\ \_____  \ \_______\    //
//        \|__|\|_______|\|_______|\|__|\|___| \__\|_______|    //
//                                            \|__|             //
//                                                              //
//                                                              //
//////////////////////////////////////////////////////////////////


contract ILQD is ERC721Creator {
    constructor() ERC721Creator("ILLIQD", "ILQD") {}
}