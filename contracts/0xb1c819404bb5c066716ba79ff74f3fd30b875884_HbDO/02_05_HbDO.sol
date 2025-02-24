// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Haunted by David Oxley
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////
//                                                                                       //
//                                                                                       //
//                                                                                       //
//     __    __     ____     __    __      __      _   ________    _____   ______        //
//    (  \  /  )   (    )    ) )  ( (     /  \    / ) (___  ___)  / ___/  (_  __ \       //
//     \ (__) /    / /\ \   ( (    ) )   / /\ \  / /      ) )    ( (__      ) ) \ \      //
//      ) __ (    ( (__) )   ) )  ( (    ) ) ) ) ) )     ( (      ) __)    ( (   ) )     //
//     ( (  ) )    )    (   ( (    ) )  ( ( ( ( ( (       ) )    ( (        ) )  ) )     //
//      ) )( (    /  /\  \   ) \__/ (   / /  \ \/ /      ( (      \ \___   / /__/ /      //
//     /_/  \_\  /__(  )__\  \______/  (_/    \__/       /__\      \____\ (______/       //
//                                                                                       //
//    By David Oxley                                                                     //
//                                                                                       //
//                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////


contract HbDO is ERC721Creator {
    constructor() ERC721Creator("Haunted by David Oxley", "HbDO") {}
}