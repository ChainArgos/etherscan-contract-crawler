// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: StreetPhotos
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                    //
//                                                                                                                    //
//    ####     ##  ###    ####    ## ##     ##      ## ##   #### ##  ### ###  ### ###    ##     ###  ##               //
//     ##      ##   ##     ##    ##   ##     ##    ##   ##  # ## ##   ##  ##   ##  ##     ##      ## ##               //
//     ##      ##   ##     ##    ####      ## ##   ####       ##      ##       ##       ## ##    # ## #               //
//     ##      ##   ##     ##     #####    ##  ##   #####     ##      ## ##    ## ##    ##  ##   ## ##                //
//     ##      ##   ##     ##        ###   ## ###      ###    ##      ##       ##       ## ###   ##  ##               //
//     ##  ##  ##   ##     ##    ##   ##   ##  ##  ##   ##    ##      ##  ##   ##       ##  ##   ##  ##               //
//    ### ###   ## ##     ####    ## ##   ###  ##   ## ##    ####    ### ###  ####     ###  ##  ###  ##               //
//                                                                                                                    //
//                                                                                                                    //
//                                                                                                                    //
//                                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract LS is ERC721Creator {
    constructor() ERC721Creator("StreetPhotos", "LS") {}
}