// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Milk Tea
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////
//                                                        //
//                                                        //
//                                                        //
//     __  __  ____  __    _  _    ____  ____    __       //
//    (  \/  )(_  _)(  )  ( )/ )  (_  _)( ___)  /__\      //
//     )    (  _)(_  )(__  )  (     )(   )__)  /(__)\     //
//    (_/\/\_)(____)(____)(_)\_)   (__) (____)(__)(__)    //
//                                                        //
//                                                        //
//                                                        //
////////////////////////////////////////////////////////////


contract MT1155 is ERC1155Creator {
    constructor() ERC1155Creator("Milk Tea", "MT1155") {}
}