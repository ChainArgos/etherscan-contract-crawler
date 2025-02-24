// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: NewInTown
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                             //
//                                                                                             //
//                                                                                             //
//     ███▄    █ ▓█████  █     █░    ██▓ ███▄    █    ▄▄▄█████▓ ▒█████   █     █░███▄    █     //
//     ██ ▀█   █ ▓█   ▀ ▓█░ █ ░█░   ▓██▒ ██ ▀█   █    ▓  ██▒ ▓▒▒██▒  ██▒▓█░ █ ░█░██ ▀█   █     //
//    ▓██  ▀█ ██▒▒███   ▒█░ █ ░█    ▒██▒▓██  ▀█ ██▒   ▒ ▓██░ ▒░▒██░  ██▒▒█░ █ ░█▓██  ▀█ ██▒    //
//    ▓██▒  ▐▌██▒▒▓█  ▄ ░█░ █ ░█    ░██░▓██▒  ▐▌██▒   ░ ▓██▓ ░ ▒██   ██░░█░ █ ░█▓██▒  ▐▌██▒    //
//    ▒██░   ▓██░░▒████▒░░██▒██▓    ░██░▒██░   ▓██░     ▒██▒ ░ ░ ████▓▒░░░██▒██▓▒██░   ▓██░    //
//    ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▓░▒ ▒     ░▓  ░ ▒░   ▒ ▒      ▒ ░░   ░ ▒░▒░▒░ ░ ▓░▒ ▒ ░ ▒░   ▒ ▒     //
//    ░ ░░   ░ ▒░ ░ ░  ░  ▒ ░ ░      ▒ ░░ ░░   ░ ▒░       ░      ░ ▒ ▒░   ▒ ░ ░ ░ ░░   ░ ▒░    //
//       ░   ░ ░    ░     ░   ░      ▒ ░   ░   ░ ░      ░      ░ ░ ░ ▒    ░   ░    ░   ░ ░     //
//             ░    ░  ░    ░        ░           ░                 ░ ░      ░            ░     //
//                                                                                             //
//                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////


contract NiT is ERC721Creator {
    constructor() ERC721Creator("NewInTown", "NiT") {}
}