// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Galactica by Leisha San
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////
//                                                                      //
//                                                                      //
//                                                                      //
//      ________       .__                 __  .__          _____       //
//     /  _____/_____  |  | _____    _____/  |_|__| ____   /  _  \      //
//    /   \  ___\__  \ |  | \__  \ _/ ___\   __\  |/ ___\ /  /_\  \     //
//    \    \_\  \/ __ \|  |__/ __ \\  \___|  | |  \  \___/    |    \    //
//     \______  (____  /____(____  /\___  >__| |__|\___  >____|__  /    //
//            \/     \/          \/     \/             \/        \/     //
//                                                                      //
//                                                                      //
//                                                                      //
//////////////////////////////////////////////////////////////////////////


contract GALACTICA is ERC721Creator {
    constructor() ERC721Creator("Galactica by Leisha San", "GALACTICA") {}
}