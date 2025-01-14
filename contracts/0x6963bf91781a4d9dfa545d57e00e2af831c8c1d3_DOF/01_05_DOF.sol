// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Dark of Undeads
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////
//                                              //
//                                              //
//        )        (                  (         //
//     ( /(    (   )\ ) (       (     )\ )      //
//     )\()) ( )\ (()/( )\ )    )\   (()/(      //
//    ((_)\  )((_) /(_)|()/( ((((_)(  /(_))     //
//      ((_)((_)_ (_))  /(_))_)\ _ )\(_))       //
//     / _ \ / _ \|_ _|(_)) __(_)_\(_) _ \      //
//    | (_) | (_) || |   | (_ |/ _ \ |  _/      //
//     \___/ \__\_\___|   \___/_/ \_\|_|        //
//                                              //
//                                              //
//                                              //
//////////////////////////////////////////////////


contract DOF is ERC1155Creator {
    constructor() ERC1155Creator("Dark of Undeads", "DOF") {}
}