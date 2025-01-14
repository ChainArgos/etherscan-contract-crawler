// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Cosmos
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                              //
//                                                                                                                                                              //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ...........--.  .--.  .--. .-..-. .--.  .--...........................................................................................................    //
//    .........: .--': ,. :: .--': `' :: ,. :: .--'.........................................................................................................    //
//    .........: :   : :: :`. `. : .. :: :: :`. `.................................^.......:............:....................................................    //
//    .........: :__ : :; : _`, :: :; :: :; : _`, :........................:..:...~:...........:......::....................................................    //
//    .........`.__.'`.__.'`.__.':_;:_;`.__.'`.__.'....................:...:..^:..~:..........^~.....::.....................................................    //
//    ......................................^^...:.........^........~......::.^^..~:........:.^...:.:~...^........:.........................................    //
//    .......................................^:........:...:~.......~:.:...:~.....^.....:..:.:~..::.^:..:..::....:...................:......................    //
//    ........................................::.......:^...~~.^.....^.:.:..^.....^.......:^.^...:.:...^:.:!:..::..................:^.......................    //
//    .........................................::.......^~...::.:....^::^...~:....^::.::..:::::^^.^~..::.::^..::.................::.........................    //
//    ..................:^......................:^....:..^:.::^:....:.::~::.::.^..!^::!^.::.!~..::^..::.:~~:.~^................::...........................    //
//    ...................:::.............::.......^:...:..::::.^.:..!:::^...:^^~:.:.....::~^.~..:^^.^^:.^:^.::........::.....:::............................    //
//    ......................::............:^:.::..:^:..::.:^.^:.^.:.~^:^:::.:::.:^:::.:...~^:::~..~^:::^:..^.........^:....:^:..............................    //
//    ........................:::.........:.^:......::.!~:..::^:..:~:.:^!:^.::~~~^::^::^.:.~^:^::..^.:~^..:~:7::...:^..~..::.......:^:......................    //
//    ...........................:^:..::..:!~.^:...::.::.:~:::::.:^~:::^:::^.:::~~::.:::.:::~Y:.:~~!:::.:^:^^:...:^:.^^.^:..................................    //
//    ........................:...:^^:..::..7J~.:..^~.::.:^:::^:^7^.::^.::::^:::::^::::::^:^5~.^^:!::::::::::.^~^::.:.:^:...::........^.....................    //
//    ........................^:.....^^......:JJ^:.:.:.:^.!!::::::~:::!^:^::~~::~^:::^:~^::YJ.^Y^::::::::::::~^^^^^.^~:....:::.....::~:.....................    //
//    ................:.....::...:...:....::...~Y?~^.~~:^^:::::~~:7!:^~?:7:^^7:^~^:^~:!?!:7G^:5!^^^:^:^:::^.^::.:^:.::......:....::.........................    //
//    ...................:....^::........^:~..:..J57^~~7~::7^~7:!~^Y~^??!?7:~J!~^^^Y7^Y??~G!~YJ:~~::::::~::~!!:~~.^:^.!:.:^:..:^:....::....::...............    //
//    ..........................::::..:~:..:^.~~.::?Y77~??^^J~!?~~~!Y^7?Y!J^^J?~^~!?!?GY~5Y^?5^~~~^^^:!~!~?J^~?!:^!~..~^!~:^.:....::....^:..................    //
//    ..........................:..^!!~::::.::::^^.:!YYJ7!J?~?7!J!^!?Y~J??J~~?7!!~Y5!?7?7B~~Y?7Y7~~^^^~?557!?7^~??!^^77~.:^:::..::..........................    //
//    ............................:::^~75!..:::::^::~?J55Y77J~?J!?~!Y?777?7J!!!?7!?7!!!~GJ777Y57!~~~^755?!J?^~?7^^7?7~...~:^~:^..::..:.......:.:............    //
//    .....................:^~~^:..:...::!??~~~~:^7!^7J!?5YJ7Y77J7J~7?!!!!!7J!~!!~!~!~~?P!J?Y5?~!~!7YG5JYJ7^7?7?JJ!^.^~::^....^...:^......::::..............    //
//    ........................:~!7!^:....::~7?7777!!?7!??7JYY??7!!JJ~~~~~~~~?!~^7!^^~~~57??YJ?~77Y5P555Y?J?!7JYJ?!^:^^^^::.::..^:.^:..:.:...................    //
//    .........................:^^!7?7!^^:.:^:~?????77J?JJ~J5J7!!!!??^~~^^^:!!^:~~^^^:!?~!J!!~!?YJJJ5YJJJ7?JJYJ7~:^^^:::::::.....~:.........................    //
//    ........................:^.....^!?YJ!^::~!7JJJJYJJ??7!!7!~7!^^~!^~::::^7::.^7..:!^:^^^^^~!!!?JJJJ??Y55J7~~^^^^^:::::~^~....::.........................    //
//    .........................~:....^~:!?YYY?!!7??JJYY5J?7JY7^^^^^::^.::.::.?:..^~:~:..:.:.^^^^^!??!~?JYY?7?J7~~^~^~~~::::.^::~^.:...........^.............    //
//    .....................^:: :::^.:~.^^^~!JYY5YJY55J?JJJ77!77~:::.::!:.::^.:~:.:~7^::^..:7::::::~~!?????JJ7!^~!~~!!~^^~^:^~.:::..^..^.....................    //
//    ......................:^^.^.::.:^.:^!!77?JY55JYJJJJ?!~^^^^^.~:.:^!..:::^^::!~:.^::..?~:::..:~!!~^77!777???77~~77?7?7~^:.::...::.:....::...............    //
//    .......................:^:.:^~!~~~^:::^^7YYJ7J5JJ?!~7!7~....:~~:.::^^^~^^:^~:~^:^:::~~~.:.:::::^~!7????J???JJ77!~^:^~^^^!~~^^^:.......................    //
//    .......................::^^:::::^!!!7777777?JJ???7!~^^~::~:::.^~:^~^~~7!!!!~!?~~~^^^^^::^^::.:::~~~~~77!!~~!!!!!!77!!!~7^~^....:......................    //
//    ..............::::.::^...:^~~!!777!!~!!!77????JY??!~^:::.::::::^~!~~!!J?JY5YYJ??77!~~^^::^^:..:::^^~!!!~!!?7~77~~^^::^^:::^^:..........:..............    //
//    ...................::::::.:^:..::~!7??JJ?JJJJ???!?7!~::.::^:^^:^~!!7YJYGGB###BGPYY777~~^^^^^^:^~~^^~~~!7~!!!!7777777!!!~^^.:^...:::::..:..............    //
//    ...................::^...:.^~~!!!!!777??7JJ?!???7!!7^^:...::^~^7!J?JY5G##&&&&&#BG5J?7!~!^^^^^^:~~^~^~~!?JJYJ7!?Y?!!!~~^:.:..:..::.....................    //
//    ...........................^^~!!!!7?J???J?J77?J7!!^^:::.::~^^^~7!?J55G#&&@@@@&&#BP5J777~^~!:^^..:~~!77??J?7!~~~!~!~!~^^:.:...:.:^:....................    //
//    ..................:::.....:^^^~~!!!7777??JJJJJ?7!~^^::..:^^^~^!!7JY5PB#&&@@@@&&#BP5J7!7^^^:::~~~^:~~~~JJ??7777!!~7~!^::::^.:...::.....................    //
//    ...................~:::...:::::::^^^^~!??7JYYJJ7~~^^^~~~::::~^^~77YYPG##&&&&&&#BG5JJ7~~^~^.::.:..:^^~!!!?!?J!!!7!!!!~^::::.:.....:::..................    //
//    ................:~..~..:..:.::.:::::::^~!~!!?!!!~~!~~~~:.^:^:^^~!??J5PGB#####BGP5J77~7~:^:.::.:^^^^~~7?7!~~^^~^~:^:::::..:.:.:^...^...:...............    //
//    ...................:^...:^:.:..:~::^~777?J7~!777777!^:::..::^:~~!!!77JYY55P5P55J?77!^^^:.::.:^::^^!!!7777!!77!!~:^:::::::.:.::..^:....:...............    //
//    ..............:^...:.:.::::^^~!!!7777?77!!7??J?!!!!~^^::::::^::^?!^~!!!77?7?77!!!~!:::~^^::::^^^^~!7?JJJJ??77!!7777!^^:::.:^..^..:....................    //
//    .....................~.::^^^^~:::::^^^^7?7777!7!777!~~!~^:::::~7~:^!7~~^^~~~:~^~::^::.^~~::^~^^~!!!!?7!?????7!~^^:^^^~^:::^::^.^:.....................    //
//    ...................::.^......:..::^^^^^~~^~~!!7!7??777?!~^::~?~::^^^:^:^:^::^:::.:^:::::^~~^^~!!7!7??777!77!!!7777!~^^::..~:..^^......................    //
//    ...................::......:..:.::::::^~^^~~~~7?J?JY??7!7?!~7:~!:::.~^.:.~^.~::..^:.:::^::~77!~!77!77??J?7!7!!~^^:^~!!!!~^^::.:......::...............    //
//    ..................:...^:.!^.::.~:::::::::^^^!!7JJJJ?7JJYJ77~^7?~^^::~^:::7~.~!:::^::::~~^^~~!?YJJ7?J?7?777~^^~^^::::...::~^!!^::.:....................    //
//    ....................::^::.:.:::~:::~::::^:!!7777~??5G#B5?7!?Y?~!!~^!J^^^^J~^!J:^^^^~~~7Y?!!!???5J!!77YJ?7!~~^^^^::^::.:..^:^:.:::^:...................    //
//    .................^.....^::::..:~.:^^::^:::!~~^^~7?G&#PPPJ!7J7!77!7J5!~~~~5~~75~~~!!~!!!?5?!?J??J5?~?7!?7~~!7~:::::.:::....:^.......:::................    //
//    .........................^:...::^..:::::^^:^:^!JG&#YJP5?!77!7Y777PGJ!!77?P!77G!7!?77!!?7?P?!?Y?~!JY?!~:^^^:^::^^~^.:~::^:::~..........................    //
//    ..................~:..........~:::!!^:.::::::!5BP?!7557!7?~?Y777GG57!7?JY5J77B??7?J?7!75?7??!7?J!~!?Y7~^^:^:::::~!^::::::.::...........:..............    //
//    ......................::....~:..::::..::::::JG5!^^?YJ~^JY~JY~?7GJ75?777JYY5?7#Y?J!Y?7!~7Y7~!7~!!7~~7~JJ7!^::::~^:~:~^:..........:..:..................    //
//    .......................::..::..:..^^^..:..!55!:^^7?~^~Y?^?Y~~~PY^Y?J!!??55P7~55757?J!77^!?!!~~^~^:^!??!777!^.::.....::::...........:..................    //
//    ...........................^::^....:^^..~55~:^::^~^:7Y~:^~^^^Y5^75!7~!J7PJY!^7J!YY~J!~5~~^~~^:^^^^::^!7^^^~7!::^..............:::.....................    //
//    .......................::^...:....^.^:^YY~:.:::::.^JJ^::::::JP^^57~^~7?7J^!!^!!!JJ!!^!?J~!:^~:^:::^~^.^77:.:^7~:..~~.::.::......:.....................    //
//    .....................:::..:::..::.. ^JJ^..::.:^..~57.:::::^7P~^77:~~^!J!~^^^~~^~!!7^^^^Y7~~::^::^::77:.:~?!..:^!~..:.:::..:^..........................    //
//    ...................::.....:...::..:7?^::...::..:?5^.:^:::77P^~~?7:^^:77^^^~:~:^^:~!:^:^^5^^::::::::.^?~.::!7^::.::..::................................    //
//    ...........................::....^!^......^~:.^PY:.::::^:^5~:.^5!::::?^^^~~~::::::^^:~::7?.::::::~:!^:!!..::~^:.......::....:.........................    //
//    .........................::.....::.........^^^Y7..:.::.^:Y!.^:J7::::^!:::::^::::::~^:::~:J~::^^::^.:^..~!:....::......................................    //
//    ...............................:~:......^:..:7^..~:.:~.:?!::.!J^^:::^:::::::::::::^:^:::^^J^~:::..:.::..:~:.......:...................................    //
//    .............................::........::..^:^^..:..::.!!^:::J:.:::::^::.^::::~.^::::^:.:^~7~...:..:.:..::.........:..................................    //
//    .........................................::..::....::.:^.:.:!!~~..::.:.::^:^:^:.:^^:.:.:.:.!:.:..:.::.^:..............................................    //
//    ........................................:..........:.::.:..:~^:^.:.:.:.:.:::!::::~.:........:..:..:...................................................    //
//    .......................................:......:.:...^..^::^^.:...^::.:.:.::.:...::.:..~.:..........:.....:............................................    //
//    ................................................::.^:.....:::^:^..^:^:...::::....^.:..^:......:.......................................................    //
//    ..............................................:...........:.::...:~......::::....^....::..........:.A Collection by.:.................................    //
//    .............................................:.......:............:.:.^..^:....:.::...................................................................    //
//    ............................................:.......................:::..:.......:^......................./|/|  _     _/  _  /   _  _   _  _..........    //
//    .........................................................................:........:....................../   | (/ /) (/  (- (  _)  (/  (/ (-..........    //
//    ......................................................................................................................................_/  - --===D....    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//                                                                                                                                                              //
//                                                                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract MDSxCOS is ERC721Creator {
    constructor() ERC721Creator("Cosmos", "MDSxCOS") {}
}