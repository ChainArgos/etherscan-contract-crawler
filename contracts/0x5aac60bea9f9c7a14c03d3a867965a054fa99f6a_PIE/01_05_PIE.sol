// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Cutecutiepie
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//               ▄████▄████▄ ▄████▄████▄ ▄████▄████▄ ▄████▄████▄ ▄████▄████▄              //
//              ██▀  ▀█▀  ▀███▀  ▀█▀  ▀███▀  ▀█▀  ▀███▀  ▀█▀  ▀███▀  ▀█▀  ▀██             //
//              ██▄       ▄███▄       ▄███▄       ▄███▄       ▄███▄       ▄██             //
//               ▀██▄   ▄██▀ ▀██▄   ▄██▀ ▀██▄   ▄██▀ ▀██▄   ▄██▀ ▀██▄   ▄██▀              //
//                 ▀██▄██▀     ▀██▄██▀     ▀██▄██▀     ▀██▄██▀     ▀██▄██▀                //
//                   ▀▀▀         ▀▀▀         ▀▀▀         ▀▀▀         ▀▀▀                  //
//                ▒▒            ▄███████▄           ▄███████▄                             //
//               ▒▒▒▒          ██▀▒▒▒▒▒▀██▄       ▄██▀▒▒▒▒▒▀██                            //
//             ▒▒▒▒▒▒▒▒       ██▒▒▒  ▒▒▒▒▀██▄   ▄██▀▒▒▒▒  ▒▒▒██     ░                     //
//               ▒▒▒▒        ██▒▒▒    ▒▒▒▒▄███████▄▒▒▒▒    ▒▒▒██   ░░░                    //
//                ▒▒        ██▀▒▒      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒      ▒▒▀██   ░      ▒▒             //
//           ░             ██▀▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒▀██        ▒▒▒▒            //
//          ░░░           ██▀▒▒▒▄██████▄    ▒▒▒▒▒    ▄██████▄▒▒▒▀██     ▒▒▒▒▒▒▒▒          //
//           ░           ██▀▒▒▒███  █████▒▒▒▒▒▒▒▒▒▒▒███  █████▒▒▒▀██      ▒▒▒▒            //
//                     ▄██▀▒▒▒▒██▄▄███▀██  ███████  ██▄▄███▀██▒▒▒▒▀██▄     ▒▒             //
//                    ▄██       ▀████▀      ▀███▀    ▀████▀         ██▄                   //
//                    ██░░░░░░░         ██▄▄██▀██▄▄██     ▄▄  ░░░░░░░██                   //
//                    ██░░░░░░░░░░       ▀▀▀▀   ▀▀▀▀     ████░░░░░░░░██                   //
//                    ▀██░░░░░░░░░░         ░░░░░       ██████░░░░░░██▀                   //
//                     ▀███░░░░░░░░                      ▀▀▀▀░░░░░███▀                    //
//                       ▀█████████████████████████████████████████▀                      //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract PIE is ERC721Creator {
    constructor() ERC721Creator("Cutecutiepie", "PIE") {}
}