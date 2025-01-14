// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: uniikura
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//                                      ▄▄▄▄▄▄▄▄▄                                         //
//                               ▄▄██████████████████▄▄                 ▄██▀▀███▄         //
//                            ▄██████████████████████████▄           ▄████████▄▄ ▀▄       //
//                         ▄████████████████████████████████▄      ▄████▀▀▀▀█████▄        //
//                       ▄████████████████████████████████████▄▄ ▄▄█▀         ▀███▌       //
//                      ▒██████████████████████████████████████████▄            ▒██▌      //
//                     ██████████████████████▀████████████████████▄█▌            ▐█▌      //
//                    █████████▐███████████████▀███████████████████▓▀             ██      //
//                   ▒█████████▐██████████████▄▄▄█████████████████▌               █▌      //
//                  ▐█████████▌▀██████████████▌   ▀▀███████████████               █       //
//                  ██████████▌▀▒████████████▐█▌    ▀▀█████████████▌             █        //
//                  ███████████▀▀████████████▌█▓▄▄▄    █████████████                      //
//                  ▌▐███████▌   ▐███████████▌████████▄ ▒███████████                      //
//                  ▌ ███████▌    ▒▐█████▀▀▀▀▀ ▄▄█████▀█ ▐█▀▀███████▌                     //
//                   ▄▐███████     ▀▀▓▀        ▐███▀█▌ ▀  ▌██  ██████▌                    //
//                    ▀███████                  ▀▀  ▀     ▌ ░  ▐███████                   //
//                   ▐██████▌████▀▀▀                     █▄█   ████████▄                  //
//                   ▄████▌▒█▄█                           ████▄  █████████▄               //
//                 ███████▒█ ▌▌          ▄██████▌ ▌     ██████▌  ▀█████▀███▄              //
//                ▄██████████▄▄█▄        ████████  ▌    ████████▌  ▀█████▄ ▀██▄           //
//               ▒███████████████▄        ▀▀▓▀▀▀    ▀▄    ▀███████   ▀   ▀    ██▄         //
//             ▄███████████████████▄▄              ▄█  ██▄    ▀███▌  ▌  ▄   ▄  ███▄       //
//            ▒█▀█████████████████████████▄▄▄▄▄▄▄█ ████▐█▀▀▀▄        █▄▐▌ ▄█▀  ▒███▌      //
//          ▄█▀ ████████████████████████████▀   ▀████▄██▌     ▀▐▄    ▐█▐███     █▒██▌     //
//         ▄▀  ████████▀  ▀▀███████████▀        ▐▌██▀ ▒█       ███▌▄▄▐ █▀█▀     █▌▒██     //
//        ▒▌  ▐██████▀       █████████▌       ▀▄▄█▌▄  █▌      ▐██▀▀           ▄███████    //
//       ▐█   ▐███████▄▄ ▄ ▀▀  ▐█▄     ▀  ▄    ▄███▄ ▐█                     ▄██████▌▐█    //
//       █▌   ▐█▌▐█▀▓██▀    ▐ ██▀▀▄▌        ▀▄██▀  ▀█▄█ ▄▀   ▄▄██▄▄▄▄▄▄▄▄▄▄███████▌ ▐█    //
//       ██    █ ▐█ ▄        ▓▄█ ▀     █▄    ▄ ▀▄    ▒█▄▀  ███████████████████████  ▐▌    //
//       ▀██    █ ██▄  ▄           ▐▄ ▄    ▄▀▐▄█  ▄▄▄▐█████▌███▌█████████████████   █     //
//         ▀▀██▓  ▒▄                  ▀    ▐▄██▀▌ ▀███████████▒█████▒██████████▀   ▒      //
//         ▄▀       ▀                       ▀█▌▐   ▀█████████████████████████▀    ▀       //
//        █▌          ▐                             ▒██████████████████████▀  ▄ ▀         //
//       ▐█▌           █▄                           ▐█████████████████████▀               //
//       ▐██▄         ▐███▄▄▄▄▄▄▄▄▄              ▄▄▄▒██████████████████▀▀                 //
//       ▐██▄██▄▄    ▄██████████████▄▄    ▄▄█▀      ▀████████████████                     //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract UNI is ERC1155Creator {
    constructor() ERC1155Creator("uniikura", "UNI") {}
}