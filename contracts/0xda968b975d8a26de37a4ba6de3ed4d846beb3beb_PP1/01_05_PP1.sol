// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Pastel Playground
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//    //                                                                                                                                                                                               //
//    //          ##### ##                                      ###                ##### ##  ###                                                                                          ##           //
//    //       ######  /###                                      ###            ######  /###  ###                                                                                          ##          //
//    //      /#   /  /  ###                         #            ##           /#   /  /  ###  ##                                                                                          ##          //
//    //     /    /  /    ###                       ##            ##          /    /  /    ### ##                                                                                          ##          //
//    //         /  /      ##                       ##            ##              /  /      ## ##                                                                                          ##          //
//    //        ## ##      ##  /###      /###     ######## /##    ##             ## ##      ## ##      /###   ##   ####        /###    ###  /###     /###   ##   ####    ###  /###     ### ##          //
//    //        ## ##      ## / ###  /  / #### / ######## / ###   ##             ## ##      ## ##     / ###  / ##    ###  /   /  ###  / ###/ #### / / ###  / ##    ###  / ###/ #### / #########        //
//    //      /### ##      / /   ###/  ##  ###/     ##   /   ###  ##           /### ##      /  ##    /   ###/  ##     ###/   /    ###/   ##   ###/ /   ###/  ##     ###/   ##   ###/ ##   ####         //
//    //     / ### ##     / ##    ##  ####          ##  ##    ### ##          / ### ##     /   ##   ##    ##   ##      ##   ##     ##    ##       ##    ##   ##      ##    ##    ##  ##    ##          //
//    //        ## ######/  ##    ##    ###         ##  ########  ##             ## ######/    ##   ##    ##   ##      ##   ##     ##    ##       ##    ##   ##      ##    ##    ##  ##    ##          //
//    //        ## ######   ##    ##      ###       ##  #######   ##             ## ######     ##   ##    ##   ##      ##   ##     ##    ##       ##    ##   ##      ##    ##    ##  ##    ##          //
//    //        ## ##       ##    ##        ###     ##  ##        ##             ## ##         ##   ##    ##   ##      ##   ##     ##    ##       ##    ##   ##      ##    ##    ##  ##    ##          //
//    //        ## ##       ##    /#   /###  ##     ##  ####    / ##             ## ##         ##   ##    /#   ##      ##   ##     ##    ##       ##    ##   ##      /#    ##    ##  ##    /#          //
//    //        ## ##        ####/ ## / #### /      ##   ######/  ### /          ## ##         ### / ####/ ##   #########    ########    ###       ######     ######/ ##   ###   ###  ####/            //
//    //   ##   ## ##         ###   ##   ###/        ##   #####    ##/      ##   ## ##          ##/   ###   ##    #### ###     ### ###    ###       ####       #####   ##   ###   ###  ###             //
//    //  ###   #  /                                                       ###   #  /                                   ###         ###                                                                //
//    //   ###    /                                                         ###    /                             #####   ###  ####   ###                                                               //
//    //    #####/                                                           #####/                            /#######  /# /######  /#                                                                //
//    //      ###                                                              ###                            /      ###/  /     ###/                                                                  //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                1111111                                                                                                                                                              //
//         ######    ######      1::::::1                                                                                                                                                              //
//         #::::#    #::::#     1:::::::1                                                                                                                                                              //
//         #::::#    #::::#     111:::::1                                                                                                                                                              //
//    ######::::######::::######   1::::1                                                                                                                                                              //
//    #::::::::::::::::::::::::#   1::::1                                                                                                                                                              //
//    ######::::######::::######   1::::1                                                                                                                                                              //
//         #::::#    #::::#        1::::l                                                                                                                                                              //
//         #::::#    #::::#        1::::l                                                                                                                                                              //
//    ######::::######::::######   1::::l                                                                                                                                                              //
//    #::::::::::::::::::::::::#   1::::l                                                                                                                                                              //
//    ######::::######::::######   1::::l                                                                                                                                                              //
//         #::::#    #::::#     111::::::111                                                                                                                                                           //
//         #::::#    #::::#     1::::::::::1                                                                                                                                                           //
//         ######    ######     1::::::::::1                                                                                                                                                           //
//                              111111111111                                                                                                                                                           //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
//                                                                                                                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract PP1 is ERC1155Creator {
    constructor() ERC1155Creator("Pastel Playground", "PP1") {}
}