// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Whispers of the Unseen
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//    |    ||_ o _|) _._ _   _  |~  _|_|_  _  | |._  _ _ _._                                  //
//     \/\/ | ||_\| }_| _\  (_)~|~   | | |}_  |_|| |_\}_}_| |                                 //
//                                                                                            //
//                                                                                            //
//    |_ |_|                                                                                  //
//    |_) _|                                                                                  //
//                                                                                            //
//                                                                                            //
//    |~||~|_ _|_/| ._                                                                        //
//    |~|_)| | | ~|~|                                                                         //
//                                                                                            //
//                                                                                            //
//                  ╓  ╓─        ╓╗  ╥╕   ╓╓╓    ╔╗╓          ╓  ╓    ╔╥   ┌╗╓╓╗╕             //
//                  ─╔╦╦╕ ╒═─     ╦  ══  ─ ─╦╕  ─══─   ═════   ════  ─ ─╦╕    ─══             //
//                   ══─      ══  ─══    ═════  ─ ──   ═══    ═  ══  ═════  ═──══             //
//                     ╨┘ └╨  ═    └┘═    └═   └╨  ╨─   ╨╨╨─   ╨╨╨─  ╨  ╨┘  ╨╨╨               //
//                   └└    ╙  └   └  └    └└└   ╙         └   ╙╙╙    └└└                      //
//                          ╙╙    ╙╙╙    ╙  ╙    ╙╙                          ╙╙╙              //
//                    ╙                                                     ╙                 //
//                                                                                            //
//                   ╓╓     ╓                                 ╓                               //
//                  ╓  ╓   ╓╓╓╓    ╓╓╓   ╓╓╓╓  ┌╓╓╓╓   ╓       ╓╓╓   ╓                        //
//                  ╓       ╥╥     ╓╓╓          ╓  ╥╕     ╓   ╓╥╥╥╕   ╓╓    ╓╔╥╓              //
//                     ─  ╒╦      ╦══     ╔╦══  ─══    ─  ─   ═╦╦─    ╔╦       ══             //
//                   ════   ════   ════   ══           ═══     ════  ═  ══   ════             //
//                   └═╨─  ╨╨╨     └┘     └══          ═┴═     ╙╨╨─                           //
//                  ╙      └      └  └    ╙╙     └└╙   ╙      ╙      ╙╙╙                      //
//                         ╙                           ╙         ╙             ╙              //
//                  ╙        ╙                  ╙                             ╙╙              //
//                                       ┌                             ┌                      //
//                                   ╓                    ╓                                   //
//                  ╓╓╓╓          ╓         ╓   ╓╓╓╓           ╓╓     ╓╓    ╓  ╓              //
//                   ╔╦╓─  ╓         ╓  ╒╦╓╓╦╕     ╓─     ╓                    ╓─             //
//                  ═════  ═─     ════╕     ══  ─══─   ═══─      ══ ╒═══    ════╕             //
//                  ─  ══   ══    ═══─    ════  ═════  ═══     ════     ─      ══             //
//                  ═  ═─   ═══─  ════─         ═─══─   ─═╩═  ═════  ═─═    ═                 //
//                  └      └╙╙    └└└     └┘    └└└╙          └      └  ╙   └╙╙               //
//                                       ╙         ╙   ╙╙╙                     ╙              //
//                    ╙    ╙╙╙╙   ╙                    ╙                      ╙               //
//                            ┌                                                               //
//                            ╓                                                               //
//                            ╓      ╓          ╓╓╓╖    ╓╓╓   ╓  ╓    ╓╓    ╓                 //
//                     ╥┐ ┌╥  ╖   ╥  ╥╖     ╥┐         ╖  ╥╖     ╥┐     ╥┐  ╥                 //
//                  ─═══╕  ────  ╒╤═╤─   ─╔══╕  ═──╤╕  ═───   ─╥═─  ╒═══─   ═───              //
//                  ═───   ─ ─╤═  ─ ──   ─ ─══  ─ ─╤═  ╤───   ═══╤═  ────   ╤───              //
//                 ╘╩═┴    ┴         ╩═  ╩     └╩══╩╛ └╩╩╝     └┴    ═  ╩╛ └╩═┴               //
//                  ╙╙╙╙   ╙  ╙   ╙       └╙     ╙╙    └      ╙  ╙          ╙                 //
//                         ╙╙╙                          ╙╙              ╙                     //
//                    ╙      ╙    ╙                    ╙  ╙                                   //
//                                  ╓       ┌                 ┌  ╓                            //
//                                                            ╓  ╓                            //
//                  ╓  ╓   ╓╓╓    ╓      ╓╓╓       ╓   ╓╓╓     ╓╓╓          ╓╓╓               //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        ┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴    //
//                                                                                            //
//    ---                                                                                     //
//    asciiart.club                                                                           //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract WISP is ERC721Creator {
    constructor() ERC721Creator("Whispers of the Unseen", "WISP") {}
}