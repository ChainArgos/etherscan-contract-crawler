// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: ERMAN GULBAG
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                         //
//                                                                                         //
//                                                                                         //
//      ______ _____  __  __          _   _    _____ _    _ _      ____          _____     //
//     |  ____|  __ \|  \/  |   /\   | \ | |  / ____| |  | | |    |  _ \   /\   / ____|    //
//     | |__  | |__) | \  / |  /  \  |  \| | | |  __| |  | | |    | |_) | /  \ | |  __     //
//     |  __| |  _  /| |\/| | / /\ \ | . ` | | | |_ | |  | | |    |  _ < / /\ \| | |_ |    //
//     | |____| | \ \| |  | |/ ____ \| |\  | | |__| | |__| | |____| |_) / ____ \ |__| |    //
//     |______|_|  \_\_|  |_/_/    \_\_| \_|  \_____|\____/|______|____/_/    \_\_____|    //
//                                                                                         //
//                                                                                         //
//                                                                                         //
//                                                                                         //
//                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////


contract EG is ERC721Creator {
    constructor() ERC721Creator("ERMAN GULBAG", "EG") {}
}