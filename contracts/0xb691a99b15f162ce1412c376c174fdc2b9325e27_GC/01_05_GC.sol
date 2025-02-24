// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Glass Crown
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                               //
//                                                                                                               //
//      /$$$$$$  /$$                                     /$$$$$$                                                 //
//     /$$__  $$| $$                                    /$$__  $$                                                //
//    | $$  \__/| $$  /$$$$$$   /$$$$$$$ /$$$$$$$      | $$  \__/  /$$$$$$   /$$$$$$  /$$  /$$  /$$ /$$$$$$$     //
//    | $$ /$$$$| $$ |____  $$ /$$_____//$$_____/      | $$       /$$__  $$ /$$__  $$| $$ | $$ | $$| $$__  $$    //
//    | $$|_  $$| $$  /$$$$$$$|  $$$$$$|  $$$$$$       | $$      | $$  \__/| $$  \ $$| $$ | $$ | $$| $$  \ $$    //
//    | $$  \ $$| $$ /$$__  $$ \____  $$\____  $$      | $$    $$| $$      | $$  | $$| $$ | $$ | $$| $$  | $$    //
//    |  $$$$$$/| $$|  $$$$$$$ /$$$$$$$//$$$$$$$/      |  $$$$$$/| $$      |  $$$$$$/|  $$$$$/$$$$/| $$  | $$    //
//     \______/ |__/ \_______/|_______/|_______/        \______/ |__/       \______/  \_____/\___/ |__/  |__/    //
//                                                                                                               //
//                                                                                                               //
//                                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract GC is ERC1155Creator {
    constructor() ERC1155Creator("Glass Crown", "GC") {}
}