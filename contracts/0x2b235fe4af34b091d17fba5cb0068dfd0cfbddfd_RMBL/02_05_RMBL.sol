// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Rumblemad
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                          //
//                                                                                                                          //
//          ___         ___          ___                                  ___          ___          ___        _____        //
//         /  /\       /__/\        /__/\        _____                   /  /\        /__/\        /  /\      /  /::\       //
//        /  /::\      \  \:\      |  |::\      /  /::\                 /  /:/_      |  |::\      /  /::\    /  /:/\:\      //
//       /  /:/\:\      \  \:\     |  |:|:\    /  /:/\:\  ___     ___  /  /:/ /\     |  |:|:\    /  /:/\:\  /  /:/  \:\     //
//      /  /:/~/:/  ___  \  \:\  __|__|:|\:\  /  /:/~/::\/__/\   /  /\/  /:/ /:/_  __|__|:|\:\  /  /:/~/::\/__/:/ \__\:|    //
//     /__/:/ /:/__/__/\  \__\:\/__/::::| \:\/__/:/ /:/\:\  \:\ /  /:/__/:/ /:/ /\/__/::::| \:\/__/:/ /:/\:\  \:\ /  /:/    //
//     \  \:\/:::::|  \:\ /  /:/\  \:\~~\__\/\  \:\/:/~/:/\  \:\  /:/\  \:\/:/ /:/\  \:\~~\__\/\  \:\/:/__\/\  \:\  /:/     //
//      \  \::/~~~~ \  \:\  /:/  \  \:\       \  \::/ /:/  \  \:\/:/  \  \::/ /:/  \  \:\       \  \::/      \  \:\/:/      //
//       \  \:\      \  \:\/:/    \  \:\       \  \:\/:/    \  \::/    \  \:\/:/    \  \:\       \  \:\       \  \::/       //
//        \  \:\      \  \::/      \  \:\       \  \::/      \__\/      \  \::/      \  \:\       \  \:\       \__\/        //
//         \__\/       \__\/        \__\/        \__\/                   \__\/        \__\/        \__\/                    //
//                                                                                                                          //
//                                                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract RMBL is ERC721Creator {
    constructor() ERC721Creator("Rumblemad", "RMBL") {}
}