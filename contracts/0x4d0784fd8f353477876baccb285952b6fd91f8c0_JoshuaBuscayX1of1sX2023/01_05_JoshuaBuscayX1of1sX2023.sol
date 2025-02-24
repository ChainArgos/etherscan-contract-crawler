// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Joshua Buscay Photography 1 of 1s 2023
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                                                                          //
//                 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━                 //
//                 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━                 //
//                 ━━┏┓━━━━━━━━┏┓━━━━━━━━━━━━━━━┏━━┓━━━━━━━━━━━━━━━━━━━━━━━                 //
//                 ━━┃┃━━━━━━━━┃┃━━━━━━━━━━━━━━━┃┏┓┃━━━━━━━━━━━━━━━━━━━━━━━                 //
//                 ━━┃┃┏━━┓┏━━┓┃┗━┓┏┓┏┓┏━━┓━━━━━┃┗┛┗┓┏┓┏┓┏━━┓┏━━┓┏━━┓━┏┓━┏┓                 //
//                 ┏┓┃┃┃┏┓┃┃━━┫┃┏┓┃┃┃┃┃┗━┓┃━━━━━┃┏━┓┃┃┃┃┃┃━━┫┃┏━┛┗━┓┃━┃┃━┃┃                 //
//                 ┃┗┛┃┃┗┛┃┣━━┃┃┃┃┃┃┗┛┃┃┗┛┗┓━━━━┃┗━┛┃┃┗┛┃┣━━┃┃┗━┓┃┗┛┗┓┃┗━┛┃                 //
//                 ┗━━┛┗━━┛┗━━┛┗┛┗┛┗━━┛┗━━━┛━━━━┗━━━┛┗━━┛┗━━┛┗━━┛┗━━━┛┗━┓┏┛                 //
//                 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┏━┛┃━                 //
//                 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┗━━┛━                 //
//                 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━                 //
//    ━━━━┏━━━┓┏┓━━━━━━━┏┓━━━━━━━━━━━━━━━━━━━━━┏┓━━━━━━━━━━━━┏┓━━━━━━━━━━┏━┓━━━━━┏┓━━━━━    //
//    ━━━━┃┏━┓┃┃┃━━━━━━┏┛┗┓━━━━━━━━━━━━━━━━━━━━┃┃━━━━━━━━━━━┏┛┃━━━━━━━━━━┃┏┛━━━━┏┛┃━━━━━    //
//    ━━━━┃┗━┛┃┃┗━┓┏━━┓┗┓┏┛┏━━┓┏━━┓┏━┓┏━━┓━┏━━┓┃┗━┓┏┓━┏┓━━━━┗┓┃━━━━━┏━━┓┏┛┗┓━━━━┗┓┃━┏━━┓    //
//    ━━━━┃┏━━┛┃┏┓┃┃┏┓┃━┃┃━┃┏┓┃┃┏┓┃┃┏┛┗━┓┃━┃┏┓┃┃┏┓┃┃┃━┃┃━━━━━┃┃━━━━━┃┏┓┃┗┓┏┛━━━━━┃┃━┃━━┫    //
//    ━━━━┃┃━━━┃┃┃┃┃┗┛┃━┃┗┓┃┗┛┃┃┗┛┃┃┃━┃┗┛┗┓┃┗┛┃┃┃┃┃┃┗━┛┃━━━━┏┛┗┓━━━━┃┗┛┃━┃┃━━━━━┏┛┗┓┣━━┃    //
//    ━━━━┗┛━━━┗┛┗┛┗━━┛━┗━┛┗━━┛┗━┓┃┗┛━┗━━━┛┃┏━┛┗┛┗┛┗━┓┏┛━━━━┗━━┛━━━━┗━━┛━┗┛━━━━━┗━━┛┗━━┛    //
//    ━━━━━━━━━━━━━━━━━━━━━━━━━┏━┛┃━━━━━━━━┃┃━━━━━━┏━┛┃━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━    //
//    ━━━━━━━━━━━━━━━━━━━━━━━━━┗━━┛━━━━━━━━┗┛━━━━━━┗━━┛━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━    //
//                                    ━━━━━━━━━━━━━━━━━━━━                                  //
//                                    ┏━━━┓┏━━━┓┏━━━┓┏━━━┓                                  //
//                                    ┃┏━┓┃┃┏━┓┃┃┏━┓┃┃┏━┓┃                                  //
//                                    ┗┛┏┛┃┃┃ ┃┃┗┛┏┛┃┗┛┏┛┃                                  //
//                                    ┏━┛┏┛┃┃ ┃┃┏━┛┏┛┏┓┗┓┃                                  //
//                                    ┃ ┗━┓┃┗━┛┃┃ ┗━┓┃┗━┛┃                                  //
//                                    ┗━━━┛┗━━━┛┗━━━┛┗━━━┛                                  //
//                                    ━━━━━━━━━━━━━━━━━━━━                                  //
//                                    ━━━━━━━━━━━━━━━━━━━━                                  //
//                                            |[X]|                                         //
//                                     _.==._.""""".___n__                                  //
//                                    d━━━━━━━.-''-. ━━━━━b                                 //
//                                    ┃[__]  /."""".\ _   ┃                                 //
//                                    ┃     // /""\ \\_)  ┃                                 //
//                                    ┃     \\ \__/ //    ┃                                 //
//                                    ┃      \`.__.'/     ┃                                 //
//                                    \━━━━━━━`-..-'━━━━━━/                                 //
//                                     `-----------------'                                  //
//                                                                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////


contract JoshuaBuscayX1of1sX2023 is ERC721Creator {
    constructor() ERC721Creator("Joshua Buscay Photography 1 of 1s 2023", "JoshuaBuscayX1of1sX2023") {}
}