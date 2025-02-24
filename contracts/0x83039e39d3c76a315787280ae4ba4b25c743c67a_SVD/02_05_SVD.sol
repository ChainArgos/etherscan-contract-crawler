// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Boy Whose Destiny Was Severed From Him
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                           //
//                                                                                           //
//              _____                    _____                    _____                      //
//             /\    \                  /\    \                  /\    \                     //
//            /::\    \                /::\____\                /::\    \                    //
//           /::::\    \              /:::/    /               /::::\    \                   //
//          /::::::\    \            /:::/    /               /::::::\    \                  //
//         /:::/\:::\    \          /:::/    /               /:::/\:::\    \                 //
//        /:::/__\:::\    \        /:::/____/               /:::/  \:::\    \                //
//        \:::\   \:::\    \       |::|    |               /:::/    \:::\    \               //
//      ___\:::\   \:::\    \      |::|    |     _____    /:::/    / \:::\    \              //
//     /\   \:::\   \:::\    \     |::|    |    /\    \  /:::/    /   \:::\ ___\             //
//    /::\   \:::\   \:::\____\    |::|    |   /::\____\/:::/____/     \:::|    |            //
//    \:::\   \:::\   \::/    /    |::|    |  /:::/    /\:::\    \     /:::|____|            //
//     \:::\   \:::\   \/____/     |::|    | /:::/    /  \:::\    \   /:::/    /             //
//      \:::\   \:::\    \         |::|____|/:::/    /    \:::\    \ /:::/    /              //
//       \:::\   \:::\____\        |:::::::::::/    /      \:::\    /:::/    /               //
//        \:::\  /:::/    /        \::::::::::/____/        \:::\  /:::/    /                //
//         \:::\/:::/    /          ~~~~~~~~~~               \:::\/:::/    /                 //
//          \::::::/    /                                     \::::::/    /                  //
//           \::::/    /                                       \::::/    /                   //
//            \::/    /                                         \::/____/                    //
//             \/____/                                           ~~                          //
//                                                                                           //
//                                                                                           //
//                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////


contract SVD is ERC721Creator {
    constructor() ERC721Creator("The Boy Whose Destiny Was Severed From Him", "SVD") {}
}