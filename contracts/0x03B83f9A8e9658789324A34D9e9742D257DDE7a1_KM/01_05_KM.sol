// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: KINUMEN_2
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////
//                                                                       //
//                                                                       //
//    ____  __.___ _______   ____ ___  _____  ___________ _______        //
//    |    |/ _|   |\      \ |    |   \/     \ \_   _____/ \      \      //
//    |      < |   |/   |   \|    |   /  \ /  \ |    __)_  /   |   \     //
//    |    |  \|   /    |    \    |  /    Y    \|        \/    |    \    //
//    |____|__ \___\____|__  /______/\____|__  /_______  /\____|__  /    //
//            \/           \/                \/        \/         \/     //
//                                                                       //
//                                                                       //
///////////////////////////////////////////////////////////////////////////


contract KM is ERC721Creator {
    constructor() ERC721Creator("KINUMEN_2", "KM") {}
}