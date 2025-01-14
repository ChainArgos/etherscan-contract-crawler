// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: We Are All A Bunch Of Clowns
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@[email protected]@@@@@**?**@@@@@@@@@@:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,[email protected]@@@@@@@@@**??*@@@@@@????*@@@@@@    //
//    @@@@[email protected]@@[email protected]@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@[email protected]@@[email protected]@@@    //
//    @@???*????**??*?**???*[email protected]@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@?**???**?*??**????**[email protected]@    //
//    @??*[email protected],,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@?????????????????????*[email protected]    //
//    @?*???????????*?????????*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*?????????*???????????*[email protected]    //
//    ???????????????????????+:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:+???????????????????????    //
//    ?*???????????????????*:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:*???????????????????*?    //
//    ?????????????????????+,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,+?????????????????????    //
//    ?????????????????????*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*?????????????????????    //
//    ??????????????????????:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:??????????????????????    //
//    ??????????????????????:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:??????????????????????    //
//    ?*????????????????????:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:????????????????????*?    //
//    ?????????????????????*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*?????????????????????    //
//    ??*??????????????????;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;??????????????????*??    //
//    @???????????????????*:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:*[email protected]    //
//    @?*????????????????*:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:*????????????????*[email protected]    //
//    ?????????????????*+:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:+*?????????????????    //
//    ?*??????????????*:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:*??????????????*?    //
//    ????????????????+,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,+????????????????    //
//    ????????????????:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:????????????????    //
//    ???????????????+,,,,,,,,,,,,,:*??*:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;*??+:,,,,,,,,,,+???????????????    //
//    ???????*??????*:,,,,,,,,,,,,+%SSSS%+,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*SSSSS%;,,,,,,,,,:*??????*???????    //
//    ?*????*:;+***;,,,,,,,,,,,,,+SSSSSSSS+,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*SSSSSSSS;,,,,,,,,,,;***+;:*????*?    //
//    ??????;,,,,,,,,,,,,,,,,,,,;SSSSSSSSS%:,,,,,,,,,,,,,,,,,,,,,,,,,,,+SSSSSSSSS%:,,,,,,,,,,,,,,,,;??????    //
//    ??*??*,,,,,,,,,,,,,,,,,,,,?SSSSSSSSSS?,,,,,,,,,,,,,,,,,,,,,,,,,,,%SSSSSSSSSS*,,,,,,,,,,,,,,,,,*??*??    //
//    @??*?;,,,,,,,,,,,,,,,,,,,;SSSSSSSSSSS%:,,,,,,,,,,,,,,,,,,,,,,,,,;SSSSSSSSSSS%:,,,,,,,,,,,,,,,,;?*?*@    //
//    @@??*,,,,,,,,,,,,,,,,,,,,*SSSSSSSSSSSS+,,,,,,,,,,,,,,,,,,,,,,,,,*SSSSSSSSSSSS;,,,,,,,,,,,,,,,,,*[email protected]@    //
//    @@@%:,,,,,,,,,,,,,,,,,,,,?SSSSSSSSSSSS*,,,,,,,,,,,,,,,,,,,,,,,,,%SSSSSSSSSSSS*,,,,,,,,,,,,,,,,,:%@@@    //
//    @@@,,,,,,,,,,,,,,,,,,,,,,%SSSSSSSSSSSS?,,,,,,,,,,,,,,,,,,,,,,,,:%SSSSSSSSSSSS?,,,,,,,,,,,,,,,,,,,@@@    //
//    @@@,,,,,,,,,,,,,,,,,,,,,:%SSSSSSSSSSSS%,,,,,,,,,,,,,,,,,,,,,,,,:%SSSSSSSSSSSS?,,,,,,,,,,,,,,,,,,,@@@    //
//    @@.,,,,,,,,,,,,,,,,,,,,,:%SSSSSSSSSSSS%,,,,,,,,,,,,,,,,,,,,,,,,:%SSSSSSSSSSSS?,,,,,,,,,,,,,,,,,,,[email protected]@    //
//    @@,,,,,,,,,,,,,,,,,,,,,,,%SSSSSSSSSSSS?,,,,,,,,,,,,,,,,,,,,,,,,:%SSSSSSSSSSSS?,,,,,,,,,,,,,,,,,,,,@@    //
//    @@,,,,,,,,,,,,,,,,,,,,,,,?SSSSSSSSSSSS*,,,,,,,,,,,,,,,,,,,,,,,,,%SSSSSSSSSSSS*,,,,,,,,,,,,,,,,,,,,@@    //
//    @.,,,,,,,,,,,,,,,,,,,,,,,+SSSSSSSSSSSS+,,,,,,,,,,,,,,,,,,,,,,,,,*SSSSSSSSSSSS;,,,,,,,,,,,,,,,,,,,,,@    //
//    @,,,,,,,,,,,,,,,,,,,,,,,,;SSSSSSSSSSS%:,,,,,,,,,,,,,,,,,,,,,,,,,;SSSSSSSSSSS%:,,,,,,,,,,,,,,,,,,,,,@    //
//    @,,,,,,,,,,,,,,,,,,,,,,,,,?SSSSSSSSSS*,,,,,,,,,,,,,,,,,,,,,,,,,,,?SSSSSSSSSS*,,,,,,,,,,,,,,,,,,,,,,@    //
//    @,,,,,,,,,,,,,,,,,,,,,,,,,;SSSSSSSSS%:,,,,,,,,,,,,,,,,,,,,,,,,,,,;SSSSSSSSS%:,,,,,,,,,,,,,,,,,,,,,,@    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,+SSSSSSSS;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,+SSSSSSS%;,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,+%SSSS%;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,+%SSSS%;,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:+**+:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:+**+:,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:;+*+;:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;?%SSSSS%*:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*%S%%%%%%%S%+,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,::;;;;;:,,,,,,,,,,,,,,,,,,,,,*S%%%%%%%%%%%S+,,,,,,,,,,,,,,,,,::;;;;;:,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,:;+++++++++:,,,,,,,,,,,,,,,,,,+S%%%%%%%%%%%%%%;,,,,,,,,,,,,,,:;+++++++++;,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,:++++++++++++;:,,,,,,,,,,,,,,,:%%%%%%%%%%%%%%%S?,,,,,,,,,,,,,:+++++++++++++:,,,,,,,,,,,,    //
//    ,,,,,,,,,,,;+++++++++++++++:,,,,,,,,,,,,,,*S%%%%%%%%%%%%%%%S+,,,,,,,,,,,;+++++++++++++++:,,,,,,,,,,,    //
//    ,,,,,,,,,,;+++++++++++++++++,,,,,,,,,,,,,:%%%%%%%%%%%%%%%%%S?,,,,,,,,,,:+++++++++++++++++:,,,,,,,,,,    //
//    ,,,,,,,,,:++++++++++++++++++;,,,,,,,,,,,,:%%%%%%%%%%%%%%%%%%%:,,,,,,,,:++++++++++++++++++;,,,,,,,,,,    //
//    ,,,,,,,,,;+++++++++++++++++++:,,,,,,,,,,,;S%%%%%%%%%%%%%%%%%%:,,,,,,,,;+++++++++++++++++++:,,,,,,,,,    //
//    ,,,,,,,,:++++++++++++++++++++;,,,,,,,,,,,;S%%%%%%%%%%%%%%%%%%:,,,,,,,:++++++++++++++++++++;,,,,,,,,,    //
//    ,,,,,,,,;+++++++++++++++++++++,,,,,,,,,,,;%%%%%%%%%%%%%%%%%%%:,,,,,,,:+++++++++++++++++++++:,,,,,,,,    //
//    ,,,,,,,,;+++++++++++++++++++++:,,,,,,,,,,:%%%%%%%%%%%%%%%%%S?,,,,,,,,;+++++++++++++++++++++:,,,,,,,,    //
//    ,,,,,,,,;+++++++++++++++++++++:,,,,,,,,,,,?S%%%%%%%%%%%%%%%S+,,,,,,,,;+++++++++++++++++++++:,,,,,,,,    //
//    ,,,,,,,,;+++++++++++++++++++++:,,,,,,,,,,,;S%%%%%%%%%%%%%%%%:,,,,,,,,;+++++++++++++++++++++:,,,,,,,,    //
//    ,,,,,,,,;+++++++++++++++++++++:,,,,,,,,,,,,?S%%%%%%%%%%%%%S+,,,,,,,,,;+++++++++++++++++++++:,,,,,,,,    //
//    ,,,,,,,,;+++++++++++++++++++++:,,,,,,,,,,,,:?S%%%%%%%%%%%S?,,,,,,,,,,;+++++++++++++++++++++:,,,,,,,,    //
//    @,,,,,,,:+++++++++++++++++++++,,,,,,,,,,,,,,:?S%%%%%%%%SS*,,,,,,,,,,,:+++++++++++++++++++++,,,,,,,,@    //
//    @,,,,,,,,++++++++++++++++++++;,,,,,,,,,,,,,,,:*%SSSSSSS%+,,,,,,,,,,,,,++++++++++++++++++++;,,,,,,,,@    //
//    @,,,,,,,,;+++++++++++++++++++:,,,,,,,,,,,,,,,,,:+*???*;:,,,,,,,,,,,,,,:+++++++++++++++++++:,,,,,,,,@    //
//    @.,,,,,,,,++++++++++++++++++:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;+++++++++++++++++;,,,,,,,,:@    //
//    @@,,,,,,,,:+++++++++++++**+;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:++**++++++++++++;,,,,,,,,,@@    //
//    @@,,,,,,,,,:+++++++++++*%%?;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,+?%%*++++++++++;,,,,,,,,,,@@    //
//    @@.,,,,,,,,,:;++++++++++??%%*:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:*%%??++++++++++;,,,,,,,,,,:@@    //
//    @@@,,,,,,,,,,,:;+++++++;+%??%?+:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:+?%??%*;+++++++;:,,,,,,,,,,,@@@    //
//    @@@,,,,,,,,,,,,,::::::,,:?%???%?+:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:+?%???%?:,::::::,,,,,,,,,,,,,,@@@    //
//    @@@@,,,,,,,,,,,,,,,,,,,,,;%?????%?*;,,,,,,,,,,,,,,,,,,,,,,,,,,,,;*?%?????%;,,,,,,,,,,,,,,,,,,,,,@@@@    //
//    @@@@,,,,,,,,,,,,,,,,,,,,,,*%??????%%?+;:,,,,,,,,,,,,,,,,,,,,:;+?%%??????%*,,,,,,,,,,,,,,,,,,,,,,@@@@    //
//    @@@@@,,,,,,,,,,,,,,,,,,,,,:?%???????%%%?*;::,,,,,,,,,,,,::;*?%%%???????%?:,,,,,,,,,,,,,,,,,,,,,@@@@@    //
//    @@@@@,,,,,,,,,,,,,,,,,,,,,,;%??????????%%%??**++;;;;++**??%%%??????????%;,,,,,,,,,,,,,,,,,,,,,,@@@@@    //
//    @@@@@@,,,,,,,,,,,,,,,,,,,,,,+%??????????????%%%%%%%%%%%%??????????????%+,,,,,,,,,,,,,,,,,,,,,,@@@@@@    //
//    @@@@@@,,,,,,,,,,,,,,,,,,,,,,,*%??????????????????????????????????????%*,,,,,,,,,,,,,,,,,,,,,,,@@@@@@    //
//    @@@@@@@,,,,,,,,,,,,,,,,,,,,,,,*%????????????????????????????????????%*,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@    //
//    @@@@@@@:,,,,,,,,,,,,,,,,,,,,,,:*%??????????????????????????????????%*:,,,,,,,,,,,,,,,,,,,,,,:@@@@@@@    //
//    @@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,:*%????????????????????????????????%*:,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@    //
//    @@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,*%??????????????????????????????%*,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@    //
//    @@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,+?%??????????????????????????%?+,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@    //
//    @@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,;?%????????????????????????%?;,,,,,,,,,,,,,,,,,,,,,,,,:@@@@@@@@@@    //
//    @@@@@@@@@@@:,,,,,,,,,,,,,,,,,,,,,,,,:+?%????????????????????%?+:,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@    //
//    @@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,:*?%%??????????????%%?*:,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,:+??%%%%????%%%%??+:,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:+**??????**+:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,::::::,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:,,,,,,,,,,,,,,,,,,,,,,,,,,,,[email protected]@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract WABOC is ERC1155Creator {
    constructor() ERC1155Creator("We Are All A Bunch Of Clowns", "WABOC") {}
}