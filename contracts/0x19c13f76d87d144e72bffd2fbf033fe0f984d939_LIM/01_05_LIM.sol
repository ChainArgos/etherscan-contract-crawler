// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Less is More
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                           //
//                                                                                           //
//    ████████████████████████████████████████████████████████████████████████████████       //
//    ██████████ .----------------.  .----------------.  .----------------. ██████████       //
//    ██████████| .--------------. || .--------------. || .--------------. |██████████       //
//    ██████████| |   _____      | || |     _____    | || | ____    ____ | |██████████       //
//    ██████████| |  |_   _|     | || |    |_   _|   | || ||_   \  /   _|| |██████████       //
//    ██████████| |    | |       | || |      | |     | || |  |   \/   |  | |██████████       //
//    ██████████| |    | |   _   | || |      | |     | || |  | |\  /| |  | |██████████       //
//    ██████████| |   _| |__/ |  | || |     _| |_    | || | _| |_\/_| |_ | |██████████       //
//    ██████████| |  |________|  | || |    |_____|   | || ||_____||_____|| |██████████       //
//    ██████████| |              | || |              | || |              | |██████████       //
//    ██████████| '--------------' || '--------------' || '--------------' |██████████       //
//    ██████████ '----------------'  '----------------'  '----------------' ██████████       //
//    ████████████████████████████████████████████████████████████████████████████████       //
//                                                                                           //
//    MINIMALIST DESIGN REQUIRES EXTREME PRECISION. Therefore, eliminate the superfluous     //
//    – it sounds easy, but it is not. Focusing on a few design elements does not allow      //
//    for any compromise in design. It highlights everything that can be seen and felt.      //
//                                                                                           //
//    --------------- LIM | lessismoreart.eth | https://lessismore.art ---------------       //
//                                                                                           //
//    ████████████████████████████████████████████████████████████████████████████████       //
//                                                                                           //
//    ████████████████████████████████████████████████████████████████████████████████       //
//                                                                                           //
//    ████████████████████████████████████████████████████████████████████████████████       //
//                                                                                           //
//    ████████████████████████████████████████████████████████████████████████████████       //
//                                                                                           //
//    ████████████████████████████████████████████████████████████████████████████████       //
//                                                                                           //
//    ████████████████████████████████████████████████████████████████████████████████       //
//                                                                                           //
//                                                                                           //
//                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////


contract LIM is ERC721Creator {
    constructor() ERC721Creator("Less is More", "LIM") {}
}