// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The art of a LostCowboy
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        ╬▓█████████████▒╬▓█╬╬╬▓█▓╬╠▒▓▓▓╬╬╬▓▓▓▓█████████╬╣╬█████████▓▓███████████████████    //
//        █████████████▒╬▓█╬▓╬█▓▒╬▓▓█▓▓▄███╬╬▓██████████████▓╬╬███╬█▓╣▓╬██████████████████    //
//        ███████████▒╬╬█╬▓╬█╬╬╬▓▓╬╬▓██████████████████████████╬╬████╬╬█╬╬╣╬╣╬████████████    //
//        ██████████╬╬█▓▓╬█╬╬╬█╬╬▓██████████████████████████████╬█████╬█╬╬╬╣╬╬╣███████████    //
//        ████████▒╬╬█╬▓██╬╬█▓╬▓████████████▓╬╠╬╩╠╬╠╠╬╬████████████▓▓▓▓▓▓╬╬╬╬╣████████████    //
//        ███████╬╬▓█▓╬█▒╬╣█╬╣████████████╬▒▒▓▓░╠▄▓▓▓▄▒╠╠╬████████████╬╬╬██▓▓╬████████████    //
//        ██████╬╬█╬▓▓█╬╬▓█╬████████████▌╠▒▄╬╠╠╠█▀╬▄▄▒╬▀▓▒╠╟███████╬╬╬█╬╬╬╬╬███╬██████████    //
//        ████▒╬██╬╬█╬╬╬█▒╬████████████████▒╬╠╠╠╟▓▒╠▒╬▓▒▒╠▒╠╫███╬█╬▓╬╬╬█╬╬╬╬██╬╬▓╬╬╣██████    //
//        ███╬╣█╬▓▓█╬╬╬█╬╬█████████████▌█╬▒╠╠╠╠▒█▓╬╬╬╬██▓▀░╠╟████╬▓╬▓╬▓╬█╬╬█╬█╬╬╬█▓╣██████    //
//        █╬╬█╬▓╬█▒╬╬▓█╬╢█▒╬▓███████████╟╬╠╠╬╠╬╫█▓╬█╬▓╬█▒╠╠╠╫╬██╣▒█╬╢╣╬▒█╬╬██╬▓╬▓███████▓▓    //
//        ╬█╬▓▓██╬╬╬█▒╬▓█╬█▓████████████╟╬╠╠╬╠╠██╣╬██░▓█▒█▒╠╠╣████╣╬╬╬╬▓█╬╬█╬▓▓██████████╬    //
//        ╬▓▓▓█╬╬╬▓█╬╬█▒███████████████▌▓╬▀▓▒▒╠██▓▓▓█░███▒▒╠╠╬╫█████▓█▓███▒╬╬██████╬╬▓▓██╬    //
//        ▓▓█╬╬╬▓█▒╬╟█▓███████████████▄▓╬╠╠╣██╬╟████▀╬█╬▓█▒╬╠╬▓███████████▒╬█████╬╬█╬╬╬▓█▓    //
//        █╬╬╬╟█▒╬╬██████████████████▌╠░▒╠╠╠╠╠╠╠╟█▒╠╠▓╬▓╬╠░╠╬╬╬███████████╫████▒╬█╬▓╣█▓╬╬▓    //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract lostx is ERC721Creator {
    constructor() ERC721Creator("The art of a LostCowboy", "lostx") {}
}