// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Oddtraits
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////
//                                                      //
//                                                      //
//    ♥♡♥(ꈍᴗꈍ)ε｀*)♥♡♥ ✦ aͣoͦiͥfeͤ ✦ ♥♡♥(ꈍᴗꈍ)ε｀*)♥♡♥     //
//                                                      //
//      ░█████╗░░█████╗░██╗███████╗███████╗             //
//      ██╔══██╗██╔══██╗██║██╔════╝██╔════╝             //
//      ███████║██║░░██║██║█████╗░░█████╗░░             //
//      ██╔══██║██║░░██║██║██╔══╝░░██╔══╝░░             //
//      ██║░░██║╚█████╔╝██║██║░░░░░███████╗             //
//      ╚═╝░░╚═╝░╚════╝░╚═╝╚═╝░░░░░╚══════╝             //
//                                                      //
//    ♥♡♥(ꈍᴗꈍ)ε｀*)♥♡♥ ✦ aͣoͦiͥfeͤ ✦ ♥♡♥(ꈍᴗꈍ)ε｀*)♥♡♥     //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
//////////////////////////////////////////////////////////


contract ODDS is ERC1155Creator {
    constructor() ERC1155Creator("Oddtraits", "ODDS") {}
}