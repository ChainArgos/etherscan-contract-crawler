// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: OCTAGON OBJECT
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                        //
//                                                                                                                                                        //
//                                                                                                                                                        //
//          ___                         ___           ___                    ___           ___                    ___           ___           ___         //
//         /  /\          ___          /  /\         /  /\                  /  /\         /  /\       ___        /  /\         /  /\         /  /\        //
//        /  /:/         /  /\        /  /::\       /  /::\                /  /::\       /  /:/      /__/\      /  /::\       /  /::|       /  /::\       //
//       /  /:/         /  /::\      /  /:/\:\     /__/:/\:\              /  /:/\:\     /  /:/       \__\:\    /  /:/\:\     /  /:|:|      /__/:/\:\      //
//      /  /:/         /  /:/\:\    /  /:/  \:\   _\_ \:\ \:\            /  /::\ \:\   /  /:/        /  /::\  /  /::\ \:\   /  /:/|:|__   _\_ \:\ \:\     //
//     /__/:/     /\  /  /::\ \:\  /__/:/ \__\:\ /__/\ \:\ \:\          /__/:/\:\_\:\ /__/:/      __/  /:/\/ /__/:/\:\ \:\ /__/:/ |:| /\ /__/\ \:\ \:\    //
//     \  \:\    /:/ /__/:/\:\ \:\ \  \:\ /  /:/ \  \:\ \:\_\/          \__\/  \:\/:/ \  \:\     /__/\/:/~~  \  \:\ \:\_\/ \__\/  |:|/:/ \  \:\ \:\_\/    //
//      \  \:\  /:/  \__\/  \:\_\/  \  \:\  /:/   \  \:\_\:\                 \__\::/   \  \:\    \  \::/      \  \:\ \:\       |  |:/:/   \  \:\_\:\      //
//       \  \:\/:/        \  \:\     \  \:\/:/     \  \:\/:/                 /  /:/     \  \:\    \  \:\       \  \:\_\/       |__|::/     \  \:\/:/      //
//        \  \::/          \__\/      \  \::/       \  \::/                 /__/:/       \  \:\    \__\/        \  \:\         /__/:/       \  \::/       //
//         \__\/                       \__\/         \__\/                  \__\/         \__\/                  \__\/         \__\/         \__\/        //
//                                                                                                                                                        //
//                                                                                                                                                        //
//                                                                                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract OBJECT is ERC1155Creator {
    constructor() ERC1155Creator("OCTAGON OBJECT", "OBJECT") {}
}