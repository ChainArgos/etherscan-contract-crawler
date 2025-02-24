// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Witching Hour
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//                                                                                        //
//    Sandra Elderberry FOKSYNΞS                                                          //
//    ████████████████████████████████████████████████████████████████████████████████    //
//    ██▓██████████████████████████████████▓███████▓╬█████████████████████████████████    //
//    █████████████████████████▓█████████████████████████████████████████▓███▓▓███████    //
//    █████████████████████████▓██████████████████████████████████████████████████████    //
//    ██████████▓▓▓██████████████████████████████████████████████▓▓███████████████████    //
//    ███████████████████████████████████████████████████████████████▓██▓▓████████████    //
//    ██▓▓██████▓▓████╣█████████████████████████████████████████████████████████▓╬████    //
//    █████████████▓▓▓╣▓▓████████████████████████████████████████████▓▓███████████████    //
//    ██████████▓▓▓▓▓╣╬╬╬╬╬▓╬▓▓█▓██████████████████████████████████████████████████▓╣█    //
//    ██████▓▓█▓╬╬▓▓▓▓▓▓▓▓▓▓▓╣╬╬▓▓▓▓██████████████████████████████████████████████████    //
//    ▓▓███▓▓╬╣▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╣▓▓▓▓███████████▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓██████████▓▓██▓█████    //
//    ████▓▓╬╣▓▓▓▓▓╬╬╬╬╬╬╬╬╣▓▓▓▓▓╬▓▓▓▓██████████▓▒╬╬╣▓╣╫▓▓▓██████▓▓▓▓█████████████████    //
//    ████▓▓╣▓▓▓▓▓╬╬╬╬╩╚╩╠╠╬╬▓▓▓▓▓╬▓▓████████████▓╬▓╣╣▓╬▓▓▓███▓██████▓▓███████████████    //
//    ███▓▓▓╣▓▓▓▓▓╬╬╠╠░░░╠╠╣╬╣▓▓▓▓╣▓▓█████████████▓▓╬╣▓╬╬▓▓╬╬█▓██▓▓███▓▓████████████▓█    //
//    ███▓▓▓╣▓▓▓▓▓╬╣╬╠╠╠╠╠╠╬╬╣▓▓▓▓╬▓▓██████████████▓╬▓╣▓▓╬▓▓▓▓▓▓▓██▓█▓╬╫▓████████▓▓███    //
//    ████▓▓▓╣▓▓▓▓╣╬╬╬╬╬╬╣╬╬╣▓▓▓▓╬╫▓███████████████▓╠╬╬╬╬▓▓▓█▓███▓█▓███▓▓▓▓▓██████████    //
//    ████▓▓▓▓▓╣▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╣▓▓▓███████████████▓╣╬╬╬╣▓▓█▓▓████▓▓██████▓▓▓█████████    //
//    ███████▓▓▓▓╣╬▓▓▓▓▓▓▓▓╬╬╬╣╫▓▓▓▓███████████████▓▓▓╬╬╣▓▓▓▓╬██████████████▓███████▓█    //
//    ████████▓▓▓▓▓▓▓▓╣╬╫╣▓╣▓▓▓▓▓███████████████████▓╬╣╬╬╬▓▓▓▓██████████████▓▓████████    //
//    ██████████▓▓▓▓▓▓▓▓╬╬▓▓███████████████████████████▓▓▓▓╣▓█████████████████████████    //
//    ██▓███████████▓▓██▓▓██████████████████████████████▓▓▓▓▓▓╬╬╬╬╬█████████████▓▓████    //
//    ██████████████████▓▓█████████████████████████████▓▓▓▓▓▒╠╬╬▓▓▓╬█████████████▓████    //
//    ██▓▓▓█████▓▓███████╬█████████████████████████████▓▓▓▓▒▒╢╣▓▓▓╬▓▓▓████████████████    //
//    █████████████████▓╬╬▓████████████████████████████▓▓▓╬╠╬╣╣▓╬╬╬╬▓▓████████████████    //
//    █████████▓███████▓▓▓╬╣╬╬████████████████████████▓▓▓╬▒╬╣╣╢╬╬╬╣╬╬▓█████████▓▓█████    //
//    ████▓▓█▓█████████▓▓╣╣╬╬╣╬▓█████████████████████▓▓▓╬▒╣╬▓▓▓╣▓╬╬╣▓▓████████████████    //
//    ███▓▓▓▓▓███████████▓╬╬╬╣╣╬╬╬▓▓███████████████▓▓▓╬╠╬╣╣▓▓▓▓█╬╬╣╣▓█████████████████    //
//    █████▓╬▓████████████████▓▓╣╫▓╬╠╬╬╬▓▓▓▓╬╬╬╬╬╬╬╬╢╠╣╣╣╬╣▓▓███▓▓╬╣██████████████████    //
//    ███╬▓███████████████▓▓████▓▓▓▓▓╣╣╬╬╬╬╣╬╬╬╬╣╣▓╬╣╣╬╣╬╣▓╬▓█████▓╬▓█████████████████    //
//    ██▓▓███▓╬╣█╬▓████████▓██████████▓▓▓▓╬╬╣╬╣▓╬╣╬▓╬╬▓╣╬╬▓╣╣╬█████▓▓█████████████████    //
//    ████████████▓▓▓█▓╬██████████████████▓▓▓▓╬╣▓▓╬╬▓╬╬▓▓╬╫▓╣╬╬███████████████████████    //
//    ████████████████████████████████████████▓╬╬▓▓╬╣▓▓╬╫▓▓╣▓▓▓╬██████████████████████    //
//    ██████████╬╬╬▓█╬▓████████████████████████▓╬╬▓╣╬╫▓▓╬╬▓▓╬▓▓╬╬█████████████████████    //
//    ██████▓▓███▓▓█████████████████████████████╬╬╣▓╬╢╬▓▓╬╣▓▓╣╣▓╣╬██████████████╬╣▓███    //
//    ██▓█████▓████████▓███████████████████▓█████╬╬╣╣╬╣╬▓▓▓╣▓▓▓╣▓╬╣▓█████████████▓████    //
//    ████████████████▓╬▓██████████████████▓▓█▓███╬╣▓▓╬╣╣▓▓▓╣▓▓▓▓█▓▓▓▓████▓╬▓█████████    //
//    ████████████████████████████████████▓▓▓█▓███▓╬╬╣▓╬╣▓█▓▓▓▓▓▓▓███▓▓█████╬▓████████    //
//    █████▓▓▓███╬╬╬████████████▓█████████▓▓██▓████╬╣╬▓▓▓╬▓█▓▓▓▓██████████████████████    //
//    █████▓▓▓████████████▓██████▓█████████▓████▓███▓▓▓▓▓▓▓██▓▓▓╣█▓╬╣╣██████████▓╬▓███    //
//    ██████████████████████████▓██████████▓█████████▓█▓███████████▓██████▓╬▓█████████    //
//    ████████████████████████▓████████████▓████████████▓████████▓▓████▓██▓▓▓█████████    //
//    ████████████▓▓███████████████▓╣╣╬▓▓██████▓▓██████▓▓▓██████▓▓████████▓███████████    //
//    █████▓█████▓▓▓████████▓╬██████▓▓▓█████████╣███▓████████████████████▓▓███████████    //
//    ████▓▓╬██████████████████████████████╣╣▓███████▓▓█▓█████▓██▓█▓▓███▓▓████████▓▓██    //
//    █████▓███████████████████████████╬▓███████▓╣███████████▓▓▓██▓███████████████████    //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract WITCH is ERC721Creator {
    constructor() ERC721Creator("Witching Hour", "WITCH") {}
}