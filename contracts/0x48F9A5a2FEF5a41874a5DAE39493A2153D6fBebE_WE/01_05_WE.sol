// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Whatever Edition
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////
//                //
//                //
//    WHATEVER    //
//                //
//                //
////////////////////


contract WE is ERC1155Creator {
    constructor() ERC1155Creator("Whatever Edition", "WE") {}
}