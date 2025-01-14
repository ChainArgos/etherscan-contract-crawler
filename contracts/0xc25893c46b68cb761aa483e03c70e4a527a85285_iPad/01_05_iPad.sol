// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Memeditions by iPadkid
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//    ██╗██████╗  █████╗ ██████╗ ██╗  ██╗██╗██████╗                             //
//    ██║██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝██║██╔══██╗                            //
//    ██║██████╔╝███████║██║  ██║█████╔╝ ██║██║  ██║                            //
//    ██║██╔═══╝ ██╔══██║██║  ██║██╔═██╗ ██║██║  ██║                            //
//    ██║██║     ██║  ██║██████╔╝██║  ██╗██║██████╔╝                            //
//    ╚═╝╚═╝     ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝                             //
//    ██████████████████████████████████████████████████████████████████████    //
//    ██████████████████████▓▓▓▓██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████████████████    //
//    ████████████████████▓▓▒▒▒▒██░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░████████████████    //
//    ████████████████████▒▒▒▒▒▒██░░▒▒▒▒▒▒▒▒▓▓▓▓▒▒▒▒████▒▒░░████████████████    //
//    ████████████████████▒▒▒▒▒▒██░░░▒▒▒░░░░▓▓▓▓▒▒░░▒▒██▒▒░░████████████████    //
//    ████████████████████▒▒▒▒▒▒██░░░▒▒▒░░░░▓▓▓▓▒▒░░▓▓██▒▒░░████████████████    //
//    ████████████████████▒▒▒▒▒▒██░░░▒▒▒░░░░▓▓▓▓▒▒▒▒████▒▒░░████████████████    //
//    ████████████████████▒▒▒▒▒▒██░░░▒▒▒░░░░▓▓▓▓▒▒▒▒████▒▒░░████████████████    //
//    ████████████████████▒▒▒▒▒▒██░░░▒▒▒░░░░▓▓▓▓▒▒▒▒████▒▒░░████████████████    //
//    ██████████▒▒▒▒▓▓▓▓██▒▒▒▒▒▒██░░░▒▒▒░░░░▓▓▓▓▒▒▒▒████▒▒░░████████████████    //
//    ████████▒▒▒▒▓▓██████▒▒▒▒▒▒██░░░░░░░░░░░▒░▒░░░░▒▒▒▒░░░░████████████████    //
//    ████████▒▒████████████▒▒▒▒██░░░░░░░░░░░░░░░░░░▒▒░░▒▒░░████████████████    //
//    ████████▒▒██████████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓██▓▓████████████████    //
//    ████████▒▒██████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓██████████████████████    //
//    ████████▒▒██████████▒▒▒▒▒▒▒▒▒▒░░░░▓▓██▓▓▓▓▒▒▒▒▒▒██▒▒██████████████████    //
//    ████████▒▒████████▓▓▒▒▒▒▒▒▒▒░░░░░░░░▒▒██▓▓▒▒▒▒▓█▒▒░░██████████████████    //
//    ████████▒▒▒▒██████▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒██████▒▒░░░░██████████████████    //
//    ██████████▒▒▒▒████▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░▒▒▒▒▒▒░░░░░░██████████████████    //
//    ████████████▒▒▓▓██████████▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▓▓████████████████    //
//    ██████████████████▓▓▓▓▓▓▓▓██▒▒▒▒░░░░░░░░░░░░░░░░░░▒▒▒▒████████████████    //
//    ████████████████▓▓▒▒▒▒▒▒▒▒▓▓██▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▒▒████████████████    //
//    ████████████████▓▓▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▓▓▓▓▓▓▒▒████████████████    //
//    ██████████████████▓▓▒▒▒▒▒▒██▓▓▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▓▓▓▓▓▓▒▒████████████████    //
//    ██████████████████████████▓▓▒▒▒▒░░░░▒▒▒▒░░░░░░▒▒▒▒░░░░████████████████    //
//    ████████████████████████████▒▒▒▒▒▒░░░░▒▒▓▓▓▓▓▓▒▒░░░░▓▓████████████████    //
//    ████████████████████▓▓▓▓▓▓████▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▓▓██████████████████    //
//    ██████████████████▓▓░░░░▒▒▓▓██████▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████████████████████    //
//    ████████████████▓▓░░░░░░░░▒▒████▓▓████████████████████████████████████    //
//    ████████████████░░░░░░░░░░▒▒██▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████████████████████    //
//    ██████████████▒▒░░░░░░░░▒▒██▒▒░░░░▒▒▒▒▒▒▓▓▒▒██▓▓██████████████████████    //
//    ██████████████░░░░░░░░▒▒██▓▓░░░░░░░░░░░░░░▒▒██▒▒██████████████████████    //
//    ████████████▒▒░░░░░░▒▒██▓▓▒▒▒▒░░░░░░░░░░▒▒██▓▓▒▒██████████████████████    //
//    ████████████░░░░░░▒▒▒▒██▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒██▒▒▒▒██████████████████████    //
//                                                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////


contract iPad is ERC1155Creator {
    constructor() ERC1155Creator("Memeditions by iPadkid", "iPad") {}
}