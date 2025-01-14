// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Buzzy's Genuary
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                   //
//                                                                                                                   //
//                                                                                                                   //
//             _              _            _            _                  _                   _    _        _       //
//            /\ \           /\ \         /\ \     _   /\_\               / /\                /\ \ /\ \     /\_\     //
//           /  \ \         /  \ \       /  \ \   /\_\/ / /         _    / /  \              /  \ \\ \ \   / / /     //
//          / /\ \_\       / /\ \ \     / /\ \ \_/ / /\ \ \__      /\_\ / / /\ \            / /\ \ \\ \ \_/ / /      //
//         / / /\/_/      / / /\ \_\   / / /\ \___/ /  \ \___\    / / // / /\ \ \          / / /\ \_\\ \___/ /       //
//        / / / ______   / /_/_ \/_/  / / /  \/____/    \__  /   / / // / /  \ \ \        / / /_/ / / \ \ \_/        //
//       / / / /\_____\ / /____/\    / / /    / / /     / / /   / / // / /___/ /\ \      / / /__\/ /   \ \ \         //
//      / / /  \/____ // /\____\/   / / /    / / /     / / /   / / // / /_____/ /\ \    / / /_____/     \ \ \        //
//     / / /_____/ / // / /______  / / /    / / /     / / /___/ / // /_________/\ \ \  / / /\ \ \        \ \ \       //
//    / / /______\/ // / /_______\/ / /    / / /     / / /____\/ // / /_       __\ \_\/ / /  \ \ \        \ \_\      //
//    \/___________/ \/__________/\/_/     \/_/      \/_________/ \_\___\     /____/_/\/_/    \_\/         \/_/      //
//                                                                                                                   //
//                                                                                                                   //
//                                                                                                                   //
//                                                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract BGEN is ERC1155Creator {
    constructor() ERC1155Creator("Buzzy's Genuary", "BGEN") {}
}