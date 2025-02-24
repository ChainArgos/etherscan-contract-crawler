// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: CARD VIP CLUB S.BINET
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                    //
//                                                                                                    //
//                                                                                                    //
//    _________ .____     ____ _____________  ____   ____._____________    _________   __________     //
//    \_   ___ \|    |   |    |   \______   \ \   \ /   /|   \______   \  /   _____/   \______   \    //
//    /    \  \/|    |   |    |   /|    |  _/  \   Y   / |   ||     ___/  \_____  \     |    |  _/    //
//    \     \___|    |___|    |  / |    |   \   \     /  |   ||    |      /        \    |    |   \    //
//     \______  /_______ \______/  |______  /    \___/   |___||____|     /_______  / /\ |______  /    //
//            \/        \/                \/                                     \/  \/        \/     //
//                                                                                                    //
//                                                                                                    //
//                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////


contract VIPCLUBSB is ERC721Creator {
    constructor() ERC721Creator("CARD VIP CLUB S.BINET", "VIPCLUBSB") {}
}