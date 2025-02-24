// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Aesthetically Anime
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////
//                                                          //
//                                                          //
//    ▄▄▄· ▄▄▄ ..▄▄ · ▄▄▄▄▄ ▄ .▄▄▄▄ .▄▄▄▄▄▪   ▐ ▄ ▄▄▄▄▄     //
//    ▐█ ▀█ ▀▄.▀·▐█ ▀. •██  ██▪▐█▀▄.▀·•██  ██ •█▌▐█•██      //
//    ▄█▀▀█ ▐▀▀▪▄▄▀▀▀█▄ ▐█.▪██▀▐█▐▀▀▪▄ ▐█.▪▐█·▐█▐▐▌ ▐█.▪    //
//    ▐█ ▪▐▌▐█▄▄▌▐█▄▪▐█ ▐█▌·██▌▐▀▐█▄▄▌ ▐█▌·▐█▌██▐█▌ ▐█▌·    //
//     ▀  ▀  ▀▀▀  ▀▀▀▀  ▀▀▀ ▀▀▀ · ▀▀▀  ▀▀▀ ▀▀▀▀▀ █▪ ▀▀▀     //
//                                                          //
//                                                          //
//////////////////////////////////////////////////////////////


contract AIAnime is ERC721Creator {
    constructor() ERC721Creator("Aesthetically Anime", "AIAnime") {}
}