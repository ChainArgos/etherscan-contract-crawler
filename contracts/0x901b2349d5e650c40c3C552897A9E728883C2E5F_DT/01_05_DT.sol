// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Degenerated Traders
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////
//                                                                                      //
//                                                                                      //
//    ________                                                   __             .___    //
//    \______ \   ____   ____   ____   ____   ________________ _/  |_  ____   __| _/    //
//     |    |  \_/ __ \ / ___\_/ __ \ /    \_/ __ \_  __ \__  \\   __\/ __ \ / __ |     //
//     |    `   \  ___// /_/  >  ___/|   |  \  ___/|  | \// __ \|  | \  ___// /_/ |     //
//    /_______  /\___  >___  / \___  >___|  /\___  >__|  (____  /__|  \___  >____ |     //
//            \/     \/_____/      \/     \/     \/           \/          \/     \/     //
//                                                                                      //
//                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////


contract DT is ERC1155Creator {
    constructor() ERC1155Creator("Degenerated Traders", "DT") {}
}