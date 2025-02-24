// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Alisha Anglin
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                     //
//                                                                                                                                                     //
//                  ▄▄▄       ██▓     ██▓  ██████  ██░ ██  ▄▄▄          ▄▄▄       ███▄    █   ▄████  ██▓     ██▓ ███▄    █  ██ ▄▄▄    ███  ██▀███      //
//    ▒████▄    ▓██▒    ▓██▒▒██    ▒ ▓██░ ██▒▒████▄       ▒████▄     ██ ▀█   █  ██▒ ▀█▒▓██▒    ▓██▒ ██ ▀█   █    ▒████▄    ▓██ ▒ ██▒▓  ██▒ ▓▒          //
//    ▒██  ▀█▄  ▒██░    ▒██▒░ ▓██▄   ▒██▀▀██░▒██  ▀█▄     ▒██  ▀█▄  ▓██  ▀█ ██▒▒██░▄▄▄░▒██░    ▒██▒▓██  ▀█ ██▒   ▒██  ▀█▄  ▓██ ░▄█ ▒▒ ▓██░ ▒░          //
//    ░██▄▄▄▄██ ▒██░    ░██░  ▒   ██▒░▓█ ░██ ░██▄▄▄▄██    ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█  ██▓▒██░    ░██░▓██▒  ▐▌██▒   ░██▄▄▄▄██ ▒██▀▀█▄  ░ ▓██▓ ░           //
//     ▓█   ▓██▒░██████▒░██░▒██████▒▒░▓█▒░██▓ ▓█   ▓██▒    ▓█   ▓██▒▒██░   ▓██░░▒▓███▀▒░██████▒░██░▒██░   ▓██░    ▓█   ▓██▒░██▓ ▒██▒  ▒██▒ ░           //
//     ▒▒   ▓▒█░░ ▒░▓  ░░▓  ▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒ ▒▒   ▓▒█░    ▒▒   ▓▒█░░ ▒░   ▒ ▒  ░▒   ▒ ░ ▒░▓  ░░▓  ░ ▒░   ▒ ▒     ▒▒   ▓▒█░░ ▒▓ ░▒▓░  ▒ ░░             //
//      ▒   ▒▒ ░░ ░ ▒  ░ ▒ ░░ ░▒  ░ ░ ▒ ░▒░ ░  ▒   ▒▒ ░     ▒   ▒▒ ░░ ░░   ░ ▒░  ░   ░ ░ ░ ▒  ░ ▒ ░░ ░░   ░ ▒░     ▒   ▒▒ ░  ░▒ ░ ▒░    ░              //
//      ░   ▒     ░ ░    ▒ ░░  ░  ░   ░  ░░ ░  ░   ▒        ░   ▒      ░   ░ ░ ░ ░   ░   ░ ░    ▒ ░   ░   ░ ░      ░   ▒     ░░   ░   ░                //
//          ░  ░    ░  ░ ░        ░   ░  ░  ░      ░  ░         ░  ░         ░       ░     ░  ░ ░           ░          ░  ░   ░                        //
//                                                                                                                                                     //
//                                                                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract AAART is ERC721Creator {
    constructor() ERC721Creator("Alisha Anglin", "AAART") {}
}