// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: SaeedShmhmdi
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//      ____                              _   ____    _                   _                       _   _       //
//     / ___|    __ _    ___    ___    __| | / ___|  | |__    _ __ ___   | |__    _ __ ___     __| | (_)      //
//     \___ \   / _` |  / _ \  / _ \  / _` | \___ \  | '_ \  | '_ ` _ \  | '_ \  | '_ ` _ \   / _` | | |      //
//      ___) | | (_| | |  __/ |  __/ | (_| |  ___) | | | | | | | | | | | | | | | | | | | | | | (_| | | |      //
//     |____/   \__,_|  \___|  \___|  \__,_| |____/  |_| |_| |_| |_| |_| |_| |_| |_| |_| |_|  \__,_| |_|      //
//    Y55555PPP55PP55PP55555555555555555555555555555555B##########5Y5555555P555555555555555555555555555555    //
//    Y555555PPPPPPPPPPPPP5555555555555PPPPPGGBBBBBBBBB#########&&P55555PPPPPP55555PPPPP555555P55555P55555    //
//    YY5555555PPPPPPPPPPPPPP55P55PGGBB##&#&&&&&&&&@@@@@@&#BB##GY5GGGPP5PPPPPP5555PPP5PP5555PP5555PPP55555    //
//    YY55555555PPPPPPPPGGBBBBBBBB&&&&&&&&&&&&&&@&&&@&&&&&&###&#5JPGBBGG5555555YYY55PPPP555PP555PPPPP55555    //
//    YYY55555555PPPGGBBGBB&&&&@@@@&&&&&&&&&&&&&&&&&&&&&&&&@@&&&&BPPGGPGBPPPPPPPPPP55P555555P5PPPPPP555555    //
//    YYY55555555PPGGB&#BGB#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@@&&&&&&&##BBPBG5555YYYYYJJJJJJ??JY5PPP555555555    //
//    YYY5555555PPB#BB#B####&&&&&&&&&&&&&&&@@&&&&&&&&&&&&&&&@@@@@@&&&&&#BG5YJJ?JJ??????????7?Y5PP55555555J    //
//    YY55555555PP##BG#BB##&&&&&&&&&&&&&&&&@@@@@@@@@&&&@@@@@@@@@@@@@@&&&&#G5YYJJJJJJJJJJJJJJ??5PPPPPPPP5YJ    //
//    YYY55555555PB##BG##B#&&&&@@@&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&#B5YYYYYYYY555555PPPPPPPPPPPYYYJ    //
//    YYY55555555PG##&#B#&&&&&@@@&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&@@&&&#BGPPPPGGGGGGGGPPGGPPPPPP5YYJJ    //
//    YYY55555555PPGB#&&&&&&&&@&&&@@@@@@@@@@@@@@@@@&&####&&&&&&&&&&@@@@@@@@&&&GPPPPPPPPP555PPPPPPPP555YYYY    //
//    YYYY5555555PB####&&&&&&&&&&&@@@@@@@@@@@@@&#G55YYY5555PPGGGBB##&&&@@@@@@&#PYYYYYYYJJJJYPPPPPP555Y55YY    //
//    YYYY5555PPPGBGG###&&&&&&&&&&&&&&&&&&&&&#BPY?7!7777777?????JY5PPG#&&@@@@@&#B5YYYYYYYYY5PPPPPPP5555555    //
//    YYYY55555PPGGGGGB##&&&&&&&#&&&&&&&&&##G5J77!!!!!!!!777!!!777??J5PG#&@@@@@@&G555555Y555GGGPPPPPPPP555    //
//    YYYY55555PPPPGGBB##&&&&&&&&&&&&&&##BG5J7!!!!!!!!!77!!7777777???JYPB&@@@@&@@&GGGGGGGGBGGGGPPPPPPPP5YJ    //
//    YYYY5555PPPPPGGGBB#&&&&&&&&&&&&&##BP5J777777!!!!!!777????????????5GB&&@@&&&@#########BBGGGGGGGPP5J??    //
//    5Y5555PPPPPPGGGGGB####&&&&&&#&&&#BGPY77!!!777777!!777777!77??????JYG#&&@@&&&#BBBB#####BGGPPGGP5YJ???    //
//    5555555PPPPPPGGGGBBGB#&&&&###&#&#BPY?!!!~~~!!7777!!!!!!!!7777?JJJJY5G&&&&&&&########&#BBBPYGPJ?77777    //
//    YYY5555PPPPPPPPGGGGPB#&&&###&&&&&##BG5YJ?77!!!!!!!777JYY5PGGGGBBG555PB&&&&&&######&&&#BBBP77!~~~~~~~    //
//    YYYY55555PPPPPGGGBGGB&&&&#BB#&&&&&&#####BGPYJ77?7?Y5PGB#######BB##BP5P#@&&&&&&&&&&&&&&BBBP~~~~^^^^^^    //
//    YYY5555555PPPPGGGGGPB#&&&G5P####BPYJJJYYYYYJ???J77Y55555YJ???JJJ5GBG5P#@&&&&&&&&&&&&&&BBBG!^^^^^^^^^    //
//    YYY55555555PPPGGGGGGB##&&BG##GBGGPP5PP555J?!~^~7~!JY5555555PPPP5YYY55P#@&&&&&&&&&&&&&&BBBG7~^^^^^^^^    //
//    YYYY5555555PPPPPGGGGBB##&BGBPPBBG?5B#B?5P5Y7~^^~~7Y5PGP??GB#5YB#G5JY5P&@&&&&&&&&&&&&###BBG?~^^^^^^^^    //
//    YYYY5555555PPPPPPPGY5GG##BGPYYYYYJJY55YYJJ?!~~~~!7JYPP5YY5P5Y5GGPYJJ5G&@&&&&&&&&&&&&&&#BBGJ~^^^^^^^^    //
//    YYYY5555555PPPPPPPPJJ5YP&J!~~~!!~!!!!!!!!!!~~!!7???JY5J?777??JJJ??JY5G&&&&&&&&&&&&&&&&&BBBJ~:.......    //
//    YYYYYY55555PPPPPPPPJ?5YY#5^^^^^~~^^^^^^^^~~~7???J55JJJ777!!!77?777JY5B&&&&&&&&&&&&&&&&&BBBY~:.......    //
//    YYYYYYY55555PPPPPPPJ?5?JYG~::::::^^^^^^:^~!?J????YPPYY!~~~~~~~!!!77?5#&&&&&####&&&&&&&&BGB5!:.....      //
//    YYYYYYY555555PPPPPPJ?57J7PY:::::::::^^^^!??7!~~~!?5PP5?~^^^^^^~!!77JG############&&&&&&BGBP!^......     //
//    YYYY55YY55555PPPPPPJ757??5B7::::::::::^~7!!~^^^^~7JYJYY!^^^^^^!!77?5&BB#&&#&#&&&&&&&&&&#GBP!^:::::::    //
//    YYYYYYY55555PPPPPPPJ757?JYBP~::::::::^^~~~?7~!!!?YYJ??7~^^^^^~!777Y#&B##&#GBBBB###&&&&&#GGG7^:::::::    //
//    YYYYYYYY55555PPPPPPJ!57??Y5#Y~^::::::^^^^~?J55?7YGP5Y7!~~^^^^!!7?YB&GBB#&&#####&&&&&&&&#BGG?^:::::::    //
//    YYYYYYYY55555PPPPPPY!57??J?BBY7^::::^7J5GB##BGPY5P#&#GPYJ7~~~!7?5B&#PBB############&&&&&BGGJ^:::::::    //
//    YYYYYYYY55555PPPPPPY!57??Y!5#GY!~^^^?G##GPP5J????JYPBG###G?!!7?5B#&BGBB#############&&&&BGGY~:::::::    //
//    YYYYYYYY55555PPPPPPY!57??J77G#PYY7~^YG5JYYJJJJJJJJ555555PGY!YGGB#&&&#B#############&&&&&BGB5~:::::::    //
//    YYYYYYYY55555PPPPPPY!5???Y7~?#BY5?!^!~^^~~~!!77777?JJJ??7??JP#B#&&##&#############&&&&&&#GBP~:::::::    //
//    JJYYYYYYY55555PPPPP5~Y???J7~~5#JJ!~^::^^~~!?YP5PP5YJ???!!77?5BB#&&################&&&&&&#GGG!^......    //
//    JJJYYYYYY555555PPPP5~Y??JJ7~~~?PJ!^^^^^^^~!!YG5Y5GY?7!77JPYYPB##G&&&#&############&&&&&&#BGG7^......    //
//    JJJJYYYYY555555PPPP5~YJ?JJ?~~~^!55J?!~^^^:^^^!~~!!!!~~!YPGPPPBGYJBB###########&###&&&&&&&BGB?^......    //
//    JJJJYYYYY555555PPPP5~YJ?JJ?~~~^.:?P5J?!77!!^^::^^!7?J??YGBBBBY77?YPGG5JPB###&&&&&&&&&&&&&BGBJ^:.....    //
//    JJJJYYYYYY5555PPPPPP!JJ?7!!^^~:...~5GJ55Y5577~^~7JJPPGPGB##BJ!!!7??J55^^~7JPG####&@@&&&&&BBB5^:.....    //
//    JJJJJYYYY55555PPP555!~^^^:. .^.....~GBBBBBBPPPP55BBGG###&#P?!~~~!!~~7~...:^~~!77??YPB#&&@#BBP~:.....    //
//    JJJJJYYYY55555Y?!^^:::.^..   ~:.....^?5B########B#&###BPY7~~~^^^~~^^:   .:^^::::^^^~7?J5GGGBG!:.....    //
//    JJJJYYJJJYJ7!^:.:::...:: .   :7:.......^~7Y55PP5555J7~^:::^^^^::^~~:   ..::^^:::::^^!!~~!7??Y?~^:...    //
//    ????7!~~^^::^:::::....:. .    ^?~........ ....:..::......::::::^^:.    ...:^:^^^^^::^!!!77!7?????7!~    //
//    !~~^::::::::..:::......  ..    .77^:.....................:^::^^:.      ...:::^^^^^::.^!!!!!!!!7!!!!7    //
//    ::::...:.::..:::.. ....   ..     :!7!~^:...............:^~^^:.     .......:::^^^^^^^:.:!!~~~~~!~^^~~    //
//    ::........ .::::.  ....   ..        .:^^^^^^^^^~~^^^:::::.       ..:......::::^^^^~~^:.:~~^^^^~^^^^~    //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract SHHI is ERC721Creator {
    constructor() ERC721Creator("SaeedShmhmdi", "SHHI") {}
}