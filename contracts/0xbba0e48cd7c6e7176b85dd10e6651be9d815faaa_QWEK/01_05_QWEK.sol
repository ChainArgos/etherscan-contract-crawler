// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: domqwek
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
//                                                             .                                                                  //
//                                                             *          .                                                       //
//                                       ...         .       :=.        :+                                                        //
//                                     ..:.          .        :..        ..                                                       //
//                                    .:..           .         -.         ...                                                     //
//                                  .::..           .          ::         .:-:      .  .=+=                                       //
//                                 .--:.           .            :--..       :+*:.......==%#-                                      //
//                                :-=-.           .               .=*%*-.    .-#=...... =%%%.                                     //
//                              .:==-:..         .                   .-=*%#=. ..:+#..... [email protected]%=-                                    //
//                             .::::.............              ...:::::::-=#@+....+*.... +%@-=.                                   //
//                             ==.    ......:::..                  ...:---::-#@=. :%-:...+##-+:                                   //
//                             .+#=.   ..:::::::.                  ......::-::=%*. +#:::.=##-+:                                   //
//                         .-... =%#+-:...:.....              .:--:. .......-:.:%* [email protected]::.+*#=+-                                   //
//                         =**: .:=#%*=::......        .  :-+**++++**+=:.....::[email protected]:%=:: *@#+=-                                   //
//                       ....::  :=*%#=:..             .-+====-------==**:....-..+%:@-:.=#%=#=:                                   //
//                     .:...:.. .==+++-..             :=---=*#%%%#*-:::::+:.. .. :@#%-.-%@+#+=-:                                  //
//                    .  .:-.    :-=--.              :=::=%%+=--::=*%-.:::=..  .  [email protected]=:-%@*#*[email protected]%*=.                               //
//                       .+:.  :=+=-::::......       +:[email protected]*=:.-:-:=-*@=...:-...: =#=:=%@*#*++##%@@@@%+.                           //
//                :+-    .*:  -*#*+===--====-       :-::%*#***=+-+=-=#%....-:.:=#+--#%%*%#+-=+*%@@@@@@#.                          //
//                 :*+==-:-  -#%%%##********-      .:-::@*###***##+*##@....::-#@-=*@@##%#+##*+=====+*#%%-                         //
//                  .==*%#: :#%@@@@@%%%%%%%#.      ..*::+%+#%%####%%#@+...::-%@@@@@%#%%**#%%@@@%%#- :#%%#*-                       //
//                    ...  .+%@@@@@@@@@@@@%+      ...=#::[email protected]%##%#####@+...::-#@@@@%####+:+%@%%#####%+-:*@@@@%=                     //
//                    ....:=*%@@@@@@@@@@@%%.      ..::-+-:-*#%%@%%#+:..:=-+%@@@@%###*=     :::-++*#%#@%%%%%@%*                    //
//                    =+--*#%@@@@@@@@@@@%%+      .::-=====++=-----:::-++*%@@@@#####=.           :=#%%*@%%%%#%@-                   //
//                    -==-=%%@@@@@@@@@@%%#.      :::-=*+**++++=:::::=**@@@@@%**##*:                :+#*@@%%#%#+                   //
//                   -**#%=-%@@@@@@@@@@%%+      .::--=+===---+=#=:-+#@@@@@@#*##*+.                   :+*@@@@%%#*.                 //
//                    .=##*:*@@@@@@@@@@%%:     .::--===-----:::*#-*#@@@@@@#*#*+=                      [email protected]@@@@@%#:                //
//                      -+#*#@@@@@@@@@@%#      .::-==-=+*#%@@+.-%=%@@@@@@#*#*+=                         .=#%@@@@@%+               //
//                      :+#%@@@@@@@@@@@@-     .::-===+***###%@*-%%@@@@@@%***+=:                           :=*##%@@@#:             //
//                     .=#%@@@@@@@@@@@@#      ::-===+*++===++#@+#@@@@@@@#++*+=.                            %**%@@@@@@%.           //
//                      -#@@@@@@@@@@@@@-     .:-===++==----==#@#@@@@@@@@#++++=.                            -%%%+#@@@@@*           //
//                       .-=+*####**++=      :-=+++===-::::-=#@@@@@@@@@@%=+++=.                            .*@%@+%%@@@@+          //
//                                          .-=+**+==--:::::-#@@%@@@@@@@@-==::                             :=#%@[email protected]@@@@%-         //
//                                          .=++**+==---:::::*%@%@@@@@@@@*:==:.                            -=%+%: *@@@@@#:        //
//                                         .-=++++++==--:::::=%@*@@@@@%@@%=-==:                            +*@##- :#@@@@@*        //
//                                         :-=++++====--:::::-#@+#%@@@@@@@#:---.                           -%@#@#: *%@@@@*        //
//                                          -========+---::::-#@==%@@@@%%@@#::-:.                          [email protected]@#@@+  #@%@@#        //
//                                           -=======-----:::-#@=-*#@@%@@@@%#-.::.                          *@#@@*  -#@@@@        //
//                                            :=====-------::-#@+--##@@%@@%@@%+....                         .%%@@+  *%#@@%:       //
//                                             :====----------#%=--=#%@@@@@@@@@%-..                          -%@@=  =#@%%@*       //
//                                              -===----------##=--#%##@@@@@@@%#@%#***+=-.                   ==%@=  .%@@%%*-      //
//                                               :====--------#++*+****#%@%%#%[email protected]@@@@@%%%%%%*+=:              .#*%#   [email protected]@@@#+      //
//                                                :===-------=**##+=--=+**%@[email protected]%%::::-=+*#%@%%%%*-            %@*%.  .*@@@@%:     //
//                                                 :-====--===*#@#+-::--=++#@@@@*...   .....-+%@@%%*-         %@@#=  .#%@@@%:     //
//                                               ...:-===-===+*#@@#+:::::-=++#%@@=       ......:+#%%##+.      *@@@#- [email protected]%@@@*:     //
//                                           .......:::-=====+*%@@@#=::::::---*#%@+       ........:*@%#%+     +%@@@%:#@@%%%=      //
//                                     ......::......::::-===+#@%*#%#=::...:::-+*#%+      ..........:=%@#+-   :%@@@@%[email protected]@@@*+      //
//                                   .......::::::...:::--:==**@+**+*@+.:.....::+-*%=      ...........-#@%*=:  .#@@@@#@@@@@-      //
//                                  .:......::::::....:::*+--+*@+*+==*%*........:+=#%.     .. ..........=%%#--   *%@@@@@@@@+      //
//                                 .:.......::::-:..:-==+=*+-=*@**====+%*.........**@-.              ....:#%%=-. :@%@@@@@@#=      //
//                                .::.:.::::::::--+=-:::::-**+*@*+=====+%+........-##-..       .   .....  .+%@[email protected]@@@@@@+       //
//          domqwek b.1980       ..:::::::::::---*#=-::...:=*+*#+=====--=#=...... .**..         [email protected]@=:::#@@@%%%-       //
//                               ..-::::::::::---=#+:::::..:++*#+-====:--==:.....  +:.            .........  :%@=-.:#@@@@%:       //
//                                                                                                                                //
//                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract QWEK is ERC721Creator {
    constructor() ERC721Creator("domqwek", "QWEK") {}
}