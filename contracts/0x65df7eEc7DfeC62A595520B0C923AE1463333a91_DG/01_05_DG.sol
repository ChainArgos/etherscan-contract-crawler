// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: DIVINE GARDENS
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////
//                                                                                    //
//                                                                                    //
//     ____  _  _     _  _      _____   _____ ____  ____  ____  _____ _      ____     //
//    /  _ \/ \/ \ |\/ \/ \  /|/  __/  /  __//  _ \/  __\/  _ \/  __// \  /|/ ___\    //
//    | | \|| || | //| || |\ |||  \    | |  _| / \||  \/|| | \||  \  | |\ |||    \    //
//    | |_/|| || \// | || | \|||  /_   | |_//| |-|||    /| |_/||  /_ | | \||\___ |    //
//    \____/\_/\__/  \_/\_/  \|\____\  \____\\_/ \|\_/\_\\____/\____\\_/  \|\____/    //
//                                                                                    //
//                                                                                    //
//                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////


contract DG is ERC721Creator {
    constructor() ERC721Creator("DIVINE GARDENS", "DG") {}
}