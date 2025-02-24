// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: SkullsByGage
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////
//                                                                                      //
//                                                                                      //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬     _____ _          _ _     ____         _____                        ╬╬╬    //
//    ╬╬╬    / ____| |        | | |   |  _ \       / ____|                       ╬╬╬    //
//    ╬╬╬   | (___ | | ___   _| | |___| |_) |_   _| |  __  __ _  __ _  ___       ╬╬╬    //
//    ╬╬╬    \___ \| |/ / | | | | / __|  _ <| | | | | |_ |/ _` |/ _` |/ _ \      ╬╬╬    //
//    ╬╬╬    ____) |   <| |_| | | \__ \ |_) | |_| | |__| | (_| | (_| |  __/      ╬╬╬    //
//    ╬╬╬   |_____/|_|\_\\__,_|_|_|___/____/ \__, |\_____|\__,_|\__, |\___|      ╬╬╬    //
//    ╬╬╬                                     __/ |              __/ |           ╬╬╬    //
//    ╬╬╬                _   ____         ___|__ /              |___/  _   _     ╬╬╬    //
//    ╬╬╬     /\        | | |  _ \       / ____|                      | | | |    ╬╬╬    //
//    ╬╬╬    /  \   _ __| |_| |_) |_   _| |  __  __ _  __ _  ___   ___| |_| |__  ╬╬╬    //
//    ╬╬╬   / /\ \ | '__| __|  _ <| | | | | |_ |/ _` |/ _` |/ _ \ / _ \ __| '_ \ ╬╬╬    //
//    ╬╬╬  / ____ \| |  | |_| |_) | |_| | |__| | (_| | (_| |  __/|  __/ |_| | | |╬╬╬    //
//    ╬╬╬ /_/    \_\_|   \__|____/ \__, |\_____|\__,_|\__, |\___(_)___|\__|_| |_|╬╬╬    //
//    ╬╬╬                           __/ |              __/ |                     ╬╬╬    //
//    ╬╬╬                          |___/              |___/                      ╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬████████████████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███████╬╬╬╬╬╬╬╬╬╬╬╬╬╬████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█████████╬╬╬╬███████████╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬█████████████╬██████████╬███╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬██╬████████╬╬█╬█╬█████████╬╬███╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬██╬╬╬███╬╬╬╬╬╬████╬╬███╬╬╬╬███╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬██████╬╬╬╬╬██╬╬╬███╬╬╬╬╬╬███╬╬╬████╬╬╬╬╬██████╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬████╬╬╬╬╬╬███╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬████████╬╬╬╬╬╬██████████╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬█╬╬╬███████╬╬╬╬╬╬╬╬████████╬╬╬╬█╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬█╬╬╬██████╬╬╬╬██╬╬╬╬╬███╬╬╬╬╬╬█╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬╬╬█╬╬╬╬███╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬████╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬██████╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬████╬█╬╬╬╬╬╬╬╬╬╬╬████████╬╬╬╬╬╬╬╬╬╬╬╬████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬████████╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬████████╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█████╬██╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬████████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬█╬╬█╬╬╬█╬╬╬█╬╬╬█╬╬╬╬█╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬█╬╬█╬╬╬█╬╬╬█╬╬╬█╬╬╬╬█╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬█╬╬█╬╬╬█╬╬╬█╬╬╬█╬╬╬╬█╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬█████████████████████╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬█████████████████████╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬█╬╬╬█╬╬╬█╬╬╬█╬╬█╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬█╬╬╬█╬╬╬█╬╬╬█╬╬█╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬█╬╬╬█╬╬╬█╬╬╬█╬╬█╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬     //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬███╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╬╬╬╬███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬     //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬████╬╬╬██╬╬╬╬╬╬╬╬╬╬╬██╬██████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬████████╬╬╬╬╬████████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//    ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//                                                                                      //
//                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////


contract SKULL is ERC1155Creator {
    constructor() ERC1155Creator("SkullsByGage", "SKULL") {}
}