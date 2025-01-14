// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Dark Depths of My Mind
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//       ╙▀██████████████████████████████████████████████████████████████████████████╬    //
//                                                                                        //
//     __   └╙████████████████████████████████████████████████████████████████████▓╬╬╩    //
//                                                                                        //
//    _  ,__    ╙▀█████████████████████████████████████████████████████████████▓╬╬╩╚Γ"    //
//                                                                                        //
//    Γ   "ε_____  ╙▀████████████████████████████████████████████████████████╬╬╩╙Γ___     //
//                                                                                        //
//    ██▄▄,  __]░φφ,   ╙▀██████████████████████████████████████████████████╬╬╩Γ__         //
//                                                                                        //
//    █████████▄`╚╣▒_     ╙▀█████████████████████████████████████████████╬╬╩Γ_            //
//                                                                                        //
//    ████████████▄╙δ,      _ ╙████████████████████████████████████████╬╬╩Γ               //
//                                                                                        //
//    ███████████████ç   ╔φ▓▄▄≤╓'▀██████████████████████████████████▓╬╩╙Γ_                //
//                                                                                        //
//    ████████████████▌  ╚╣╝╩╬╩╝╬≥_╙██████████████████████████████╬╬╩╙'                   //
//                                                                                        //
//    █████████████████▌ _ ▒ ]╕_"█,_╙███████████████████████████▓╬╩Γ_                     //
//                                                                                        //
//    ███████████████████▄▄█_ █ε_╫█▄  ████████████████████████╬╬╩╙_                       //
//                                                                                        //
//    ███████████████████████ ║█µ ███████████████████████████╬╩Γ_                         //
//                                                                                        //
//    ████████████████████████████████████████████████████╬╬╩Γ__                          //
//                                                                                        //
//    ██████████████████████████████████████████████████╬╩╙'_                             //
//                                                                                        //
//    ███████████████████████████████████████████████╬╬╩╙'_                               //
//                                                                                        //
//    ████████████████████████████████████████████▓╬╬╩Γ_                                  //
//                                                                                        //
//    ██████████████████████████████████████████╬╬╩╩Γ__                                   //
//                                                                                        //
//    ██████████████████████████████████████╬█╬╬╠▄#_                                      //
//                                                                                        //
//    ███████████████████████████████████████╝╝░╫╓█                                       //
//                                                                                        //
//    ██████████████████████████████████▄▓@▒▒▄M▀#▀                                        //
//                                                                                        //
//    █████████████████████████████████▓╬╬╩░'__¬                                          //
//                                                                                        //
//    ████████████████████████████████╬╬╩Γ'_                                              //
//                                                                                        //
//    █████████████████████████████▓╬╩╩Γ_                                                 //
//                                                                                        //
//    ████████████████████████████╬╬╩Γ_   _               ,   _                           //
//                                                                                        //
//    ██████████████████████████╬╬╩Γ__                ,  _╠▄  µ≥ .                        //
//                                                                                        //
//    ████████████████████████╬╬╩Γ_                   ╟█__╟▓▄ ╣▒½▐░                       //
//                                                                                        //
//    █████████████████████╬╬╩╙Γ_                     ║██¼ ╟█_╙▓░█▒▒_                     //
//                                                                                        //
//    █████████████████▓╬╬╬╩Γ'                         ╙██└Ç██▒╟█╣██▄_                    //
//                                                                                        //
//    ███████████████▓╬╬╬╩Γ'                            ╙█████▓▓██████_                   //
//                                                                                        //
//    ███████████████╬╬╩Γ_                                 ╙███████████▒_                 //
//                                                                                        //
//    █████████████╬╩╩░_                                     ▀╩▀█████████▒╗_,             //
//                                                                                        //
//    ███████████╬╩╙'   _                                        ╙▀███████████▓╦_         //
//                                                                                        //
//    ████████╬╬╩╙                                                  ╙▀███████████████▓    //
//                                                                                        //
//    ██████╬╬╩Γ                                                       ███████████████    //
//                                                                                        //
//    ████╬╩╩'                                                           ╙≥╙╙█████████    //
//                                                                                        //
//    ██╬╩╙                                                                   '╙▀█████    //
//                                                                                        //
//    ╜╙"                                                                       "²ⁿ─└╙    //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract BNW is ERC721Creator {
    constructor() ERC721Creator("Dark Depths of My Mind", "BNW") {}
}