// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The STAR
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                        //
//                                                                                                        //
//    ------------ ----    ---- ------------      ------------ ------------    ------    -----------      //
//    ************ ****    **** ************      ************ ************   ********   ***********      //
//    ------------ ----    ---- ----              ----         ------------  ----------  ----    ---      //
//        ****     ************ ************      ************     ****     ****    **** *********        //
//        ----     ------------ ------------      ------------     ----     ------------ ---------        //
//        ****     ****    **** ****                     *****     ****     ************ ****  ****       //
//        ----     ----    ---- ------------      ------------     ----     ----    ---- ----   ----      //
//        ****     ****    **** ************      ************     ****     ****    **** ****    ****     //
//                                                                                                        //
//                                                                                                        //
//                                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract STAR is ERC1155Creator {
    constructor() ERC1155Creator("The STAR", "STAR") {}
}