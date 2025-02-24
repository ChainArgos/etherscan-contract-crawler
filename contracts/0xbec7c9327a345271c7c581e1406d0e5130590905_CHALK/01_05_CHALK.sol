// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: CHALKed
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  //
//                                                                                                  //
//                                                                                                  //
//    ___  ___  ___  ______ _   __         _       _____  _   _   ___   _      _   __         _     //
//    |  \/  | / _ \ | ___ \ | / /        | |  _  /  __ \| | | | / _ \ | |    | | / /        | |    //
//    | .  . |/ /_\ \| |_/ / |/ /  ___  __| | (_) | /  \/| |_| |/ /_\ \| |    | |/ /  ___  __| |    //
//    | |\/| ||  _  ||    /|    \ / _ \/ _` |     | |    |  _  ||  _  || |    |    \ / _ \/ _` |    //
//    | |  | || | | || |\ \| |\  \  __/ (_| |  _  | \__/\| | | || | | || |____| |\  \  __/ (_| |    //
//    \_|  |_/\_| |_/\_| \_\_| \_/\___|\__,_| (_)  \____/\_| |_/\_| |_/\_____/\_| \_/\___|\__,_|    //
//                                                                                                  //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////


contract CHALK is ERC721Creator {
    constructor() ERC721Creator("CHALKed", "CHALK") {}
}