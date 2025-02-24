// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Killian Moore - Editions
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                                                                     //
//                                                                     //
//    '  ██╗  ██╗██╗██╗     ██╗     ██╗ █████╗ ███╗   ██╗              //
//    '  ██║ ██╔╝██║██║     ██║     ██║██╔══██╗████╗  ██║              //
//    '  █████╔╝ ██║██║     ██║     ██║███████║██╔██╗ ██║              //
//    '  ██╔═██╗ ██║██║     ██║     ██║██╔══██║██║╚██╗██║              //
//    '  ██║  ██╗██║███████╗███████╗██║██║  ██║██║ ╚████║              //
//    '  ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝              //
//    '  ███╗   ███╗ ██████╗  ██████╗ ██████╗ ███████╗                 //
//    '  ████╗ ████║██╔═══██╗██╔═══██╗██╔══██╗██╔════╝                 //
//    '  ██╔████╔██║██║   ██║██║   ██║██████╔╝█████╗      █████╗       //
//    '  ██║╚██╔╝██║██║   ██║██║   ██║██╔══██╗██╔══╝      ╚════╝       //
//    '  ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║  ██║███████╗                 //
//    '  ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝                 //
//    '  ███████╗██████╗ ██╗████████╗██╗ ██████╗ ███╗   ██╗███████╗    //
//    '  ██╔════╝██╔══██╗██║╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝    //
//    '  █████╗  ██║  ██║██║   ██║   ██║██║   ██║██╔██╗ ██║███████╗    //
//    '  ██╔══╝  ██║  ██║██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║    //
//    '  ███████╗██████╔╝██║   ██║   ██║╚██████╔╝██║ ╚████║███████║    //
//    '  ╚══════╝╚═════╝ ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝    //
//    '                                                                //
//                                                                     //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////


contract KMED is ERC721Creator {
    constructor() ERC721Creator("Killian Moore - Editions", "KMED") {}
}