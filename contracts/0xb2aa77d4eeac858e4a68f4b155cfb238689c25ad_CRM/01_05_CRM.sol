// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: CRYPTORASTAS Music Label
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

/////////////////////////////////////////////////////////////////////////////
//                                                                         //
//                                                                         //
//                                                                         //
//      /$$$$$$  /$$$$$$$  /$$     /$$ /$$$$$$$  /$$$$$$$$ /$$$$$$         //
//     /$$__  $$| $$__  $$|  $$   /$$/| $$__  $$|__  $$__//$$__  $$        //
//    | $$  \__/| $$  \ $$ \  $$ /$$/ | $$  \ $$   | $$  | $$  \ $$        //
//    | $$      | $$$$$$$/  \  $$$$/  | $$$$$$$/   | $$  | $$  | $$        //
//    | $$      | $$__  $$   \  $$/   | $$____/    | $$  | $$  | $$        //
//    | $$    $$| $$  \ $$    | $$    | $$         | $$  | $$  | $$        //
//    |  $$$$$$/| $$  | $$    | $$    | $$         | $$  |  $$$$$$/        //
//     \______/ |__/  |__/    |__/    |__/         |__/   \______/         //
//                                                                         //
//                                                                         //
//                                                                         //
//     /$$$$$$$   /$$$$$$   /$$$$$$  /$$$$$$$$ /$$$$$$   /$$$$$$           //
//    | $$__  $$ /$$__  $$ /$$__  $$|__  $$__//$$__  $$ /$$__  $$          //
//    | $$  \ $$| $$  \ $$| $$  \__/   | $$  | $$  \ $$| $$  \__/          //
//    | $$$$$$$/| $$$$$$$$|  $$$$$$    | $$  | $$$$$$$$|  $$$$$$           //
//    | $$__  $$| $$__  $$ \____  $$   | $$  | $$__  $$ \____  $$          //
//    | $$  \ $$| $$  | $$ /$$  \ $$   | $$  | $$  | $$ /$$  \ $$          //
//    | $$  | $$| $$  | $$|  $$$$$$/   | $$  | $$  | $$|  $$$$$$/          //
//    |__/  |__/|__/  |__/ \______/    |__/  |__/  |__/ \______/           //
//                                                                         //
//                                                                         //
//                                                                         //
//     /$$      /$$ /$$   /$$  /$$$$$$  /$$$$$$  /$$$$$$                   //
//    | $$$    /$$$| $$  | $$ /$$__  $$|_  $$_/ /$$__  $$                  //
//    | $$$$  /$$$$| $$  | $$| $$  \__/  | $$  | $$  \__/                  //
//    | $$ $$/$$ $$| $$  | $$|  $$$$$$   | $$  | $$                        //
//    | $$  $$$| $$| $$  | $$ \____  $$  | $$  | $$                        //
//    | $$\  $ | $$| $$  | $$ /$$  \ $$  | $$  | $$    $$                  //
//    | $$ \/  | $$|  $$$$$$/|  $$$$$$/ /$$$$$$|  $$$$$$/                  //
//    |__/     |__/ \______/  \______/ |______/ \______/                   //
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////


contract CRM is ERC1155Creator {
    constructor() ERC1155Creator("CRYPTORASTAS Music Label", "CRM") {}
}