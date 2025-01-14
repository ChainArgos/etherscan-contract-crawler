// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: MrReier Ai Pepe
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                                                                     //
//      ╓▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄,       //
//                                                                                     //
//       ██▄▒░██.   ▄█░▒▄█▌▒▒█▒▒▒▒▓██▒▒▐░▒▒▒░▀██▀▒█▒▒▒▒▒▒▌▒▒█▓▒▐▒░▒▒▒▒█▒▒▓▌▒▒▒▀▓██.    //
//                                                                                     //
//       █▌▒█░▄██╖,██▒▒▓░█▌▒▒████▌▒▒█▒▒▐████▒▒▒█▓▒███████▌▒▒█▓▒▐███████▒▒▐████▒▒▒█▌    //
//                                                                                     //
//       ██▒▒█▀▒▀██▀▒▒█▒▒█▌▒▒███▀▒▒▄█▒▒▐███▀▒▒█▌▓▓█▓▒▒▒╫█▌▒▒█▓▓▐▓▒░▒▓██▓▒▐███▀▒▒██▒    //
//                                                                                     //
//       █▌▒▒██▄▒▐▌▒▒█▌▒▒█▌▒▒█▄▄▒▒▒██▒▒▒▄▄▄▒▒▒█▌▓▒███████▌▒▒█▓▒▐███████▒▒▐▓▄▄▒▓▓█▌     //
//                                                                                     //
//       █▌▒▒████▐▌███▌▒▒█▓▒▒██▀███▓█▒▒▒█▀██▒╣█▌▒▒███████▌▒▒█▒▒▐███████▓▒▓█▀██████▒    //
//                                                                                     //
//       █▌▒▒██▒████╜█▌▒▒██▓██▌ ███▌█▒▒▒█▒▐█▌▒▒██▓██▒▓╢▒▒▌▒▒█████▌▒▓▒▒█▓███▒╙███▓█▌    //
//                                                                                     //
//       ╙▀▀▀▀╜      ╙▀▀▀▀▀▀▀▀`  ▀▀▀▀▀▀▀▀` ╙▀▀▀█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀╜  ╙▀▀▀▀`    //
//                                                                                     //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////


contract AiPEPE is ERC1155Creator {
    constructor() ERC1155Creator("MrReier Ai Pepe", "AiPEPE") {}
}