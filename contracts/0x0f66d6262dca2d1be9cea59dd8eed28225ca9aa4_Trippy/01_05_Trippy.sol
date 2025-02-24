// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: TrippyTour
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//     /$$$$$$$$        /$$                                  //
//    |__  $$__/       |__/                                  //
//       | $$  /$$$$$$  /$$  /$$$$$$   /$$$$$$  /$$   /$$    //
//       | $$ /$$__  $$| $$ /$$__  $$ /$$__  $$| $$  | $$    //
//       | $$| $$  \__/| $$| $$  \ $$| $$  \ $$| $$  | $$    //
//       | $$| $$      | $$| $$  | $$| $$  | $$| $$  | $$    //
//       | $$| $$      | $$| $$$$$$$/| $$$$$$$/|  $$$$$$$    //
//       |__/|__/      |__/| $$____/ | $$____/  \____  $$    //
//                         | $$      | $$       /$$  | $$    //
//                         | $$      | $$      |  $$$$$$/    //
//                         |__/      |__/       \______/     //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
//                                                           //
///////////////////////////////////////////////////////////////


contract Trippy is ERC1155Creator {
    constructor() ERC1155Creator("TrippyTour", "Trippy") {}
}