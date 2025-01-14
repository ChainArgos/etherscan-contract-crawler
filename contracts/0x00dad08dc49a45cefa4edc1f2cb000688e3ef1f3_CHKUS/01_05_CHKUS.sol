// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Check Yourself
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
//     _______  __   __  _______  _______  ___   _    __   __  _______  __   __  ______    _______  _______  ___      _______     //
//    |       ||  | |  ||       ||       ||   | | |  |  | |  ||       ||  | |  ||    _ |  |       ||       ||   |    |       |    //
//    |       ||  |_|  ||    ___||       ||   |_| |  |  |_|  ||   _   ||  | |  ||   | ||  |  _____||    ___||   |    |    ___|    //
//    |       ||       ||   |___ |       ||      _|  |       ||  | |  ||  |_|  ||   |_||_ | |_____ |   |___ |   |    |   |___     //
//    |      _||       ||    ___||      _||     |_   |_     _||  |_|  ||       ||    __  ||_____  ||    ___||   |___ |    ___|    //
//    |     |_ |   _   ||   |___ |     |_ |    _  |    |   |  |       ||       ||   |  | | _____| ||   |___ |       ||   |        //
//    |_______||__| |__||_______||_______||___| |_|    |___|  |_______||_______||___|  |_||_______||_______||_______||___|        //
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract CHKUS is ERC721Creator {
    constructor() ERC721Creator("Check Yourself", "CHKUS") {}
}