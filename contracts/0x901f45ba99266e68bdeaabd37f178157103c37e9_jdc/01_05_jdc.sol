// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: COLOMBO
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//           _____                   _______                   _____           _______                   _____                    _____                   _______                   //
//             /\    \                 /::\    \                 /\    \         /::\    \                 /\    \                  /\    \                 /::\    \               //
//            /::\    \               /::::\    \               /::\____\       /::::\    \               /::\____\                /::\    \               /::::\    \              //
//           /::::\    \             /::::::\    \             /:::/    /      /::::::\    \             /::::|   |               /::::\    \             /::::::\    \             //
//          /::::::\    \           /::::::::\    \           /:::/    /      /::::::::\    \           /:::::|   |              /::::::\    \           /::::::::\    \            //
//         /:::/\:::\    \         /:::/~~\:::\    \         /:::/    /      /:::/~~\:::\    \         /::::::|   |             /:::/\:::\    \         /:::/~~\:::\    \           //
//        /:::/  \:::\    \       /:::/    \:::\    \       /:::/    /      /:::/    \:::\    \       /:::/|::|   |            /:::/__\:::\    \       /:::/    \:::\    \          //
//       /:::/    \:::\    \     /:::/    / \:::\    \     /:::/    /      /:::/    / \:::\    \     /:::/ |::|   |           /::::\   \:::\    \     /:::/    / \:::\    \         //
//      /:::/    / \:::\    \   /:::/____/   \:::\____\   /:::/    /      /:::/____/   \:::\____\   /:::/  |::|___|______    /::::::\   \:::\    \   /:::/____/   \:::\____\        //
//     /:::/    /   \:::\    \ |:::|    |     |:::|    | /:::/    /      |:::|    |     |:::|    | /:::/   |::::::::\    \  /:::/\:::\   \:::\ ___\ |:::|    |     |:::|    |       //
//    /:::/____/     \:::\____\|:::|____|     |:::|    |/:::/____/       |:::|____|     |:::|    |/:::/    |:::::::::\____\/:::/__\:::\   \:::|    ||:::|____|     |:::|    |       //
//    \:::\    \      \::/    / \:::\    \   /:::/    / \:::\    \        \:::\    \   /:::/    / \::/    / ~~~~~/:::/    /\:::\   \:::\  /:::|____| \:::\    \   /:::/    /        //
//     \:::\    \      \/____/   \:::\    \ /:::/    /   \:::\    \        \:::\    \ /:::/    /   \/____/      /:::/    /  \:::\   \:::\/:::/    /   \:::\    \ /:::/    /         //
//      \:::\    \                \:::\    /:::/    /     \:::\    \        \:::\    /:::/    /                /:::/    /    \:::\   \::::::/    /     \:::\    /:::/    /          //
//       \:::\    \                \:::\__/:::/    /       \:::\    \        \:::\__/:::/    /                /:::/    /      \:::\   \::::/    /       \:::\__/:::/    /           //
//        \:::\    \                \::::::::/    /         \:::\    \        \::::::::/    /                /:::/    /        \:::\  /:::/    /         \::::::::/    /            //
//         \:::\    \                \::::::/    /           \:::\    \        \::::::/    /                /:::/    /          \:::\/:::/    /           \::::::/    /             //
//          \:::\    \                \::::/    /             \:::\    \        \::::/    /                /:::/    /            \::::::/    /             \::::/    /              //
//           \:::\____\                \::/____/               \:::\____\        \::/____/                /:::/    /              \::::/    /               \::/____/               //
//            \::/    /                 ~~                      \::/    /         ~~                      \::/    /                \::/____/                 ~~                     //
//             \/____/                                           \/____/                                   \/____/                  ~~                                              //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//                                                                                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract jdc is ERC721Creator {
    constructor() ERC721Creator("COLOMBO", "jdc") {}
}