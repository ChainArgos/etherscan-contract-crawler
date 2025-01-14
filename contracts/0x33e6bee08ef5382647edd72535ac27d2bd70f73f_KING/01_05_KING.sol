// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Kingdom of Despair
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                    //
//                                                                                                    //
//      _  ___                 _                          __   _____                       _          //
//     | |/ (_)               | |                        / _| |  __ \                     (_)         //
//     | ' / _ _ __   __ _  __| | ___  _ __ ___     ___ | |_  | |  | | ___ ___ _ __   __ _ _ _ __     //
//     |  < | | '_ \ / _` |/ _` |/ _ \| '_ ` _ \   / _ \|  _| | |  | |/ _ / __| '_ \ / _` | | '__|    //
//     | . \| | | | | (_| | (_| | (_) | | | | | | | (_) | |   | |__| |  __\__ | |_) | (_| | | |       //
//     |_|\_|_|_| |_|\__, |\__,_|\___/|_| |_| |_|  \___/|_|   |_____/ \___|___| .__/ \__,_|_|_|       //
//      _             __/ | _____  _____   ____                               | |                     //
//     | |           |___/ |  __ \|  __ \ / __ \                              |_|                     //
//     | |__  _   _    __ _| |__) | |__) | |  | |                                                     //
//     | '_ \| | | |  / _` |  _  /|  _  /| |  | |                                                     //
//     | |_) | |_| | | (_| | | \ \| | \ \| |__| |                                                     //
//     |_.__/ \__, |  \__,_|_|  \_|_|  \_\\____/                                                      //
//             __/ |                                                                                  //
//                                                                                                    //
//                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////


contract KING is ERC721Creator {
    constructor() ERC721Creator("Kingdom of Despair", "KING") {}
}