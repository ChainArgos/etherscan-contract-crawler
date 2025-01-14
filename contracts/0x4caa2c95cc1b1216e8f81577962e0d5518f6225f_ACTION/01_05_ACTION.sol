// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: ACTION PEPE
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                           //
//                                                                                           //
//                                                                                           //
//     █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗    ██████╗ ███████╗██████╗ ███████╗    //
//    ██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔════╝██╔══██╗██╔════╝    //
//    ███████║██║        ██║   ██║██║   ██║██╔██╗ ██║    ██████╔╝█████╗  ██████╔╝█████╗      //
//    ██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║    ██╔═══╝ ██╔══╝  ██╔═══╝ ██╔══╝      //
//    ██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║    ██║     ███████╗██║     ███████╗    //
//    ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝     ╚══════╝╚═╝     ╚══════╝    //
//                                                                                           //
//                                                                                           //
//                                                                                           //
//                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////


contract ACTION is ERC1155Creator {
    constructor() ERC1155Creator("ACTION PEPE", "ACTION") {}
}