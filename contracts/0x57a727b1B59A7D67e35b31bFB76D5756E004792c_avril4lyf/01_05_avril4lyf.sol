// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: avril15 Lifetime Preallocation Tickets
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//          ' '              ,,                                             ' '  '   '    //
//                                                                                        //
//      '     .           ,░╠▒▒╚▒▒φ≥,                ,╔φ╠╠╠╠╠▒░                  '  '     //
//                                                                                        //
//     ..  ''             ]φ▒╠╬╬▒▒▒▒▒▒▒╙╙╚╚╠╠╠▒░░▒▒▒░░░░▒╠╠╬╠▒▒░░░░'.                     //
//                                                                                        //
//     ''       '        [░░▒╠╬╬╬╬╬╠▒▒▒▒╠╠╠╠╬▒▒░░░░░░░φ╠╬╬╠╬╬▒╚░░""'''                    //
//                                                                                        //
//     '                 ░░░░╠╠▒╠╠▒▒▒╠╩╚╚▒▒▒▒▒▒░░╓░╙░░░φ░░╠╬╠░φΓ"^^  '                    //
//                                                                                        //
//                       ∩░░░╩╚╠╠╠▒▒▒╠░░░╚╚▒╬▒▒╚░▒░░░░░░░▒▒╠╩▒▒░                          //
//                                                                                        //
//                  ' '  !░Γ░░░░▒▒▒▒▒▒▒▒░░░╠╠▒░φφφ▒▒░░░░░▒▒▒▒░░░-...                      //
//                                                                                        //
//         '             ¡░▒φφ░φ╠╠╠▒▒▒╠▒▒╩╩╠╠╠▒╚╩╩╩╠╠╠╠▒╠▒▒▒▒▒╠░''''''                    //
//                                                                                        //
//             '         ░φ▒▒╠╠╩╩╙╙░░░φ▒▒░φφφφφφφ▒░░░░░░░░╚╚╚▒▒░░'....                    //
//                                                                                        //
//                      ░╠▒╠╠▒░φ╠╠╠╠╩╠▒▒╚╚╠╠╠╠╠╠╩╚▒▒╠╩╠▒▒▒▒▒▒▒▒▒░⌐                        //
//                                                                                        //
//    '               .φ▒╠░░▒▒▒╠▒└ ;φ▒▒▒░.└░░░,,░φ╚▒▒▒░.'╙╠▒▒▒▒▒╠░                        //
//                                                                                        //
//                    .░╠╬╬╬▒▒▒▒▒╠▒▒▒▒▒╩╚╩╚╚╚░╚╚φ▒≥░╠▒▒▒φ╠▒╚╩╩╝╬╠▒░                       //
//                                                                                        //
//                    !░╚╠╬╬╠╠╙╙╚▒▒▒▒▒▒░░░░░░░░░░φêΓ ╠▒▒▒╩░░φφφ╠╬╠░░'``''                 //
//                                                                                        //
//                    "░▒╠╠╠▒░░░░░▒▒▒▒▒▒░░φ#▒▒▒░░ ,φ╠▒╩╠▒▒φ░░╠╠╠╠╠▒'                      //
//                                                                                        //
//       ' ' '        !φ╠╠╠╠╠▒░░░╠▒▒▒▒▒▒▒▒░╠▒φ╠░-φ▒▒▒╠░ ╠▒▒▒▒╠▒╠╬╠▒░                      //
//                                                                                        //
//     '      '       :░▒╠╬╬╬╠╠▒▒▒▒▒φ▒╠▒▒▒▒▒╙│░φ▒╚▒░░╠▒░ ╚▒▒╠▒░▒░░╠Γ'''.'                 //
//                                                                                        //
//                     ░╠╠╠╬╬╬▒╠▒▒▒╠╠╠▒▒▒░░░░░~ └╚▒φ▒▒╠▒φφ╠╠╠╠╠╠▒▒▒∩""''                  //
//                                                                                        //
//                     .░░▒╠╬╬╬╠▒╚░░░░░░░░░░░░;░░⌐''    : ;╠╬╬╬╬╬▒░                       //
//                                                                                        //
//                      ╔▒╠╬╬╬╬╬▒▒▒░░▒░▒▒▒░░░φ░'.  '      φ╢╬╬╬╠╠▒φ,                      //
//                                                                                        //
//                  '  φ▒▒╩╙╠╬╬╚╚▒▒░░▒▒░░╠▒φφ▒▒φ╠▒  ,╓  '' ╠╩╩╝╠▒▒▒▒╠φε                   //
//                                                                                        //
//                     ╠╠▒▒,φ▒╠╬╬▒╠░░▒▒░░╠▒▒▒▒▒╚╠▒░\.│. ░φ╓╠▒,φ╠▒╠``"  ╔╓                 //
//                                                                                        //
//               '    ]▒▒▒▒╠╬▒▒╬╬▒╠╬▒▒▒░▒▒▒▒▒▒▒φ╠▒░░¡\;φ╬╠╠▒╠╠▒▒▒"`  -"╙╚╔,               //
//                                                                                        //
//        '. ~        ╠▒╬╬▒▒╬╣▒╠╬▒╠╬╬▒▒▒▒▒░░░▒▒░╠▒░░░░╠╬╬╬╬▒╟╬▒▒▒φ╔       φ               //
//                                                                                        //
//      '..    ..   ;▒▒▒╬╬▒▒╠╬▒▒╠▒░╬╬▒▒▒▒▒▒░░▒▒░╠▒▒░░░╠╬╬╬╬▒╟╬╣╬╬╠▒▒≥                     //
//                                                                                        //
//    ''.''. ...  'φ╠╬▒╠╣╬▒▒░╬╬▒▒▒▒╬╬▒▒╠▒▒▒░░▒▒░╠▒░░░░╠╬╬╬╬▒╠╬╬╬╠╠╠▒▒          ╠     '    //
//                                                                                        //
//    ░.┌...''..'. ░╬╬▒╠╠╠╠▒▒╠╬╬▒▒▒╠╬╬▒▒╠▒▒▒▒▒▒░╠▒▒░░░░╠╬╠╠▒╠╬╬╬╬╬╬▒▒░░░░░     ╠⌐         //
//                                                                                        //
//    │∩┐¡'''...'. ░╚╬▒╠╬╬╬╬▒▒╬╬╠▒▒╠╬╬▒▒▒╚▒▒▒▒▒▒╠▒▒░░░▒▒╬╬╬▒▒╠╠╠╠╩░▒Γ,φ ╠╚░╔╠Mê╠φ╠░       //
//                                                                                        //
//    ░░¡░░░░.¡'-' .⌠╠╬╠╠╬╬╠▒▒╠╬╬▒▒▒╬╬╠▒╬╠▒▒▒╠▒▒╠▒▒▒▒▒▒╠╠╬╬▒╠╬▒▒▒▒╠╠Γ  ²╦φΓ ╠  ╠░╠░       //
//                                                                                        //
//    ░░░░░░░¡│░╓φφ╬╬╬╬╬╬╬╬▒╬╠╬╬╣╬╠╬╬╠╠╠╠╠▒░░▒░▒▒▒╠╠╬╬╬╬╬╬╬▒╬╬╬╬╬╬╠φφφφ,         ╙  '     //
//                                                                                        //
//    ░░░░░░φφ╠╠▒╠╠╬╬╬╬╬╬╬╬╠╠╠╠╬╬╠╬╠╠╠╠╬╬╩▒▒▒▒▒▒▒▒╠╠╠╠╬╬╬╬╬╬╬╬╬╬╬╬╠╠╠╬╠╠╠╬▒φ≥,       '    //
//                                                                                        //
//    ░φ░░φ╠▒╠╬╠╠╬╣╣╣╬╬╬╬╬▒╠╬╬╠╠╠╠╬╠╠╠╠╠╠▒▒▒▒▒▒▒▒▒▒▒╠╫╬╬╬╬╬╠╠╠╠╠╠╠╠╬╬╬╬╬╬╬╬╬╬╬╬▒≥         //
//                                                                                        //
//    ╩╩▒▒╩╬╠╬╬╬╠╠▒▒╠╠╬╬╬╬╠╠▒▒╠╠╬╬╠▒╠╠╠╠╬▒▒▒╚╚╠▒▒▒▒▒╠╠╬╠╠╠╠╠╩▒▒╠╠╠╠╠▒░░╚╠╬╬╠╠╬╬╬╠╠░░░░    //
//                                                                                        //
//    ▒▒▒╠╠╬╬╬╬╠╬╬╬╬╬╬╬╬╠╬╬╬╬╬╬╬╬╠╠╠╠╠╠╠▒▒░Γ░░╠▒▒▒▒╠╠╠╬╬╬╬╬╠╠╠╠╠╬╬╠╬╬╠╠▒╠╬╬╬╬╬╬╬╬╠╬░      //
//                                                                                        //
//    ▒╠╠╠╠╬╬╬╬╠╠╬╬╬╬╠╠╠╬╠╬╠╠╠▒╚╠╬╬╬╠╠╠╬╠╠φφ╠╠╬╠╠╢╬▒╠╠╬╠╬╬╬╠╠╠╠╠╠╚╠╠▒▒▒φ▒╬╬╩╠╠╠╠╬╬╬▒░     //
//                                                                                        //
//    ▒╬╩╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╠╠╠╠╠╠╠╠╬╬╬╬╬╬╬╬╠╠╠╠╬╠╩╠╠╠▒▒░╬╬╠╠╠╠╠╠╠╠╩▒▒╠╠╩╚╠╠╠╬╬▒▒▒▒╠╬╬╬╬▒░    //
//                                                                                        //
//    ╠╬╬╬╬╬╬╬╬╬╬╬╬╩╠╠╩╬╬╬╩╩╬╝╝╠╬╠╠╬╬╬╬╬░░▒╠╠▒░░╚▒░╚╚╠╬╬╠╠╠▒▒▒╠╠╠╠╠╠╠╠▒╠╠╬╬╬╠╠╠╬╬╬╬╬╬▒    //
//                                                                                        //
//         ````                      ``                                        `````      //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract avril4lyf is ERC721Creator {
    constructor() ERC721Creator("avril15 Lifetime Preallocation Tickets", "avril4lyf") {}
}