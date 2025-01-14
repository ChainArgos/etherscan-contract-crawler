// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Checks VS
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                      //
//                                                                                                                                                      //
//                                                                                                                                                      //
//        ,o888888o.    8 8888        8 8 8888888888       ,o888888o.    8 8888     ,88'   d888888o.             `8.`888b           ,8' d888888o.       //
//       8888     `88.  8 8888        8 8 8888            8888     `88.  8 8888    ,88'  .`8888:' `88.            `8.`888b         ,8'.`8888:' `88.     //
//    ,8 8888       `8. 8 8888        8 8 8888         ,8 8888       `8. 8 8888   ,88'   8.`8888.   Y8             `8.`888b       ,8' 8.`8888.   Y8     //
//    88 8888           8 8888        8 8 8888         88 8888           8 8888  ,88'    `8.`8888.                  `8.`888b     ,8'  `8.`8888.         //
//    88 8888           8 8888        8 8 888888888888 88 8888           8 8888 ,88'      `8.`8888.                  `8.`888b   ,8'    `8.`8888.        //
//    88 8888           8 8888        8 8 8888         88 8888           8 8888 88'        `8.`8888.                  `8.`888b ,8'      `8.`8888.       //
//    88 8888           8 8888888888888 8 8888         88 8888           8 888888<          `8.`8888.                  `8.`888b8'        `8.`8888.      //
//    `8 8888       .8' 8 8888        8 8 8888         `8 8888       .8' 8 8888 `Y8.    8b   `8.`8888.                  `8.`888'     8b   `8.`8888.     //
//       8888     ,88'  8 8888        8 8 8888            8888     ,88'  8 8888   `Y8.  `8b.  ;8.`8888                   `8.`8'      `8b.  ;8.`8888     //
//        `8888888P'    8 8888        8 8 888888888888     `8888888P'    8 8888     `Y8. `Y8888P ,88P'                    `8.`        `Y8888P ,88P'     //
//                                                                                                                                                      //
//                                                                                                                                                      //
//                                                                                                                                                      //
//                                                                                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract CHKVS is ERC1155Creator {
    constructor() ERC1155Creator("Checks VS", "CHKVS") {}
}