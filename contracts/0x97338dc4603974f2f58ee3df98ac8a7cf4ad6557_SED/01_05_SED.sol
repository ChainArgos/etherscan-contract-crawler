// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Seduction
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////
//                                                         //
//                                                         //
//       _____          _            _   _                 //
//      / ____|        | |          | | (_)                //
//     | (___   ___  __| |_   _  ___| |_ _  ___  _ __      //
//      \___ \ / _ \/ _` | | | |/ __| __| |/ _ \| '_ \     //
//      ____) |  __/ (_| | |_| | (__| |_| | (_) | | | |    //
//     |_____/ \___|\__,_|\__,_|\___|\__|_|\___/|_| |_|    //
//     |___ \    | |     (_)     (_)     | |               //
//       __) | __| |_ __  _ _ __  _  __ _| |__             //
//      |__ < / _` | '_ \| | '_ \| |/ _` | '_ \            //
//      ___) | (_| | | | | | | | | | (_| | | | |           //
//     |____/ \__,_|_| |_|_|_| |_| |\__,_|_| |_|           //
//     |__ \ / _ \__ \|___ \    _/ |                       //
//        ) | | | | ) | __) |  |__/                        //
//       / /| | | |/ / |__ <                               //
//      / /_| |_| / /_ ___) |                              //
//     |____|\___/____|____/                               //
//                                                         //
//                                                         //
//                                                         //
//                                                         //
/////////////////////////////////////////////////////////////


contract SED is ERC721Creator {
    constructor() ERC721Creator("Seduction", "SED") {}
}