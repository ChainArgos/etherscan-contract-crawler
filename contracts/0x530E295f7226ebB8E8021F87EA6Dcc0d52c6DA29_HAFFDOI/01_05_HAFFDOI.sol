// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Declaration of Independence
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////
//                                                                  //
//                                                                  //
//                                                                  //
//     ██░ ██  ▄▄▄        █████▒ █████▒▄▄▄█████▓ ██ ▄█▀▄▄▄          //
//    ▓██░ ██▒▒████▄    ▓██   ▒▓██   ▒ ▓  ██▒ ▓▒ ██▄█▒▒████▄        //
//    ▒██▀▀██░▒██  ▀█▄  ▒████ ░▒████ ░ ▒ ▓██░ ▒░▓███▄░▒██  ▀█▄      //
//    ░▓█ ░██ ░██▄▄▄▄██ ░▓█▒  ░░▓█▒  ░ ░ ▓██▓ ░ ▓██ █▄░██▄▄▄▄██     //
//    ░▓█▒░██▓ ▓█   ▓██▒░▒█░   ░▒█░      ▒██▒ ░ ▒██▒ █▄▓█   ▓██▒    //
//     ▒ ░░▒░▒ ▒▒   ▓▒█░ ▒ ░    ▒ ░      ▒ ░░   ▒ ▒▒ ▓▒▒▒   ▓▒█░    //
//     ▒ ░▒░ ░  ▒   ▒▒ ░ ░      ░          ░    ░ ░▒ ▒░ ▒   ▒▒ ░    //
//     ░  ░░ ░  ░   ▒    ░ ░    ░ ░      ░      ░ ░░ ░  ░   ▒       //
//     ░  ░  ░      ░  ░                        ░  ░        ░  ░    //
//                                                                  //
//                                                                  //
//                                                                  //
//                                                                  //
//////////////////////////////////////////////////////////////////////


contract HAFFDOI is ERC1155Creator {
    constructor() ERC1155Creator("Declaration of Independence", "HAFFDOI") {}
}