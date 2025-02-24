// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Verifry'd
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////
//                                                                                 //
//                                                                                 //
//     __     __                     __   ______                     __     __     //
//    /  |   /  |                   /  | /      \                   /  |   /  |    //
//    $$ |   $$ | ______    ______  $$/ /$$$$$$  |______   __    __ $$/____$$ |    //
//    $$ |   $$ |/      \  /      \ /  |$$ |_ $$//      \ /  |  /  |$//    $$ |    //
//    $$  \ /$$//$$$$$$  |/$$$$$$  |$$ |$$   |  /$$$$$$  |$$ |  $$ | /$$$$$$$ |    //
//     $$  /$$/ $$    $$ |$$ |  $$/ $$ |$$$$/   $$ |  $$/ $$ |  $$ | $$ |  $$ |    //
//      $$ $$/  $$$$$$$$/ $$ |      $$ |$$ |    $$ |      $$ \__$$ | $$ \__$$ |    //
//       $$$/   $$       |$$ |      $$ |$$ |    $$ |      $$    $$ | $$    $$ |    //
//        $/     $$$$$$$/ $$/       $$/ $$/     $$/        $$$$$$$ |  $$$$$$$/     //
//                                                        /  \__$$ |               //
//                                                        $$    $$/                //
//                                                         $$$$$$/                 //
//                                                                                 //
//                                                                                 //
/////////////////////////////////////////////////////////////////////////////////////


contract Fryd is ERC721Creator {
    constructor() ERC721Creator("Verifry'd", "Fryd") {}
}