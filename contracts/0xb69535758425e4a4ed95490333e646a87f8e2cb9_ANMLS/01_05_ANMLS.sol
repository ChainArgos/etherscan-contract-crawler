// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Bright Animals
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                              //
//                                                                                                                                                              //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ........................,;;........,,..................................,;,............................................................................    //
//    .................;:....:+?,...,;++++:..........................,+*+:,...++:...,:,.....................................................................    //
//    ...............:*+,...,*;+.,;*??+:,.............................,:+**;:,,**....+*;,...................................................................    //
//    ..............:*+.....,*:*;*%?:....................................,;%?****.....:++;..................................................................    //
//    .............,**,.....,*;**?;........................................:?+;?:......,+++....,,,.......,,,.......,,.....,,,,......,,...,,..,,,,,,,........    //
//    .............*S+......,?:;*,..........................................,+;*+.......,*;*..;#####S*,.:#####S?;.:###:.:?#@@@#?,.:###;.*##%:#######%.......    //
//    .............S**,.....*+;;,.............................................++*;.....,;??#;.;@@@[email protected]@S.:@@@?*@@@+;@@@:,#@@?+%@@%.:@@@;.%@@S,+*@@@S++.......    //
//    .............+%+*+:,,+*++................................................*;+;,,;*?*?%?,.;@@@,:@@#,:@@@:.#@@?:@@@,;@@@,.:@@@,:@@@;[email protected]@S...#@@*.........    //
//    ..............:+*??;+?;*:................................................,*,**+??+;:,...;@@@#@@%:.:@@@%%@@#:;@@@,;@@#,,:;;;,:@@@S%#@@S..,#@@?.........    //
//    .................,;*++;+:................................................,*,+?*:........;@@@*%@@%,:@@@#@@S,.;@@@,;@@#:#@@@@::@@@S?#@@S..,#@@?.........    //
//    ....................:?+:*..........................................,:,...+;**:..........;@@@,.#@@;:@@@;[email protected]@;.;@@@,;@@@,:[email protected]@@::@@@;[email protected]@S..,#@@?.........    //
//    ...................;*,?%;+..,;*,...................................:*;;,:**?,.,;........;@@@;;@@@;:@@@;[email protected]@#,;@@@::@@@+,*@@@::@@@;.%@@S..,#@@?.........    //
//    ...................?%,.*%+;,++;.....................................,*:*?%?,..;?,.......;@@@@@@S+.:@@@;.#@@*;@@@:.+#@@@@#@@::@@@;[email protected]@S..,#@@*.........    //
//    ...................:S*:.*%+?;*,...,+.....,;...........,,.....,.......+*+*?..,;??,.......,:::::,...,:::,.,:::,:::,..,:;;,,::,,:::,.,:::...:::,.........    //
//    ....................:?*;:%+;;*;...;?:....,%;.........:?;....:?,..,,:;;:;S;;*%S?,......................................................................    //
//    .....................,;+;+;:,:*;;:+*+,...:**.........**;...;*?;;**++++*???%%*;..:::,...,::,..,:::.,:::,.::::...,:::,....:::,...,:::,.....:;;;:........    //
//    ........................,:;+**?*??+??++*++;+.........+;;++*S#%?**++++++;;:,....,@@@?...:@@S,.:@@S.;@@@;,#@@@+..*@@@%...,@@@?...:@@@;...;[email protected]@@@@%:......    //
//    ...............................,,:;;??**?+:+:,.....,:;+:?*SS*;;;,..............*@@@@,..:@@@%.:@@[email protected]@@;,@@@@%.,#@@@%...*@@@@,..:@@@;..,@@@?:[email protected]@S......    //
//    ................................;;**+;;+*S%?*;*;,;;;+%?*+***?%**;.............,#@@@@*..:@@@@?:@@[email protected]@@;,@@@@#,;@@@@%..,#@@@@*..:@@@;..,#@@S::;;:......    //
//    ................................:+?##%*;:*#*:.:S%*,.;%#+;+?###?;[email protected]@?#@#,.:@@@@@[email protected]@[email protected]@@;,@@[email protected]@;[email protected]#@@%[email protected]@?#@#,.:@@@;...:[email protected]@@%:........    //
//    .................................:++%#@%;+SS%;;%S*,;%%#;:S#S**:[email protected]@:%@@;.:@@#[email protected]@@@[email protected]@@;,@@?%@%#@?#@%[email protected]@:%@@;.:@@@;.....;%@@@%,......    //
//    ...................................::;+*%@S+,:::::::,,S#??;::................;@@@S#@@%.:@@S,[email protected]@@[email protected]@@;,@@[email protected]@@@:#@%.;@@@S#@@%.:@@@;..,;+*:;#@@%......    //
//    ........................................,S#%*.,,.,,..:@@?....................%@@S*[email protected]@@::@@#.:#@@[email protected]@@;,@@?,@@@S.#@%.%@@S*[email protected]@@::@@@+,,,#@@%,[email protected]@#,.....    //
//    .........................................?%?:,;:+;::,+S**:..................:@@@[email protected]@?:@@#..;@@[email protected]@@;,@@?.%@@*.#@%,@@@[email protected]@?:@@@@@@?:[email protected]@@@@#+......    //
//    ........................................,S?*:+,,,,;?,?+++%,............,,,..,;;;,..:;;:,;;:...:;:.,;;;,.:;:.,;;,.:;:,;;;,..:;;:,;;;;;;:..:+++;,.......    //
//    ........................................?*+;%?*+;++?%:*+?++:...,:;+;;;;++;;;:,........................................................................    //
//    ........................................?*++?*@#[email protected]??+;S,+S??*???+:,.,:::,,:+*+;:,.................,,,::;;;;++*+;+;;:,...............................    //
//    .......................................:S;+?%*%%%*??%%?+;;?%:+***+:.....,,;;,,,:;++*++;;;;;;;;;;;;;+++**:;;:,,::::;*++;++;,,..........................    //
//    [email protected]*:;*%?*+;*?%?;::?#;:+?+*:,........,:,.....,::::;:;:::::;:,,,,,..........,.,:;+;::;;+:,.......................    //
//    .......................................*@#*,;*?%+;+%*,:+S?*,:+?+:..................,,.,,.......,:;:;,.................,;++;,,+*+,.....................    //
//    ......................................,#S%%*?+*S?;*;.:*S*,;:??++:............:,..:::,.............,::::,,;...............,;+*::?*;....................    //
//    ......................................*#+?%S?;+?+%;,:?%+,.+%%*;+,.....,:,,...;:,;:,..................,,::;:......::,,,......:*++*?,...................    //
//    .....................................,S%+**?S%+?:*+,%S+,,:?%+;;:....,;;,,...:++,........................,,;,....,:,...........;%#*+...................    //
//    ......................................+S*?,:+%?+,,+:+++.;++??:*,..,;;:,:;...,;;...........................+:.,,,,............:;[email protected]?*...................    //
//    ......................................:#%S+::+*:;:*;,:+;**+%:*+..,:,..,+,.....:,..........................;+.::,............,;?+SS:...................    //
//    .......................................*#S%??*;++*+;::*?%+%;;?,......:;,.....,:...........................+:.,.............,:;*?%;....................    //
//    .......................................,?%%?%**?:%:,;;*#?S*,*:......:+,.....,,:.........................,:?:..............,;;;**......................    //
//    ........................................,SSS?**+:+::;?S??+:+:,,....,;......,:.,*,.......................:*?..............:;;;?*.......................    //
//    .........................................:S#?%*?;?;*??**;:?*;:,,,.,+......:;...;?,....................,,;**:,...........,;++**........................    //
//    ..........................................,?S#%?**%*%%*:::*;+::;:,:,......:,...,%;::,.............,::::,;%*,,...........,+?;*.........................    //
//    ............................................:*S%S%%%S?+:*+%+?;;;::........,....,?*:;;;,,...,...,..,,,.,:;+:::..........,;*:*,.........................    //
//    ..............................................,+SS##S%,.*%**+??;;;.,...,,....::??+:;,++::+;,,;;:,..,:+?%%%*:;+:,..,,,,:;;,;?..........................    //
//    ................................................,*;*%@S?;:+?*+?*;+,;;;:;;:,,:?%@?+;+;+*+*?+++*++;;***?%?%?#+,+;,,,,;+*+:,.+;..........................    //
//    ....................................................,+*S#+::**+*+;:+;;:,,:+**%#?%?**+++++;+++++***???%%%#SS#%:.,,,,+;:,,,:;;..........................    //
//    .......................................................,*S%?**;+%**,,,:::,.;;+S%%??%%??*?%??%%SS%%?*%?%%%#S%#S*:,.;,.....;:*..........................    //
//    .........................................................:,*%?SS%@%...,,::,,:?:,::;;;+++++;;;:::,...:%%??**+*?%S?,;;.....::*,.........................    //
//    ..........................................................,?+;*%%*%;..,:...:?;.......................,?%%+++;;+*S%;*,....,;:+.........................    //
//    .........................................................,*+,;**??%%,..:,..,*,.........................+%?*?;:;;*%S?:.....;,*,........................    //
//    ........................................................,*;,;?;:+%*;*,.,+,.,*...........................:?*+*;+;**+S?+;,..,;:*........................    //
//    .......................................................,?;,,+;;**:..;+,,+:.:+............................,??*++;*?+S:*+;,.,*;;*,......................    //
//    ......................................................:*;,,;:+*:.....?:.,+,+;.............................,%%*;+*#*?;,?::,.+?;;+......................    //
//    .....................................................:*:::;+?*,......*+..,,*:..............................;*:;;;%%*%.:?,..,??:*......................    //
//    .....................................................*;*;,;S*........+;....++..............................:?;;+***%?..++:,,;?+;......................    //
//    .....................................................+*:,.+S:........;*,:,.+:..............................;?;:*++**...:*,...+*.......................    //
//    .....................................................:*,..+%..........?:..,*...............................++;;::?+....,?...,*:.......................    //
//    ......................................................:*,,;?..........:?,,;+...............................%+;**?;......*,.;+;........................    //
//    .......................................................:?,,%,..........*,:*;..............................;%+;?*,.......*.:+*.........................    //
//    ........................................................++,?*..........*,:?;.............................,?*;??,.......,?.;*;.........................    //
//    .........................................................?:,%;.........*,:?:.............................+?++?,........:*.;*:.........................    //
//    .........................................................,*,:%+,.......?,:*;............................;?+:?:.........++.:*..........................    //
//    ..........................................................;+..;+;;,....?:,++...........................;%:,?*.........,?,,;*..........................    //
//    ...........................................................+;,..,%*:,.;*,.,*..........................;*:,;%,.........+;..++..........................    //
//    ............................................................:;*+:,+%?,**,,,?,........................:?::,*+.........,*:,,:;..........................    //
//    ...............................................................:*%??S?*:.,%?,.......................;%+:,?S;.........?:;:?%;..........................    //
//    .................................................................:[email protected]%?*:+;........................*S%S%+*;.........*#?*;*,...........................    //
//    .........................................................,,,,,,::::%#%S#S*:;++++;:::;+*+;;;;:::;::[email protected]#@*:,::::::::[email protected]##?;:,,.........................    //
//    ..........................................................,,,,::::;++++++++++;;;:::::;;;:;;::;;;::;;;;+++;++++**+++*???*;::,,.........................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//                                                                                                                                                              //
//                                                                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract ANMLS is ERC721Creator {
    constructor() ERC721Creator("Bright Animals", "ANMLS") {}
}