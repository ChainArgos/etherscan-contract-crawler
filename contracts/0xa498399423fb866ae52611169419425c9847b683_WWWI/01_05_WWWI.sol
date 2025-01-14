// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: WhichWitchWasIt
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//          =                                                                                 //
//          `                                                      ,,,,,~.                    //
//         ¡     -                                           ;¿░░░░▒▒▒▒▒▒░▒▒φ░,               //
//        :░┐  .¡                                        ,╓▒░▒▒▒▒▒▒▒▒╬▒░░░╜╙░░╜╙░»            //
//         "░░░░                                      ,░░▒▒▒▒▒▓▓█▌▒░░"'           "«          //
//          '└░░,   ─`                             .∩░▒▒▒▒▒▒▓╣▒░░░░¡`                         //
//            `"░░░¿     ─                       ¿░░▒▒▒▒▓▓▓▓▓▒▒░"'                            //
//         :'':─"░░!░,.░:    -                 r░▒▒▒╫▓▓▓▒░▒▒░░░"'                             //
//        `.'      '░░░░,  ,,    .          .≡░░▒╢▓▓██▓▓▓▒░░="'''`                  ..┌"'     //
//                .:╖┘"└░╓░,    "         ,░░░▒▒╫▓█▓▓▓▓▒▒▒!":`                   :¡¡'`        //
//               '''    .└░░░░¿" .    ` ;░░░░▒▒▒▒▒▒▒▒▒▒░░░²'` `             .'░;└└"`          //
//               .     .¡╙'`'"░░!;~;,,░░░░░▒╢╣╢▒▒▒▒▒░░░╘░"~'`            ,:¡└░└└~             //
//                    ¿`     .)░░░░░░░░░≡░▒▓▓▓▓╢▒╣▒▒░░░░'~'```           ┌░¡"` `..            //
//               »«╓,`      ,░"-  `┘!░░░░░░▀▀▓▒▒▒▒▒▒░░░┐::'`              "":.                //
//               '   ²╝w╓, ┌``     ,░' '░░░░░░░▒▒▒▒░░░└,,'```           ─     `               //
//                .⌐..  `╙▒╫g╖╓,,,└;,,╓.'░░░░░░░░░░░░░:~:```            "''..                 //
//               '   ┌~,. `╘▒▒▓▓▓▓▓▒▒▒░▒▒░~  '░░░░░░░;,"::'` ,                                //
//                 .;" :¡¡¡:▒╣▓███▓▓▒▒░▒▒░░░:╓╜`  ²░░░░░¡,'`'`'        ,                      //
//               `.'    `░░¡▄█████▓▒▒▒░▒▒░░░╜└. .   ,░*└░░░r;'   .                            //
//                      ─`,░▀████▓▓▒▓▒▒▒▒▒░░░¡¿░""'^^   `└░░░░└¡=. '  ;'                      //
//                    `  ─`'¡ ╙▀▓███▓▓▓╣▒▒░░░'`   '      .░"`'"░¡░░¡,░=                       //
//                         ┌╢╖   ████▓▓▒▒▒┘`       ,¡,``,░     ,ⁿ"░'░░¡Y:=,   `               //
//                         j▓██▄▓████▓▒▒▒░░░░░ppp░░░░`. └     ," r   '░░*░┐¡░┌░¡¡,,.,,.,'^    //
//                          ╙▓██▓▀▀▀▒▒▒▒▒▒▒▒▒▒▒▒░░░"'` `     /  "     ░"   '└"''░░""»┘'"^'    //
//                        ':^░██░,` ,╓@▒▒▒▒▒▒▒▒▒░░¡~,-      '  `     ┘"     :    r   :        //
//                       ''""░██▓░┌▒▒▒▒▒▒▒▒▒░▒░░░░└"'`              ¡`      '    `            //
//                         -''▀▓▒╙¡░░░░░░░░░░└░!=.                 .                          //
//                               "╨▒░└─.`''```   ```                                          //
//                                 `'   ,@╣░╓.                                                //
//                                     "¿╫█▓▒▒░┐.'  ` .░                                      //
//                                     ▓░▀▒▒▒░▒~┌"  ;░░░   ¡,                                 //
//                                    ]█▒╖░"░,g░¡`.;▒░▒*   ░¡,                                //
//                                   ƒ▐█▌░╓░▄▄╣░░░░╣░▒╜`  ┌░░r `                              //
//                                  ▐░▓█▒Ñ╙«▓▓░░░░╣▒▒╩`  ,▒░░`  =                             //
//                                  ▓░▐█ç  ▄█░░░!╢▒▒Ñ`` ,▒░░`  ,┐`                            //
//                                ╟W╫▓└▓████▌└¡¡╟▒▒╣`` ,▒░▒"   ░░"                            //
//                                                                                            //
//    ---                                                                                     //
//    asciiart.club                                                                           //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract WWWI is ERC721Creator {
    constructor() ERC721Creator("WhichWitchWasIt", "WWWI") {}
}