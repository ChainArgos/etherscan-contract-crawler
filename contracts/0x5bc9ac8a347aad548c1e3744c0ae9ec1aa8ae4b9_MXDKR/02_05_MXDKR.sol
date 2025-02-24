// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Max Drekker
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                       //
//                                                                                                                                                       //
//                                                                                                                                                       //
//            _   _         _           _      _             _            _           _            _              _              _            _          //
//           /\_\/\_\ _    / /\       /_/\    /\ \          /\ \         /\ \        /\ \         /\_\           /\_\           /\ \         /\ \        //
//          / / / / //\_\ / /  \      \ \ \   \ \_\        /  \ \____   /  \ \      /  \ \       / / /  _       / / /  _       /  \ \       /  \ \       //
//         /\ \/ \ \/ / // / /\ \      \ \ \__/ / /       / /\ \_____\ / /\ \ \    / /\ \ \     / / /  /\_\    / / /  /\_\    / /\ \ \     / /\ \ \      //
//        /  \____\__/ // / /\ \ \      \ \__ \/_/       / / /\/___  // / /\ \_\  / / /\ \_\   / / /__/ / /   / / /__/ / /   / / /\ \_\   / / /\ \_\     //
//       / /\/________// / /  \ \ \      \/_/\__/\      / / /   / / // / /_/ / / / /_/_ \/_/  / /\_____/ /   / /\_____/ /   / /_/_ \/_/  / / /_/ / /     //
//      / / /\/_// / // / /___/ /\ \      _/\/__\ \    / / /   / / // / /__\/ / / /____/\    / /\_______/   / /\_______/   / /____/\    / / /__\/ /      //
//     / / /    / / // / /_____/ /\ \    / _/_/\ \ \  / / /   / / // / /_____/ / /\____\/   / / /\ \ \     / / /\ \ \     / /\____\/   / / /_____/       //
//    / / /    / / // /_________/\ \ \  / / /   \ \ \ \ \ \__/ / // / /\ \ \  / / /______  / / /  \ \ \   / / /  \ \ \   / / /______  / / /\ \ \         //
//    \/_/    / / // / /_       __\ \_\/ / /    /_/ /  \ \___\/ // / /  \ \ \/ / /_______\/ / /    \ \ \ / / /    \ \ \ / / /_______\/ / /  \ \ \        //
//            \/_/ \_\___\     /____/_/\/_/     \_\/    \/_____/ \/_/    \_\/\/__________/\/_/      \_\_\\/_/      \_\_\\/__________/\/_/    \_\/        //
//                                                                                                                                                       //
//                                                                                                                                                       //
//                                                                                                                                                       //
//                                                                                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract MXDKR is ERC721Creator {
    constructor() ERC721Creator("Max Drekker", "MXDKR") {}
}