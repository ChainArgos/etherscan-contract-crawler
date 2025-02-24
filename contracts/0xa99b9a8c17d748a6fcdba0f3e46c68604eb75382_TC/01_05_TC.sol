// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Timeless Canvases
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                             @@ @                              %@    @(                                     //
//                          &  @@  &.                            @    @    %@                                 //
//                         @ @%@    @                %           @   @ @, @                                   //
//                       %       &                   .   @@     && ,, @  @   &,                               //
//                      @,     @        @          @.          @@ @   @ @*@&@                                 //
//                     @@                 @       ,. #% &( *   .@/*@      @                                   //
//                    #@      @      ,@           @  @@ @ (     ,                                             //
//                    @*      ,     @, (  @    @    *  %##   @                         . .                    //
//                   &@        #              @    @                                   *@@@&                  //
//                   @@          #           @          @%                         &   #@@@@                  //
//                   @@             @     #&         @@@@@@@&                     .,     @(                   //
//                   @@                             #@@@@@@@@                      #     @#                   //
//                   @@.                            @@@@@@@@@                           /@                    //
//                   ,@@                          @@@@@@@@/                             @                     //
//                    @@@                        #@@@,@@@@@                            @@                     //
//                    ,@@(                       ,@@@@@@@@@@@@@@                      @@                      //
//                     @@@.                      @@@@@@@@@@@@@@@@                    &@                       //
//                      #@@&                     @@@@@@@@@@@@@@@@           @       @@                        //
//                        @@@          #        @@@@@@@@@@@@@,@@@.         %       @@                         //
//                         @@@@     @@@        @@@@ @@@@@@@@@  @@@@              @@.                          //
//                           @@@@  @@@@@&  @@@@@@  @@@@@@@@@@*    @@@@@%@@*#,. @@@                            //
//                             @@@@@   .@@@@@@@@#,&@@@@@@@@@@@.  &@@@@@@/(& *@@&                              //
//                                @@@@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@% @@@@                                 //
//                                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                    //
//                                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                        //
//                                             @@@@@@@@@@@@@@@@@                                              //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract TC is ERC721Creator {
    constructor() ERC721Creator("Timeless Canvases", "TC") {}
}