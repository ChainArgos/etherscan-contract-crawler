// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Street Shooting
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                     //
//                                                                                                                     //
//                                                                                                                     //
//    ___________.__          __________.__            __           ________            ___.  ___.                     //
//    \__    ___/|  |__   ____\______   \  |__   _____/  |_  ____  /  _____/___________ \_ |__\_ |__   ___________     //
//      |    |   |  |  \_/ __ \|     ___/  |  \ /  _ \   __\/  _ \/   \  __\_  __ \__  \ | __ \| __ \_/ __ \_  __ \    //
//      |    |   |   Y  \  ___/|    |   |   Y  (  <_> )  | (  <_> )    \_\  \  | \// __ \| \_\ \ \_\ \  ___/|  | \/    //
//      |____|   |___|  /\___  >____|   |___|  /\____/|__|  \____/ \______  /__|  (____  /___  /___  /\___  >__|       //
//                    \/     \/              \/                           \/           \/    \/    \/     \/           //
//       _____ _____________________      /\                              /\   _______  ______________________         //
//      /  _  \\______   \__    ___/     / /                             / /   \      \ \_   _____/\__    ___/         //
//     /  /_\  \|       _/ |    |       / /   www.ThePhotoGrabber.com   / /    /   |   \ |    __)    |    |            //
//    /    |    \    |   \ |    |      / /                             / /    /    |    \|     \     |    |            //
//    \____|__  /____|_  / |____|     / /                             / /     \____|__  /\___  /     |____|            //
//            \/       \/             \/                              \/              \/     \/                        //
//                                                                                                                     //
//                                                                                                                     //
//                                                                                                                     //
//                                                                                                                     //
//                                                                                                                     //
//                                                                                                                     //
//                                                                                                                     //
//                                                                                                                     //
//                                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract TPG23 is ERC721Creator {
    constructor() ERC721Creator("Street Shooting", "TPG23") {}
}