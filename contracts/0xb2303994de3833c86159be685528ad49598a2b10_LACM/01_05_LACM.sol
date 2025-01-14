// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Life Story of the City of Los Angeles v1
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                                 //
//                                                                                                                                                                                                                                 //
//                                                                                                                                                                                                                                 //
//              _____                    _____                    _____                    _____                    _____                    _____            _____                    _____                    _____              //
//             /\    \                  /\    \                  /\    \                  /\    \                  /\    \                  /\    \          /\    \                  /\    \                  /\    \             //
//            /::\    \                /::\    \                /::\    \                /::\    \                /::\____\                /::\____\        /::\    \                /::\    \                /::\    \            //
//           /::::\    \              /::::\    \              /::::\    \              /::::\    \              /::::|   |               /:::/    /        \:::\    \              /::::\    \              /::::\    \           //
//          /::::::\    \            /::::::\    \            /::::::\    \            /::::::\    \            /:::::|   |              /:::/    /          \:::\    \            /::::::\    \            /::::::\    \          //
//         /:::/\:::\    \          /:::/\:::\    \          /:::/\:::\    \          /:::/\:::\    \          /::::::|   |             /:::/    /            \:::\    \          /:::/\:::\    \          /:::/\:::\    \         //
//        /:::/__\:::\    \        /:::/__\:::\    \        /:::/  \:::\    \        /:::/__\:::\    \        /:::/|::|   |            /:::/    /              \:::\    \        /:::/__\:::\    \        /:::/__\:::\    \        //
//        \:::\   \:::\    \      /::::\   \:::\    \      /:::/    \:::\    \      /::::\   \:::\    \      /:::/ |::|   |           /:::/    /               /::::\    \      /::::\   \:::\    \      /::::\   \:::\    \       //
//      ___\:::\   \:::\    \    /::::::\   \:::\    \    /:::/    / \:::\    \    /::::::\   \:::\    \    /:::/  |::|   | _____    /:::/    /       ____    /::::::\    \    /::::::\   \:::\    \    /::::::\   \:::\    \      //
//     /\   \:::\   \:::\    \  /:::/\:::\   \:::\    \  /:::/    /   \:::\ ___\  /:::/\:::\   \:::\    \  /:::/   |::|   |/\    \  /:::/    /       /\   \  /:::/\:::\    \  /:::/\:::\   \:::\    \  /:::/\:::\   \:::\    \     //
//    /::\   \:::\   \:::\____\/:::/  \:::\   \:::\____\/:::/____/  ___\:::|    |/:::/__\:::\   \:::\____\/:: /    |::|   /::\____\/:::/____/       /::\   \/:::/  \:::\____\/:::/  \:::\   \:::\____\/:::/__\:::\   \:::\____\    //
//    \:::\   \:::\   \::/    /\::/    \:::\  /:::/    /\:::\    \ /\  /:::|____|\:::\   \:::\   \::/    /\::/    /|::|  /:::/    /\:::\    \       \:::\  /:::/    \::/    /\::/    \:::\   \::/    /\:::\   \:::\   \::/    /    //
//     \:::\   \:::\   \/____/  \/____/ \:::\/:::/    /  \:::\    /::\ \::/    /  \:::\   \:::\   \/____/  \/____/ |::| /:::/    /  \:::\    \       \:::\/:::/    / \/____/  \/____/ \:::\   \/____/  \:::\   \:::\   \/____/     //
//      \:::\   \:::\    \               \::::::/    /    \:::\   \:::\ \/____/    \:::\   \:::\    \              |::|/:::/    /    \:::\    \       \::::::/    /                    \:::\    \       \:::\   \:::\    \         //
//       \:::\   \:::\____\               \::::/    /      \:::\   \:::\____\       \:::\   \:::\____\             |::::::/    /      \:::\    \       \::::/____/                      \:::\____\       \:::\   \:::\____\        //
//        \:::\  /:::/    /               /:::/    /        \:::\  /:::/    /        \:::\   \::/    /             |:::::/    /        \:::\    \       \:::\    \                       \::/    /        \:::\   \::/    /        //
//         \:::\/:::/    /               /:::/    /          \:::\/:::/    /          \:::\   \/____/              |::::/    /          \:::\    \       \:::\    \                       \/____/          \:::\   \/____/         //
//          \::::::/    /               /:::/    /            \::::::/    /            \:::\    \                  /:::/    /            \:::\    \       \:::\    \                                        \:::\    \             //
//           \::::/    /               /:::/    /              \::::/    /              \:::\____\                /:::/    /              \:::\____\       \:::\____\                                        \:::\____\            //
//            \::/    /                \::/    /                \::/____/                \::/    /                \::/    /                \::/    /        \::/    /                                         \::/    /            //
//             \/____/                  \/____/                                           \/____/                  \/____/                  \/____/          \/____/                                           \/____/             //
//                                                                                                                                                                                                                                 //
//                                                                                                                                                                                                                                 //
//                                                                                                                                                                                                                                 //
//                                                                                                                                                                                                                                 //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract LACM is ERC721Creator {
    constructor() ERC721Creator("The Life Story of the City of Los Angeles v1", "LACM") {}
}