// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: SashiNakimo
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                           //
//                                                                                                                                                                           //
//              _____                    _____                    _____                    _____                    _____                                                    //
//             /\    \                  /\    \                  /\    \                  /\    \                  /\    \                                                   //
//            /::\    \                /::\    \                /::\    \                /::\____\                /::\    \                                                  //
//           /::::\    \              /::::\    \              /::::\    \              /:::/    /                \:::\    \                                                 //
//          /::::::\    \            /::::::\    \            /::::::\    \            /:::/    /                  \:::\    \                                                //
//         /:::/\:::\    \          /:::/\:::\    \          /:::/\:::\    \          /:::/    /                    \:::\    \                                               //
//        /:::/__\:::\    \        /:::/__\:::\    \        /:::/__\:::\    \        /:::/____/                      \:::\    \                                              //
//        \:::\   \:::\    \      /::::\   \:::\    \       \:::\   \:::\    \      /::::\    \                      /::::\    \                                             //
//      ___\:::\   \:::\    \    /::::::\   \:::\    \    ___\:::\   \:::\    \    /::::::\    \   _____    ____    /::::::\    \                                            //
//     /\   \:::\   \:::\    \  /:::/\:::\   \:::\    \  /\   \:::\   \:::\    \  /:::/\:::\    \ /\    \  /\   \  /:::/\:::\    \                                           //
//    /::\   \:::\   \:::\____\/:::/  \:::\   \:::\____\/::\   \:::\   \:::\____\/:::/  \:::\    /::\____\/::\   \/:::/  \:::\____\                                          //
//    \:::\   \:::\   \::/    /\::/    \:::\  /:::/    /\:::\   \:::\   \::/    /\::/    \:::\  /:::/    /\:::\  /:::/    \::/    /                                          //
//     \:::\   \:::\   \/____/  \/____/ \:::\/:::/    /  \:::\   \:::\   \/____/  \/____/ \:::\/:::/    /  \:::\/:::/    / \/____/                                           //
//      \:::\   \:::\    \               \::::::/    /    \:::\   \:::\    \               \::::::/    /    \::::::/    /                                                    //
//       \:::\   \:::\____\               \::::/    /      \:::\   \:::\____\               \::::/    /      \::::/____/                                                     //
//        \:::\  /:::/    /               /:::/    /        \:::\  /:::/    /               /:::/    /        \:::\    \                                                     //
//         \:::\/:::/    /               /:::/    /          \:::\/:::/    /               /:::/    /          \:::\    \                                                    //
//          \::::::/    /               /:::/    /            \::::::/    /               /:::/    /            \:::\    \                                                   //
//           \::::/    /               /:::/    /              \::::/    /               /:::/    /              \:::\____\                                                  //
//            \::/    /                \::/    /                \::/    /                \::/    /                \::/    /                                                  //
//             \/____/                  \/____/                  \/____/                  \/____/                  \/____/                                                   //
//                                                                                                                                                                           //
//                                                                                                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract sashi is ERC721Creator {
    constructor() ERC721Creator("SashiNakimo", "sashi") {}
}