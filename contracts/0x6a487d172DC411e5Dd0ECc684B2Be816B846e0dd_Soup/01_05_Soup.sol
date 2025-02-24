// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Seethe' Sequences Soup
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//              _____                   _______                   _____                    _____              //
//             /\    \                 /::\    \                 /\    \                  /\    \             //
//            /::\    \               /::::\    \               /::\____\                /::\    \            //
//           /::::\    \             /::::::\    \             /:::/    /               /::::\    \           //
//          /::::::\    \           /::::::::\    \           /:::/    /               /::::::\    \          //
//         /:::/\:::\    \         /:::/~~\:::\    \         /:::/    /               /:::/\:::\    \         //
//        /:::/__\:::\    \       /:::/    \:::\    \       /:::/    /               /:::/__\:::\    \        //
//        \:::\   \:::\    \     /:::/    / \:::\    \     /:::/    /               /::::\   \:::\    \       //
//      ___\:::\   \:::\    \   /:::/____/   \:::\____\   /:::/    /      _____    /::::::\   \:::\    \      //
//     /\   \:::\   \:::\    \ |:::|    |     |:::|    | /:::/____/      /\    \  /:::/\:::\   \:::\____\     //
//    /::\   \:::\   \:::\____\|:::|____|     |:::|    ||:::|    /      /::\____\/:::/  \:::\   \:::|    |    //
//    \:::\   \:::\   \::/    / \:::\    \   /:::/    / |:::|____\     /:::/    /\::/    \:::\  /:::|____|    //
//     \:::\   \:::\   \/____/   \:::\    \ /:::/    /   \:::\    \   /:::/    /  \/_____/\:::\/:::/    /     //
//      \:::\   \:::\    \        \:::\    /:::/    /     \:::\    \ /:::/    /            \::::::/    /      //
//       \:::\   \:::\____\        \:::\__/:::/    /       \:::\    /:::/    /              \::::/    /       //
//        \:::\  /:::/    /         \::::::::/    /         \:::\__/:::/    /                \::/____/        //
//         \:::\/:::/    /           \::::::/    /           \::::::::/    /                  ~~              //
//          \::::::/    /             \::::/    /             \::::::/    /                                   //
//           \::::/    /               \::/____/               \::::/    /                                    //
//            \::/    /                 ~~                      \::/____/                                     //
//             \/____/                                           ~~                                           //
//                                                                                                            //
//    ___________                                                                                             //
//    Seethe' Sequences Soup . SeetheCool                                                                     //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract Soup is ERC721Creator {
    constructor() ERC721Creator("Seethe' Sequences Soup", "Soup") {}
}