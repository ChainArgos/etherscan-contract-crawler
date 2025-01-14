// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: HOPE | Art Collection
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
//                                                                                                              //
//    #     # ####### ######  #######                                                                           //
//    #     # #     # #     # #         #      #   #  ####  #    #    #      # #    # ######    # #####         //
//    #     # #     # #     # #         #       # #  #    # #    #    #      # #   #  #         #   #           //
//    ####### #     # ######  #####   #####      #   #    # #    #    #      # ####   #####     #   #           //
//    #     # #     # #       #         #        #   #    # #    #    #      # #  #   #         #   #   ###     //
//    #     # #     # #       #         #        #   #    # #    #    #      # #   #  #         #   #   ###     //
//    #     # ####### #       #######            #    ####   ####     ###### # #    # ######    #   #   ###     //
//                                                                                                              //
//                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract HOPE is ERC1155Creator {
    constructor() ERC1155Creator("HOPE | Art Collection", "HOPE") {}
}