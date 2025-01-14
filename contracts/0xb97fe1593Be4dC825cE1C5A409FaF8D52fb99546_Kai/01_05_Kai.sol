// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Code_of_Kai
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//                                                                                        //
//     .----------------.  .----------------.  .----------------.  .----------------.     //
//    | .--------------. || .--------------. || .--------------. || .--------------. |    //
//    | |     ______   | || |     ____     | || |  ________    | || |  _________   | |    //
//    | |   .' ___  |  | || |   .'    `.   | || | |_   ___ `.  | || | |_   ___  |  | |    //
//    | |  / .'   \_|  | || |  /  .--.  \  | || |   | |   `. \ | || |   | |_  \_|  | |    //
//    | |  | |         | || |  | |    | |  | || |   | |    | | | || |   |  _|  _   | |    //
//    | |  \ `.___.'\  | || |  \  `--'  /  | || |  _| |___.' / | || |  _| |___/ |  | |    //
//    | |   `._____.'  | || |   `.____.'   | || | |________.'  | || | |_________|  | |    //
//    | |              | || |              | || |              | || |              | |    //
//    | '--------------' || '--------------' || '--------------' || '--------------' |    //
//     '----------------'  '----------------'  '----------------'  '----------------'     //
//     .----------------.  .----------------.                                             //
//    | .--------------. || .--------------. |                                            //
//    | |     ____     | || |  _________   | |                                            //
//    | |   .'    `.   | || | |_   ___  |  | |                                            //
//    | |  /  .--.  \  | || |   | |_  \_|  | |                                            //
//    | |  | |    | |  | || |   |  _|      | |                                            //
//    | |  \  `--'  /  | || |  _| |_       | |                                            //
//    | |   `.____.'   | || | |_____|      | |                                            //
//    | |              | || |              | |                                            //
//    | '--------------' || '--------------' |                                            //
//     '----------------'  '----------------'                                             //
//     .----------------.  .----------------.  .----------------.                         //
//    | .--------------. || .--------------. || .--------------. |                        //
//    | |  ___  ____   | || |      __      | || |     _____    | |                        //
//    | | |_  ||_  _|  | || |     /  \     | || |    |_   _|   | |                        //
//    | |   | |_/ /    | || |    / /\ \    | || |      | |     | |                        //
//    | |   |  __'.    | || |   / ____ \   | || |      | |     | |                        //
//    | |  _| |  \ \_  | || | _/ /    \ \_ | || |     _| |_    | |                        //
//    | | |____||____| | || ||____|  |____|| || |    |_____|   | |                        //
//    | |              | || |              | || |              | |                        //
//    | '--------------' || '--------------' || '--------------' |                        //
//     '----------------'  '----------------'  '----------------'                         //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract Kai is ERC721Creator {
    constructor() ERC721Creator("Code_of_Kai", "Kai") {}
}