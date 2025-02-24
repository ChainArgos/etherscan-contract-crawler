// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Neighborhood FUDkers
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                                                        //
//                                                                                                                                                                                                                                                        //
//                                                                                                                                                                                                                                                        //
//     .----------------.  .----------------.  .----------------.                                                                                                                                                                                         //
//    | .--------------. || .--------------. || .--------------. |                                                                                                                                                                                        //
//    | |  _________   | || |  ____  ____  | || |  _________   | |                                                                                                                                                                                        //
//    | | |  _   _  |  | || | |_   ||   _| | || | |_   ___  |  | |                                                                                                                                                                                        //
//    | | |_/ | | \_|  | || |   | |__| |   | || |   | |_  \_|  | |                                                                                                                                                                                        //
//    | |     | |      | || |   |  __  |   | || |   |  _|  _   | |                                                                                                                                                                                        //
//    | |    _| |_     | || |  _| |  | |_  | || |  _| |___/ |  | |                                                                                                                                                                                        //
//    | |   |_____|    | || | |____||____| | || | |_________|  | |                                                                                                                                                                                        //
//    | |              | || |              | || |              | |                                                                                                                                                                                        //
//    | '--------------' || '--------------' || '--------------' |                                                                                                                                                                                        //
//     '----------------'  '----------------'  '----------------'                                                                                                                                                                                         //
//     .-----------------. .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.     //
//    | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |    //
//    | | ____  _____  | || |  _________   | || |     _____    | || |    ______    | || |  ____  ____  | || |   ______     | || |     ____     | || |  _______     | || |  ____  ____  | || |     ____     | || |     ____     | || |  ________    | |    //
//    | ||_   \|_   _| | || | |_   ___  |  | || |    |_   _|   | || |  .' ___  |   | || | |_   ||   _| | || |  |_   _ \    | || |   .'    `.   | || | |_   __ \    | || | |_   ||   _| | || |   .'    `.   | || |   .'    `.   | || | |_   ___ `.  | |    //
//    | |  |   \ | |   | || |   | |_  \_|  | || |      | |     | || | / .'   \_|   | || |   | |__| |   | || |    | |_) |   | || |  /  .--.  \  | || |   | |__) |   | || |   | |__| |   | || |  /  .--.  \  | || |  /  .--.  \  | || |   | |   `. \ | |    //
//    | |  | |\ \| |   | || |   |  _|  _   | || |      | |     | || | | |    ____  | || |   |  __  |   | || |    |  __'.   | || |  | |    | |  | || |   |  __ /    | || |   |  __  |   | || |  | |    | |  | || |  | |    | |  | || |   | |    | | | |    //
//    | | _| |_\   |_  | || |  _| |___/ |  | || |     _| |_    | || | \ `.___]  _| | || |  _| |  | |_  | || |   _| |__) |  | || |  \  `--'  /  | || |  _| |  \ \_  | || |  _| |  | |_  | || |  \  `--'  /  | || |  \  `--'  /  | || |  _| |___.' / | |    //
//    | ||_____|\____| | || | |_________|  | || |    |_____|   | || |  `._____.'   | || | |____||____| | || |  |_______/   | || |   `.____.'   | || | |____| |___| | || | |____||____| | || |   `.____.'   | || |   `.____.'   | || | |________.'  | |    //
//    | |              | || |              | || |              | || |              | || |              | || |              | || |              | || |              | || |              | || |              | || |              | || |              | |    //
//    | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |    //
//     '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'     //
//     .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.                                                                                                         //
//    | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |                                                                                                        //
//    | |  _________   | || | _____  _____ | || |  ________    | || |  ___  ____   | || |  _________   | || |  _______     | || |    _______   | |                                                                                                        //
//    | | |_   ___  |  | || ||_   _||_   _|| || | |_   ___ `.  | || | |_  ||_  _|  | || | |_   ___  |  | || | |_   __ \    | || |   /  ___  |  | |                                                                                                        //
//    | |   | |_  \_|  | || |  | |    | |  | || |   | |   `. \ | || |   | |_/ /    | || |   | |_  \_|  | || |   | |__) |   | || |  |  (__ \_|  | |                                                                                                        //
//    | |   |  _|      | || |  | '    ' |  | || |   | |    | | | || |   |  __'.    | || |   |  _|  _   | || |   |  __ /    | || |   '.___`-.   | |                                                                                                        //
//    | |  _| |_       | || |   \ `--' /   | || |  _| |___.' / | || |  _| |  \ \_  | || |  _| |___/ |  | || |  _| |  \ \_  | || |  |`\____) |  | |                                                                                                        //
//    | | |_____|      | || |    `.__.'    | || | |________.'  | || | |____||____| | || | |_________|  | || | |____| |___| | || |  |_______.'  | |                                                                                                        //
//    | |              | || |              | || |              | || |              | || |              | || |              | || |              | |                                                                                                        //
//    | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |                                                                                                        //
//     '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'                                                                                                         //
//                                                                                                                                                                                                                                                        //
//                                                                                                                                                                                                                                                        //
//                                                                                                                                                                                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract NHFUDkers is ERC721Creator {
    constructor() ERC721Creator("The Neighborhood FUDkers", "NHFUDkers") {}
}