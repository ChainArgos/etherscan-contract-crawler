// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Ife Heads
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                                                                          //
//                                                                                          //
//                                                _ -,~ _   _                               //
//                                            ;."φ░░φ░~ '  _ _ _                            //
//                                        .,"░φ░>,≤φ╠"²░-__'`   _ _                         //
//                                       ,  'Σφ▒▒²""∩░╔ ¡,,░~░-=░.^. _                      //
//                                    ;,`_'.ⁿ╔Γ⌐'ƒ_.,ⁿ__ _ _`-'.≤≤░>"!"=_                   //
//                                  'ú░░φ»░╓╙_    φ` _'░░φ░░≤▒░░φ^_;≤»"- ¼                  //
//                                 ∩░░φφ░φ"_ _, ,░"φ▒/░╠▒╠╠▒╠▒▒░░φΣ▒ε; -░]_                 //
//                                ░≥φ║;;>__ ░░,∩φ=╓Θ░╬░ê▒╚╬╠╠╠▒╠╬╬▒φG;φ▒░j_                 //
//                              [»;δ╙// ___?»░ε≤╔δ░╬░φ║▒φ╝φ║╠╠╢╬╬╠╠╠▒╩░(░]_                 //
//                              "▒▒╬▒░╚MM,'≥░░░^░╠ê░▒╩▒╬╠╠▒╚╬╬╬║╣╬╠╠▒░░δ░#                  //
//                              ▒  j╠▒▒wσ░Γ⌐ /.Θ≤░╠╬╠╠╜#░╠│⌐▒▄╠╚▒╠▒▒╠╬▒░φ                   //
//                              /░∩ ▓φµ└╙∩ {`'_,░∩▒╠╩é▒╬╙░▒╬╦░╬▒φ░╚▒╠▒▒φ▒_                  //
//                            »δ;░∩ ▒╠╠╚╙░'-/;"/,░░δ░░╙»╓╛╣╫'Γ▒╬▓▒╬╠╠░╠╠                    //
//                           "/ ⌂φ╦φ╬√╔_φ╓,,∩,_ⁿ',,░`,,Θ/▐⌐,[email protected]║╬╬▓▒▒╬▒╬                     //
//                          φ≤≥≡▒╠╚▒╠▒▒▒≤░░░░░» ░░, φ?≤≤╙,░▄╙▄▓▓▓▓╬▒╬▒_                     //
//                          ╙╩▓╫╝╨⌠Å╠╚╚╠▒▒φ░φ░),="«░=`Γ╬║║╬▓▓▓▓▓▓▓╬╠╠⌂_                     //
//                           -│,'=,░░│░╚▒▒░╠░░7-_φ╓Θ░]φ░╩╣╫╣╬╢╬╬╣╬▒▒╠_ _                    //
//                          ╠▒╚╦ _'[ [[╙φφ▒δ░..ε⌠∩,C/░╔╬╬╠▒╣╬╬╬╬╬╬▒╠░_                      //
//                          ^#Wφ╠▄^*_∩░Θ░▒╝▒ε{^«,∩;"φφ▒╩╠╠╠╣╬╬╬╠╬▒Γ╬                        //
//                          '╓µ╗φ░≤╓,╩░╬▒▒¼╙/,░░░φ░╙▒╠╟╬░#╠╚╠║╬╬╠▒▒╠_                       //
//                             `▒╙░;░░▒╬░φ½╩░░#░░▒╬╠╣▓▒φ░φφφ╣╬╠╠╩▒▒▒_                       //
//                              '^░=╚Å╙φΣ╓.φ╙╠▒╠╠║╣╬╬φÅ░╣╚░"╠║╩╬▒▒╠▒_                       //
//                                ⁿ░»≥░Çôφ║φ╠╠╬╫▓▓╬φ╠░ò░░^,φ╚╠╠δ╩▒╠▒__                      //
//                                  _"²╧╢╢╬╣╣╣╬╬╬░≥░░∩ⁿ,=░`-½╚╠φ╜░j╠_                       //
//                                        __ ╘▒╙░░∩'___.²,,φ░≤╩╙░"░╠,                       //
//                     _                   _╓#▌'^_      ,²,░░ⁿ┌φ░░,≤╩╩▒"_ _                 //
//                                      _╓▒╩╙   ___ _ ,"_-`ⁿ░ε░=""_ _  _ _  _               //
//                                     ,░"       _  _^_'_;"⌐'_ _ _ _                        //
//                                 ___ __         _ __ `__                                  //
//                                          _      ___ __                          _        //
//                                                 _                        _  ]_._..       //
//                                                                          _         __    //
//                                                                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////


contract IFE is ERC721Creator {
    constructor() ERC721Creator("Ife Heads", "IFE") {}
}