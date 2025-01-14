// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: DotConnector Event Editions
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//     _______                     __        _______     __ __ __   __                        //
//    |    ___|.--.--.-----.-----.|  |_     |    ___|.--|  |__|  |_|__|.-----.-----.-----.    //
//    |    ___||  |  |  -__|     ||   _|    |    ___||  _  |  |   _|  ||  _  |     |__ --|    //
//    |_______| \___/|_____|__|__||____|    |_______||_____|__|____|__||_____|__|__|_____|    //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract EvEd is ERC1155Creator {
    constructor() ERC1155Creator("DotConnector Event Editions", "EvEd") {}
}