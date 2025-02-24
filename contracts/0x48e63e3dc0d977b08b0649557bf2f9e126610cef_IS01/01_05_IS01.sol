// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Invisible Suburbia 01
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////
//                                                                       //
//                                                                       //
//                                                                       //
//        ____                   _             _     __      __          //
//       /  _/   ____  _   __   (_)   _____   (_)   / /_    / /  ___     //
//       / /    / __ \| | / /  / /   / ___/  / /   / __ \  / /  / _ \    //
//     _/ /    / / / /| |/ /  / /   (__  )  / /   / /_/ / / /  /  __/    //
//    /___/   /_/ /_/ |___/  /_/   /____/  /_/   /_.___/ /_/   \___/     //
//                                                                       //
//       _____            __                      __      _              //
//      / ___/  __  __   / /_   __  __   _____   / /_    (_)  ____ _     //
//      \__ \  / / / /  / __ \ / / / /  / ___/  / __ \  / /  / __ `/     //
//     ___/ / / /_/ /  / /_/ // /_/ /  / /     / /_/ / / /  / /_/ /      //
//    /____/  \__,_/  /_.___/ \__,_/  /_/     /_.___/ /_/   \__,_/       //
//                                                                       //
//       ____    ___                                                     //
//      / __ \  <  /                                                     //
//     / / / /  / /                                                      //
//    / /_/ /  / /                                                       //
//    \____/  /_/                                                        //
//                                                                       //
//                                                                       //
//                                                                       //
//                                                                       //
//                                                                       //
//                                                                       //
//                                                                       //
//                                                                       //
//                                                                       //
//                                                                       //
///////////////////////////////////////////////////////////////////////////


contract IS01 is ERC721Creator {
    constructor() ERC721Creator("Invisible Suburbia 01", "IS01") {}
}