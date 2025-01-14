// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: c-la
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////
//                                                              //
//                                                              //
//                     .__                             __       //
//      ____           |  | _____       _____ ________/  |_     //
//    _/ ___\   ______ |  | \__  \      \__  \\_  __ \   __\    //
//    \  \___  /_____/ |  |__/ __ \_     / __ \|  | \/|  |      //
//     \___  >         |____(____  / /\ (____  /__|   |__|      //
//         \/                    \/  \/      \/                 //
//                                                              //
//                                                              //
//////////////////////////////////////////////////////////////////


contract cla is ERC721Creator {
    constructor() ERC721Creator("c-la", "cla") {}
}