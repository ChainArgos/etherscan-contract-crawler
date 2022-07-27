// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: cubes
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                     //
//                                                                                                                                     //
//                                                                                                                                     //
//              _____                    _____                    _____                    _____                    _____              //
//             /\    \                  /\    \                  /\    \                  /\    \                  /\    \             //
//            /::\    \                /::\____\                /::\    \                /::\    \                /::\    \            //
//           /::::\    \              /:::/    /               /::::\    \              /::::\    \              /::::\    \           //
//          /::::::\    \            /:::/    /               /::::::\    \            /::::::\    \            /::::::\    \          //
//         /:::/\:::\    \          /:::/    /               /:::/\:::\    \          /:::/\:::\    \          /:::/\:::\    \         //
//        /:::/  \:::\    \        /:::/    /               /:::/__\:::\    \        /:::/__\:::\    \        /:::/__\:::\    \        //
//       /:::/    \:::\    \      /:::/    /               /::::\   \:::\    \      /::::\   \:::\    \       \:::\   \:::\    \       //
//      /:::/    / \:::\    \    /:::/    /      _____    /::::::\   \:::\    \    /::::::\   \:::\    \    ___\:::\   \:::\    \      //
//     /:::/    /   \:::\    \  /:::/____/      /\    \  /:::/\:::\   \:::\ ___\  /:::/\:::\   \:::\    \  /\   \:::\   \:::\    \     //
//    /:::/____/     \:::\____\|:::|    /      /::\____\/:::/__\:::\   \:::|    |/:::/__\:::\   \:::\____\/::\   \:::\   \:::\____\    //
//    \:::\    \      \::/    /|:::|____\     /:::/    /\:::\   \:::\  /:::|____|\:::\   \:::\   \::/    /\:::\   \:::\   \::/    /    //
//     \:::\    \      \/____/  \:::\    \   /:::/    /  \:::\   \:::\/:::/    /  \:::\   \:::\   \/____/  \:::\   \:::\   \/____/     //
//      \:::\    \               \:::\    \ /:::/    /    \:::\   \::::::/    /    \:::\   \:::\    \       \:::\   \:::\    \         //
//       \:::\    \               \:::\    /:::/    /      \:::\   \::::/    /      \:::\   \:::\____\       \:::\   \:::\____\        //
//        \:::\    \               \:::\__/:::/    /        \:::\  /:::/    /        \:::\   \::/    /        \:::\  /:::/    /        //
//         \:::\    \               \::::::::/    /          \:::\/:::/    /          \:::\   \/____/          \:::\/:::/    /         //
//          \:::\    \               \::::::/    /            \::::::/    /            \:::\    \               \::::::/    /          //
//           \:::\____\               \::::/    /              \::::/    /              \:::\____\               \::::/    /           //
//            \::/    /                \::/____/                \::/____/                \::/    /                \::/    /            //
//             \/____/                  ~~                       ~~                       \/____/                  \/____/             //
//                                                                                                                                     //
//                                                                                                                                     //
//                                                                                                                                     //
//                                                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract cubes is ERC721Creator {
    constructor() ERC721Creator("cubes", "cubes") {}
}