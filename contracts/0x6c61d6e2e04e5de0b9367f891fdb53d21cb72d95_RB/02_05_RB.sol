// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Rock Badger
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//                                                                           //
//    _____  ____  ____  __  __    _____   ____   ____  ____  ____ _____     //
//    | () )/ () \/ (__`|  |/  /   | () ) / () \ | _) \/ (_,`| ===|| () )    //
//    |_|\_\\____/\____)|__|\__\   |_()_)/__/\__\|____/\____)|____||_|\_\    //
//                                                                           //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////


contract RB is ERC721Creator {
    constructor() ERC721Creator("Rock Badger", "RB") {}
}