// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Life Without Color
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////
//                                                                //
//                                                                //
//    ////////////////////////////////////////////////////////    //
//    //                                                    //    //
//    //                                                    //    //
//    //                                __   ___            //    //
//    //                             _,.`. \:/,"  `-._      //    //
//    //                         ,-*" _,.-;-*`-.+"*._ )     //    //
//    //                        ( ,."* ,-" / `.  \.  `.     //    //
//    //                       ,"   ,;"  ,"\../\  \:   \    //    //
//    //                      (   ,"/   / \.,' :   ))  /    //    //
//    //                       \  |/   / \.,'  /  // ,'     //    //
//    //                        \_)\ ,' \.,'  (  / )/       //    //
//    //                            `  \._,'   `"           //    //
//    //                               \../                 //    //
//    //                               \../                 //    //
//    //                               \../                 //    //
//    //                               \../                 //    //
//    //                               \../                 //    //
//    //   Life Without Color '23      \../                 //    //
//    //                                                    //    //
//    //                                                    //    //
//    //                                                    //    //
//    ////////////////////////////////////////////////////////    //
//                                                                //
//                                                                //
//                                                                //
////////////////////////////////////////////////////////////////////


contract WN3 is ERC721Creator {
    constructor() ERC721Creator("Life Without Color", "WN3") {}
}