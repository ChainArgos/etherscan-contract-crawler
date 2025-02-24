// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: SKETCHBOOK by Luis Simo
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////
//                                                              //
//                                                              //
//          ___                       ___           ___         //
//         /  /\        ___          /__/\         /  /\        //
//        /  /:/_      /  /\        |  |::\       /  /::\       //
//       /  /:/ /\    /  /:/        |  |:|:\     /  /:/\:\      //
//      /  /:/ /::\  /__/::\      __|__|:|\:\   /  /:/  \:\     //
//     /__/:/ /:/\:\ \__\/\:\__  /__/::::| \:\ /__/:/ \__\:\    //
//     \  \:\/:/~/:/    \  \:\/\ \  \:\~~\__\/ \  \:\ /  /:/    //
//      \  \::/ /:/      \__\::/  \  \:\        \  \:\  /:/     //
//       \__\/ /:/       /__/:/    \  \:\        \  \:\/:/      //
//         /__/:/        \__\/      \  \:\        \  \::/       //
//         \__\/                     \__\/         \__\/        //
//                                                              //
//                                                              //
//////////////////////////////////////////////////////////////////


contract SKETCH is ERC721Creator {
    constructor() ERC721Creator("SKETCHBOOK by Luis Simo", "SKETCH") {}
}