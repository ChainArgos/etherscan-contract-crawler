// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: andstillatoms
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                         //
//                                                                                         //
//                                                                                         //
//                       _       _    _  _  _         _                                    //
//                      | |     | |  (_)| || |       | |                                   //
//      __ _  _ __    __| | ___ | |_  _ | || |  __ _ | |_  ___   _ __ ___   ___            //
//     / _` || '_ \  / _` |/ __|| __|| || || | / _` || __|/ _ \ | '_ ` _ \ / __|           //
//    | (_| || | | || (_| |\__ \| |_ | || || || (_| || |_| (_) || | | | | |\__ \           //
//     \__,_||_| |_| \__,_||___/ \__||_||_||_| \__,_| \__|\___/ |_| |_| |_||___/           //
//                                                                SOMEONE                  //
//                                                                                         //
//                                                                                         //
//                                                                                         //
//                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////


contract and is ERC721Creator {
    constructor() ERC721Creator("andstillatoms", "and") {}
}