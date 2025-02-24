// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Keni's Studio
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                                                                          //
//                                                                                          //
//                                                       #▓▌                                //
//                                    ,╓╖╗╦╦MMMMM╦╗╖╖,,▄▓▒░╚▓                               //
//                              ,╦▒╣╫╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬▓░░░░╟▓                              //
//                           ╓▒╣╬╣╣╣╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▌░░░░░░╫▓▌╖                           //
//                           `╙▀╣╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╫░░░░░░░╫╬╬▓╣▒╖                        //
//                             ╓#╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓╣╬▓▓▓╬╬╬╬╬╬╬▓╬╗                      //
//                          ╓Θ╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬╬╬╬╬╬▓╗╗╦╦╦╦╦╗µ            //
//                       ,φ╟╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓╫▓▓▓╣╬╬╣╬╬╬╬╬╬╬╬╬▓▀▀╟▀             //
//                      φ╠╬╬╬╬╬╣╣╣╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓▀    ╙╣╣╬╣╬╬╬╬╬╬▓▓░▄▀               //
//                     ╠╬╬╣╣╣╬╬╬╬▓▓▓▓▓██▓╬╬╬╬╬╬╬╬╬╬╬╬╣▌        ╚╬╬╣╬╬╬╣╣▓╬▌                 //
//                   ,╬╣╣╬╬▓▓▓█▓█████▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣          ╫╬╣╬╬╬╬▓▓▓▌                 //
//                  .╬╬▓╝▀▀╙╙└─ ╓φ╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣     ╓╗   ▐╣╬╣╣╬▓▓▓╬╜                 //
//                           ,Θ╠╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╬▄   ▌▄▓    ╬╬╣▓╣▓▓▓`                  //
//                         ╓╠╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╣▓╬╬╬▓╝▓╖ ▐▓▓`    ╫╣╣╣▓╬╬⌐                   //
//                        ╬▒╬╬╬╬╬╬╬╬╬╬╣╣╣╣╣╣╬╬╬╬╬╬╬▌░░░░░░╚≥,,,≤▒╚▓▓▓▓░╙                    //
//                       ╬╠╬╬╬╬╣╣╣╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▌░░░░Γ░░░░░░▒▒▒╠█▓▓█▓▀                   //
//                      ╬╠╬╬╣╣╬╬╬╬▓▓▓▓▓▓▓███████▓▓▓█▒░░░╚▒░░░░░░░░░╚╚└└                     //
//                     ⌠╠╬╣╬╬╬▓▓▓▓█▀▀╙─ ,▄▓▓█▓▀▀█████▓▄░░░░░░░░░░░░▒╙                       //
//                     ╬╬▓╣╬▓██▀╙   ,≤φ▒░░░░░░░▒╫╬╬╬╬╬▓▓▓▓▓▄▄Å╜╙^                           //
//                     ╝╙╙└╙╙  ,eφ▒░░░░▄▄#▓▓▓╬╬╣╬╬╬╬╬╬░░░░▀╙                                //
//                             ╘░░░▄▓▓╬▓▓▓▓▓╬╬╬╬╬╬╬╬╬░░░░░╕                                 //
//                       `-     ]╞▓▓▓▓▓▓╬╬▓▓╬╬╬╬╬╬╬╣░░░░░░░▒≥,   ▄▓▒∩╓╖                     //
//                        `▒φ≥φφ░╫▓╬▓▓▓╬╬╬╬╬╬╬╣╣╣╣╣▒░░░░╙ ╙φ░░░░╚╚▓▒ ]╠,,.                  //
//                  «▒      ░░░▒╙╙─  ╨╙└  ╟╬╬╬╬╬╬╬╣░░░╚      "╚░░φ╩, φ░¼░░Γ                 //
//              .    ║≥     ⌠╠            ▐▓╬╬╬╬╬╬╬▒░╙        ║▓▓▒░░░░▒▒░░φ  »╓,            //
//           `   %     ,╓╔  ╚Γ     ⁿ¥▄╦@▓▓╬▓╬╬╬╬╣▓▓╬▓╬╬▓▓╗╖    ╙╙╙╩╩╝╙╙╚φ▒░   ▒░░░▒φ≡       //
//                "≡╔φ░▒▒  φ╩          └╙╙╙▀╬╬╬╬▌╙╙╜╩╬╫╣╬╬╬╬▓▓▄           └▒   ╠░░▒░░░≥     //
//              ╔φφ▒╩φ░░░φ▒╙               j╬╬╬╬b       ╙╙╣╬╬╬╬╬▓         ▒▒░   ▒░╛╠▒╚╙^    //
//                    "╙"                   ╬╬╬╬µ           ╙▓╬╬╬▓          ╙δ╓φ░╚ └φ       //
//                                          ╣╬╬╬▌            j╬╬╬╬▌                         //
//                                         ▐╣╬╬╬⌐            ]╬╬╬╬▌                         //
//                                         ╢╬╬╬╣             ▐╬╬╬╬▌                         //
//                                        ╔╬╬╬╣▌         Θ╫▓▓▓╬╬╬╬▌                         //
//                                      ╓▓╬╬╬╣▓         ╚░░└▀▓╬╬╬╣▓▒░≥                      //
//                               «#▄▄,▄▓╬╬╬╣╬▀          ▒░▒,   ╙╙▀╙└                        //
//                                ║▓╬╬╬╬╬╣╬▓└        ╓▓▓░░▒W╬▒≥╦,,  ,'                      //
//                                 ╙▓╬▓╬╬▓▌        ╓▓╬▓╣▓▒░░╙ `╙╙╚░░Γ                       //
//                      ,▄▓▓     .   ╙▀▓╬▓╬      ╔▓▓╬╬╬╬╬╬▓▓▓▄,,,,φâ                        //
//                    ╓▓╬╬╬╬▓▄     ▒≥, ╙░░║      ▓▓▓╬╬╬╬╬╬╬╬╬╬╬▀└                           //
//                  ╓▓╬╬╬╬╬╬╬▓▓▓▄µ,,░░░░╜        ╟╬▓▓╬╬╬╬╬╬╬╬▌                              //
//                 ╣╬╬╬╬╣╬╬╬▀╙─   ╙╠╙Å─           ▀╬▓▓╬╬╬╬╬╣▀        ╓▓╬▓,                  //
//                ╞╠▓╬╬╬╬▓╙          "║            ╙╣▓▓▓╬╬▓─       ,▓╬╬╬╬╬▓▄                //
//                 ░╣╬▓╙'╙N           ░¼             └▀▓▓▌        ▄╬╬╬╬╬╬╬╬╬╬▓╥             //
//                 ╘║╨.╣╬╦└▒,   a²▀▓╬╬▓▓                └▀▓╗    ,▓╬╬╬╬╬╬╬╬╬╬╬╬╬▌            //
//                  ╙▒░╬▒╚''└╔▓╬▓╬▓▓▄╙╙╙\                  └╙▓╗▄▓╬╬╬╬╬╬╬╬╬╬╬▓▓▓▀            //
//                    ╬Ç'││╓▓╬╬╬╬╬╬╬╬╬▓▄╖²                     ╙╙▀▀▓▓▓▓▓▓╝▀▀╙─              //
//                     ╚░φ▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬▌\                                                 //
//                       ╚░▀▓╬╬╬╬╬╬╣╬╬╬╬╬╬╙▌                                                //
//                         ╙╬╠▀▓╬╬╬╬╬╬╬╬╬▌║╣                                                //
//                            ╙╚╬╬╫╠▀▀╫╫╫▓▓▓                                                //
//                                                                                          //
//                                                                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////


contract KENI is ERC1155Creator {
    constructor() ERC1155Creator() {}
}