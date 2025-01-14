// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Olive Allen 2.0
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                                                                     //
//      ______  __ __                          ______      ______      //
//     /      \|  \  \                        /      \    /      \     //
//    |  ▓▓▓▓▓▓\ ▓▓\▓▓__     __  ______      |  ▓▓▓▓▓▓\  |  ▓▓▓▓▓▓\    //
//    | ▓▓  | ▓▓ ▓▓  \  \   /  \/      \      \▓▓__| ▓▓  | ▓▓▓\| ▓▓    //
//    | ▓▓  | ▓▓ ▓▓ ▓▓\▓▓\ /  ▓▓  ▓▓▓▓▓▓\     /      ▓▓  | ▓▓▓▓\ ▓▓    //
//    | ▓▓  | ▓▓ ▓▓ ▓▓ \▓▓\  ▓▓| ▓▓    ▓▓    |  ▓▓▓▓▓▓   | ▓▓\▓▓\▓▓    //
//    | ▓▓__/ ▓▓ ▓▓ ▓▓  \▓▓ ▓▓ | ▓▓▓▓▓▓▓▓    | ▓▓_____ __| ▓▓_\▓▓▓▓    //
//     \▓▓    ▓▓ ▓▓ ▓▓   \▓▓▓   \▓▓     \    | ▓▓     \  \\▓▓  \▓▓▓    //
//      \▓▓▓▓▓▓ \▓▓\▓▓    \▓     \▓▓▓▓▓▓▓     \▓▓▓▓▓▓▓▓\▓▓ \▓▓▓▓▓▓     //
//                                                                     //
//                                                                     //
//                                                                     //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////


contract OLIVE2 is ERC721Creator {
    constructor() ERC721Creator("Olive Allen 2.0", "OLIVE2") {}
}