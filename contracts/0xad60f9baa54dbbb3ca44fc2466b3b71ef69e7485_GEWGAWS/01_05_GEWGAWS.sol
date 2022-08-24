// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: GEWGAWS
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////
//                                                                   //
//                                                                   //
//       _____ ________          _______     __          _______     //
//      / ____|  ____\ \        / / ____|   /\ \        / / ____|    //
//     | |  __| |__   \ \  /\  / / |  __   /  \ \  /\  / / (___      //
//     | | |_ |  __|   \ \/  \/ /| | |_ | / /\ \ \/  \/ / \___ \     //
//     | |__| | |____   \  /\  / | |__| |/ ____ \  /\  /  ____) |    //
//      \_____|______|   \/  \/   \_____/_/    \_\/  \/  |_____/     //
//                                                                   //
//                                                                   //
//          ___  _ ___       _  _   _     ___ ___      _             //
//     |\ |  |  |_  | \_/   /  |_) |_  /\  |   | \  / |_             //
//     | \| _|_ |   |  |    \_ | \ |_ /--\ |  _|_ \/  |_             //
//                                                                   //
//    https://niftycre.com                                           //
//    https://twitter.com/niftycre                                   //
//                                                                   //
//                                                                   //
///////////////////////////////////////////////////////////////////////


contract GEWGAWS is ERC721Creator {
    constructor() ERC721Creator("GEWGAWS", "GEWGAWS") {}
}