// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Build an Ape by Reido
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                                                                                  //
//                                                                                                                                                                                                                                                                                  //
//                                                                                                                                                                                                                                                                                  //
//                        ___                                    _____                   ___           ___                    ___           ___         ___                                                       ___           ___                      _____          ___         //
//         _____         /__/\        ___                       /  /::\                 /  /\         /__/\                  /  /\         /  /\       /  /\                  _____          ___                 /  /\         /  /\        ___         /  /::\        /  /\        //
//        /  /::\        \  \:\      /  /\                     /  /:/\:\               /  /::\        \  \:\                /  /::\       /  /::\     /  /:/_                /  /::\        /__/|               /  /::\       /  /:/_      /  /\       /  /:/\:\      /  /::\       //
//       /  /:/\:\        \  \:\    /  /:/      ___     ___   /  /:/  \:\             /  /:/\:\        \  \:\              /  /:/\:\     /  /:/\:\   /  /:/ /\              /  /:/\:\      |  |:|              /  /:/\:\     /  /:/ /\    /  /:/      /  /:/  \:\    /  /:/\:\      //
//      /  /:/~/::\   ___  \  \:\  /__/::\     /__/\   /  /\ /__/:/ \__\:|           /  /:/~/::\   _____\__\:\            /  /:/~/::\   /  /:/~/:/  /  /:/ /:/_            /  /:/~/::\     |  |:|             /  /:/~/:/    /  /:/ /:/_  /__/::\     /__/:/ \__\:|  /  /:/  \:\     //
//     /__/:/ /:/\:| /__/\  \__\:\ \__\/\:\__  \  \:\ /  /:/ \  \:\ /  /:/          /__/:/ /:/\:\ /__/::::::::\          /__/:/ /:/\:\ /__/:/ /:/  /__/:/ /:/ /\          /__/:/ /:/\:|  __|__|:|            /__/:/ /:/___ /__/:/ /:/ /\ \__\/\:\__  \  \:\ /  /:/ /__/:/ \__\:\    //
//     \  \:\/:/~/:/ \  \:\ /  /:/    \  \:\/\  \  \:\  /:/   \  \:\  /:/           \  \:\/:/__\/ \  \:\~~\~~\/          \  \:\/:/__\/ \  \:\/:/   \  \:\/:/ /:/          \  \:\/:/~/:/ /__/::::\            \  \:\/:::::/ \  \:\/:/ /:/    \  \:\/\  \  \:\  /:/  \  \:\ /  /:/    //
//      \  \::/ /:/   \  \:\  /:/      \__\::/   \  \:\/:/     \  \:\/:/             \  \::/       \  \:\  ~~~            \  \::/       \  \::/     \  \::/ /:/            \  \::/ /:/     ~\~~\:\            \  \::/~~~~   \  \::/ /:/      \__\::/   \  \:\/:/    \  \:\  /:/     //
//       \  \:\/:/     \  \:\/:/       /__/:/     \  \::/       \  \::/               \  \:\        \  \:\                 \  \:\        \  \:\      \  \:\/:/              \  \:\/:/        \  \:\            \  \:\        \  \:\/:/       /__/:/     \  \::/      \  \:\/:/      //
//        \  \::/       \  \::/        \__\/       \__\/         \__\/                 \  \:\        \  \:\                 \  \:\        \  \:\      \  \::/                \  \::/          \__\/             \  \:\        \  \::/        \__\/       \__\/        \  \::/       //
//         \__\/         \__\/                                                          \__\/         \__\/                  \__\/         \__\/       \__\/                  \__\/                              \__\/         \__\/                                   \__\/        //
//                                                                                                                                                                                                                                                                                  //
//                                                                                                                                                                                                                                                                                  //
//                                                                                                                                                                                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract BAPES is ERC1155Creator {
    constructor() ERC1155Creator("Build an Ape by Reido", "BAPES") {}
}