// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: BOTANICA. Darkness to Light
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                                                                     //
//     ____     ___    _______     .    __    _ _   ___      .         //
//     /   \  .'   `. '   /       /|    |\   |  | .'   \    /|         //
//     |,_-<  |     |     |      /  \   | \  |  | |        /  \        //
//     |    ` |     |     |     /---'\  |  \ |  | |       /---'\       //
//     `----'  `.__.'     /   ,'      \ |   \|  /  `.__,,'      \ /    //
//                                                                     //
//     .___                \                                           //
//     /   `    ___  .___  |   , , __     ___    ____   ____           //
//     |    |  /   ` /   \ |  /  |'  `. .'   `  (      (               //
//     |    | |    | |   ' |-<   |    | |----'  `--.   `--.            //
//     /---/  `.__/| /     /  \_ /    | `.___, \___.' \___.'           //
//                                                                     //
//      .                .              _       .                      //
//     _/_     __.       /     `   ___. /      _/_                     //
//      |    .'   \      |     | .'   ` |,---.  |                      //
//      |    |    |      |     | |    | |'   `  |                      //
//      \__/  `._.'      /---/ /  `---| /    |  \__/                   //
//                                \___/                                //
//                                                                     //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////


contract BDL is ERC721Creator {
    constructor() ERC721Creator("BOTANICA. Darkness to Light", "BDL") {}
}