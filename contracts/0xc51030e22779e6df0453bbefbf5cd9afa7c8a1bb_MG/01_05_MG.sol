// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Meta-Garbage Airdrop (1/1 Holders)
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//                                                                          //
//       `....                    `..                                       //
//     `.    `..                  `..                                       //
//    `..           `..    `. `...`..         `..       `..      `..        //
//    `..         `..  `..  `..   `.. `..   `..  `..  `..  `.. `.   `..     //
//    `..   `....`..   `..  `..   `..   `..`..   `.. `..   `..`..... `..    //
//     `..    `. `..   `..  `..   `..   `..`..   `..  `..  `..`.            //
//      `.....     `.. `...`...   `.. `..    `.. `...     `..   `....       //
//                                                     `..                  //
//                                                                          //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////


contract MG is ERC721Creator {
    constructor() ERC721Creator("Meta-Garbage Airdrop (1/1 Holders)", "MG") {}
}