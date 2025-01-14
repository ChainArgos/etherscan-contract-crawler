// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: DECONSTRUCT - BLACK BOX
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        █▓███╬▓▓▓▓▓██╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╟╠╬╬╬╬╬╬╬╠╬╣╣╬╬╬╬╬╬▓╣╬╬▓╬╬╬╬╠╠╠╬╬╬╬╬╬╠╠╠╠▒╠Γ╣╬█▓▓▓▓▓    //
//        ▓▓▓██╬▓█▓╣▓▓█╬╬╬╬╬╬╬╬╬╬╬╬╬▓╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╠╬▓╬╬╬╬╬╠╬╬╬╬╬╬╬╬╬╠▒╬│▒╬╬█▓▓▓▓▓    //
//        ▓▓▓██╬▓█▓▓▓▓█╬╬╬╬╬╬╬╬╬╬╬╬╣╬╣╣▓╬╬╬╬╬╬╬╠╬╬╬╬╬╬╬╬╬╣▓▓╬╬╬╬╬╬╬╬╬╬╠╬╠╬╬╬╢╠╬▒▒╬╟╬▓▓▓▓▓▓    //
//        ▓▓▓██╬▓█▓▓█▓█╬╬╣╬▓╬╬╬╬╬╬╬╬╬╬╬█╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╫╠╠▒░▒╣╬▓▓▓▓▓▓    //
//        ▓▓▓█▓╬▓▓▓▓▓▓█╬╬╬╣▓╬╬╬╬╬╬╬╬╬╬╬╬▓▓▓╬╬╬╠╬╣▓▓╬╬╣╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╣╫╣╬╢φ▒╟╠╬▓▓▓▓▓    //
//        ▓▓▓╬▓╬▓▓╣▓╬▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬█▓╬╬╣▓█▓╬╬╬▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╠╬╬╬╬╠╠╟╬░░╠╬░╬╠▓▓▓    //
//        ▓███████████████████████████████╬╬╣█▓█╣██╟▓╬╬╬█████████████████████████████████▓    //
//        ▓▓██████████████████████████████▓▓▓▓██████╬╬╬╣█████████████████████████████████▓    //
//        ▓▓█████████▓▓▓▓▓▓▓▓╬╬╬▓╣▓▓▓██████▓╬╬╣╬▓▓╬╬╢╬▓████████▓▓╣╫╣╬╫╬╢╫╫╫╬╬████████████▓    //
//        ▓███████▓▓█▓▓█▓█▓▓▓▓▓▓▓▓▓▓▓╣▓▓█▓▓▓╬╬╬╬╣╬╬╬╬╠████▓▓▓╣╬╣▓▓▓▓▓▓▓▓▓▓█▓▓▓▓╬╬▓███████▓    //
//        ▓████████▓╬╬╬╬╬╬╬╬╬╬▓▓╬╬╬╬▓███▓▓▓▓╬╬╬╬╠╬╠╬╬╠▓▓▓█████╬╠╬╬╬╬╬╬╟╬╣╬╬╬╬╬╬▓█████████▓    //
//        ▓████████▓█▓███████▓▓▓▓▓╬╣╬╬╬╬╣╣▓▓╠╬╬╬╣╠╬╬╬╬▓▓▓▓▓▓╣╬╬╬▓▓▓████████████▓▓▓▓██████▓    //
//        ▓▓███████▓╬╬╬▓▓▓▓▓▓▓╬▓╣▀████▓▓▓╬╣▓╬╬╬╬╬╬╬╬╠╬▓▓▓███████╬╬╬╠╬▓▓█▓▓▓▓╣▓╠╬▓████████▓    //
//        ▓▓███████████████████████▓▓╬╬██╣╣▓╬╬╬╬╬╠╬╬╬╬▓▓▓██▓█████████████▓╠██████████████▓    //
//        ▓▓█████████╬▓╬╣╬╠╫╬╠▓▒▓████████╣▓▓╬╬╬╬╬╬╬╠╬╠▓▓▓████████▒╠╬╬╣╬╬╫╬╠╫▒╟███████████▓    //
//        ▓▓██████████▓╬▀╫╝▀╬▒▄▓█████████╣▓▓╬╬╬╬╬╬╬╠╬╬▓▓▓█╬╬██████▓▒╠╠▀╝╫╬▒╠▓████████████▓    //
//        ▓▓███████▓██████████████▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬▓▓▓███▓╣█▓██████▓▓▓▓█████╬╬╫▓▓█████▓    //
//        ▓▓███████▓▓█▓█▓▓▓▓▓▓▓▓╣╬▓▓█▓▓▓▓▓▓▓╬╬╬╬╣╠╬╬╬╬▓▓▓██▓▓▓╬▓▓▓▓▓▓▓▓▓▓▓▓╣╬╣╣▓╬▓╣██████▓    //
//        ▓▓█████▓▓▓▓▓▓▓▓▓▓▓╬╫╬╬╣▓▓▓▓╣╬▓▓▓▓▓╬╬╬╬╣╬╠╠╬╬▓▓▓█▓▓▓▓▓╬╬╬▓╣╬╣▓╣╣╫╬╣╣╫╬╬╬╣▓██████▓    //
//        ▓▓█████▓▓▓▓▓╣╬▓╬╣╬╬╬╣╣▓╣╬╬╬╬╣▓█▓▓▓╬╬╬╣╣╬╬╬╬╬╬▓▓▓▓▓╬╬▓╬▓╬╣╬╬╬╬╬╬╬╬╬╣╬╣╬╣╬╣▓█████▓    //
//        ▓▓▓▓▓███████████████████████╠╬╬╬╬╬╬╬╠╬╬╠╠▒╠╠╠╠╠╠╠████████████████████████▓▓╬▓▓▓▓    //
//        █▓▓▓█████████████████████▓▓╬╬╬╬╬╬╬╬╬╬╬╬▒╠▒╠╠╠▒╠╠╠╬████████▓▓██████████▓▓▓▓▓▓▓▓▓▓    //
//        ▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▒▒░╠╠╠╠╠╬╠╠╣▓▓╣▓╣╬▓▓╬╬▓▓▓▓▓▓╬╬╬╬╬▓▓▓▓▓▓▓▓    //
//        █▓▓▓██▓▓▓▓╬▓╬▓╬▓▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▒▒╠╠╠▒╠╠╠╠╠╣▓╬╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╣╬╬╬█▓▓▓▓▓▓▓    //
//        ██████▓▓╬╬╬╬╬▓╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬▒╠▒╠▒╠╠╠╠╠╠╬╬╬╬╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬█▓▓▓▓▓▓▓    //
//        █▓████▓╣╬╬╬╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬▒▒▒╠╠╠▒▒╠╠╠╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬█▓▓▓▓▓▓▓    //
//        ██████╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╢╬╬╬╬╬╬╬╠╠╬╬╬▒▒▒╠╠▒▒▒╠╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╠╬╣▓▓▓▓▓▓▓▓    //
//        ███████╣╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╢╬╬╣╬╬╬╬╬╬╬╬╬▒╠▒▒▒▒▒░╠╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▒╬╬╬╬╬▓▓▓▓▓▓▓▓▓    //
//        ▓▓████▓╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬▒▒▓███▓▒╣▒▒▓███▄▒▒╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╣▓▓▓▓▓▓▓▓▓    //
//        ▓▓▓▓▓███╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╣╬╬╬╬╣█████████████╬╬╠╠╬╬╬╬╬╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓▓▓▓▓▓▓▓▓▓    //
//        ▓▓▓███▓██╬╬╬╬╬╬╬╬╬╬╬╬╠╬╬╬╬╣╬╬╬╬╬╬╬╣▓▓▓▓▓╬╬╬╬╬╬╬╬╠╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓    //
//        ▓▓▓▓██████╬╣╬╬╬╬╬╬╬╣╬╬╬╬╬╬╣╬╬╠╬╬╬╬╬╬╬╬▓╬╬╬╬╬╬╬╬╬╠╠╬╬╬╠╬╬╬╬╬╬╬╬╢╬╬╬╬╬▓▓█▓▓▓▓▓▓▓▓▓    //
//        ▓▓█▓▓▓▓▓███╬╬╬╬╬╬╬╬╣╬╠╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╠╬╠╬╬╬╠╠╠╬╬╠╬╬╬╬╬╠╬╬╬╬╬╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//        ▓▓▓█▓▓██████╣╣╫╫╫╫╫╫╫╫╫╫╫╫╫╬╬╬╬╬╠╬╬╬╠╠╬╬╠╠╠╬╠╠╬╠╣╠╬╬╬╬╬╬╬╬╬╬╢╬╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//        ▓▓▓▓▓████████▓╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╬▓▓█▓▓▓▓▓▓▓▓▄▒╠╠╠╠╬╬╬╬╬╬╬╬╬╬╬╬╠╬╫▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//        ▓▓▓▓█▓▓████████╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓██▓▓╬▓█████▓╬╬╣╫█▓▒╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//        ▓▓▓▓▓███▓▓███████╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣▓╬╬╬╬╠╬╬╬╬╬╣╬╬╬╬╬╬╠╬╬╬╬╬╬╬╬╬▓██▓▓▓█▓▓▓▓█▓▓▓▓▓▓▓    //
//        ▓▓▓▓▓▓▓██▓▓███████▓╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬▓███▓▓███╬╬╬╬╠╬╬╬╬╬╬╬╠╬╬╬▓▓▓███▓▓█▓▓▓▓█▓▓▓▓▓▓▓    //
//        ▓▓▓▓▓▓▓▓▓▓▓▓█████████╬╬╬╬╬╬╬╬╬╬╬╬╣╣╬▓▓███╬╬╬╬╠╬╬╬╬╬╠╬╬╬╬╬▓▓███▓▓▓▓██▓▓▓█▓▓█▓▓▓▓█    //
//        ▓▓▓▓▓▓▓██▓▓████████████▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓    //
//        ▓▓▓▓▓▓█████████████████████▓╬╬╬╬╬╬╬╬╬╬▓╬╬╬╬╬╬╬╬╬╬▒▓▓█████▓▓▓▓▓▓▓▓█▓▓██▓▓███▓▓▓▓▓    //
//        ▓▓▓▓▓▓█▓▓█▓███▓██████▓██████████▓▓▓╬╬╬╬╬╬╬╬▓▓▓██████▓▓▓╬╬▓▓▓▓▓▓▓▓▓▓▓████████▓▓▓▓    //
//        ▓▓▓▓▓██▓▓▓████████╬╬▓▓▓▓▓▓▓█████████████████████▓▓▓╬╣╬╬╬╬╬╣▓▓▓▓▓██▓▓██████▓▓▓█▓▓    //
//        ▓▓▓▓█████████████▓╬╬╬╬╬╬╬╣▓▓▓▓▓▓▓▓▓▓██████▓▓▓▓▓╣╬╬╬╬╬╬╬╬╬╬▓▓▓███▓███▓▓▓████▓█▓▓▓    //
//        ▓█████████████╬╠╬╬╬╬╬╬╬╬╬╬╣╬▓╣╬╬╬╬▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬█████████▓█▓█▓██▓▓    //
//        ▓▓▓█▓████▓╬╬▒╠╬φ▄╬╬╣╬╣╬╣╬╬╬╬▓╣╬╬╣╬╬╬╬╣▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╠▒▒╬╬╚╬╠████████▓▓██▓▓    //
//                                                                                            //
//                                                                                            //
//          █████▄ ▓█████ ▄████µ ▄████▄ ╟██ j█▌ ▓█▀██ ██████ █████▄ ██  ██  ▓███▄ ██████      //
//          ╫█⌐ ██⌐╫████▌▐█▌  ' ▐█▌  ╟█⌐╟███▄█▌ ▀███▄   ██   █████▀ ██  ██ ██─  '   ██        //
//          ╫██▄██ ╫██▄▄▄ ██▄▄█▀ ██▄▄██ ╟█⌐╙██▌"██▄██⌐  ██   ██ ▀█▌ ██▄▄██ ╙██▄██¬  ██        //
//                          ''     ''             '                   ''      '               //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract BKBOX is ERC1155Creator {
    constructor() ERC1155Creator() {}
}