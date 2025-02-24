// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: 1SELF
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

///////////////////////////////////////////////////////////////
//                                                           //
//                                                           //
//                                                           //
//    _________/\\\______________________________            //
//     ________\/\\\______________________________           //
//      ________\/\\\___________________/\\\__/\\\_          //
//       ________\/\\\______/\\\\\______\//\\\/\\\__         //
//        ___/\\\\\\\\\____/\\\///\\\_____\//\\\\\___        //
//         __/\\\////\\\___/\\\__\//\\\_____\//\\\____       //
//          _\/\\\__\/\\\__\//\\\__/\\\___/\\_/\\\_____      //
//           _\//\\\\\\\/\\__\///\\\\\/___\//\\\\/______     //
//            __\///////\//_____\/////______\////________    //
//                                                           //
//                                                           //
//                                                           //
///////////////////////////////////////////////////////////////


contract SELF is ERC721Creator {
    constructor() ERC721Creator("1SELF", "SELF") {}
}