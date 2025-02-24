// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Ink and Chrome
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒    //
//        ░░░░░░░░░▒╫▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//        ░░░░░░░░▒▀▓▓▓╜░░░░░` `░░▒╬╣░░`   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//        .,,,,,.░ ░▒▒.        ,╥╢▒▓▓╣░ ,╓▄▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//        ░░░▒╢▒▒░░░░░░  `,░▒░░░░▒╢╜╙░░░╢╣▓▓▓█▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//        ░▒╢╢╣▒▒▒▒░`` .░╥╢╢╣▒▒░░░░░▒╢▒░ ▒▒▓╜░░░░      ░░  ░     ░░░░░░░░░░░░░░░░░░░░░░░░░    //
//        ▒╣╢╣╣╢▒╜`    ▒▒╢╣╢▒▒▒▒▒▒▒▓▓╣▒▒░░░░░╥▓▓█@░░░░,,≤,░ ░  ░░ ░░ ░ ░░░░░░░░░░░░░░░░░░░    //
//        ░░▒▒▒░           ``╙╨▒▒▓▓▓▓╣╢▒▒▒░░╢╜▒██▒▒▒▓█████▄▄░        ░     ░ ░░░░░░░░░░░░░    //
//        ▒▒▒▒▒░,,░          ,╢▓▓▓▓▓▓▓╢╣▒▒▒░ ░╢▒▄▄██████████▌░,        ░      ░ ░░░░░░░░░░    //
//        ▒▒▒░░░▒╢▒▒,,,,,  ,╓╢▒▒▒▀▀▓▓▓▒▓▓╣▒▒░░░████████████████▌                ░ ░░░░░░░░    //
//        ▒▒▒░▒╣▒▒╢╢╢╢╣▒▒╫▓╫▓▓╣╣╫╣╣╣▒▓▓▓▓╣▒▒▒▒░▓████████████████▌               ░     ░░░░    //
//        ▓█▒▓╣▒▒▒▒▒▒▒▒▒▒░▒▒▒╢▒▒▒▒▒╢╢▒╢▒▒▒▒▒`Æ░╟▓████████████████▒                     ░░░    //
//        █▀▓▓╣╣▒▒▒▒▓▓▓▒▒▒▒▒▒╢▓▒▓▓▓▓╣╢╢╢╢╢░ j░╥▓████▓▀▓███████▓███W                     ░░    //
//         ░░╙╜░╫╫╫▓▓╢╣╣▒▒▒▒╜▒▓▓▓▓▓▓╣╣▒▒╜    j█▒███▓╣▒▒▒▒▒▀▀▒▒▒▓██▌                           //
//        ░░░░,     ░░╨╢╣╫▒▒▓▒▒▒▒╢╣╣╣╣╜      ██▒██▓╣╣▒▒▒▒▒▒░░░░░▒▀▓                           //
//        ██▄▒░░░░░░    ╙╣▀╣╢▒▒▒▒░░▒`      ▓▓▓█▌▒╣╣╢╣▒▒▒▒▒▒H░░░▒░▒░                           //
//        ██████▓▒▒▒░░░   `╙╢▒▒▒▒▒`       ]╝▀█▓▓▒╫╢▒╢▀█▄▒▒▒▒▒░▒▒▒░░                           //
//        ██████████▒░░     └╜╜┘       ╕ -░╓▓▒╣╢▒▒▓██████▓▒░░░░░░░                            //
//        █████████████▓▓@╖╖╖╓H       ░ -└▒▓▀▀╩▓▓▒▒▒▀▀▓▀▓▓▒▒╫██▓▌                             //
//        ██████████▓▒▒▒╢▒▒▒▒             ╙▒░,'"█▓▓▒▒▒▄▄████▓▓▀▀┘                             //
//        █████████████████▀           ]A ⌠╣█▄▌████▀████▓"└▓M▒░     ▄▌                        //
//        ███████████████╜            ╒▓░░ ░└█████  ▐▌"▀▌╔█▓W]▀░  ╤▀▌,╝                       //
//        █████████████▀`              ▄╖   ¥╖▀██▀▀▄██▄████▓▒▐╣ ⌠▓▄@█"            ──⌐         //
//        █████████████▓╖,╓╓╖,▄▄▄  ¬▄████M  ╚▒▒¥█@"█▓▀████████▄╓█▓█╜         ,░╥─  ]░,,,      //
//        ███████▓╫╣▒▒▒▒▒▒▒▒░░░▀▀▌,░╙████▌╖╘▄▓█▌█▌██▀▄███▄▌██▀█T▄█,            ╜`   `╙░░░,    //
//        ████████▓╢╢▒╢▒▒▒▒▒▒░░░░░░ `▐████████▒╜█▓░▀▄███████▀▄█╬▓   ,    ,,     `─╖╖,.,  ╨    //
//        ████████▓▒▒╨╨▒▒▒▒▒░░`      ███████████████▀▌▒░░█▌⌐.⌠█▀ .a█▓Γ7 ,▄╢▒        `╜░ ░     //
//        ▓▓▓▓▓▓▓▓▓▓╢╢╢Ñ▒╥╖,,          ░╜╜░╙╫██████▌▒▒▒█████▄▀H▐▓╖  ,▄▄█████▒H░─ ,─   "╨░`    //
//        █Θ░░░░░░░░▒▒░▄▓▓▓▓▒▒@@▄▄▄╖╖,╖░░▒▄▒▄█████████▌█████▓▄▄█▓╣▄██████████▌░,,░╖╓░,░░░     //
//        ▌▒▒▒▒▒▒▒▒╣╢╢█████▓▓▓▓▓██████▓█████████████▓╢█Ñ████████▓▓▓██████████╣▒▒▒▒▒▒▒``  ╜    //
//        ▒▒▒╣╢▒▒╢╢████▀██▓█▓▓▓▓█████████████████████████████████▓██████████▓▓▓▓▓▓▓╫▒╖╖╖╥▄    //
//        ░░░░░░░░░░╙``░`██▓▓██████▀▀▀▀▀▀▀▀▀▀▀▀▀███████████████████████████▓▓▓▓▓▓▓▓▓▀▀╣╢▒╨    //
//        ░░░░░░░░░░░    ▓███████▀            ░░░░▒▒▒▒▒▒▀▀▀▀█████▓▓█▀▀▀▀█▀`'"╙╙╙░╫▒░  ░░      //
//        ░░░░░░░░       ███████¡               ░░░░░░▒▒░░░░░████▌▓              `╙"*░   ,    //
//        ░░░░░░░░░      ▀█████▌                     `       ▐███▀                       ╙    //
//        ░░░░░░░░       "█████▌                             ▐██▌                             //
//        ░░░░░░ ░        █████▌.                            ▐██▌                             //
//        ░░░░░░          ▐█████░                            ███▌                             //
//        ░░░░░ ░         ▐█████▄                           ▐███                              //
//        ░░░░░░░░        ███████░                          ███▌                              //
//        ░░░░░░░░        ███████░                         ▐███M                              //
//        ░░░░░░░ ░     ░████████░                         ████M                        ░     //
//        ░░░░░░░░░░░░░░▄████████                         j████▌                              //
//        ░░░░░░░░░░░░░▄█████████                         j████▌                              //
//        ░░░░░░░░░░░░░╙▀▀██████▌   `-.                   ▐████▌N                             //
//        ░░░░░░░░░░░░░░░░░░'⌠▀▀███▄▄▄▄▄;                 ████▓▒▒▒Ç                     ░░    //
//        ░░░░░░░░░░░░░░░░░░░░░░█████████████████████████████▓▒▒▒▒██.                   ░░    //
//        ░░░░░░░░░░░░░░░░░░░░░░▐███████████████████████████▓▒░░╫████▄               ░░░░░    //
//        ░░░░░░░░░░░░░░░░░░░░░░░██████████████████████████▓░▒╫▓███████⌐░      ░   ░░░░░░░    //
//        ░░░░░░░░░░░░░░░░░░░░░░░]▓███████████████████████▓▓▓███████████▄░░   `  ░░░░░░░░░    //
//        ░░░░░░░░░░░░░░░░░░░░░░░▐▓▓▓▓███████████████████████████████████▄░░░░░░░░░░░░░░░░    //
//        ▒▒░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓████████████████████████████████████░░░░░░░░░░░░░░░░    //
//        ░░░░░░▒▒▒░░░░░░░░░░░░░░░████████████████████████████████████████▌░░░░░░░░░░░░░░░    //
//        ░▒░▒░▒▒▒▒░░░▒░░░░░░░░░░░████████████████████████████████████████▌░░░░░░░░░░░░░░░    //
//        ***╙*╙╙╙*╙╙╙*********╙╙**▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀`****`******╙╙╙╙    //
//                                                                                            //
//    ---                                                                                     //
//    asciiart.club                                                                           //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract IAC is ERC721Creator {
    constructor() ERC721Creator("Ink and Chrome", "IAC") {}
}