// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: CRYPTOMUZIK
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////
//                                                                                       //
//                                                                                       //
//                                                                                       //
//                                                                                       //
//                                                                                       //
//                             ▌▐                                                        //
//                            ▐ ▐                                                        //
//                        ,╓≈⌐╩ ▌                                                        //
//                      jπ , ╠,"▄                                                        //
//                       ⌐`   ,«└                                                        //
//             ,ⁿ╦≥≈╗╗╗µ ▄▄▄▄▄╖▄ ╓▄,,,,, ,,,,╓,                        ,,,,,,,╓▄╖        //
//             █╬╗▄▀▄╜▄╬▓╙░░░▄▀Æ▓║╣╬╬█╠Θ▌█╠╬█└#╣⌐▒░╝╓█j▒░░å▀▄╜╬╬╫▐░╓▀▄╗╙█░║▐▒]▒▒║        //
//             ║▒▒▒▓╗▄▀╬╬▌█Å▀▄█▒║▐▓▀╫▒░░║▐▒█┌█╬╫ █▀,█╬⌐▌▄▀▄▒░╙╬█▌█▀▄╬░░░██▀▌██▌▌░⌐       //
//             ]▄▀█▒####╙╣▄²╬░▓╙▒▌█▌█#▄"╝▌╝ ▀▀╙,▄,█▌▌╚▌▀▄▌  └`╙` Æ╦#,╘m≥≥≥m╓ ▒▓║░⌐       //
//             ╞░│▒▄▀╝▄¬  ^▐▒≥█▀╙█╟▐▒╜▀╙    ▀▒╣▀▄░▌▌╙▌╙⌐█▀█      '▀╝╬╬▄╬╔▀é░▌██⌐▒        //
//             ▐░░▄Å╜^      ▌░,╝"            'ª█▄]⌐▌▄╝⌐]╝▒▄▀.,        ╬w▄▓╝▄▌██▄╟        //
//              `▄#▓╬╫▓     ╚▀Φ╣              ^╦w▄ ╠e▒▓║█╠æ▌█▀╠p     ╙`▄▄▄▄▄╗ █≥W        //
//              █╗▄▀▓▐█      └╬▌▄,              ▀.╬¼╙▒▌█╝L▀ ╣─█─      ▐▄└╝╬╬╬▌ %░⌐       //
//              ║╬▓▀▄#          ▀██▌             ║█``   ▀▒║▐▒▌╙       █╠╬╗,╙▓▌▐▌╙▌       //
//               ▄▄▄▄▄4▌         %▄.▄            ▌║       ╙▐╬╝       ▐░▒▒▄╝▀,, ▒▌└       //
//              j░░▄▀▄▀▄█         "▓╙▓▓▄         █▒║        ██▌      ╓«═▀▀▀╜╨╨▌▌▌╫       //
//              ▐░╩▄▀░▄Å▀             ╙░╠       j▒░█        ╙╬▌      @▒▒▀ æ≥╗╗▄║ ▓       //
//               ▀▐█╗φ▓╬░▌█▄           █░╠µ      █▒║         █       ▐)└█µ▌└%░║ ╠╣       //
//               ▄ %▄▄▄╠╙ █#█╙▄        ▐░░▌▄    ║░█▌                  `█░▌█▄█▄╣]╬╠⌐      //
//               ╠│▒╖▄▀▀Φ█╬╠╣▌█╠▄       ╙╬▄░║   ╓▀░╝                  "█╗▄]M≥≥≥##,─      //
//               ╞▄╜^▄φ░▒▒≤╥▄└║╣╫─        ▀▒╠░║ ▒#▌        j▄         █╦╙╬▌║░Å▀,#░⌐      //
//               ╓▄▄▄  ▄▄╥╗≤╦M ▀╓█ █         ║╩▀░░│░█,      ▌▓,      ▐▒▄█m▀ ,#▒░░░▌      //
//               ╫╬╣¬é▌█░░░█─@▓ █╣╒║▓       ∩;φ╠╬░▒▒░█▌     ╠▄╙▌,▄╓,╒[email protected]@▓▒█ ▄,╙▄░░▌      //
//               ║╣─⌠░Å ▌▄▀,╬▒▒▌╙▓║▌██     ▌[╙╠▌Γ░╬█▒║╣⌐    ║█▐▌▌╠░▌▐╙╦└╫║¬╬░│░≥▄%▌      //
//               ╘▀▐╝▀▀▀└«█▒▒▒╬╚ ▌╙╣╜▓,    ⌐]φ╬█╜╙Γ╠▌▐╬▌    ╫─▌█ └▒▌▐░░╝¬╓▄▄▄▄▄,▒╙       //
//                ▄╙▒│░║j▒▒##╗▄╙▀ █\█d▒    ▌░░║▒╠▒φ█░║╣▌    ╫▐▓,⌐█╙▌▐#║▀██ M╖▒▀╬▒░║      //
//                ▌▀▄▀▒█▐░░░▄Å▀▀▄⌐█▌╙▌█    %╙╬╟╬█╙░░▄█╣     ╙║.█⌐▌█ └╗▄"▀▌,▀▀▀╜▀▀─╙      //
//                ║░░█└▌╝▀╠▄µ▀█▀▄▀▌╙▄╚▀     └▄▒░░░▄▓╬▀        █╩ ▒å╒█║░╠▀▄▄╓╙▀╬╬╬╬╬µ     //
//                └▀"",▄▄╫╝▓¬█#,▄▄`▀ █¬        '╙╙▀╙         "▄║]▐.█║▐╩,▀▄╚⌐▌▒#▄▀▓╠▌     //
//                @▄╙╬░░░░█╓╬░░╙¼╙╜╓ε                        Φ▄║╓,█▒╝ ▀µ██⌐└╙▀▀▀╝▓⌐^     //
//                ╫░▓▄▀▒▄▀Æ▒░▄╝▀└,@▓                         █≈╠▀╙▄Θ║j░▌` ▄╙░░│░]▀╒║     //
//                █▒╩╩█▄«▀█▄m▀░││▌╠`                         ▌½╬╬░≥▄▀ ▄█▐▌██╙▄░╓▀#░║     //
//                 ╗╗╗╥-'▄█"▀▀▀▀╝▌               @           ▌▌█▄▀,╗ ▄██║║╘▒█▄█`█Å╝╜⌐    //
//                 ▒░#─╓▀╗╙╝╬░░║▀               ▀▒µ           ╙╓Θ▒░║ █'▌█░█.▄▄╗╗#▓▌▓     //
//                 ▒▀ #░░▄▄█*╙╙              ▄╣─█▄`         ]⌐█▄╙▄░║]▒█ ▌╔]╗,╙▀╬╣▀á║     //
//                 ▀,██▄╖╗≥#╗               █╬╬▓─╬⌐         ╫ ▌░█ ▀▓▐░╠j█.▌░░╠▓[email protected]░▐     //
//                 ▄j▓╬█▀▀╝▄║             ╒█╝╨▀▀▀─          ▒⌐▌╬╬▓─└▄╒▄" ▀█▄╗#Θ▌╔▄`║     //
//                 █╠▄▀▄│▒▓W              ▄Θ▌▌╙╬░▌         ▐░▌▀▀▄é▒░║▐▒╠╗▄Φ▒░░▓╓░▄╩      //
//                 █╬░▓▄╙▀▄██             ║║▐▌█▌╙          ╬░▌ ▄╙╬░░▌║╠╬╠░▓▄▀▓╓█▀ ▄╣⌐    //
//                 █╝▀,▄#▄╙▀▓             ╘▌▌▌▌▌▄          ╙╝▌╫╬▓▄╙█]▒░▒╬╝▀^╠▄╙ ▄▓╬║     //
//                 ╔╖▄▄██▀╜▀W              ▄▌ ╙█▌                 └ ╙╫╗ ▄#▀░░▌ ,└╙╝╣     //
//                 ║░░░░▄╝╜▀▌              \╣▐▌╙▌                     ▀▐╗▄╙▀╝▌Æ╝╜▀█▄     //
//                 ║╝",▄≤Θ▒│░▄             █▐▐░▌                      ▌╦╙╬╬▓ ╓╫▄█▀▀╝█    //
//                 ,,▄»╗═, ▄▄▄             ██╫█╓▒▓▄                  ê▄▄▓╜╬▌┌▒▄╫╜▀▄▄╗    //
//                 ▌░░$▀é╠▌╙▒║            ]█ ▄ ▄▄▄╠▀         ,  ▄▄,  "█Mw▄│ ▄▄╗▓█╬╬╬╣    //
//                 ║░╩,█╬╬▓█╙█             ▐▌║█'╫╬╬╬╬╬╬█ ▌@▄╙▀║▌║╬╬█,#▄▀Å",╗▀╗▄▀▓╬╬╬╫    //
//                 "` "╙▀▀▀╝█╩             ▒▌▐▒╚µ╙╬╬╬╬▓ ╬╙⌐▒▌╒▒╠─█╠▀╬░░█ ▄╙▀▓╬▄╠╗▄▀╬╣    //
//                 ▐# ╙▄│╙╙▒▀█`█╒▄        █╣▌ ▀▄╙▄ █╬█ á░░▓║▌╓,╙▀▄▒╙#▄╙¼▓▄╬▓╗╠'█▄╝▀,▄    //
//                 ╞░░#ç▀▄░▄▀▄╬╟║█▐       ▄## █▄,▀█ ▀ ╒░░░░▌⌐▐░│░▒#≥╬█╙▀▄▀⌐█╣╜▌æΘ▒░│║    //
//                 ║░░░░█▄`▄╬░░║`]▒█  ▄#▓▒▄▄║ █▄▄╬█Æm █▄ÅÅ╝╝⌐ ╜╜╙╙╜╜╜╜╙╙▀▀^ `╙`╙````^    //
//                 ╙`     └└└¬└¬  ''                                                     //
//                                                                                       //
//                                                                                       //
//                                                                                       //
//                                                                                       //
//                                                                                       //
//                                                                                       //
//                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////


contract MUZIK is ERC1155Creator {
    constructor() ERC1155Creator("CRYPTOMUZIK", "MUZIK") {}
}