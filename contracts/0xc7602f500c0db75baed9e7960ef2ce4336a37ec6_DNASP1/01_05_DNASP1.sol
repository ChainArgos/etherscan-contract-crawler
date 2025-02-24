// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Dead NFT Artist Society Podcast Season 1
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                       //
//                                                                                                                                                       //
//    ______               _   _   _ ______ _____    ___       _   _     _     _____            _      _          ______         _               _       //
//    |  _  \             | | | \ | ||  ___|_   _|  / _ \     | | (_)   | |   /  ___|          (_)    | |         | ___ \       | |             | |      //
//    | | | |___  __ _  __| | |  \| || |_    | |   / /_\ \_ __| |_ _ ___| |_  \ `--.  ___   ___ _  ___| |_ _   _  | |_/ /__   __| | ___ __ _ ___| |_     //
//    | | | / _ \/ _` |/ _` | | . ` ||  _|   | |   |  _  | '__| __| / __| __|  `--. \/ _ \ / __| |/ _ \ __| | | | |  __/ _ \ / _` |/ __/ _` / __| __|    //
//    | |/ /  __/ (_| | (_| | | |\  || |     | |   | | | | |  | |_| \__ \ |_  /\__/ / (_) | (__| |  __/ |_| |_| | | | | (_) | (_| | (_| (_| \__ \ |_     //
//    |___/ \___|\__,_|\__,_| \_| \_/\_|     \_/   \_| |_/_|   \__|_|___/\__| \____/ \___/ \___|_|\___|\__|\__, | \_|  \___/ \__,_|\___\__,_|___/\__|    //
//                                                                                                          __/ |                                        //
//                                                                                                         |___/                                         //
//     _____                              __                                                                                                             //
//    /  ___|                            /  |                                                                                                            //
//    \ `--.  ___  __ _ ___  ___  _ __   `| |                                                                                                            //
//     `--. \/ _ \/ _` / __|/ _ \| '_ \   | |                                                                                                            //
//    /\__/ /  __/ (_| \__ \ (_) | | | | _| |_                                                                                                           //
//    \____/ \___|\__,_|___/\___/|_| |_| \___/                                                                                                           //
//                                                                                                                                                       //
//                                                                                                                                                       //
//                                                                                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract DNASP1 is ERC721Creator {
    constructor() ERC721Creator("Dead NFT Artist Society Podcast Season 1", "DNASP1") {}
}