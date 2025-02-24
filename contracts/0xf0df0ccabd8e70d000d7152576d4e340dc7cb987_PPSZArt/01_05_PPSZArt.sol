// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: PaperedPeace Art OE
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                       //
//                                                                                                       //
//     ____   ____  ____   ___  ____     ___  ___     ____   ___   ____    __    ___     ..eeeee..       //
//    |    \ /    ||    \ /  _]|    \   /  _]|   \   |    \ /  _] /    |  /  ]  /  _]  e0"   @   "0e     //
//    |  o  )  o  ||  o  )  [_ |  D  ) /  [_ |    \  |  o  )  [_ |  o  | /  /  /  [_   e0"   @   "0e     //
//    |   _/|     ||   _/    _]|    / |    _]|  D  | |   _/    _]|     |/  /  |    _] 0!     @     !0    //
//    |  |  |  _  ||  | |   [_ |    \ |   [_ |     | |  | |   [_ |  _  /   \_ |   [_  0!   .dWb.   !0    //
//    |  |  |  |  ||  | |     ||  .  \|     ||     | |  | |     ||  |  \     ||     | Y0 .e* @ *e. 0P    //
//    |__|  |__|__||__| |_____||__|\_||_____||_____| |__| |_____||__|__|\____||_____|  z0*   @   *0z     //
//                                                     Paper Mosaic Art from Shando Z    "[email protected]"       //
//                                                                                                       //
//                                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////


contract PPSZArt is ERC1155Creator {
    constructor() ERC1155Creator("PaperedPeace Art OE", "PPSZArt") {}
}