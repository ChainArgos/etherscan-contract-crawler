// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Little Orbs
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
//      ████████╗██╗  ██╗███████╗    ██╗     ██╗████████╗████████╗██╗     ███████╗     ██████╗ ██████╗ ██████╗ ███████╗    //
//      ╚══██╔══╝██║  ██║██╔════╝    ██║     ██║╚══██╔══╝╚══██╔══╝██║     ██╔════╝    ██╔═══██╗██╔══██╗██╔══██╗██╔════╝    //
//         ██║   ███████║█████╗      ██║     ██║   ██║      ██║   ██║     █████╗      ██║   ██║██████╔╝██████╔╝███████╗    //
//         ██║   ██╔══██║██╔══╝      ██║     ██║   ██║      ██║   ██║     ██╔══╝      ██║   ██║██╔══██╗██╔══██╗╚════██║    //
//         ██║   ██║  ██║███████╗    ███████╗██║   ██║      ██║   ███████╗███████╗    ╚██████╔╝██║  ██║██████╔╝███████║    //
//         ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚══════╝╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝    //
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract TLO is ERC721Creator {
    constructor() ERC721Creator("The Little Orbs", "TLO") {}
}