// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Che-Yu Wu Interactive Memes
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////
//                                                                                //
//                                                                                //
//       ______  __                  ____  ____         ____      ____            //
//     .' ___  |[  |                |_  _||_  _|       |_  _|    |_  _|           //
//    / .'   \_| | |--.  .---.  ______\ \  / /__   _     \ \  /\  / /__   _       //
//    | |        | .-. |/ /__\\|______|\ \/ /[  | | |     \ \/  \/ /[  | | |      //
//    \ `.___.'\ | | | || \__.,        _|  |_ | \_/ |,     \  /\  /  | \_/ |,     //
//     `.____ .'[___]|__]'.__.'       |______|'.__.'_/      \/  \/   '.__.'_/     //
//                                                                                //
//                                                                                //
//                                                                                //
////////////////////////////////////////////////////////////////////////////////////


contract MEMECYW is ERC1155Creator {
    constructor() ERC1155Creator("Che-Yu Wu Interactive Memes", "MEMECYW") {}
}