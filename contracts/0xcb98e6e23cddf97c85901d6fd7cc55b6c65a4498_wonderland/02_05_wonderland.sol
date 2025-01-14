// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: this isnt wonderland
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                 //
//                                                                                                 //
//                                                                                                 //
//     ██▒   █▓ ██▓ ▄████▄   ▄▄▄                                                                   //
//    ▓██░   █▒▓██▒▒██▀ ▀█  ▒████▄                                                                 //
//     ▓██  █▒░▒██▒▒▓█    ▄ ▒██  ▀█▄                                                               //
//      ▒██ █░░░██░▒▓▓▄ ▄██▒░██▄▄▄▄██                                                              //
//       ▒▀█░  ░██░▒ ▓███▀ ░ ▓█   ▓██▒                                                             //
//       ░ ▐░  ░▓  ░ ░▒ ▒  ░ ▒▒   ▓▒█░                                                             //
//       ░ ░░   ▒ ░  ░  ▒     ▒   ▒▒ ░                                                             //
//         ░░   ▒ ░░          ░   ▒                                                                //
//          ░   ░  ░ ░            ░  ░                                                             //
//     ██▓ ███▄    █                                                                               //
//    ▓██▒ ██ ▀█   █                                                                               //
//    ▒██▒▓██  ▀█ ██▒                                                                              //
//    ░██░▓██▒  ▐▌██▒                                                                              //
//    ░██░▒██░   ▓██░                                                                              //
//    ░▓  ░ ▒░   ▒ ▒                                                                               //
//     ▒ ░░ ░░   ░ ▒░                                                                              //
//     ▒ ░   ░   ░ ░                                                                               //
//     █     █░ ▒█████   ███▄    █ ▓█████▄ ▓█████  ██▀███   ██▓    ▄▄▄       ███▄    █ ▓█████▄     //
//    ▓█░ █ ░█░▒██▒  ██▒ ██ ▀█   █ ▒██▀ ██▌▓█   ▀ ▓██ ▒ ██▒▓██▒   ▒████▄     ██ ▀█   █ ▒██▀ ██▌    //
//    ▒█░ █ ░█ ▒██░  ██▒▓██  ▀█ ██▒░██   █▌▒███   ▓██ ░▄█ ▒▒██░   ▒██  ▀█▄  ▓██  ▀█ ██▒░██   █▌    //
//    ░█░ █ ░█ ▒██   ██░▓██▒  ▐▌██▒░▓█▄   ▌▒▓█  ▄ ▒██▀▀█▄  ▒██░   ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█▄   ▌    //
//    ░░██▒██▓ ░ ████▓▒░▒██░   ▓██░░▒████▓ ░▒████▒░██▓ ▒██▒░██████▒▓█   ▓██▒▒██░   ▓██░░▒████▓     //
//    ░ ▓░▒ ▒  ░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ▒▒▓  ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░░ ▒░▓  ░▒▒   ▓▒█░░ ▒░   ▒ ▒  ▒▒▓  ▒     //
//      ▒ ░ ░    ░ ▒ ▒░ ░ ░░   ░ ▒░ ░ ▒  ▒  ░ ░  ░  ░▒ ░ ▒░░ ░ ▒  ░ ▒   ▒▒ ░░ ░░   ░ ▒░ ░ ▒  ▒     //
//      ░   ░  ░ ░ ░ ▒     ░   ░ ░  ░ ░  ░    ░     ░░   ░   ░ ░    ░   ▒      ░   ░ ░  ░ ░  ░     //
//        ░        ░ ░           ░    ░       ░  ░   ░         ░  ░     ░  ░         ░    ░        //
//                                  ░                                                   ░          //
//                                                                                                 //
//                                                                                                 //
//                                                                                                 //
/////////////////////////////////////////////////////////////////////////////////////////////////////


contract wonderland is ERC721Creator {
    constructor() ERC721Creator("this isnt wonderland", "wonderland") {}
}