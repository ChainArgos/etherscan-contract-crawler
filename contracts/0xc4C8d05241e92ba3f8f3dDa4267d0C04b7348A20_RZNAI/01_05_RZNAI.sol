// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Ornate Fantasies
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                    //
//                                                                                                                                                                                    //
//                                                                                                                                                                                    //
//      _____                 _   _ _         _____          _          _____  _           _                              _            __          ___ _   _                _____     //
//     |  __ \               | \ | (_)       |  __ \        | |        |  __ \| |         | |                            | |           \ \        / (_) | | |         /\   |_   _|    //
//     | |__) |___ ______ _  |  \| |_  __ _  | |__) |__  ___| |_ ______| |__) | |__   ___ | |_ ___   __ _ _ __ __ _ _ __ | |__  _   _   \ \  /\  / / _| |_| |__      /  \    | |      //
//     |  _  // _ \_  / _` | | . ` | |/ _` | |  ___/ _ \/ __| __|______|  ___/| '_ \ / _ \| __/ _ \ / _` | '__/ _` | '_ \| '_ \| | | |   \ \/  \/ / | | __| '_ \    / /\ \   | |      //
//     | | \ \  __// / (_| | | |\  | | (_| | | |  | (_) \__ \ |_       | |    | | | | (_) | || (_) | (_| | | | (_| | |_) | | | | |_| |    \  /\  /  | | |_| | | |  / ____ \ _| |_     //
//     |_|  \_\___/___\__,_| |_| \_|_|\__,_| |_|   \___/|___/\__|      |_|    |_| |_|\___/ \__\___/ \__, |_|  \__,_| .__/|_| |_|\__, |     \/  \/   |_|\__|_| |_| /_/    \_\_____|    //
//                                                                                                   __/ |         | |           __/ |                                                //
//                                                                                                  |___/          |_|          |___/                                                 //
//                                                                                                                                                                                    //
//                                                                                                                                                                                    //
//                                                                                                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract RZNAI is ERC721Creator {
    constructor() ERC721Creator("Ornate Fantasies", "RZNAI") {}
}