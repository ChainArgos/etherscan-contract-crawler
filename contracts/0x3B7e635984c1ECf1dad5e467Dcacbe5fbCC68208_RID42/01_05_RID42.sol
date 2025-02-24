// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Real Imaginary Dream
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                //
//                                                                                                                                //
//    ########################################################################################################################    //
//    ########################################################################################################################    //
//    ########################################################################################################################    //
//    #####################################################################################((,**(((###########################    //
//    ####################################################################################((((/*/(((((((######################    //
//    ##################################################################################((((((/**,**,//(((####################    //
//    ################################################################################((((((((//*,**//(((((###################    //
//    ##############################################################################((((((/*/*,//&*/,//(((((##################    //
//    ###########################################################################(((((((//,#*/(&@@((/,,,*((((((###############    //
//    ######################################################################((((((((((((//,*,@@@@@@@@@,,/((((((((#############    //
//    ################################################################(((((((((((((((((//*,#@@@@@@@@@&/,//(((((((((((((((#####    //
//    ##############################################################((((/(***,*/////((,**,,,/&@@@@@@%(,,,**/*//((((((((/**(###    //
//    ############################################################(((((((*//((*/,,,,/@#%&@@@@@@@@@@@@@@@&@((%%/*///**/*,///((#    //
//    #########################################################((((((((((/**(@@@@#&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/,/#@%#****((#    //
//    #####################################################((((((((((((//**,*#&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@((/((((    //
//    ###################################(((((((((((((((((((((((((((/,#/*,*(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/,*/(((((    //
//    ################################(((**/(((((((((((((((((((((((//*,#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&///(((    //
//    ###############################((((/**//((((((/,*/(((((((((//*,/*(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&##(,(/    //
//    ##############################((((((*,,/**,,**,,(#,*,*//////**,/%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@*,/(    //
//    ###########################(((((((((//*,/@&&(/(#@@(((*,/,***,,/#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&*/((    //
//    ########################((((((((((//**,,(,@@@@@@@@@@@@@@**,,,(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%(*(    //
//    #####################(((((((///////*,*&@@@@@@@@@@@@@@@@@@@&(/(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&,/((    //
//    #############(((((((((((((((/**,,*,,**@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,((((    //
//    ######((((((*((((((((((((////,,(@@@@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(/(((((    //
//    ##&#&@&#&&&@@@@@@&(%&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/*,*/((((((    //
//    #####(((((((*(((((((((((/*/**,*(@@@@(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//(((((    //
//    ###########(((((((((((((((((/**,,/,,**@@@@@@@@@@@@@@@@@@@@@@/&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%/((((    //
//    ####################((((((((/*////**,(@@@@@@@@@@@@@@@@@@@@@#(&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&,/((    //
//    ########################((((((((((//**,,(*@@@@@@@@@@@@@@*/,,,%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//*(    //
//    ###########################(((((((((//*,*@@&(*#&@@//*/*/,***,,/%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%,*/(    //
//    ##############################((((((/,,/**,***,,/#,,**//////***(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#&**/(    //
//    ###############################((((/**//(((((///,/(((((((((//**(/#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#%#,//    //
//    ################################(((*/*(((((((((((((((((((((((//*,(#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#*///((    //
//    ###################################(((((((((((((((((((((((((((/((#/,*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(,*/(((((    //
//    ####################################################(((((((((((((//**,*#(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@#(/((((    //
//    #########################################################((((((((((/**(@@@@#&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/,(@@&@*,**((#    //
//    ############################################################(((((((,((/(/*/,,,*@&&@@@@@@@@@@@@@@@@@@((@&/*//*,,**,/*/((#    //
//    ##############################################################((((/(**,**////*#(,**,,,/&@@@@@@(/,,,,***/*/(((((((/,/((##    //
//    ################################################################((((((((((((((((///*,(@@@@@@@@@&(,//(((((((((((((((#####    //
//    #####################################################################(((((((((((((//*/(@@@@@@@@%/,/(((((((((############    //
//    ###########################################################################(((((((/*,(((%@@@@&(,***((((((###############    //
//    ##############################################################################((((((/,**,*,&,(,//(((((##################    //
//    ################################################################################((((((((/*****//(((((###################    //
//    ##################################################################################((((((/*/****//(((####################    //
//    ####################################################################################((((*(*(((((/(######################    //
//    #####################################################################################((/,/(((###########################    //
//    ########################################################################################################################    //
//    ########################################################################################################################    //
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract RID42 is ERC1155Creator {
    constructor() ERC1155Creator("Real Imaginary Dream", "RID42") {}
}