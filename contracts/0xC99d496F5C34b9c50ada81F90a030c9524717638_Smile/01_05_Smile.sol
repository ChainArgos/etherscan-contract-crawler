// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Have A Nice Day
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                   //
//                                                                                                                   //
//    ██   ██  █████  ██    ██ ███████      █████      ███    ██ ██  ██████ ███████     ██████   █████  ██    ██     //
//    ██   ██ ██   ██ ██    ██ ██          ██   ██     ████   ██ ██ ██      ██          ██   ██ ██   ██  ██  ██      //
//    ███████ ███████ ██    ██ █████       ███████     ██ ██  ██ ██ ██      █████       ██   ██ ███████   ████       //
//    ██   ██ ██   ██  ██  ██  ██          ██   ██     ██  ██ ██ ██ ██      ██          ██   ██ ██   ██    ██        //
//    ██   ██ ██   ██   ████   ███████     ██   ██     ██   ████ ██  ██████ ███████     ██████  ██   ██    ██        //
//                                                                                                                   //
//                                                                                                                   //
//                                                                                                                   //
//                                                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract Smile is ERC1155Creator {
    constructor() ERC1155Creator("Have A Nice Day", "Smile") {}
}