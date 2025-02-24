// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Nuh Milo Editions
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                            ,            ,                   ███▓╥                          //
//                         ,▓███▌        ]███▌        ▓█▓       ▀████                         //
//                         ██████▌       ╫████       ████▌        ████                        //
//                         ████████      █████      ]█████        ████µ                       //
//                        j███  ╙███     █████▌     ████████▓▄▓████████                       //
//                        ▐███    ╙███▓▄███████    ]████████████▀▀▀▀███µ                      //
//                        ╟███      ─╙▀███▀▀███    ███▀╫███▌        ▐███                      //
//                        ╟███              ╙████████Γ ╟███⌐         ███▌                     //
//                        └███                ▀████▀└  ▐███▌         ████▌                    //
//                 ▄██▄     └                          ▐███▌          └▀▀      ,▄▄███▄        //
//                ▐████         ████      ▄▄▄      ▄██▌ ╙█▀¬               ,▄██████▀▀         //
//                █████▌      ,█████     ╟███      ████                  ╓███████████▄        //
//               ▓█████▌     ╓██████     ╟███      ███▌                 ████▀╙╙╙╙╙╙╙████      //
//              ╓███████    ▄███████     ▐███      ███▌               ╓███▀          ╙███▄    //
//              ███ ╟███   ▓███└████     j███      ███▌              ╒███▌            ▐███    //
//             ███▌  ███▌,████  ╟███      ███      ███Γ              ████             ╫███    //
//            ████   ╟███████   ▐███      ███▌     ███⌐             ,███▌            ╓███─    //
//          ,████▌    █████▀     ████     ████▄    ████   ,,▄▄▄▓▓████████           ▓███─     //
//         ██████       └        █████▌   ╟████    ███████████████████████       ,▓███▀       //
//        ▐█████▌                ╙████⌐    ╙▀▀└    █████▀▀▀╙└─        ▀█████████████▀─        //
//        █████Γ                  ╙▀▀└                                  ╙▀▀█████▀▀╙           //
//         ▀██─                                                                               //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract NME is ERC1155Creator {
    constructor() ERC1155Creator("Nuh Milo Editions", "NME") {}
}