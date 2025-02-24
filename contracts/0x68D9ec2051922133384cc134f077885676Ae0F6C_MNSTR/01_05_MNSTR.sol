// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Gods and Monsters
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                               //
//                                                                                                                               //
//                                                                                                                               //
//       _____   ________    _______    _________________________________________    ________ ________  ________    _________    //
//      /     \  \_____  \   \      \  /   _____/\__    ___/\_   _____/\______   \  /  _____/ \_____  \ \______ \  /   _____/    //
//     /  \ /  \  /   |   \  /   |   \ \_____  \   |    |    |    __)_  |       _/ /   \  ___  /   |   \ |    |  \ \_____  \     //
//    /    Y    \/    |    \/    |    \/        \  |    |    |        \ |    |   \ \    \_\  \/    |    \|    `   \/        \    //
//    \____|__  /\_______  /\____|__  /_______  /  |____|   /_______  / |____|_  /  \______  /\_______  /_______  /_______  /    //
//            \/         \/         \/        \/                    \/         \/          \/         \/        \/        \/     //
//                                                                                                                               //
//                                                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract MNSTR is ERC1155Creator {
    constructor() ERC1155Creator("Gods and Monsters", "MNSTR") {}
}