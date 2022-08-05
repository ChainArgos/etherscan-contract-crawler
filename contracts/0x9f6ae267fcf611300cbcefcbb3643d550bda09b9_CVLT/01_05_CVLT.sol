// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: thespacebetween
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                              //
//                                                                                                                                                              //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  (@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@     @@@@@@@@@@@@@@@@             @@@@@@@@@             @@@@@@@@@@@@@@     @@@@@@@@@@@@@     @@@@@@@  @@@@@@@@@     @@@     @@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@     @@@@@@@@@@@@@@@@     @@@@@(   @@@@@@@@     @@@@@@   @@@@@@@@@@@@@      @@@@@@@@@@@@     @@@@@@@@ @@@@@@@@@@     @@@     @@@@@@@@@@@@@@    //
//    @@@@@@@@@@@     @@@@@@@@@@@@@@@@     @@@@@@@( @@@@@@@@     @@@@@@@@ @@@@@@@@@@@@@ @    @@@@@@@@@@@@@    @@@@@@@@ @@@@@@@@@@@     @@@@   @@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@    @@@@@@@@@@@@@@@@@    @@@@@@@@@ @@@@@@@@    @@@@@@@@@ @@@@@@@@@@@@ @     @@@@@@@@@@@@     @@@@@@@  @@@@@@@@@@@     @@@  ,@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@     @@@@@@@@@@@@@@@@    *@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@ @@     @@@@@@@@@@@     @@@@@@@@ @@@@@@@@@@@@     @   @@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@     @@@@@   @@@@@@@@     @       @@@@@@@@@     @       @@@@@@@@@@@@@ @@     @@@@@@@@@@@     @@@@@@@@ @@@@@@@@@@@@@      @@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@    @@@@   @@@@@@@@@.            @@@@@@@@@@            @@@@@@@@@@@@@ @@@     @@@@@@@@@@@     @@@@@@@ @@@@@@@@@@@@@      @@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@     @@@    @@@@@@@@@     @@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@  @@@@    (@@@@@@@@@@     @@@@@@@  @@@@@@@@@@@@       @@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@     @@@     @@@@@@@@     @@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@  @@@@     @@@@@@@@@@     @@@@@@@@ @@@@@@@@@@@  @      @@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@     @@@@     @@@@@@@     @@@@@@@@@ @@@@@@@*    @@@@@@@@@ @@@@@@@@@   &@@@     @@@@@@@@@@    @@@@@@@@ @@@@@@@@@@   @@      @@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@    @@@@@    @@@@@@@@    @@@@@@@@@ @@@@@@@@    @@@@@@@@@ @@@@@@@@@            @@@@@@@@@@     @@@@@@@  @@@@@@@@    @@@      @@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@     @@@@     @@@@@@@    /@@@@@@@  @@@@@@@@     @@@@@@@  @@@@@@@@@  @@@@@@     @@@@@@@@@     @@@@@@@  @@@@@@@@    @@@@      @@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@     @@@@     @@@@@@@     @@@@@#   @@@@@@@@     @@@@@@   @@@@@@@@@  @@@@@@@     @@@@@@@@@     @@@@@@ @@@@@@@@@    @@@@@      @@@@@@@@@@@    //
//    @@@@@@@@@@@@@@     #       @@@@@@@@              @@@@@@@@               @@@@@@@@  @@@@@@@     @@@@@@@@@@%          @@@@@@@@@     @@@@@      @@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//                                                                                                                                                              //
//                                                                                                                                                              //
//                                                                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract CVLT is ERC1155Creator {
    constructor() ERC1155Creator() {}
}