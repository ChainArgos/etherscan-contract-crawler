// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Momentum
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////
//                                                 //
//                                                 //
//      ____  _                _                   //
//     |  _ \| |__   ___   ___| |__  _   _ ___     //
//     | |_) | '_ \ / _ \ / _ \ '_ \| | | / __|    //
//     |  __/| | | | (_) |  __/ |_) | |_| \__ \    //
//     |_|   |_| |_|\___/ \___|_.__/ \__,_|___/    //
//                                                 //
//                                                 //
//                                                 //
//                                                 //
//                                                 //
//                                                 //
/////////////////////////////////////////////////////


contract PHBM is ERC721Creator {
    constructor() ERC721Creator("Momentum", "PHBM") {}
}