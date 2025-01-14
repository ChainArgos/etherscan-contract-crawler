// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Toys and Treasures
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////
//                                                       //
//                                                       //
//                                                       //
//      _______                                   _      //
//     |__   __|                                 | |     //
//        | | ___  _   _ ___       __ _ _ __   __| |     //
//        | |/ _ \| | | / __|     / _` | '_ \ / _` |     //
//        | | (_) | |_| \__ \    | (_| | | | | (_| |     //
//      __|_|\___/ \__, |___/     \__,_|_| |_|\__,_|     //
//     |__   __|    __/ |                                //
//        | |_ __ _|___/_ _ ___ _   _ _ __ ___  ___      //
//        | | '__/ _ \/ _` / __| | | | '__/ _ \/ __|     //
//        | | | |  __/ (_| \__ \ |_| | | |  __/\__ \     //
//        |_|_|  \___|\__,_|___/\__,_|_|  \___||___/     //
//                                                       //
//                                                       //
//                                                       //
//                                                       //
///////////////////////////////////////////////////////////


contract TNT is ERC1155Creator {
    constructor() ERC1155Creator("Toys and Treasures", "TNT") {}
}