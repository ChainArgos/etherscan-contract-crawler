// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Bugapu Friends
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                            //
//                                                                                                                                            //
//        _/_/_/                                                          _/_/_/_/            _/                            _/                //
//       _/    _/  _/    _/    _/_/_/    _/_/_/  _/_/_/    _/    _/      _/        _/  _/_/        _/_/    _/_/_/      _/_/_/    _/_/_/       //
//      _/_/_/    _/    _/  _/    _/  _/    _/  _/    _/  _/    _/      _/_/_/    _/_/      _/  _/_/_/_/  _/    _/  _/    _/  _/_/            //
//     _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/      _/        _/        _/  _/        _/    _/  _/    _/      _/_/         //
//    _/_/_/      _/_/_/    _/_/_/    _/_/_/  _/_/_/      _/_/_/      _/        _/        _/    _/_/_/  _/    _/    _/_/_/  _/_/_/            //
//                             _/            _/                                                                                               //
//                        _/_/              _/                                                                                                //
//                                                                                                                                            //
//                                                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract BUGAPU is ERC721Creator {
    constructor() ERC721Creator("Bugapu Friends", "BUGAPU") {}
}