// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: That Crazy Sun of a Beach
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                      //
//                                                                                                                                      //
//      ##     ### ##   #### ##   ## ##    ## ##   ##  ###  ####      ## ##   ###  ##    ##     ####       ####   ###  ##    ####       //
//       ##     ##  ##  # ## ##  ##   ##  ##   ##  ##   ##   ##      ##   ##   ##  ##     ##     ##         ##      ## ##     ##        //
//     ## ##    ##  ##    ##     ####     ##   ##  ##   ##   ##      ####      ##  ##   ## ##    ##         ##     # ## #     ##        //
//     ##  ##   ## ##     ##      #####   ##   ##  ##   ##   ##       #####    ## ###   ##  ##   ##         ##     ## ##      ##        //
//     ## ###   ## ##     ##         ###  ##   ##  ##   ##   ##          ###   ##  ##   ## ###   ##         ##     ##  ##     ##        //
//     ##  ##   ##  ##    ##     ##   ##  ##   ##  ##   ##   ##  ##  ##   ##   ##  ##   ##  ##   ##  ##     ##     ##  ##     ##        //
//    ###  ##  #### ##   ####     ## ##    ## ##    ## ##   ### ###   ## ##   ###  ##  ###  ##  ### ###    ####   ###  ##    ####       //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract SUN is ERC721Creator {
    constructor() ERC721Creator("That Crazy Sun of a Beach", "SUN") {}
}