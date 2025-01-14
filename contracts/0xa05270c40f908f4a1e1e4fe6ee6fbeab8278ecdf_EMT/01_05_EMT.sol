// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Heart EmMadeThis
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////
//                                                                  //
//                                                                  //
//                                                                  //
//                                                                  //
//                                                                  //
//     ____  _  _  _  _   __   ____  ____  ____  _  _  __  ____     //
//    (  __)( \/ )( \/ ) / _\ (    \(  __)(_  _)/ )( \(  )/ ___)    //
//     ) _) / \/ \/ \/ \/    \ ) D ( ) _)   )(  ) __ ( )( \___ \    //
//    (____)\_)(_/\_)(_/\_/\_/(____/(____) (__) \_)(_/(__)(____/    //
//                                                                  //
//                                                                  //
//////////////////////////////////////////////////////////////////////


contract EMT is ERC721Creator {
    constructor() ERC721Creator("Heart EmMadeThis", "EMT") {}
}