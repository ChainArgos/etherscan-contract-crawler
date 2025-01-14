// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: AImpasto Paintings
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////
//                                                                       //
//                                                                       //
//                                                                       //
//    ░█████╗░██╗███╗░░░███╗██████╗░░█████╗░░██████╗████████╗░█████╗░    //
//    ██╔══██╗██║████╗░████║██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗    //
//    ███████║██║██╔████╔██║██████╔╝███████║╚█████╗░░░░██║░░░██║░░██║    //
//    ██╔══██║██║██║╚██╔╝██║██╔═══╝░██╔══██║░╚═══██╗░░░██║░░░██║░░██║    //
//    ██║░░██║██║██║░╚═╝░██║██║░░░░░██║░░██║██████╔╝░░░██║░░░╚█████╔╝    //
//    ╚═╝░░╚═╝╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░░╚════╝░    //
//                                                                       //
//                                                                       //
///////////////////////////////////////////////////////////////////////////


contract AIMP is ERC721Creator {
    constructor() ERC721Creator("AImpasto Paintings", "AIMP") {}
}