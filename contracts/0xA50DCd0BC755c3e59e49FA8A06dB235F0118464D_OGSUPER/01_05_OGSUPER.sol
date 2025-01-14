// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: OG Superchief
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

/////////////////////////////////////////////////////////////////////////////
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
//                         ▄, ▄  ▄▄  ,▄▄▄ ▄▄, ▄▄     ▄,,                   //
//                        █▄▌█═╔▌█ ╟┘█  ─▓▌`█▓▌]╓▌▄µL█─▐█▀▓,               //
//                         ╙⌐█ ╟J█,╟─█▄▄ ╫███▐▌"▓▀█▐▌█▌╓█, ╙▀`             //
//                       █,▓▌█ ╟▌█▄  █   ╟▌ █▐▌ ▐─█j▌█ ╟█└└                //
//                     ██╬╨╨└╠███╫▌  █▄▄µ▐▌ ╣██▄▌▌█▓▄█▓#▄                  //
//                    █▓╣ ╨╓▀▄▀╨─/─╬▀╙ ▄▌▌███p╠▌╟▌ ╟╙╞└⌐▀╫▄                //
//                   ▓└█   ─└¬  ",╣"▓ ⌐▌ ▄╘ ╜└ ^╟▐ ▓ ─ ▐`▌╬▌               //
//                  ▐Γ █  '     ▐╜ ƒÅ[ ▌ ╨ █ b  ╞  ┘ ─  █─╙█─              //
//                  ╡─▐▐        ▐    ▌ ▌ ┌]   ▄µ▐  µ    ▌  ╟▌              //
//                  ▓─,╘        █   j─ ' ╟   Φ▐,  ,▓    ▌▌  ╡              //
//                 ╫ ▌╠┐     ,▓     ╗═, ▀  \▌▐│╓▀▌█     ╫, ▌▌              //
//               ]▄ ▌╓j ▐J▄▄▄▄╞╘▀    ▄R   ╓ █ ▓▐ ▓j─    ,█▀╨▀⌐             //
//                ╟╬██ ▌ ▓▀╘██▐ ▌¼   ╫  6███▓▄█╣ƒ ▓j▓▓▌▀,Æ.▌╣              //
//                 ½¼▀▄W▄ b▓╙▌▐ └▄▌▌ j ▐╞████▓██▄▄▌╨╟▀┌▀└╓▀▌▌              //
//                  ¼▀└▀▄▀█ ▌ █▐▓█─▌ ▌ ╟▐╙██▌███▌█▀─▀██╖#▄#▐               //
//                  ▌▌▓ ╙██⌐╙▄▄██▌┌│ █  ▀▓╝█████▌,⌐▐ █╣▓██m▐▄              //
//                ╓▀▌████▓██#██▌╘⌐▀█╛██╕  ¼╚███▓▄▌ █ ████████▀µ            //
//               ╒▓▄▄╓▓███████╣  .▓▌Æ██▌╘µ▀ ▐└▓███▓████▌▀ ╬█╠██▄           //
//               ▌██/█▀Æ╓▄╞▄▌▌╙ ¼▓█ƒ,▌▄▌µ└¥▄ \╙<╠▓ █▄\¼▓▌▀██╫█▀█           //
//               ▌┌ƒ╓▄▀██╣╩█▓██`▀╙─▓██╙██  ╙J██▄▀▓▓.▓╘▓██▌╟▀▌              //
//              ▐███▀╨█╝▓█████▌    ███ ╙█▌  ^█████▓██████╓▌██              //
//              ▐╙▓██▐██  ▀▄█y▌ ]█▌  "▌ ▓µƒÇ┐╙█▌╙█▀█▐╙``▐██╣█µ             //
//               █▌█▌▌▄▄ ╟██ ▓█▌╞╫┐▄▄▓▓  `▓▌█▌╠▄m▄▄▌██    ▒█ƒ              //
//               ╟█╠▒▀█▌ ████████▓▓▌  ╟█╝▓█▌╙███╫█▌╔╙██   ╙█`              //
//                ▌▐▌▌ ▌▐███▄████▓▓▌  ▄█▓▓██─▀████▌  ██▌                   //
//                 ▐█▓██╞▀█▓████████╬▓███▓██▌╝▌▌  █è █▌└                   //
//                  ▌▌▀▄  █▐j▌███╫╙█╠▌╣█ ╣ ██╞█╣╥╔ ▓╬▌└                    //
//                   █▓─   ▀j╝▓j█ ┤╟▌╟ ▌\ \▌████╨▌ [╟█                     //
//                   ╙█    }⌠▄█▐ █▌▐╠j ▌ ▀█⌐▐╙▌ ▌   ▐╞                     //
//                         j▌▌█╞  ▌▐Γ ──  █  ⌐Γ ▌   Γ▐                     //
//                          ─▐╫╛   ▐▓ ▌      ▌ ▄    └▓                     //
//                            █    j█╒▐      ▌Æ▀     ╚                     //
//                                  ▌└▓      █▀                            //
//              ,,,   ╓             ^ `      ▀                             //
//             █▄ ▐⌐  █▓  █  └▌   ▓*▀▀▀`Æ▀"▀▌▓▄ ▄▌   █  ╫▐█▓,²▀▌╙└.        //
//            ⁿ█,▄m▄ ██╟█ █   █  ª█m¥═ ,█"▀▌ ╙██▌    ██▓█▐▄ └└ █           //
//             █▄,,╟ ▌ ─└▌ █═▀╘▄Æ⌐▓,,▄▌ ▌  █─ ╟▌    ▐▌ ╙█╟⌐    █.          //
//                                      ▀  ─            ─'     └.          //
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////


contract OGSUPER is ERC1155Creator {
    constructor() ERC1155Creator() {}
}