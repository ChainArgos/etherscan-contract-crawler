// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Flakestate
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                                                                            //
//    ##########   ####               ###       ####     #################    //
//    #       ##    ##               #####       ##     ###     ##       #    //
//            ##    ##              ##  ###      ##   ##        ##            //
//       #######    ##             ##    ###     #####          #######       //
//            ##    ##        #   ###########    ##   ##        ##            //
//            ##    ##       ##  ##        ###   ##     ###     ##       #    //
//            ####################    ################   #################    //
//    ####         ##    ##     #    #####    #     ##    ##    ##       #    //
//      ####       #     ##         ##  ###         ##     #    ##            //
//         ####          ##        ##    ###        ##          #######       //
//            ###        ##       ###########       ##          ##            //
//    ###     ###        ##      ##        ###      ##          ##       #    //
//      #######        #############        ###   ######       ###########    //
//                                                                            //
//                         nature - that's the power                          //
//                              flakestate.com                                //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////


contract Music is ERC721Creator {
    constructor() ERC721Creator("Flakestate", "Music") {}
}