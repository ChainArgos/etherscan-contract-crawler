// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: CactiCrew
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//         ▄▓██████▄µ    ▄▓██████▄µ          ,▄███████▄    ╓▄███████▄         //
//      ▄██▀└      ╙▀████▀└      ╙▀█▓      ▓█▀╙      └╙██▓█▀╙      └╙██▄      //
//     ██└          ╓▄█▄▄,          ▀█▄  ╔█▀          ,▄▄█▄▄,         └██     //
//    ██       ,▄████████████▄       ╟█─ █▌       ▄████████████▓,       ██    //
//    █▌     ╓██▀████████└  └▀█▌      █▌▐█─     ▄█▀╓████████   ╙██▄     ╟█    //
//    ██    ▄█▀ ╟████████      ██    ▐█▌╘█▌    ██' █████████     ╙█▌    ██    //
//    └██  ▐█▌  ╟████████████   ██  ╓█▌  ╙█▄  ██   ████████████▌  ╙█▌  ▓█─    //
//      ▀█▄██    ▀██████████─   ╟█▄██▀    ╙██▄█▌   └███████████    ██▄██      //
//     ▄█▀ ╟█      ▀▀████▀╙     ▓█ ╙██    ██▀ ██     ╙▀████▀▀'     █▌ ▀█▌     //
//    ▐█▀   ██                 ╓█▌   ██  ██   ╙█▄                 ▓█   ╙█▌    //
//    █▌     ██,              ▄█▀     █▌▐█b    ╙█▌              ,██─    ╟█    //
//    ██      ╙██▄         ▄▓█▀'     j█▌▐█▄      ▀██▄        ,▄██▀      ╫█    //
//    ╙█▄        ╙▀████████▀╙        ██  ██        ╙▀▀███████▀▀─       ╓█▌    //
//     ╙██           ▄██           ▄██    ▀█▄          ,▓█▄          ,▓█▀     //
//       ╙███▄▄▄▄▄▄██▀`╙███▄▄▄▄▄▄██▀─       ▀██▓▄▄▄▄▄▓██▀└▀██▄▄▄▄▄▄▓██▀       //
//          └╙╙▀▀╙└       └╙╙▀▀╙└              └╙╙▀╙╙─       └╙╙▀╙╙'          //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////


contract BEP is ERC721Creator {
    constructor() ERC721Creator("CactiCrew", "BEP") {}
}