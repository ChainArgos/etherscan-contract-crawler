// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Ozy Multiple Editions
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  //
//                                                                                                  //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,::::::::::::::::::,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,::::::::,:,::::;:::+,;;,,:::::::,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,::::,,::;;;++*;;:+:+;;;;.+;;+;,:;;:,::::,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,::::,,,;+,:;;;:;:;;;;;;;;;;;;;;;+,.;;;+++:,,::::,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,:::,,.:++;;;::;;++;;;;;::;::;:;::;;;++;;::;;,:+;:,::::,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,::,,::+:,;::;++;::,:+,*::*,*::+,*:;+,+,:::;+++::;;:+;:,,::,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,::,:;;+;;::++;::,+,+;,;,,,,,,,,,,,,,,,,:,;;:*,::;++;::;+;;,,::,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,::,,:;*+,,;++::;:*,:,,,,,,,,,,,:::;;++**+;;:,,,,*:+:,;++::;;,,,,::,,,,,,,,,,,,    //
//    ,,,,,,,,,,:;,.:;+;+++*;,:+:;,,,,,,,,,,,,::;+++;;,,:;;+*****;,,:,*;,:+*;,,,,:+:::,,,,,,,,,,    //
//    ,,,,,,,,,;:,,::;,,+*:,:*,:,;;,,,,:.,:+*%S###SS%%????*+;:,,:;++:,,,*::,+*:.:;;+,:;,,,,,,,,,    //
//    ,,,,,,,,;,,,++:.;*;,,*:,,++;,++?:+;*%%%?*+++;::::;;+*??*;,...,;:,,,,*::,**,,;+:,,;:,,,,,,,    //
//    ,,,,,,:;,,,++:,+*,,+;.,+*:.;?:+;***;,,:+??*;,..,.......,,,*,,,:;;,,,.:+:,;?:,+*:.,;:,,,,,,    //
//    ,,,,,:;,,;;+:,*+,:*,.:?+,.,:+,,;:,,+?#@#%*;,,::,:,;;,.;?+,;?+,,,;*:.,,.+;,,?;,:::,,;:,,,,,    //
//    ,,,,,;,,:+;:,?;.;+,.;?+,.;*;,,??*S#@@@@#S###S#%+*??%?::[email protected]?;+%+.,,;%+.,,.;+,,?;,+*;,,;:,,,,    //
//    ,,,,;,,,;*:,?;.+;,.+%%+.*?:..:@@@@@@@S%%#@@@#++%%[email protected]@@?,.%#;*?%,,+,;%?,,,.:*,,?;,:++,,;,,,,    //
//    ,,,;:,:++;.*+.++,.;S#%,??,,.:??#@@#%?%#@@@#*;*%[email protected]@@@@#[email protected]+%#;.+*,;S?:,,,:*,,%,:++,,:;,,,    //
//    ,,,;,,,++,:?,:+,,:#@S,?%.,,;?*%@@#%[email protected]@@##%*???#@#@@@@@@@@[email protected]#;#*.:S,:*#?;,,,;+.;?.;*;,,;:,,    //
//    ,,;:,,;+;.?;,+;,.*@#:;#,,;,;+S%?#@@@S?*%%?%%*?%?+%[email protected]@@@@#@[email protected]:,#;,,*#*:,,,+:.?:,++,,,;,,    //
//    ,,;,,,+;,:?,:*,,,%*;.S*.,*,,;,*@@@??S%*****?%%%%?%%?%%?S#@@@#;@?,#?.,:@%++,,;+.;*.;+;,,;,,    //
//    ,,;,,:++,+*.;+,,,?,.:#:.;S,:*[email protected]#?%[email protected]@@@@%[email protected]@@S%???%S*%#@#;@#;@%.+:#S?%:.:*,:?,:+;:,;:,    //
//    ,::,,:*+,*+.+;,,,:,,;#,:##,+*,[email protected]@*#+*@@@@@@S;;[email protected]@@@@@S:[email protected]+#@;@@@@%.?:%#S%+.,*:,%,,::,,::,    //
//    ,::,,;+;.*;.+;,,;:,,;@,;@#,*%%@@@S*%S??%S##@@@@##SS%%?*%#S*#@*@@@@?.%:%S#@;.,*:,%,:++,,::,    //
//    ,::,,:::.*+.+;,.**.,:@;:@@:[email protected]@@@@@##%?S?+%%???+??*?%%%S?%%[email protected]@%@@@@;:S,#%#@:,,*,,%,,::,,::,    //
//    ,,;,,;++,;*.;+,.+S,,,S?:@@*;@##@@@#@%#%??SS*%S*SS*%S?SSS%%#@#[email protected]@@S,%*;@?%S,,:+,:?,;+;,,;:,    //
//    ,,;,,,++,:%,:*,,,#;[email protected]@@@#:#*:@@@@@%@:;?SS?%SS####@@%+:?#[email protected]?#@@@;?S,SS?%?.,;+.+*.:+;,,;,,    //
//    ,,;:,,;+;.?;.+;..*S,,,%@@@@?*@:[email protected]@@@@@:#@@##@@@%+*@@?:+S#*#%[email protected]@@?*S,[email protected]+*%,,,*:.?:,++,,,;,,    //
//    ,,,;,,:+;,:?,,*,,,S?.,:#@@@@:?#;[email protected]@#[email protected]:[email protected]#%@@@+.;@@S?#@S;S%;@@@%*#,*@+++;..;+.;*.:+;,,;:,,    //
//    ,,,;:,,::;.*+.;+,.:#*..:[email protected]@S:,[email protected]%@@@*#:;S:*?%+;*@@S%@@%;S?;#@@%?S:*@;,,,,.:*,,%,:;;.,:;,,,    //
//    ,,,,;,,:+;:,?;,;;,.:#%,.,%#;...+#@SSS?+;;**?%?*+::+##*+S**@@@%%%,%#;.,,,.:+,,?;,++;,,;,,,,    //
//    ,,,,,;,,;+++;?;.+;:.,%#;..+S%;,.,*%S%S#S?%%%?+,,*##?+??*[email protected]##S%+:S%,.:,,.;;:,?;,:;;;,;:,,,,    //
//    ,,,,,:;,.:;+:,*+.+;:..*#%:.,+%%+:.,+++:,;+?+;;*S%*+*??S#%%#S*:;?;,:+:.,+;:,?;.+*:.,;:,,,,,    //
//    ,,,,,,:;,,:+;::**,:+::.,?#%*:,;*+,,.,,,:;++***+;+**?S%++?%+,.::,+?;,.;;;,;?:,;;,,,;:,,,,,,    //
//    ,,,,,,,,;,.,;*;:;*;.+;;,.:*##%***:+;,,,,,,,,;;;++**;:,;;,.,;;;*?+,.:+::,*+,:;+;:,;:,,,,,,,    //
//    ,,,,,,,,,;:,,;+*;,+*:,+:+,.,;%##@?S*+...,,,,:,,::,..,,,,;?#@%*;,.,*::,+*:,;+;,,:;,,,,,,,,,    //
//    ,,,,,,,,,,:;,,,;+;:,+*;,;:*,,.,;*%###?*+++**??**+:,,;+?##S*;,,:,*,::+*;:;++:,,::,,,,,,,,,,    //
//    ,,,,,,,,,,,,::,,,;;,,,;++::,*,;:.,,:;+*??%%%%%+:,,,:::;:,,,:+,+,:;++::,,,;;,::,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,::,,,;+;;,:+++:,;,++,+,,,.,..,,.,,,,,,,:,+,;+,;:;++;::;*+,,,::,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,::::,++;,,::;++;;::;,+::*,*::?::*,*::+,;::;+++:::;++:,,:::,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,::::,,,,;*:::::;+++;;;;:;::;::;:;;;;++;;:::;++;+;:,:::,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,::::,;::;++;+;,,:;;;;;;*+;;;;;::;::;;+;+:;,,::::,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,::::,,,:;;,;+*;;;;;++;:;;;;,,:;::;,:::::,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,::::::,;::,:::::::::::,,,:::::::,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:::::::::::::::::,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//                                                                                                  //
//                                                                                                  //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////


contract OME is ERC1155Creator {
    constructor() ERC1155Creator("Ozy Multiple Editions", "OME") {}
}