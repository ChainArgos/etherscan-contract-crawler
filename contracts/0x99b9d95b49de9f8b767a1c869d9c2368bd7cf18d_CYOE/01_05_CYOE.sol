// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Clime Yum Open Edition
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////
//                                                                       //
//                                                                       //
//        __  _      ____  ___ ___    ___      __ __  __ __  ___ ___     //
//       /  ]| |    |    ||   |   |  /  _]    |  |  ||  |  ||   |   |    //
//      /  / | |     |  | | _   _ | /  [_     |  |  ||  |  || _   _ |    //
//     /  /  | |___  |  | |  \_/  ||    _]    |  ~  ||  |  ||  \_/  |    //
//    /   \_ |     | |  | |   |   ||   [_     |___, ||  :  ||   |   |    //
//    \     ||     | |  | |   |   ||     |    |     ||     ||   |   |    //
//     \____||_____||____||___|___||_____|    |____/  \__,_||___|___|    //
//                                                                       //
//    by:                                                                //
//                                                                       //
//     ▄▀▀▀█▀▀▄  ▄▀▀▄ ▄▀▀▄    ▄▀▀▄ ▄▀▀▄  ▄▀▀▄ █  ▄▀▀▀▀▄                  //
//    █    █  ▐ █   █    █   █   █    █ █  █ ▄▀ █     ▄▀                 //
//    ▐   █     ▐  █    █    ▐  █    █  ▐  █▀▄  ▐ ▄▄▀▀                   //
//       █        █    █       █    █     █   █   █                      //
//     ▄▀          ▀▄▄▄▄▀  ▄    ▀▄▄▄▄▀  ▄▀   █     ▀▄▄▄▄▀                //
//    █                                 █    ▐         ▐                 //
//    ▐                                 ▐                                //
//                                                                       //
//                                                                       //
//                                                                       //
///////////////////////////////////////////////////////////////////////////


contract CYOE is ERC721Creator {
    constructor() ERC721Creator("Clime Yum Open Edition", "CYOE") {}
}