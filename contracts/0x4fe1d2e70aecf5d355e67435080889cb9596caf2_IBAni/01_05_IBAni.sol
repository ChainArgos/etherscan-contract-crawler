// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Isekai Battle Anniversary
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                   //
//                                                                                                                                                                   //
//                                                                                                                                                                   //
//    .___               __           .__  __________         __    __  .__              _____                .__                                                    //
//    |   | ______ ____ |  | _______  |__| \______   \_____ _/  |__/  |_|  |   ____     /  _  \   ____   ____ |__|__  __ ___________  ___________ _______ ___.__.    //
//    |   |/  ___// __ \|  |/ /\__  \ |  |  |    |  _/\__  \\   __\   __\  | _/ __ \   /  /_\  \ /    \ /    \|  \  \/ // __ \_  __ \/  ___/\__  \\_  __ <   |  |    //
//    |   |\___ \\  ___/|    <  / __ \|  |  |    |   \ / __ \|  |  |  | |  |_\  ___/  /    |    \   |  \   |  \  |\   /\  ___/|  | \/\___ \  / __ \|  | \/\___  |    //
//    |___/____  >\___  >__|_ \(____  /__|  |______  /(____  /__|  |__| |____/\___  > \____|__  /___|  /___|  /__| \_/  \___  >__|  /____  >(____  /__|   / ____|    //
//             \/     \/     \/     \/             \/      \/                     \/          \/     \/     \/              \/           \/      \/       \/         //
//                                                                                                                                                                   //
//                                                                                                                                                                   //
//                                                                                                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract IBAni is ERC1155Creator {
    constructor() ERC1155Creator("Isekai Battle Anniversary", "IBAni") {}
}