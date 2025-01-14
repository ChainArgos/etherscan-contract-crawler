// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: forces of emotion
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                //
//                                                                                                                                //
//    ....................'',,''..'...............                                .                              .............    //
//       .................''''''''.......';;''..         ....    ...  .....                                        ....'......    //
//       ...................''''.......',::.             ...'... ...   ....        ..                               ...'......    //
//       .......'.........................               ...''.. ..... .....                             .....................    //
//    ..................'...''.. .....                  ....................                           .....'.................    //
//    .........',,,'''..............                    ...............  ...                .....    .....',,''...............    //
//    .........,'...','...........                 ..  ...'.......   .    .                  .....  .....'',,,,,''''..........    //
//    ........''.   .';,,,'''...          ..   ...... ....'..........'.......      .......................',;;;;;,,''.....  ..    //
//    ......'';'.     .......         ......... ..';;,,,''.........',,'...'''..........................'....',,;;;;,,'...    .    //
//    ..   ..'',,...     ..   .......... ..........',,''..........''',''..',;,''......'....';;;'.......,;,'...........   .....    //
//    ..    ''...''.....  .........  .. ................ ......',,'''......,;,;;;;;,;;,,,;::;;;;,.......,,....................    //
//    .... .',........'........ ........................';;;,'..',,,'.....',;:::::,,;;;;;;;;;:::;'.......,;;,,'...',,'.......     //
//    .....';,'.......................   ...............',:::c;'.........',;;::c:,''''',,,,;;;,'...........'''''.',;,.........    //
//         ....''..........................    ......'.'..,;,;:,........''';;;:;,''''....'''..................''',,,..........    //
//             .'.....      .............''...   ....'......''........',;,,,,,''.''..................    .......',;'..........    //
//              ....      ..............',,........','.......       .','''...............  .........     ......';:c;'.........    //
//                                    ...      ... ......  ...       ........    .  ......................... ..',;;'...''...'    //
//                                                    ...   ..       ..  ....           .  ............ ...................',,    //
//                                       ..     .  ....                .          .       ..... ....    ....  ................    //
//                     ........'..     ....    .... ..... .                        ....       ....      .       ..............    //
//       ....         .....''...''..........   .,..  . ...                         .....      ..                           ...    //
//                   ...',,'...............'...'..  ..                              ......                               .  ..    //
//                  .....'........    .........   .''...                            ......                       .....       .    //
//        ....... ..................         ..   .',..                            ....           ..''..  .............           //
//     .... ..............................   ... ..','.        ....       ..       ....         ..,;,,,'...'.............. .'.    //
//           ..'.......................          .''..        .......       ... ........       ..,:;;,,,...'.............. ..'    //
//           ...........'..  .........           .......  ..    ....      .............       .';;,,;,',....''............  ..    //
//            .....   ....   ..  ....          .     .... .     .....  ..............        .','',;'.......''...............'    //
//                      ...       ....         .  . ..... .      ............... ..'.      ..;;,',;,...  ...''................    //
//                   .... .                   .. .......       .  .......... ..........  ..',;,,;:;'..   ..''.................    //
//                     ........    ......    ..   .........  ............................',,'.....      ..''..................    //
//       .                 ...................   .....''....   ..................... .';:,..          . ..''....''............    //
//     ....                  ................     ...''','....................................       .....'''........''.......    //
//    ...'.. .....            ...'''........     ..''''..,......................'.......  ..       ......'.';'........'.......    //
//     .........  ..      ..       ..''....     ....',..';,.....................'...........      ......''....................    //
//     ..........         ......    ....       .....''.';:;'..........'''................,'.  ........''.........'''..........    //
//      .............   .  .....    ..          .....',;:c:;'........,:c::,.............'''........''''........',;;,.......       //
//     ...............     ..      ....... ...........'................'........................',,,,'........''''''......        //
//     ..............     .....     .....''.........  ..                                ..','...',;,'....'',,;;;,''.......        //
//    .  ....   .....     .'''............''...........     ...                        ...............'',,;;;;;;,,,,'.....        //
//       ...'.....         ...............................   .                           ............',;;;;,,,;,',,;'.....        //
//      ....','....       .........  ........''.........        ......    ....  ...        .........',;;:;;,,;;,,,;,.......       //
//     ..............     ........   ..  ...','......           .....     ....  ....          ......',,,,'',;;,'.',,.......       //
//      ..'.   .......    .......   ...     ..''... ...                 ..''..  .....         ..........''.',;,,',,,'........     //
//    ........        .. ..  .........  ......',...........          ....,,,'.......... .....  .........,,...',,,,,'.........     //
//    ...........   .....      ....    .........   ........    ..  ..,,,''','................    ...  .......',,,,,,'........     //
//    ...............                   .'.       ..........    .....','...'''...        ....     .     .....',;;;;,'......       //
//    .....   ..  ..                     ..     .............  ..............'...          ..   .....   ....';;,'''......         //
//    ...   ..... ....                         ........''.......'...........,'..                    .    ..',;,'..'....           //
//    ..   ........                            ...........'.................,..  ....        ........ ......,,'......             //
//    .    ......                            ............','..'.......................           ................... ..           //
//    .    ...                              .............';'..'. .....  ....................     ..'.....  ........               //
//         ..                          ..................',...          ......................  . .......   ..                    //
//             ..                   ......................'..               ...........           ......    .                     //
//                                 ................','''....                ......                ......   ..                     //
//                                    ...........',,,,,'....                .'......      .     .............                     //
//                                    ... .......',,,,....                 ..'.. ......      ..........                           //
//                                   ..    .......''''....              ...'''.   .............                                   //
//                                          ..  ........... ....        ..,,,'....... ...                                         //
//                                               .................       .........                                                //
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract FM is ERC721Creator {
    constructor() ERC721Creator("forces of emotion", "FM") {}
}