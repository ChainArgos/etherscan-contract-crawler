// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: José Alberto the Documentary Project
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  //
//                                                                                                  //
//    ::::::::::::-+##+%+.:-#*+#@%##%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    :::::::....-=##*+%=.:-*%%##%@##%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    :..........:=*#*++.:=-+#@@%%%@@%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    ............:-*#*-.=+:-*%%@@%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    ............:::**=.*=-:=*%%%@@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    ......     ..:.=++:-=:.-=*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    .           ..:-+=:.::..=*#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//                ..::::.:==+.:-*#%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//                .....::=##*#+-=*##%%@@@@@@@@@@@@@@@@@%%@@@@%@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//                 ..::-+*%%*%%+:=+*%%%%@@@@@@@@@@@@@@@%@%@@%%#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//               ..:::-+#%@@%%*%+-+**%%%@@@@@@@@@@@@@@@%%%%@%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//              :::::-+#%@@@@%=-#-*#%%%%@@@@@@@@@@@@@@%@@%%@%@@@@@%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//             ::::-+#%%%@@@%%=:-==*%@@%%@@@@@@@@@@@@@@@%%@%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//            :::=+#%%%%%%%%%%=:.-*=*%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//           .-=*##%%%%%%%#%#%#:::-+#%@@@@@@%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%#    //
//           :-*#%%%##%%%%%#*###---+#%@@@@@@%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%#    //
//            :+#%#=::+#%@@@#**%#-=+*#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%    //
//             .-++--+%%@@@@@*+#%#==*%%%@@@%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//             .:--::=+#%%@@%%-*%%#++#%@%@%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//              .:=:::-#%%%%%%*-#%%%#%%@%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//               ..::--=#*%%@%%#=#%%%%%@@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//               ....:-::+*#@@@@#+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//              .......::+=*%%%@#%+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//            ....:-:..  .-=*+#%@%#=#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//             ....-=*++++*#***%%%#++#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//             ...::-=+=+####%%%%%%**%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//              ...:--=::--+*#%%%%%##%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//               ...:---::--=*######%%@@@@@@@@@@@%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//               ...::-===--+**###%%%@@@@@@%%#*+-::+##%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//               ....::-+**+=+*#%%%%@@@%%*=-:.....:-===+*#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//                ...::-=*######%%%%%%%%#-::......:-+=====+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%    //
//                ...::-=*#%%%%%@@@%%%%%%=:::.....:-+++++==+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%    //
//                ..::--=*%%%%%%%%%%%####+-::.....:-+***++++*#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%    //
//                ..::--=*%%%%%##########*-::.....:-=*******#%%@%%%@@@@@@@@@@@@@@@@@@@@@@@%%%%%%    //
//               ...::--+*###############*=-:.....::=##*#####%%%#**%@@@@@%%@@@@@@@@@@@@@@%%%%%@@    //
//    ...        ..:::-=+*##***#####%%%%%#=-::::::::=###########***#%@%%%%%%%@@@@@@@@@@%%%%%%@%%    //
//    -::....  ...:::--==+***####%%%%@@@%#+-::::::::=*%##########**#%%%####%%%%%%@@@@%%%%%%%%#%%    //
//    ---:::.....:::--==+**###%%%%@@@@@@%#+=-:::::::-+#%#######%%####%%%%%%%%%%%%@@@%%%%%%@%##%%    //
//    ==--:::::::::--=++*##%%%%@@@@@@@@%%#*=-:::::::-=+#%#####%%%%%%%%%@@@@@@@@@@@@%#%%%%@%#%%##    //
//    ----:::------=+**#%%%%@@@@@@@@@@@%%#*=--::------=*#%###%%%%%%%%@@@@@@@@@@@@@%#%%%%@%#%%#*#    //
//    ::::::---===+*#%%%%@@@@@@@@@@@@@%%%#*+=----------=*%%%%%%%%%%%%@@@@@@@@@@@@###%#%@@%#%%***    //
//    ::::-===++*#%%%%@@@@@@@@@@@@@@@@%%##*+=----==+==-=+#%%%%%%%%%%%@@@@@@@@@@%#*###%@@%%%%#+*#    //
//    :-==++**#%%%@@@@@@@@@@@@@@@@@@@@%%###*+=====+**+===+*#%%%%%%%%%%%@@@@@@%#*####%%%%%%%%*+#@    //
//    ++**##%%@@@@@@@@@@@@@@@@@@@@@@@@%%%###*+==++****++==++*#%%%%%%%%%%%@%%#*****#%@%%##%%%*+%@    //
//    ##%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%**+++**####*+++++++*#%%%%%%%#*+++****#%%%%%%##%%#*%@    //
//                                                                                                  //
//                                                                                                  //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////


contract JADP is ERC721Creator {
    constructor() ERC721Creator(unicode"José Alberto the Documentary Project", "JADP") {}
}