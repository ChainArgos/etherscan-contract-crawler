// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Awesome Dog
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

/////////////////////////////////////////////////////////
//                                                     //
//                                                     //
//      /\                             |~~\            //
//     /__\\    //~/(~/~\|/~\ /~\ /~/  |   |/~\/~~|    //
//    /    \\/\/ \/__)\_/|   |   |\/_  |__/ \_/\__|    //
//                                             \__|    //
//                                                     //
//                                                     //
/////////////////////////////////////////////////////////


contract AD is ERC1155Creator {
    constructor() ERC1155Creator("Awesome Dog", "AD") {}
}