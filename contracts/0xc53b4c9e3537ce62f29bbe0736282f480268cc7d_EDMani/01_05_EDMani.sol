// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: editions works by Manishahzadeh
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////
//                                                                                    //
//                                                                                    //
//      __  __             _    _____ _           _                  _      _         //
//     |  \/  |           (_)  / ____| |         | |                | |    | |        //
//     | \  / | __ _ _ __  _  | (___ | |__   __ _| |__  ______ _  __| | ___| |__      //
//     | |\/| |/ _` | '_ \| |  \___ \| '_ \ / _` | '_ \|_  / _` |/ _` |/ _ \ '_ \     //
//     | |  | | (_| | | | | |  ____) | | | | (_| | | | |/ / (_| | (_| |  __/ | | |    //
//     |_|  |_|\__,_|_| |_|_| |_____/|_| |_|\__,_|_| |_/___\__,_|\__,_|\___|_| |_|    //
//                                                                                    //
//                                                                                    //
//                                                                                    //
//                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////


contract EDMani is ERC721Creator {
    constructor() ERC721Creator("editions works by Manishahzadeh", "EDMani") {}
}