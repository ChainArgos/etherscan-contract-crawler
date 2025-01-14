// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Lab
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////
//                                                                      //
//                                                                      //
//                                                                      //
//     ____  _   _  ____    __      __    ____                          //
//    (_  _)( )_( )( ___)  (  )    /__\  (  _ \                         //
//      )(   ) _ (  )__)    )(__  /(__)\  ) _ <                         //
//     (__) (_) (_)(____)  (____)(__)(__)(____/                         //
//       __    ____  __  __    __    ___  _   _  ____  _  _    __       //
//      /__\  (_  _)(  \/  )  /__\  / __)( )_( )(_  _)( \( )  /__\      //
//     /(__)\  _)(_  )    (  /(__)\( (__  ) _ (  _)(_  )  (  /(__)\     //
//    (__)(__)(____)(_/\/\_)(__)(__)\___)(_) (_)(____)(_)\_)(__)(__)    //
//     ____  ____   ___  ___  ___   __                                  //
//    ( ___)(  _ \ / __)(__ )(__ \ /  )                                 //
//     )__)  )   /( (__  / /  / _/  )(                                  //
//    (____)(_)\_) \___)(_/  (____)(__)                                 //
//                                                                      //
//                                                                      //
//                                                                      //
//////////////////////////////////////////////////////////////////////////


contract AiLab is ERC721Creator {
    constructor() ERC721Creator("The Lab", "AiLab") {}
}