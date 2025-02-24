// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Kashushu
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                     //
//                                                                                                     //
//                                                                                                     //
//         .                               .                                 .                         //
//       .'|                             .'|                               .'|                         //
//     .'  |                            <  |                              <  |                         //
//    <    |            __               | |                               | |                         //
//     |   | ____    .:--.'.         _   | | .'''-.     _    _         _   | | .'''-.     _    _       //
//     |   | \ .'   / |   \ |      .' |  | |/.'''. \   | '  / |      .' |  | |/.'''. \   | '  / |      //
//     |   |/  .    `" __ | |     .   | /|  /    | |  .' | .' |     .   | /|  /    | |  .' | .' |      //
//     |    /\  \    .'.''| |   .'.'| |//| |     | |  /  | /  |   .'.'| |//| |     | |  /  | /  |      //
//     |   |  \  \  / /   | |_.'.'.-'  / | |     | | |   `'.  | .'.'.-'  / | |     | | |   `'.         //
//                                                                                                     //
//                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////


contract Kk is ERC721Creator {
    constructor() ERC721Creator("Kashushu", "Kk") {}
}