// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Rosa Menkman
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

///////////////////////////////////////////////////
//                                               //
//                                               //
//    FFD8█████████▒▒▒         ▓███████████      //
//    ██████████▒▒▒               ▒████████      //
//    ██████████▒                  ▒███████      //
//    ██████████                    ▓██████      //
//    █████████░░░▒ ▒          ░ ▒  ███████      //
//    █████████████▓█▓ ▒▓▓▓▓▓▓▓█▒█  ███████      //
//    ████████░██▓▓▓▓▓  ▓▓▓▓▓▓▓██▓  ███████      //
//    ████████ ██              █░   ░██████      //
//    ████████░▓█░   ░░░░      ░    ▒██████      //
//    █████████░██░  ░░░░        ░▓░███████      //
//    █████████████▓▓▒▒▒▒▒  ▓▓ ▓▓██████████      //
//    ███████████████▒    ▒▓██▓████████████      //
//    ███████████████▓▓▓▓▓▓████████████████      //
//    █████████████████████████████▒███████      //
//    ░░░░░░░░▒░▒▒██████████▓▒▒░░░░░░░▒▒▒▒▒      //
//             ░  ██████████░          FFD9      //
//                                               //
//    < DCT >                                    //
//              THE TRUE VALUE OF                //
//      A WORK OF ART EXTENDS BEYOND ITS         //
//    MARKET, ENWRAPPING BOTH ITS CULTURAL       //
//         AND HISTORIC SIGNIFICANCE             //
//                                   < /DCT >    //
//                                               //
//                                               //
///////////////////////////////////////////////////


contract JPEG is ERC721Creator {
    constructor() ERC721Creator("Rosa Menkman", "JPEG") {}
}