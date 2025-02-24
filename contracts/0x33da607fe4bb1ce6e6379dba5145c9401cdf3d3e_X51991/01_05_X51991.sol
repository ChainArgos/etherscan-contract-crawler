// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: X51991
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////
//                                                //
//                                                //
//    ██   ██ ███████  ██  █████   █████   ██     //
//     ██ ██  ██      ███ ██   ██ ██   ██ ███     //
//      ███   ███████  ██  ██████  ██████  ██     //
//     ██ ██       ██  ██      ██      ██  ██     //
//    ██   ██ ███████  ██  █████   █████   ██     //
//                                                //
//                                                //
//                                                //
////////////////////////////////////////////////////


contract X51991 is ERC1155Creator {
    constructor() ERC1155Creator("X51991", "X51991") {}
}