// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: INVNT ART
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  //
//                                                                                                  //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████▓▓▓▓██████████████████████████████████████    //
//    ▓▓▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████████▓▓▓▓██████████████████████████████████████    //
//    ▓▓▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓██████████████▓▓███████████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓███████████████████████████████████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓▓▓▓▓▓▓█████████████████▓▓███████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▓█████████▓▓██▓▓█████████▓█████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓█▓▓▓████▓▓████████▓▓▓▓▓▓▓▓▓▓▓▓█████████████████████████▓▓███████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓█▓▓▓█▓▓█▓▓███▓▓▓▓▓██████████▓▓██████████████████████▓▒▓██████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓████▓▓▓▓▓████▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓███████████████████████████████████▓▒▒▒▓▓████████    //
//    ▓▓▓▓▓▓▓▓▓▓█████▓▓▓██▓▓▓▓█▓▓▓▓▓▓██▓▓▓▓▓█████████████████████████████▓▓▓▓▓▓███▓▓▒▓█▓████████    //
//    ▓▓▓▓▓▓▓████████▓▓████▓▓██████████▓▓██████████████████████████████▓▓▓▓▓██▓▓▓▓▓▓▓▓▓█████████    //
//    ▓▓▓▓▓▓█████▓▓██▓███████████████████████████▓▓███████████████████▓▓▓▓███████▓▓▓▓▓▓█████████    //
//    ▓▓▓▓▓▓▓███▓▓██▓▓████▓█▓███████████████████▒▒▓▓███████▓▓▓██████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓███▓███████████████████████████▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓█████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓████▓▓▓████████████████████████▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓█████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓██████████████████████████████░▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓█████████████▓███████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓███▓▓█▓███████████████▓▓▓▓▓▓▒░▓▓▒▒▒▒▒▓▓▓▓▓▓▓▓▓█████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓██████▓▓▓▓▒▒▒▓▓▓█▓▓▓▓▓▓▓▓▓▓▓░▒▓███▒▓▓▓▓▓▓▓▓▓▓▓▓▓███████████████████████████████    //
//    ▓▓▓▓▓▓▓██▓▓▓▓▓▓▓███▓▓▒▒▒▒▓▓▓▓▓▓█▓▒▓▓▓▓▓░▒▒▓▓▒▒▓▓█████▓▓█▓▒▓███████████████████████████████    //
//    ▓▓▓▓▓▓▓███▓▓▓▓▓▓▓████▓▓▓▒▓██████▓▓▓▓▓▓▓▒▒▒▓▒▒▒▓▓▓▓▓▓▓▓█▓▓▓████████████████████████████████    //
//    ▓▓▓▓▓▓▓███▓▓▓▓▓▓▓███████████████▓▓▓▓█▓▓▓▒▓▓▒▒▓▓▓▓▓▓▓▓██▒▓█████████████████████████████████    //
//    ▓▓▓▓▓████▓▓▓████████████████████▓▓▓▓█▓▓█▓▓▓▓▓▓█▓█▓▓████▓█████████████▓▓████████▓▓█████████    //
//    ▓▓▓▓███████▓▓████████████████████▓▓█████▓▓▓▓▓███▓█████▓▓▓▓▓▓████▓██▓▒▓▓███▓▓▓▒▒▓▓▓████████    //
//    ▓▓▓▓▓█████▓▓▓███████████████████▓▓▓▓█████▓▓▓█████████▓▓▓▓▓▓▓████▓▓▒▓▓▓▓▓▓▓▓▓▒▓▓▓████▓█████    //
//    ▓▓███████▓▒▒▓▓▓█████████████▓██▓▓▓▓▓██████▓▓█████████▓▓▓▓▓▓███▓▓▒▒▒▓▓▓▓▓▓▓▒▓▓▓▓██▓▓▓▓▓████    //
//    ▓▓▓███▓▓█▓▓▒▓▓█████████████████▓▒▓▓▓▓██████████████▓▓▒▒▓▓▓▓▓▓▓▓▒▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████    //
//    ▓▓▓██▓▓▓▓▓▓▒▓▓███████████████▓▒▓▓▓▓██████████████▓▓▓▓▓███▓▓▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████    //
//    ▓▓▓▓██▓████▓▒███████████████▓▓▓▓████████████████▓▓▓▓██████▓▓▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████████    //
//    ▓▓▓▓▓███▓██████████████████▓▓▓█▓▓█████████████████████████▓▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓██████    //
//    ▓▓▓▓▓▓████████████████████████▓▓██████▓▒▒▓█▓▓▓█████████▓▓▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████████    //
//    ▓▓▓▓▓▓▓▓▓████████████████████▓███████▓▓▓▓██▓███████▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓██████████████████████████▓▒▒▓███████▓▒▓▓▓▓▓▓▓▓████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓██████████████████████▓▓▓▓▓▓▓▓▓▓████▓▓▓▓▓▓▓███████████████████▓███▓▓▓▓▒▒▒▒▒▓▓▓    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓████████████▓▓▓▓▓▓███▓▓▒▒░▓█▓▓▓█████████████████████████▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓█████████████▓▓▓▓▓████▓▒▒▒▓█▓▒▒▓████████████▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓█████████████▓▓▓▓▓████▓▒▓▓▓▓▓▓▒▓▓█▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓██████████████▓▓▓█████████▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓███████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓████████████▓█▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓████████▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓█▓▓▓▓▓▓▓▓▓████████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓█▒░░▒▒▒▒▒▒▒▓▓▓▓▓▓█▓█▓▓█████▓▓▓▓█████████████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████▓███████▓▓██████████████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓███████████▓▓▓▓█▓▓▓█▓█████▓▓█████████████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓███▓▓▓█▓▓▓▓▓█▓▓▓▓▓▓▓▓█▓▓▓██▓▓▓▓▓███████████████████████████████████████    //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████████████████████████████████    //
//    ▓▓▒▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███████████████████████████████    //
//                                                                                                  //
//                                                                                                  //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////


contract INVNT is ERC1155Creator {
    constructor() ERC1155Creator("INVNT ART", "INVNT") {}
}