// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: MRH PFP
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////
//                                                  //
//                                                  //
//          ___           ___           ___         //
//         /\__\         /\  \         /\__\        //
//        /::|  |       /::\  \       /:/  /        //
//       /:|:|  |      /:/\:\  \     /:/__/         //
//      /:/|:|__|__   /::\~\:\  \   /::\  \ ___     //
//     /:/ |::::\__\ /:/\:\ \:\__\ /:/\:\  /\__\    //
//     \/__/~~/:/  / \/_|::\/:/  / \/__\:\/:/  /    //
//           /:/  /     |:|::/  /       \::/  /     //
//          /:/  /      |:|\/__/        /:/  /      //
//         /:/  /       |:|  |         /:/  /       //
//         \/__/         \|__|         \/__/        //
//          ___           ___           ___         //
//         /\  \         /\  \         /\  \        //
//        /::\  \       /::\  \       /::\  \       //
//       /:/\:\  \     /:/\:\  \     /:/\:\  \      //
//      /::\~\:\  \   /::\~\:\  \   /::\~\:\  \     //
//     /:/\:\ \:\__\ /:/\:\ \:\__\ /:/\:\ \:\__\    //
//     \/__\:\/:/  / \/__\:\ \/__/ \/__\:\/:/  /    //
//          \::/  /       \:\__\        \::/  /     //
//           \/__/         \/__/         \/__/      //
//                                                  //
//                                                  //
//                                                  //
//                                                  //
//////////////////////////////////////////////////////


contract MRH is ERC1155Creator {
    constructor() ERC1155Creator("MRH PFP", "MRH") {}
}