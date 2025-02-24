// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Friends Of Doodler
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////
//                                                          //
//                                                          //
//      ______    _                _                        //
//     |  ____|  (_)              | |                       //
//     | |__ _ __ _  ___ _ __   __| |___                    //
//     |  __| '__| |/ _ \ '_ \ / _` / __|                   //
//     | |  | |  | |  __/ | | | (_| \__ \                   //
//     |_|__|_| _|_|\___|_| |_|\__,_|___/                   //
//      / __ \ / _|                                         //
//     | |  | | |_                                          //
//     | |  | |  _|                                         //
//     | |__| | |                                           //
//      \____/|_|              _ _                          //
//     |  __ \                | | |                         //
//     | |  | | ___   ___   __| | | ___ _ __                //
//     | |  | |/ _ \ / _ \ / _` | |/ _ \ '__|               //
//     | |__| | (_) | (_) | (_| | |  __/ |                  //
//     |_____/ \___/ \___/ \__,_|_|\___|_|                  //
//                                                          //
//                                                          //
//                                                          //
//                                       ___                //
//                                   ,-""   `.              //
//                                 ,'  _   e )`-._          //
//                                /  ,' `-._<.===-' honk    //
//                               /  /                       //
//                              /  ;                        //
//                  _.--.__    /   ;                        //
//     (`._    _.-""       "--'    |                        //
//     <_  `-""                     \                       //
//      <`-                          :                      //
//       (__   <__.                  ;                      //
//         `-.   '-.__.      _.'    /                       //
//            \      `-.__,-'    _,'                        //
//             `._    ,    /__,-'                           //
//                ""._\__,'< <____                          //
//                     | |  `----.`.                        //
//                     | |        \ `.                      //
//                     ; |___      \-``                     //
//                     \   --<                              //
//                      `.`.<                               //
//                        `-'                               //
//                                                          //
//                                                          //
//////////////////////////////////////////////////////////////


contract HONK is ERC721Creator {
    constructor() ERC721Creator("Friends Of Doodler", "HONK") {}
}