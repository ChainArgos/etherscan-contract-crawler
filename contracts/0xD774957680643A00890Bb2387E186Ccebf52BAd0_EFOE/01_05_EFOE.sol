// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Everfresh OE
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                               ╓▓███████▓╠░░░░░░░░░░░░░▄▓███████████████    //
//                                             ╓▓███████▀φ░░░░░░░░░░░░▄▓██████████████████    //
//                                            ▓███████▌░░░φ░░░░░░░≥▄▓████▀φφ╟█████████████    //
//                                          ╓██████████▓Γ░░░░≥░░½▓████▀#░░░░░φ╩▓██████████    //
//                                         ╔█████████████▌░░░≥▄▓███▓╠φ░░░░░░░░░░╚▀████████    //
//                                        ]████████████████▄▄████▀φ░░░░░░░░░░░░░∩,▓███████    //
//                                        ████╠░╣██████████████╬░░░░░░░░░░░░░░░▄▓█████████    //
//                                       ╫██▀░░░░░▓████████████▄░░φ≥≥≥░░░░░░▒▓████████████    //
//                                       ██▒░░░░░░φ╠█████████████▄░░░░░░░░▄▓██████████████    //
//                                       █φ░░░░░░░░░▓██████████████▌Γ░░Q▓█████████████████    //
//                                       ░░░░░░░░░▄███▓▀█████████████▌▓███████████████████    //
//        ▓████████▓▌▄▓███████████       φ░░░░≥"╥███▓▒░░░▀████████████████████████████████    //
//        ████████████████████████             ▓███╠░░░░░░░╬██████████████████████████████    //
//        ▓╙      └▀██████▌                  ,███▀░░░░░░░░░░φ╬████████████████████████████    //
//                  └█████▌                 ╓███▒░░░░░░░░░░≥"▄████████████████████████████    //
//                   ▐███████████▌          ██▓░░░░░░░░░≥" ▄████▀≥▀███████████████████████    //
//                   j███████████▌          ▓▓φ░░░░░░≥"  ╓▓███▀░░░░░╠▓████████████████████    //
//                   ▓████▌                  "░░░="    .▓███▀φ░░░░░░░∩ ▀██████████████████    //
//        µ        ,▓█████▌                           ▄███▓▒░░░░░░░"     ├████████████████    //
//        ██▌▄▄▄▄▄▓████████▄▄▄▄▄▄▄                   ▓███╬φ░░░░░"       ▄█████████████████    //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract EFOE is ERC1155Creator {
    constructor() ERC1155Creator("Everfresh OE", "EFOE") {}
}