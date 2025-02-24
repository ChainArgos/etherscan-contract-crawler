// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Resurrection - Genesis
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                                                                          //
//    __________                                                  __  .__                   //
//    \______   \ ____   ________ ________________   ____   _____/  |_|__| ____   ____      //
//     |       _// __ \ /  ___/  |  \_  __ \_  __ \_/ __ \_/ ___\   __\  |/  _ \ /    \     //
//     |    |   \  ___/ \___ \|  |  /|  | \/|  | \/\  ___/\  \___|  | |  (  <_> )   |  \    //
//     |____|_  /\___  >____  >____/ |__|   |__|    \___  >\___  >__| |__|\____/|___|  /    //
//            \/     \/     \/                          \/     \/                    \/     //
//    ___.           _________                     .__  .__                                 //
//    \_ |__ ___.__. \_   ___ \____________   __ __|  | |__| ____                           //
//     | __ <   |  | /    \  \/\_  __ \__  \ |  |  \  | |  |/    \                          //
//     | \_\ \___  | \     \____|  | \// __ \|  |  /  |_|  |   |  \                         //
//     |___  / ____|  \______  /|__|  (____  /____/|____/__|___|  /                         //
//         \/\/              \/            \/                   \/                          //
//                                                                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////


contract RSR is ERC1155Creator {
    constructor() ERC1155Creator("Resurrection - Genesis", "RSR") {}
}