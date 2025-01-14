// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Seize The Bubble
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//      _________      .__                  __  .__             __________     ___.  ___.   .__              //
//     /   _____/ ____ |__|_______ ____   _/  |_|  |__   ____   \______   \__ _\_ |__\_ |__ |  |   ____      //
//     \_____  \_/ __ \|  \___   // __ \  \   __\  |  \_/ __ \   |    |  _/  |  \ __ \| __ \|  | _/ __ \     //
//     /        \  ___/|  |/    /\  ___/   |  | |   Y  \  ___/   |    |   \  |  / \_\ \ \_\ \  |_\  ___/     //
//    /_______  /\___  >__/_____ \\___  >  |__| |___|  /\___  >  |______  /____/|___  /___  /____/\___  >    //
//            \/     \/         \/    \/             \/     \/          \/          \/    \/          \/     //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract STB is ERC1155Creator {
    constructor() ERC1155Creator("Seize The Bubble", "STB") {}
}