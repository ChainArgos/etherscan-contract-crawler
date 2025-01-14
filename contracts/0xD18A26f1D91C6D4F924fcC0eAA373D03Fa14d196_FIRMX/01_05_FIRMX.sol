// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: FITYREMIXND
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                //
//                                                                                                                                //
//              _____                   _____                   _____                   _____                                     //
//             /\    \                 /\    \                 /\    \                 /\    \                ______              //
//            /::\    \               /::\    \               /::\    \               /::\____\              |::|   |             //
//           /::::\    \              \:::\    \             /::::\    \             /::::|   |              |::|   |             //
//          /::::::\    \              \:::\    \           /::::::\    \           /:::::|   |              |::|   |             //
//         /:::/\:::\    \              \:::\    \         /:::/\:::\    \         /::::::|   |              |::|   |             //
//        /:::/__\:::\    \              \:::\    \       /:::/__\:::\    \       /:::/|::|   |              |::|   |             //
//       /::::\   \:::\    \             /::::\    \     /::::\   \:::\    \     /:::/ |::|   |              |::|   |             //
//      /::::::\   \:::\    \   ____    /::::::\    \   /::::::\   \:::\    \   /:::/  |::|___|______        |::|   |             //
//     /:::/\:::\   \:::\    \ /\   \  /:::/\:::\    \ /:::/\:::\   \:::\____\ /:::/   |::::::::\    \ ______|::|___|___ ____     //
//    /:::/  \:::\   \:::\____/::\   \/:::/  \:::\____/:::/  \:::\   \:::|    /:::/    |:::::::::\____|:::::::::::::::::|    |    //
//    \::/    \:::\   \::/    \:::\  /:::/    \::/    \::/   |::::\  /:::|____\::/    / ~~~~~/:::/    |:::::::::::::::::|____|    //
//     \/____/ \:::\   \/____/ \:::\/:::/    / \/____/ \/____|:::::\/:::/    / \/____/      /:::/    / ~~~~~~|::|~~~|~~~          //
//              \:::\    \      \::::::/    /                |:::::::::/    /              /:::/    /        |::|   |             //
//               \:::\____\      \::::/____/                 |::|\::::/    /              /:::/    /         |::|   |             //
//                \::/    /       \:::\    \                 |::| \::/____/              /:::/    /          |::|   |             //
//                 \/____/         \:::\    \                |::|  ~|                   /:::/    /           |::|   |             //
//                                  \:::\    \               |::|   |                  /:::/    /            |::|   |             //
//                                   \:::\____\              \::|   |                 /:::/    /             |::|   |             //
//                                    \::/    /               \:|   |                 \::/    /              |::|___|             //
//                                     \/____/                 \|___|                  \/____/                ~~                  //
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract FIRMX is ERC1155Creator {
    constructor() ERC1155Creator("FITYREMIXND", "FIRMX") {}
}