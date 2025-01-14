// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: 60r90
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                //
//                                                                                                //
//    ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((    //
//    ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((    //
//    ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((    //
//    ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((    //
//    ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((    //
//    ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((    //
//    ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((    //
//    (((((((((((((((((((((((%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((((((((((((((((((((    //
//    (((((((((((((((((((((((%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%((((((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@%///*,***,***,***,***,***,***,***,***,////@@@@(((((((((((((((((((    //
//    ((((((((((((((((((((@@@%///,*********************************////@@@@(((((((((((((((((((    //
//    ((((((((((((((((((((@@@#,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@****@@@@(((/.../(((((((((((    //
//    ((((((((((((((((((((@@@%///,*********************************////@@@@(((/.../(((((((((((    //
//    ((((((((((((((((((((@@@%///,,,**,***************,***********,////@@@@(((/.../(((((((((((    //
//    ((((((((((((((((((((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(((((((/.../(((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@/((((((((((/.../(((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((/.../(((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%,,,,@@@@@@@@@@@//////////////*////////@@@((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@(((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//    ((((((((((((((((((((@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@@@(((((((((((((((((((((((((((    //
//                                                                                                //
//                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////


contract R0690 is ERC1155Creator {
    constructor() ERC1155Creator("60r90", "R0690") {}
}