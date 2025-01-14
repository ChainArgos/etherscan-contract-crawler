// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Josello
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////
//                                                        //
//                                                        //
//          _                _ _               _____      //
//         | |              | | |        /\   |  __ \     //
//         | | ___  ___  ___| | | ___   /  \  | |__) |    //
//     _   | |/ _ \/ __|/ _ \ | |/ _ \ / /\ \ |  _  /     //
//    | |__| | (_) \__ \  __/ | | (_) / ____ \| | \ \     //
//     \____/ \___/|___/\___|_|_|\___/_/    \_\_|  \_\    //
//                                                        //
//                                                        //
//                                                        //
//                                                        //
////////////////////////////////////////////////////////////


contract JAR is ERC721Creator {
    constructor() ERC721Creator("Josello", "JAR") {}
}