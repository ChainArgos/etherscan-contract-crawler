// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Ladybrown&SHIS
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  //
//                                                                                                  //
//    .-.     .--.  .----..-.  .-..----. .----.  .----. .-. . .-..-. .-. .----..-. .-..-. .----.    //
//    | |    / {} \ | {}  \\ \/ / | {}  }| {}  }/  {}  \| |/ \| ||  `| |{ {__  | {_} || |{ {__      //
//    | `--./  /\  \|     / }  {  | {}  }| .-. \\      /|  .'.  || |\  |.-._} }| { } || |.-._} }    //
//    `----'`-'  `-'`----'  `--'  `----' `-' `-' `----' `-'   `-'`-' `-'`----' `-' `-'`-'`----'     //
//                                                                                                  //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////


contract LBS is ERC1155Creator {
    constructor() ERC1155Creator("Ladybrown&SHIS", "LBS") {}
}