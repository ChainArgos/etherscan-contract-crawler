// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: NoContext Genesis Pass
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                            //
//                                                                                                                            //
//          ::::    :::  ::::::::          ::::::::   ::::::::  ::::    ::: ::::::::::: :::::::::: :::    ::: :::::::::::     //
//         :+:+:   :+: :+:    :+:        :+:    :+: :+:    :+: :+:+:   :+:     :+:     :+:        :+:    :+:     :+:          //
//        :+:+:+  +:+ +:+    +:+        +:+        +:+    +:+ :+:+:+  +:+     +:+     +:+         +:+  +:+      +:+           //
//       +#+ +:+ +#+ +#+    +:+        +#+        +#+    +:+ +#+ +:+ +#+     +#+     +#++:++#     +#++:+       +#+            //
//      +#+  +#+#+# +#+    +#+        +#+        +#+    +#+ +#+  +#+#+#     +#+     +#+         +#+  +#+      +#+             //
//     #+#   #+#+# #+#    #+#        #+#    #+# #+#    #+# #+#   #+#+#     #+#     #+#        #+#    #+#     #+#              //
//    ###    ####  ########          ########   ########  ###    ####     ###     ########## ###    ###     ###               //
//                                                                                                                            //
//                                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract NOCTXT is ERC721Creator {
    constructor() ERC721Creator("NoContext Genesis Pass", "NOCTXT") {}
}