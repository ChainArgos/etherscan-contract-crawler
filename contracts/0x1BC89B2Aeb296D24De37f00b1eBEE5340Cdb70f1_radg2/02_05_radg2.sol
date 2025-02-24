// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: makeitrad || gmgn v2
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//     ___ __ __   ________   ___   ___   ______    ________  _________  ______    ________   ______          //
//    /__//_//_/\ /_______/\ /___/\/__/\ /_____/\  /_______/\/________/\/_____/\  /_______/\ /_____/\         //
//    \::\| \| \ \\::: _  \ \\::.\ \\ \ \\::::_\/_ \__.::._\/\__.::.__\/\:::_ \ \ \::: _  \ \\:::_ \ \        //
//     \:.      \ \\::(_)  \ \\:: \/_) \ \\:\/___/\   \::\ \    \::\ \   \:(_) ) )_\::(_)  \ \\:\ \ \ \       //
//      \:.\-/\  \ \\:: __  \ \\:. __  ( ( \::___\/_  _\::\ \__  \::\ \   \: __ `\ \\:: __  \ \\:\ \ \ \      //
//       \. \  \  \ \\:.\ \  \ \\: \ )  \ \ \:\____/\/__\::\__/\  \::\ \   \ \ `\ \ \\:.\ \  \ \\:\/.:| |     //
//        \__\/ \__\/ \__\/\__\/ \__\/\__\/  \_____\/\________\/   \__\/    \_\/ \_\/ \__\/\__\/ \____/_/     //
//                                                                                                            //
//                                                                                                            //
//               Artist, designer, pixel manipulator, looking at the world with childlike wonder.             //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract radg2 is ERC721Creator {
    constructor() ERC721Creator("makeitrad || gmgn v2", "radg2") {}
}