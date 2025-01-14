// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: rughero.eth
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////
//                                                                   //
//                                                                   //
//                                                                   //
//    ######  #     #  #####     #     # ####### ######  #######     //
//    #     # #     # #     #    #     # #       #     # #     #     //
//    #     # #     # #          #     # #       #     # #     #     //
//    ######  #     # #  ####    ####### #####   ######  #     #     //
//    #   #   #     # #     #    #     # #       #   #   #     #     //
//    #    #  #     # #     #    #     # #       #    #  #     #     //
//    #     #  #####   #####     #     # ####### #     # #######     //
//                                                                   //
//                                                                   //
//                                                                   //
///////////////////////////////////////////////////////////////////////


contract rughero is ERC1155Creator {
    constructor() ERC1155Creator("rughero.eth", "rughero") {}
}