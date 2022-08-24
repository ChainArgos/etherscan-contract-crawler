// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Home of The High Elves
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//        ██████████████████████████▓▓▄██████████████████▓███▓▓█████████████████▓▓██▓█████    //
//        ▓███████▓███████████▓▓▓███████████████████████▓▓██▓▓████████████████████████████    //
//        █████▀║▓████████▀╢▓██████████████████████████▓▓██████████████████████████▓▓█████    //
//        ███░▄████████▓▓███████████▀▀▒▓▓▓████████████▓╢▓█████████████████████████▒▒╫█████    //
//        ▀▀╟███████▀▒▓█████████▀▒▒▓██████████████████╬▓████████████████████████▓▒╫╣▓█████    //
//        ╖▓██████▀▒▄████████▀ ╓▄███████████▀▀███████▓▓███████████████████████╣╫▓▓╣╢▓█████    //
//        ██████▀▒▄██████▀╜╖▄██████████▀▀` _╓███████▓▓███████████████▓████▓▓▓▓▓▓▓╣▒▒╟█████    //
//        ████▀,å██████▀`,██████████▀" , _╓▓█████████████████████▀▀▀▀▒,╫███▓▓▓▓╢╫▓▒▒▓█████    //
//        ███`╓███████`µ█████████▀  _,,_ ]▓███████████████▀▀╜░░╓µgp╫▓████▓▓▓╢╣▒▒╫▓▓▒╫█████    //
//        ██▌d██████▌░▓████████▀_,╓╖▒╢▒ ]▓█████████▓▀▒▒▒╖╓╖▒▓▓████▓▓▓▓▓▓▓▓╢╫╣▒▒▓██╣╫▓█████    //
//        █▌╟██████╣▓████████▀_┌╫▓▓╣▒▒▓╣╫▓██████▀"▒▒▓▓██▓▓▓██████╣╣▓▓▓╜╜╙_''║▓███▓▒╫▓▓▓███    //
//        ╙╫██████▓███████▀╙ _╓╫▓▓▓╣╫██▌▒╙███▀╜__╥▓███▓▓╫▓██▓██▓╜╙╢╜╜___ _g▄▓▓█▀▀░▒▓██████    //
//        ╖▓█████▓███████` ,╓▓▓▓▓▓╣╫▓██▌▒_╙`___╓╫█▓▓▓▓▓▒╟▓▓▓▓╜`____  ,╓@▓▓█████▓ _╫███████    //
//        ▓█████▓▓██████▌_╓▓████▓╣▒▓███▓╣ ____▒▓▓▓▓██▓▒▒╫▓╜ _____ ,g▓▓████████▓▒,╫████████    //
//        ███╣╣▒╟▓█▓████▒_┌▓█████▓╣▓████▓╖ __╟▓▓▓▓▓▓▓╜  _ ____ ,╓g▓▓████████▓╜ _╟█████████    //
//        ▓▓▓█▌╣▓███▓▓███∩░▓█████▓▒▓██████@╖╓╢▓▓▓▓╜ _ _ ___]@▓▓███████████▓╜`_µ▓██████████    //
//        ████▌▒▓████████▒ ╙▓████▓▒╫▓▓▓▓▓█▓╣╜╙` _  __ ,╓╖,, "╙╙▀▓███████▓╜ _╓▓███████████▓    //
//        ████▌▓████▓▓███▒ ╓╫▓███▓▒▒▓▓▓╜╜╙  _______,µ▄█████▓▄▄▄▄▄▄▓▓▓▓▒▒╙░µ▓██████████████    //
//        ██▓▓▓▓██▓▓██████[_]▓██▓▓ __ _________,╓q▓████████████████▓╜ _,▄█████████████████    //
//        ████▓▓▓█████████▓@║▓███▒ ___________╓▓█████████████▓▀▀╜_ ,µ▄███████████▓████████    //
//        █████▓███████████▌'╨▓█▌ ______ ,,╓@▓▓▓██████████▓╣▒╖╖╓._]▓████████████▓▓████████    //
//        ██████▓██████████▌ _╙╙`__ ,╓@▄@@╖▒▒▒▒▒▒▓▓▓▓██████████▓▓▓▒▒╙╙╙▒▒▓▓█████▓███████▓▓    //
//        ██████▓▓█████████╜______,@████████▓▓▓▓▓▓▓▓▓╣▓▓▓▓▓▓███▓▓▓▀╜▒g█████████╣▓████████▓    //
//        ███████████████▀____,╓@▓████▓▓▓╣▓▓████████████████▓▓▓╝░,p▓██████████▌╫██████████    //
//        █████████████╜__╓╖╓▓▓████████████▓▓▓▓██▓▓▓▓▓█████▓▀`_,╫▓███████████▒▓███████████    //
//        █████████▌╜_ ___▒▒▀▀▀▀▀▀▓▓▓▓▓▓█████▓▓▓▓▓▓▓▓▓▓▓╜╙ ___╙▓████████████║╫████████████    //
//        ████████▓▒▒╖╖µ▄████▓▄╖╖╖╓▒╙╜╙╨▓██████▓▓▓▓▒▒▒▒▒░ __,╓╖▓███████████▓██████████████    //
//        ███████╜ _▒▒▓█████████████▓@╖p▒▒▒╙▀▓▓▓▓▓▒▒▒▒╢▒▒,╓▒╫████████████▀▒███████████████    //
//        █████▒  _░╫███████████████████████▄▄▄▄@╖ppppp▄███████████████▀╫▄████████████████    //
//        █████╣▒@@╫▓████████████████████████████████████████████████▓▓█████████████████▓▓    //
//        ████▓███████████████████▓████████████████████████████████▓█████████████████████▓    //
//        ███████████████████████▓▓████████████████████████████▓█████████████████████████▓    //
//        ,,╓▄▓▓█████████████████▓███████████████████████████████████████████████████████▓    //
//        █████████████████████▓▓████████████████████████████████████████████████▓▓▓▓▓▓▓▓█    //
//        ███▓████████████████▓▓█████████████████████████████████████████████████╣▓███████    //
//        ███▓▓█████████▓▓██████████████████████████████████████████████████████▓▓█████▓▓▓    //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract ELVES is ERC1155Creator {
    constructor() ERC1155Creator() {}
}