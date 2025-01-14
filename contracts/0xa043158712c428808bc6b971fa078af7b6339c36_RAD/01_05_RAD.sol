// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: RoshayART
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                              //
//                                                                                              //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&%&&%%&&&%%%&&&%%%%%          //
//    @@@@@@@@@@@@@@@@@@&&&@&&&&&&&&&&&&&&&&&&&&@@@&&&&&&&&&%%%&&&&&%%%&%&%&%&&%&%%%%%          //
//    @@@@@@@@@@@@@@@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%&&&%%%%&%%&%&%&%&&%&%%%%%          //
//    @@@@@@@@@@@@@@&&...&#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%&&&%&&&&%&&&%&&&&%&%%%          //
//    @@@@@@@@@@@@@&&&((@@@@@@@@@@@@&%&&&&%&&&&&&&&&&&&&&&&&%&&&&%&%&%%&%&%%%%%%&%&%&%          //
//    @@@@@@@@@@&&&&&(@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&&%%&%%%&&&&&&&&&%%%&%&%&%&&%&%&%%%          //
//    @@@@@@@@@@@&&&&%@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&%&&%%%&*%%&&&&&&&&%%&%&%&%%&%&%&%%          //
//    @@@@@@@@@@&&&&@@@@@@@@@@&@&@%%##&&&&&&&%%&&&&%%%%%%%%####%%&&&&&&&&%%%%%%%%%%(**          //
//    @@@@@@@@@&&&&&@@@@@@@@@@&&@@@@@&..&&&&&&&&&&&%,####///.####*%%&&&&&&&&%%%%%(((((          //
//    @@@@@@@@@&&&&&&@&@@@@@@&&&@&%&@@#///..&&&&&&&&&%%%%%%%%%%%%%%%%%%&&&&&&&&%%(((((          //
//    @@@@@@@@@@&&&@@@@@@@@&@@@@@@&&&&&##/....&.....%%%%%%%%%%%%%%%%%%%%%&&&&&&&%%%**.          //
//    @@@@@@@@@@@@@@@@&@@@@%&@@@@&@@%&,((/**........../######(((((((((((((%&&&&&&&%%%.          //
//    @@@@@@@@@@@@@@@&@@@@%%%%@%&**@&****,*****,, ,,,**,  , *,,, ,  ,& #%%%%%#&&&&&&%%          //
//    @@@@@@@@@@@@@@@@&%%@%%%%@%%%*((((***///##//#*///###/#(((//(((&(@(&%%%%%%%&&&&&&&          //
//    @@@@@@@@@@@@@@@&%%%%%%%%(%%%((#####%%#/####%%%##/#%%%%#/####(@(@(&&&&&&&&&&&%%&&          //
//    @@@@@@@@@@@@@@@@&&&&&%%%%%%%%%%%#%###%%%##//###///#%%#//%#&&&&%%&&&%%&&&&&&%,%%%          //
//    @@@@@@@@@@@@@@@@&%&&&%%%%%%%%%((#(((&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%&%%&&&&&,,,#&&          //
//    @@@@@@@@@@@@@@@@@@@&&&&&%%%%@@@@@@@@&&&&&&&&&&&&&&&&&&&&&&&%%%%%&&%&&&&@&,,,,#&&          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&@@&&&&&&&&&&&&&&&&&&&&&%&%%%&%%&&&&@@&&&%#%%%          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&@@&&&&&&&&%%%&&%&&&&@@@@&&%&&&%          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&%&&&&@@@@&@@@&&&&          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@&&&&&&&&&&&&&&&&&@@@@@@@@&&&%%&          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&&&&&&&&&&&@&@@@@&&&&%,,          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&&&&&&&&&&@&@@&@&&&&&&&          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&@&&&&&&@@@@&@@&&&&&&&          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&#@@@@@@@@&&&&&&&&          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&@@@@@@@@@@@&@&&&@&&&&&&&&&&          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&@@@@@@@@@@@@@@@&&@@@@@@@@@@@@@@@@@&@@@&&&&@@@          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&@%%%%@@@@@@@@@@@@@@&&&@@&&%@@&&@@@&&&&&@@@@          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&@@@@@@@@@@@@&&&&&&&&&&&@@@@@&&&&&&&&&@@@@@@@          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&@&&@&&&&&&&&&&&&&&@&&&&@@@@@@@@          //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&&&&@&&&&&@@@@@@@@@@@@          //
//                                                                                              //
//           /$$                                         /$$                                    //
//          | $$                                        | $$                                    //
//      /$$$$$$$ /$$        /$$$$$$   /$$$$$$   /$$$$$$$| $$$$$$$   /$$$$$$  /$$   /$$          //
//     /$$__  $$|__/       /$$__  $$ /$$__  $$ /$$_____/| $$__  $$ |____  $$| $$  | $$          //
//    | $$  | $$ /$$      | $$  \__/| $$  \ $$|  $$$$$$ | $$  \ $$  /$$$$$$$| $$  | $$          //
//    | $$  | $$| $$      | $$      | $$  | $$ \____  $$| $$  | $$ /$$__  $$| $$  | $$          //
//    |  $$$$$$$| $$      | $$      |  $$$$$$/ /$$$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$          //
//     \_______/| $$      |__/       \______/ |_______/ |__/  |__/ \_______/ \____  $$          //
//         /$$  | $$                                                         /$$  | $$          //
//        |  $$$$$$/                                                        |  $$$$$$/          //
//         \______/                                                          \______/           //
//                                                                                              //
//                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////


contract RAD is ERC721Creator {
    constructor() ERC721Creator("RoshayART", "RAD") {}
}