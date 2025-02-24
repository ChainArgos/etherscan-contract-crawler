// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Make Art Not War
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                      ░  ░   ░ ░  ░                ░  ░ ░░░░░░░░░░░░░░░     //
//          j▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓Γ░     //
//          j▓▓▓▓▓▀▀▓▓▓▓▓▓▀▀▓▓▀▀▀▀▀▀▀▓▓▀▀▓▓▓▓▀▀▓▓▀▀▀▀▀▀▓▓▓╫███████▌▓████████▓▓███████╣▓▌░     //
//          j▓▓▓▓▌░░▐▓▓▓▓░░░▓▌░░▄▄▄░░▐▓░░▓▓▓▓░░▓▌░░▄▄▄▄▓▓▓▓████████▓████████▓▓███████▌▓▌░     //
//          j▓▓▓▓▌░░░▓▓▓░░░░▓▌░░▓▓▓░░▐▓░░▓▓▓▓░░▓▌░░▓▓▓▓▓▓▓▓██▓▓▓███▓██▌▓▓▓██▓▓▓▓███▓▓▓▓▌░░    //
//          j▓▓▓▓▌░]░░▓░░░░░▓▌░░▓▓▓░░▐▓░░▓▓▓▀░░▓▌░░▓▓▓▓▓▓▓▓██▓▓▓███▓██▌▓▓▓██▓▓▓▓███▓▓▓▓▌░     //
//          j▓▓▓▓▌░▐▓░░░░▓░░▓▌░░░░░░░▐▓░░░░░░░▓▓▌░░░░░░▐▓▓▓████████▓████████▓▓▓▓███▓▓▓▓▌      //
//          j▓▓▓▓▌░]▓▌░░▓▓░░▓▌░░▓▓▓░░▐▓░░▓▓▓░░░▓▌░░▓▓▓▓▓▓▓▓██╣╢╢███▓█████▌╣╣▓▓▓▓███▓▓▓▓▌░     //
//        ░ j▓▓▓▓▌░]▓▓W▓▓▓░░▓▌░░▓▓▓░░▐▓░░▓▓▓▓░░▓▌░░▓▓▓▓▓▓▓▓██▓▓▓███▓██▌███▓▓▓▓▓▓███▓▓▓▓▌░░    //
//         ░j▓▓▓▓▌░▐▓▓▓▓▓▓░░▓▌░░▓▓▓░░▐▓░░▓▓▓▓░░▓▌░░░░░░░▓▓▓██▓▓▓███▓██▌╣██▌▓▓▓▓▓███▓▓▓▓▌      //
//        ░░j▓▓▓▓▌░▐▓▓▓▓▓▓░░▓▌░░▓▓▓░░▐▓▄▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╢╢▓▓▓▓███▓██▌▓███▓▓▓▓▓███▓▓▓▓▌      //
//        ░░j▓▓▓▓▌░▐▓▓▓▓▓▓░░▓▌░░▓▓▓▓▓▓▓▓▓▓▓▓▓▀▓▌▓▓░▓▓░▓▓▓▓▓▓▓▓▓▓╢╢█▓██▌▓╢██╣▓▓▓▓███▓▓▓▓▌      //
//        ░░j▓▓▓▓▌░▐▓▓▓▓▓▓░░▓▓▄▓▓▓▓▓▓▓▀▓▌░▓░▓▄▓▓▓▓▓▓▓æ▓▄▓▌░▌░▓▀▓▓▓▓▓╢█╣▓▓███▓▓▓▓███▓▓▓▓▌      //
//        ░ j▓▓▓▓▌░▐▓▓▓▓▓▓░░▓▓▓▓▓▓▓▓░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▄▓░▓▓▓▓▓▓▓▓╫██╣▓▓▓███▓▓▓▓▌      //
//        ░░j▓▓▓▓▌░▐▓▓▓▓▓▓▓▓▓▓▓▀▀▓░▐▓▓▓▓▓▓▄m▓▓▓█▓██▓▓▓▓▓▓▒▒▓▓▓▓▓▓▌░▓▀▓▓▓▓▓▓██▓▓▓███▓▓▓▓▌      //
//        ░░j▓▓▓▓▌░▐▓▓▓▓▓▓▓▓▓▀░▓▄▓▓▓▓▓╣▓▓██████████████████▓▓▓╦▓▓▓▓▓▄▓░▓▓▓▓▓▓▓▓▓███▓▓▓▓▌      //
//          j▓▓▓▓▌░▐▓▓▓▓▓▓▓▓▀▓▓▓▓▓░╣▓▓▓████████████████████████▓▓▓▒▓▓▓▓▓▀▓▓▓▓▓▓▓███▓▓▓▓▌      //
//        ░ j▓▓▓▓▌░▐▓▓▓▓▓▓░▀▓▓▓▓▒▓▓▓▌▀▀███████████████████████▀▀Ñ╫▓▓▄▓▓▓▓▀░▓▓▓▓▓███▓▓▓▓▌      //
//        ░ j▓▓▓▓▌░▓▓▓▓▓▓▌▓▓▓▓▒▄▓▓▌░║░▄░▒░█████▀▀░░░▀██████░░▀▌▒⌠░▐▌▓▓╙▓▓▓▓▐▓▓▓▓▓██▓▓▓▓▌      //
//        ░ j▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓░▓█▒░░█▀▀▓▒░▒███▒╜░░░░░░▒░▀███░░φ▓▀▀▓░░▒▓▓▒▓▓▓▒▓▓▓▓▓╣█▓▓▓▓▌      //
//        ░░j▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▒▓▓▓█░▄▀N▄▀░░██▀▒▄░░░░░░░░▄░░███░░▀▄▓█▄░▄▓▓▓▒▓▓▓░▓▓▓▓▓▓▓▓▓▓▌      //
//        ░░j▓▓▓▓▓▓▓▓▓▓▄▓▓▓▒▓▒▒███░░░█▄░██░▓▄▄█▀░░░░▀▄▄▄▄░██░░░▌░░░███▓▓▓▐▓▓▓▄▓▓▓▓▓▓▓▓▓▌      //
//        ░░j▓▓▓▓▓▓▓▓▓▀▓▓▓▓▐▓▓█░░░█▀▒░███▌▓█████░░[░█████░░███▀░▀▀█▀▒░█▒▓▓▓▓▓▓▀▓▓▓▓▓▓▓▓▌      //
//          j▓▓▓▓▓▓▓░▀W▓▓▓▒▓▓▒░▀▌▀▄▄░▄███░░▒▒▒▒░░▌█░░▒▒░▒░░████▄▄▄╩▓▄▀▀▓▒▓░▓▓[email protected]▀░▓▓▓▓▓▓▌      //
//        ░ j▓▓▓▓▓▀▀▀╪░▓▓▓▒▓▓░░░█▄█▒▓██░█▌░░░░░░█░░▌▄░░░░░░█░███▄█▄█▄▄▒▓▓▓░▓▓▓░╨▀▀▓▓▓▓▓▌      //
//        ░ j▓▓▓▓▓▄▄▄▄┴▓▓▓╠▓▒█░░░▌░░▐███▄█░░░░░░▄▄▄▄░░░░░░█▄████▒░▐▒░░█▌╫▓░▓▓▓░▄▄▄▄▓▓▓▓▌      //
//          j▓▓▓▓▓▓▓░░Ä▓▓▓░▓▓▓████████████░░░░░█▀▀▀█▀░░░░░██████▄▄██▄██▓▓▓░▓▓▓W░░▓▓▓▓▓▓▌      //
//        ░░j▓▓▓▓▓▓▓▓▄▄▓▓▓▌▓▌▒▒████████████▄░░░░░░░▒░░░░▄█████████████▒▒▓▌▐▓▓▓░▓▓▓▓▓▓▓▓▌      //
//          j▓▓▓▓▓▓▓▓▓░▓▓▓▓░▓▓▓▓█████████████▄░░░░░░░░▄██████████████▓▓▓▓░▓▓▓▄▐▓▓▓▓▓▓▓▓▌      //
//        ░░j▓▓▓▓▓▓▓▓▓▓▄▓▓▓▓░▓▓▒▒███████████▌░▀▀████████████████████▒▒▓▓░▓▓▓▓▄▓▓▓▓▓▓▐▓▓▌      //
//          j▓▓▓▓█╣▓▓▓▓▓M▓▓▓▓▒▓▓▓▒▌░▓▀██████░░░░░░τ¼███████████▀▓▌░▓▓▓▌╓▓▓▓▀▓▓▓▓▓▓▓░▐▓▓▌      //
//          j▓▓▓▓██▓▓▓▓▓▓▓▐▓▓▓▓▒▓▓▓▌▒▓░▓▒▒█▀░░░░░░▒@▓▓█████▀▒▓▒▓▒▐▓▓▌▒▓▓▓▓▓░▓▓▓▓▓▓░░▐▓▓▌      //
//          j▓▓▓▓███▓▓▓▓▓▓▄▓▓▓▓█▐▓▓▓██████W▄░▒▒░░░▒▒░▒▓██████▄▓▓▓▓▓▒▌█▓▓▓▓░▓▓▓▓▓▓░░░▐▓▓▌      //
//          j▓▓▓▓███▓▓▓▓▓▓▓w▄▓▓▓█▄▓▓▌█▀████▓▓▓██▓▓▓▓▓▓▓██████▀█▐▌▓Ç▄█▓▓▓░▒▓▓▓▓▓▓░░░░▐▓▓▌      //
//          j▓▓▓▓███╢▓▓╢╢▓▓▓▓░░▓▀▓╣╢█▄▀▀M▀██████████████▓▓█▌▀▀▄█╢╢╢▓▀▓░░▓▓▓▓▓▓░░░▓░░▐▓▓▌      //
//          j▓▓▓▓████▓▓▐██╣▓▓▓▓W▄▓░▓▓▓▓██████████▓▓▓██████████╢▓▓▓░▓░░▓▓▓▓▓▓▀░░æ▓▓░░▐▓▓▌      //
//          j▓▓▓▓████▌▓▓██▌▓╢▓▓▓▓▓▓▌░▓░░▓█▌█M▀▓▓▓███▓▓▓▀▓█▌█▓░░▄░▓▓▓▓▓▓▓▓▓▓▌░░▓▓▓▓░░▐▓▓▌      //
//          j▓▓▓▓█████▓▓██▌▓███╢▓▓▓▓▓▓░░▐▓█▐█▄Y▀▓▓▓▓▓▌▓▄█▀█╢░░░▓▓▓▓▓▓▓▓▓░░▓▌░░▓▓▓▓░░▐▓▓▌      //
//          j▓▓▓▓██████▓██▌▓██████▓▓▓▓▓▓▓▓▓█▄▀██▄▐[▓▓██▀▄█╢▓▓▓▓▓▓▓▓▓▀░░░░░▓▌░░▓▓▓▓░░▐▓▓▌      //
//          j▓▓▓▓█████████╣▓██▌▓█████▓█▓╣▓▓▓╣╢▓▄█████▄▓█╢▓▓▓▓▓▓▓▓░░░░▄▓░░░▓▌░░▓▓▓▓░░▐▓▓▌      //
//          j▓▓▓▓███╣█████▌▓██▌▓▓▓███▓██████████▌▓▓▀▀▓▓▓▓▓▓▓░░░▓▌░░▓▓▓▓░░░▓▌░░▓▓▓▓░░▐▓▓▌      //
//          j▓▓▓▓███▓▓████▌▓██▌▓▓▓███▓▓▓╢███████▌▓▓░░▓▓▓░░▓▓░░░▓▌░░▓▓▓▓░░░▓▌░░▓▓▓▓░░▐▓▓▌      //
//          j▓▓▓▓███▓▓████▌▓██▌▓▓▓███▓▓▓▓███▓▓▓▓▓▓▓░░▓░░░░░▓░░░▓▌░░░░░░░░░▓▌░░░░░░░░▐▓▓▌      //
//          j▓▓▓▓███▓▓╫███╣▓██▌▓▓▓███▓▓▓▓███▓▓▓▓▓▓▓░░░░░▓▓░░░░░▓▌░░▓▓▓▓░░░▓▌░░▄░░░▓▓▓▓▓▌      //
//          j▓▓▓▓███▓▓▓███╣▓███▓▓▓███▓▓▓▓███▓▓▓▓▓▓▓░░░ä▓▓▓▓░░░j▓▌░░▓▓▓▓░░░▓▌░░▓▓░░╙▓▓▓▓▌      //
//          j▓▓▓▓███▓▓▓▐██╣▓█████████▓▓▓▓███▓▓▓▓▓▓▓░░▓▓▓▓▓▓▓░░j▓▌░░▓▓▓▓░░░▓M░░▓▓▓░░╙▓▓▓▌      //
//          j▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▌      //
//          ░`⌠`⌠⌠```"`"""""""""""""""""""""""""""``""`"`""``````"```````````````"``"`"`      //
//        ````````````````````````````````````````````````````````````````````````````````    //
//                                                                                            //
//    ---                                                                                     //
//    asciiart.club                                                                           //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract MANW is ERC1155Creator {
    constructor() ERC1155Creator("Make Art Not War", "MANW") {}
}