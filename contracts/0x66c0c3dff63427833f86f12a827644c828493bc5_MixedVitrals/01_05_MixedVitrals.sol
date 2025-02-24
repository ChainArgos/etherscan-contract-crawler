// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: MixedVitrals by NunoCostaPT
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                                                                     //
//     _   _                    ____          _        ____ _____      //
//     | \ | |_   _ _ __   ___  / ___|___  ___| |_ __ _|  _ \_   _|    //
//     |  \| | | | | '_ \ / _ \| |   / _ \/ __| __/ _` | |_) || |      //
//     | |\  | |_| | | | | (_) | |__| (_) \__ \ || (_| |  __/ | |      //
//     |_| \_|\__,_|_| |_|\___/ \____\___/|___/\__\__,_|_|    |_|      //
//                                                                     //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////


contract MixedVitrals is ERC721Creator {
    constructor() ERC721Creator("MixedVitrals by NunoCostaPT", "MixedVitrals") {}
}