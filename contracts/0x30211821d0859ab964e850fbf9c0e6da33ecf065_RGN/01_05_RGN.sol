// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Regeneration
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                  //
//                                                                                                                  //
//      _____                                      _   _               _                   ___      _               //
//     |  __ \                                    | | (_)             | |                 / _ \    | |              //
//     | |__) |___  __ _  ___ _ __   ___ _ __ __ _| |_ _  ___  _ __   | |__  _   _    ___| | | | __| | ___  ___     //
//     |  _  // _ \/ _` |/ _ \ '_ \ / _ \ '__/ _` | __| |/ _ \| '_ \  | '_ \| | | |  / __| | | |/ _` |/ _ \/ __|    //
//     | | \ \  __/ (_| |  __/ | | |  __/ | | (_| | |_| | (_) | | | | | |_) | |_| | | (__| |_| | (_| |  __/\__ \    //
//     |_|  \_\___|\__, |\___|_| |_|\___|_|  \__,_|\__|_|\___/|_| |_| |_.__/ \__, |  \___|\___/ \__,_|\___||___/    //
//                  __/ |                                                     __/ |                                 //
//                 |___/                                                     |___/                                  //
//                                                                                                                  //
//                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract RGN is ERC1155Creator {
    constructor() ERC1155Creator("Regeneration", "RGN") {}
}