// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: udunus
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                         //
//                                                                                                                                                         //
//              _____                   _____                   _____                   _____                   _____                   _____              //
//             /\    \                 /\    \                 /\    \                 /\    \                 /\    \                 /\    \             //
//            /::\____\               /::\    \               /::\____\               /::\____\               /::\____\               /::\    \            //
//           /:::/    /              /::::\    \             /:::/    /              /::::|   |              /:::/    /              /::::\    \           //
//          /:::/    /              /::::::\    \           /:::/    /              /:::::|   |             /:::/    /              /::::::\    \          //
//         /:::/    /              /:::/\:::\    \         /:::/    /              /::::::|   |            /:::/    /              /:::/\:::\    \         //
//        /:::/    /              /:::/  \:::\    \       /:::/    /              /:::/|::|   |           /:::/    /              /:::/__\:::\    \        //
//       /:::/    /              /:::/    \:::\    \     /:::/    /              /:::/ |::|   |          /:::/    /               \:::\   \:::\    \       //
//      /:::/    /      _____   /:::/    / \:::\    \   /:::/    /      _____   /:::/  |::|   | _____   /:::/    /      _____   ___\:::\   \:::\    \      //
//     /:::/____/      /\    \ /:::/    /   \:::\ ___\ /:::/____/      /\    \ /:::/   |::|   |/\    \ /:::/____/      /\    \ /\   \:::\   \:::\    \     //
//    |:::|    /      /::\____/:::/____/     \:::|    |:::|    /      /::\____/:: /    |::|   /::\____|:::|    /      /::\____/::\   \:::\   \:::\____\    //
//    |:::|____\     /:::/    \:::\    \     /:::|____|:::|____\     /:::/    \::/    /|::|  /:::/    |:::|____\     /:::/    \:::\   \:::\   \::/    /    //
//     \:::\    \   /:::/    / \:::\    \   /:::/    / \:::\    \   /:::/    / \/____/ |::| /:::/    / \:::\    \   /:::/    / \:::\   \:::\   \/____/     //
//      \:::\    \ /:::/    /   \:::\    \ /:::/    /   \:::\    \ /:::/    /          |::|/:::/    /   \:::\    \ /:::/    /   \:::\   \:::\    \         //
//       \:::\    /:::/    /     \:::\    /:::/    /     \:::\    /:::/    /           |::::::/    /     \:::\    /:::/    /     \:::\   \:::\____\        //
//        \:::\__/:::/    /       \:::\  /:::/    /       \:::\__/:::/    /            |:::::/    /       \:::\__/:::/    /       \:::\  /:::/    /        //
//         \::::::::/    /         \:::\/:::/    /         \::::::::/    /             |::::/    /         \::::::::/    /         \:::\/:::/    /         //
//          \::::::/    /           \::::::/    /           \::::::/    /              /:::/    /           \::::::/    /           \::::::/    /          //
//           \::::/    /             \::::/    /             \::::/    /              /:::/    /             \::::/    /             \::::/    /           //
//            \::/____/               \::/____/               \::/____/               \::/    /               \::/____/               \::/    /            //
//             ~~                      ~~                      ~~                      \/____/                 ~~                      \/____/             //
//                                                                                                                                                         //
//                                                                                                                                                         //
//                                                                                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract UDN is ERC721Creator {
    constructor() ERC721Creator("udunus", "UDN") {}
}