// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: UnDreams
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////
//                                                                        //
//                                                                        //
//    .-. .-..-. .-. ,'|"\   ,---.    ,---.    .--.             .---.     //
//    | | | ||  \| | | |\ \  | .-.\   | .-'   / /\ \ |\    /|  ( .-._)    //
//    | | | ||   | | | | \ \ | `-'/   | `-.  / /__\ \|(\  / | (_) \       //
//    | | | || |\  | | |  \ \|   (    | .-'  |  __  |(_)\/  | _  \ \      //
//    | `-')|| | |)| /(|`-' /| |\ \   |  `--.| |  |)|| \  / |( `-'  )     //
//    `---(_)/(  (_)(__)`--' |_| \)\  /( __.'|_|  (_)| |\/| | `----'      //
//          (__)                 (__)(__)            '-'  '-'             //
//                                                                        //
//                                                                        //
////////////////////////////////////////////////////////////////////////////


contract UDS is ERC721Creator {
    constructor() ERC721Creator("UnDreams", "UDS") {}
}