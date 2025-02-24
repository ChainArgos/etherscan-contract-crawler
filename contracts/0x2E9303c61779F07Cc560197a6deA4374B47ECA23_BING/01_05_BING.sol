// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Bing Chilling
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////
//                                                                                   //
//                                                                                   //
//     ________  ___  ________   ________                                            //
//    |\   __  \|\  \|\   ___  \|\   ____\                                           //
//    \ \  \|\ /\ \  \ \  \\ \  \ \  \___|                                           //
//     \ \   __  \ \  \ \  \\ \  \ \  \  ___                                         //
//      \ \  \|\  \ \  \ \  \\ \  \ \  \|\  \                                        //
//       \ \_______\ \__\ \__\\ \__\ \_______\                                       //
//        \|_______|\|__|\|__| \|__|\|_______|                                       //
//                                                                                   //
//                                                                                   //
//                                                                                   //
//     ________  ___  ___  ___  ___       ___       ___  ________   ________         //
//    |\   ____\|\  \|\  \|\  \|\  \     |\  \     |\  \|\   ___  \|\   ____\        //
//    \ \  \___|\ \  \\\  \ \  \ \  \    \ \  \    \ \  \ \  \\ \  \ \  \___|        //
//     \ \  \    \ \   __  \ \  \ \  \    \ \  \    \ \  \ \  \\ \  \ \  \  ___      //
//      \ \  \____\ \  \ \  \ \  \ \  \____\ \  \____\ \  \ \  \\ \  \ \  \|\  \     //
//       \ \_______\ \__\ \__\ \__\ \_______\ \_______\ \__\ \__\\ \__\ \_______\    //
//        \|_______|\|__|\|__|\|__|\|_______|\|_______|\|__|\|__| \|__|\|_______|    //
//                                                                                   //
//                                                                                   //
//                                                                                   //
//                                                                                   //
//                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////


contract BING is ERC1155Creator {
    constructor() ERC1155Creator("Bing Chilling", "BING") {}
}