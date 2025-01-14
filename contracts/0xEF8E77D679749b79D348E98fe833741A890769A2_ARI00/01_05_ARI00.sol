// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: ARIMYNE0000
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////
//                                                                    //
//                                                                    //
//    (((((((((((((((((((((((((###########((((((((((((((((((((((((    //
//    (((((((((((((((((##(///////////**********##(((((((((((((((((    //
//    (((((((((((((#(////////////////////***********##((((((((((((    //
//    (((((((((((/////////////////////////*************/((((((((((    //
//    (((((((((/////////////////////////////**************((((((((    //
//    (((((((////////////////////(///////////******/********((((((    //
//    @@@@//////////////%@/////((@@@@#///////*******//********((((    //
//    @@@//////////(##@@@@@@##(((%@@@@(//////*****,(#////*&*****((    //
//    @@*///////////////@@//((((/@(@@@@(///***(#/////////%///****(    //
//    @*/////////////////#//((((@//(@@@@(//#****///////%//////////    //
//    @*////////////////////(((@((//(@@@@(///***///@%#////////////    //
//    @*///////(/////////////(@(((///#@@@@////**/*%##(////////////    //
//    /**/////(((///////////(@(((((///#@@@@///*%//////////////////    //
//    @**////((#(((/////////%@@@@@@@@@@@@@@@%**//////////////////*    //
//    @***//((#&%#(/////#/((///(((((((((%@@@@*//////////////////**    //
//    @,***//(#&%#(//(///@//////////*%///@@@@@*////////////////**/    //
//    @@.***//(#((/#//*@@///////*#(////***@@@@@*//////////////**,(    //
//    @@@.****//#(///@@&****,#/***********/@@@@@(////////////**,((    //
//    @@@@/***,/**//***,/#*******************/////////////****/(((    //
//    @@@@@@.*#*,*(#/***********************/////////*******,/((((    //
//    (((((((/,****************************//////////******/((((((    //
//    ((((((((((/**********************////////////////*/(((((((((    //
//    (((((((((((((/*/////////////////////////////////((((((((((((    //
//    (((((((((((((((((/////////////////(((((((///((((((((((((((((    //
//                                                                    //
//                                                                    //
////////////////////////////////////////////////////////////////////////


contract ARI00 is ERC1155Creator {
    constructor() ERC1155Creator("ARIMYNE0000", "ARI00") {}
}