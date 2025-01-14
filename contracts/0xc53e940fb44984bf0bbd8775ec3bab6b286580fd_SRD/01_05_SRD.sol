// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: SHAGUN's WORLD
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                      //
//                                                                                                                                                      //
//     .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.       //
//    | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |      //
//    | | _____  _____ | || |  _________   | || |   _____      | || |     ______   | || |     ____     | || | ____    ____ | || |  _________   | |      //
//    | ||_   _||_   _|| || | |_   ___  |  | || |  |_   _|     | || |   .' ___  |  | || |   .'    `.   | || ||_   \  /   _|| || | |_   ___  |  | |      //
//    | |  | | /\ | |  | || |   | |_  \_|  | || |    | |       | || |  / .'   \_|  | || |  /  .--.  \  | || |  |   \/   |  | || |   | |_  \_|  | |      //
//    | |  | |/  \| |  | || |   |  _|  _   | || |    | |   _   | || |  | |         | || |  | |    | |  | || |  | |\  /| |  | || |   |  _|  _   | |      //
//    | |  |   /\   |  | || |  _| |___/ |  | || |   _| |__/ |  | || |  \ `.___.'\  | || |  \  `--'  /  | || | _| |_\/_| |_ | || |  _| |___/ |  | |      //
//    | |  |__/  \__|  | || | |_________|  | || |  |________|  | || |   `._____.'  | || |   `.____.'   | || ||_____||_____|| || | |_________|  | |      //
//    | |              | || |              | || |              | || |              | || |              | || |              | || |              | |      //
//    | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |      //
//     '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'       //
//     .----------------.  .----------------.                                                                                                           //
//    | .--------------. || .--------------. |                                                                                                          //
//    | |  _________   | || |     ____     | |                                                                                                          //
//    | | |  _   _  |  | || |   .'    `.   | |                                                                                                          //
//    | | |_/ | | \_|  | || |  /  .--.  \  | |                                                                                                          //
//    | |     | |      | || |  | |    | |  | |                                                                                                          //
//    | |    _| |_     | || |  \  `--'  /  | |                                                                                                          //
//    | |   |_____|    | || |   `.____.'   | |                                                                                                          //
//    | |              | || |              | |                                                                                                          //
//    | '--------------' || '--------------' |                                                                                                          //
//     '----------------'  '----------------'                                                                                                           //
//     .----------------.  .----------------.                                                                                                           //
//    | .--------------. || .--------------. |                                                                                                          //
//    | | ____    ____ | || |  ____  ____  | |                                                                                                          //
//    | ||_   \  /   _|| || | |_  _||_  _| | |                                                                                                          //
//    | |  |   \/   |  | || |   \ \  / /   | |                                                                                                          //
//    | |  | |\  /| |  | || |    \ \/ /    | |                                                                                                          //
//    | | _| |_\/_| |_ | || |    _|  |_    | |                                                                                                          //
//    | ||_____||_____|| || |   |______|   | |                                                                                                          //
//    | |              | || |              | |                                                                                                          //
//    | '--------------' || '--------------' |                                                                                                          //
//     '----------------'  '----------------'                                                                                                           //
//     .----------------.  .----------------.  .----------------.  .----------------.  .----------------.                                               //
//    | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |                                              //
//    | | _____  _____ | || |     ____     | || |  _______     | || |   _____      | || |  ________    | |                                              //
//    | ||_   _||_   _|| || |   .'    `.   | || | |_   __ \    | || |  |_   _|     | || | |_   ___ `.  | |                                              //
//    | |  | | /\ | |  | || |  /  .--.  \  | || |   | |__) |   | || |    | |       | || |   | |   `. \ | |                                              //
//    | |  | |/  \| |  | || |  | |    | |  | || |   |  __ /    | || |    | |   _   | || |   | |    | | | |                                              //
//    | |  |   /\   |  | || |  \  `--'  /  | || |  _| |  \ \_  | || |   _| |__/ |  | || |  _| |___.' / | |                                              //
//    | |  |__/  \__|  | || |   `.____.'   | || | |____| |___| | || |  |________|  | || | |________.'  | |                                              //
//    | |              | || |              | || |              | || |              | || |              | |                                              //
//    | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |                                              //
//     '----------------'  '----------------'  '----------------'  '----------------'  '----------------'                                               //
//                                                                                                                                                      //
//                                                                                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract SRD is ERC721Creator {
    constructor() ERC721Creator("SHAGUN's WORLD", "SRD") {}
}