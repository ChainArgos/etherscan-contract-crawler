// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Feels Good
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%@@@@%%###******##%@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@%###*******#%%#######*******#%@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@%#######*****#####***#####*****#%@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@%%###****#########********#########@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@%%###********#########*******#########%@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@%###############*++*#%%%%%%#############@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@%#*+##%%%##=++###++=+%%%%%%#++**#########%@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@%+++#%%%%%%***###**++*#%%%#*****#********#@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@#+++#%%#####*####%%%%%%%%%####***********#@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@%%%%%%####################***************##@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@%%###########################*******########%@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@%#############################################@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@%%#############################################@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@%%#####################%%%%@@@@@%%###########%@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@%#######%%%%%###%%%%%@@@@%%%%%%#%%%%%%%%%%%#%@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%@@@@@@%%%%%%%@@@@@@@%%%%%%%%%%@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@%%%@@@@@@@@%%%%%%%%@@@@%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%@@@@@@@@%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%######%@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%#######################**%@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@%%%########################**+*%@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@%##########################******#@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@%######################*#####******#@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@%#####################*****###*****++#@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@%#*+*%%%%%%%%%%#=---+###******##****+++#@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@##*+*#%%%%%%%%%%#----=%%##******##***++++#@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@%###%%%%%%%%%%%%%%%##*#%%#####****##****++++#@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@%###%%%%%%%%%%%%%%%%%%%%%%#######**###***++++*%@@@@@@@@@@@@@@    //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract meme is ERC1155Creator {
    constructor() ERC1155Creator() {}
}