// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: glitched cartoons
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬▓½  ╝╣╣╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╣╬╣╬╣╬╬╬╬╣╬╬╬╣╬╬╬╬╬╬╬╣╬╬╣╣    //
//                                                                                     //
//                            ]╬╬▓▄╙  ,▄╬╬▄╣╬▓╗╗╣╬▓╗╗╣╣╣╣▓Æ╣╬╣▓▓╣╬╬╣╣╣╬╣╬▓▓╬╬╣╬╬╬╬╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╣╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╣L  ╫╬╣╬╣╣╣╬╬╬╬╣╬╬╬╬╬╬╬╣╬╣╬╣╣╬╬╬╣╬╬╬╣╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬▓╖╚⌐ ,▄╬╬▄╫╬╬▄▄╫╣▓▄▄╣▄╣╬▌╗╣╬╣╬╣▓╣╬╬╣╣╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╣L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╣╬╬╬L  ╫╬╣╣╣╬╬╬╬╬╬╬╬╬╬╬╬╣╣╣╬╣╬╣╬╬╬╬╣╬╬╬╬╬╬╬╣╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬▓╖╚⌐  ▄╬╣▄╟╬╣▄▄╟╬▓▄▄╫▄╣╬▌▄╢╬╣▓╣╣╣╬╬╣╬╬╬╬╣▓╬╬╬╬╬╬╬╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                            ]╬╬╬╬L  ╫╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╣╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣    //
//                                                                                     //
//                             ▀▀▀▀─  ╜▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀    //
//                                                                                     //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////


contract GC is ERC721Creator {
    constructor() ERC721Creator("glitched cartoons", "GC") {}
}