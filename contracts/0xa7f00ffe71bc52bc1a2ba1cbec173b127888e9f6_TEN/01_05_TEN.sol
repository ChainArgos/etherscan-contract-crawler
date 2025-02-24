// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: TENEBRINI ART
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////
//                          //
//                          //
//                          //
//     ____  ____  __ _     //
//    (_  _)(  __)(  ( \    //
//      )(   ) _) /    /    //
//     (__) (____)\_)__)    //
//     ____  ____  ____     //
//    (  __)(  _ \(  _ \    //
//     ) _)  ) _ ( )   /    //
//    (____)(____/(__\_)    //
//      __   __ _   __      //
//     (  ) (  ( \ (  )     //
//      )(  /    /  )(      //
//     (__) \_)__) (__)     //
//      __   ____  ____     //
//     / _\ (  _ \(_  _)    //
//    /    \ )   /  )(      //
//    \_/\_/(__\_) (__)     //
//                          //
//                          //
//                          //
//////////////////////////////


contract TEN is ERC721Creator {
    constructor() ERC721Creator("TENEBRINI ART", "TEN") {}
}