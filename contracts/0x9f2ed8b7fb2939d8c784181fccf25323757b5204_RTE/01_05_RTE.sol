// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Ricardo Takamura Editions
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                               //
//                                                                                                                                                                                               //
//    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    //
//    //                                                                                                                                                                                   //    //
//    //                                                                                                                                                                                   //    //
//    //                                                                                ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄                                                                                //    //
//    //                                                                           ▄▄████▀▀███▀▀███▀▀███▀▀████▄▄                                                                           //    //
//    //                                                                       ▄▄███▄▄███████████████████████▄▄███▄▄                                                                       //    //
//    //                                                               ▄▄▄█▀▀▀▀▀▀▀▀                             ▀▀▀▀▀▀▀▀█▄▄▄                                                               //    //
//    //                                                           ▄▄█▀▀         ▄▄▄▄▄▄█████████████████████▄▄▄▄▄▄         ▀▀█▄▄                                                           //    //
//    //                                                         ▄█▀      ▄▄▄████████████████▀▀▀▀▀▀▀▀▀████████████████▄▄▄      ▀█▄                                                         //    //
//    //                                                         ▀█▄     ██████████████▀▀                 ▀▀██████████████     ▄█▀                                                         //    //
//    //                                                           ▀▀█▄▄  ▀▀███████▀▀                         ▀▀███████▀▀  ▄▄█▀▀                                                           //    //
//    //                                                               ▀▀▀▀█▄▄▄▄▄▌                               ▐▄▄▄▄▄█▀▀▀▀                                                               //    //
//    //                                                                        ▐                                 ▌                                                                        //    //
//    //                                                                        ▐                                 ▌                                                                        //    //
//    //                                                                        ▌                                 ▐                                                                        //    //
//    //                                                                        ▌                                 ▐                                                                        //    //
//    //                                                                       ▐                                   ▌                                                                       //    //
//    //                                                                       ▐                                   ▌                                                                       //    //
//    //                                                                                                                                                                                   //    //
//    //     ▐████████████████        ▐█████         █████▌     ██████▌        ▐█████         ████████       ▐███████▌  █████▌         █████▌  █████████████▌            ▐█████            //    //
//    //     ▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓        ▓▓▓▓▓▓▌        ▓▓▓▓▓▌    ▓▓▓▓▓▌          ▓▓▓▓▓▓▌        ▓▓▓▓▓▓▓▓▌      ▓▓▓▓▓▓▓▓▌  ▓▓▓▓▓▌         ▓▓▓▓▓▌  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌           ▓▓▓▓▓▓▌           //    //
//    //           ▓▓▓▓▓▌            ▓▓▓▓▓▓▓▓▌       ▓▓▓▓▓▌   ▓▓▓▓▓▌          ▓▓▓▓▓▓▓▓▌       ▓▓▓▓▓▓▓▓▓▌    ▓▓▓▓▓▓▓▓▓▌  ▓▓▓▓▓▌         ▓▓▓▓▓▌  ▓▓▓▓▓▌    ▓▓▓▓▓▌         ▓▓▓▓▓▓▓▓▌          //    //
//    //           ▓▓▓▓▓▌           ▓▓▓▓▌ ▓▓▓▓▌      ▓▓▓▓▓▌  ▓▓▓▓▌           ▓▓▓▓▌ ▓▓▓▓▌      ▓▓▓▓▓▌▓▓▓▓▌  ▓▓▓▓▌▓▓▓▓▓▌  ▓▓▓▓▓▌         ▓▓▓▓▓▌  ▓▓▓▓▓▌    ▓▓▓▓▌         ▓▓▓▓▌ ▓▓▓▓▌         //    //
//    //           ▓▓▓▓▓▌          ▓▓▓▓▌   ▓▓▓▓▌     ▓▓▓▓▓▓▓▓▓▓▓▓▌          ▓▓▓▓▌   ▓▓▓▓▌     ▓▓▓▓▓▌ ▓▓▓▓▌▓▓▓▓▌ ▓▓▓▓▓▌  ▓▓▓▓▓▌         ▓▓▓▓▓▌  ▓▓▓▓▓▓▓▓▓▓▓▓▓▌         ▓▓▓▓▌   ▓▓▓▓▌        //    //
//    //           ▓▓▓▓▓▌         ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌    ▓▓▓▓▓▌  ▓▓▓▓▓▌        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌    ▓▓▓▓▓▌  ▓▓▓▓▓▓▓▌  ▓▓▓▓▓▌   ▓▓▓▓▓▌       ▓▓▓▓▓▌   ▓▓▓▓▓▌  ▓▓▓▓▓▓▌       ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌       //    //
//    //           ▓▓▓▓▓▌        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌   ▓▓▓▓▓▌    ▓▓▓▓▓▌     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌   ▓▓▓▓▓▌   ▓▓▓▓▓▌   ▓▓▓▓▓▌    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌    ▓▓▓▓▓▌    ▓▓▓▓▓▌     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌      //    //
//    //           ▓▓▓▓▓▌       ▓▓▓▓▓▌       ▓▓▓▓▓▌  ▓▓▓▓▓▌      ▓▓▓▓▓▌  ▓▓▓▓▓▌       ▓▓▓▓▓▌  ▓▓▓▓▓▌    ▓▓▓▌    ▓▓▓▓▓▌      ▓▓▓▓▓▓▓▓▓▓▓▓▌      ▓▓▓▓▓▌      ▓▓▓▓▓▌  ▓▓▓▓▓▌       ▓▓▓▓▓▌     //    //
//    //                                                                                                                                                                                   //    //
//    //                                                                     ▐                                       ▌                                                                     //    //
//    //                                                                     ▐                                       ▌                                                                     //    //
//    //                                                                     ▌                                       ▐                                                                     //    //
//    //                                                                     ▌                                       ▐                                                                     //    //
//    //                                                                    ▐                                         ▌                                                                    //    //
//    //                                                                    ▐                                         ▌                                                                    //    //
//    //                                                                    ▌                   ██                    ▐                                                                    //    //
//    //                                                                    ▌                  ▄▓▓▄                   ▐                                                                    //    //
//    //                                                                   ▐                  ▐▓▓▓▓▌                   ▌                                                                   //    //
//    //                                                                   ▐                  ▐▓▓▓▓▌                   ▌                                                                   //    //
//    //                                                                   ▌                  ▐▓▓▓▓▌                   ▐                                                                   //    //
//    //                                                                   ▌                   ▓▌▐▓                    ▐                                                                   //    //
//    //                                                                                       ▓▌▐▓                                                                                        //    //
//    //                                                                                       ▓▌▐▓                                                                                        //    //
//    //                                                                                       ▓▌▐▓                                                                                        //    //
//    //                                                                                       ▀  ▀                                                                                        //    //
//    //                                                                                                                                                                                   //    //
//    //                                                                                                                                                                                   //    //
//    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    //
//                                                                                                                                                                                               //
//                                                                                                                                                                                               //
//                                                                                                                                                                                               //
//                                                                                                                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract RTE is ERC1155Creator {
    constructor() ERC1155Creator("Ricardo Takamura Editions", "RTE") {}
}