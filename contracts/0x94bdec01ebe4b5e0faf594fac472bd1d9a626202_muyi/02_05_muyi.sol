// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Muyi
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                              //
//                                                                                                                                                              //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKKKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKKKKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKKKKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKKKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKK0000KXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKK000OkO0KXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK0O000Oxxx0KXXXXKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKOkkOOkxxxk0KXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKOkkOOkxxxxOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX0kkOOkxxxOKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX0kkOOkxdk0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKkxxxxddk0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKOollllld0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKOddddddxOKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKOkxxkkOOO0KXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKOkxxxkOOOkOKKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK00000000000000000000000000000000    //
//    KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK000000000000000000OOkxxkkOOOxddk000OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO000000000000000000000000000000    //
//    ddddddddddddddoooooooooooooooooooooooooooooooooollllllllllllllldkkxxkkkkkdllllllllllllllccccccccccccccccccccccccccccccloxkO000000000000000000000000000    //
//    cccccccccccccccccccccccccccccccccccccccccccclllllllllllllllcccccodkOOxdoollllccccccccccldxdlcccccccccccccccccccccccccccccloxkO000000000000000000000000    //
//    ccccccccccccccccccccccccccccllccclodxxkkOOO000000000000000OOOOkkxx0K0kdoooooolllcccloxkO0K0kocccccccccccccccccccccccccccccccloxkO000000000000000000000    //
//    cccccccccccccccccccccccccok0000OO0KKK0000OOOOOOOOO00OkkkOOOOOOOOO000K0OxooooooooooxO0KKK0kdocccccccccccccccccccccccccccccccccccloxkO000000000000000000    //
//    cccccccccccccccccccccccclOKxodkKWWNX0OOkkxxxxkkOOOKNX000000kxxxxxkk0KKKOdllooooodk0000kxdlccccccccccccccccccccccccccccccccccccccccloxkO000000000000000    //
//    cccccccccccccccccccccccclOKdccclxXWMMWWWNNNXXXXKKKXNNNXXXXKKXXXXNNWWWXOOkdollcllodxxxolccccccccccccccccccccccccccccccccccccccccccccccloxkO000000000000    //
//    cccccccccccccccccccccccccd00dlcccdXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWOlllllcccccccclloollcccccccccccccccccccccccccccccccccccccccccccccccloxkO000000000    //
//    ccccccccccccccccccccccccccdOKOdlclOWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXdccccccccccccccoddolccccccccccccccccccccccccccccccccccccccccccccccccccloxkO000000    //
//    cccccccccccccccccccccccccccldO0OxdONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXOxdlcccccccccccoodolcccccccccccccccccccccccccccccccccccccccccccccccccccccloxkO000    //
//    cccccccccccccccccccccccccccldkKNNNNNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNX0OxdlccccccodoolccccccccccccccccccccccccccccccccccccccccccccccccccccccccloxkO    //
//    cccccccccccccccccccccccccoOKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWKklccclodoocccccccccccccccccccccccccccccccccccccccccccccccccccccccccccclo    //
//    ccccccccccccccccccccccclkXWMMMMMMMMMMWWWWWMMMMMMMMMMMMMMMMMMMMWWWWWMMMMMMMMMMMWOlccloddocccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccdXMMMMMMMMMWWNXXXXNWWWMMMMMMMMMMMMMWWWNNXXXNNWMMMMMMMMMWKocclooolcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    ccccccccccccccccccccccco0WMMMMMMMMNXXXXXXXNWWWWWWWWWWWWWWWWWNNXXXXXNWMMMMMMMMWKdccclodolcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccclkKWMMMMMMWNNXXXXXNNNWWWWWWWWWWWWNNNXXXXXNNWMMMMMMWNKklcccccloolcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccclx0XWWMMMMWWNNNNNNXNNNNNNNNNNNNNNNNNWWWWMMWWWNX0xdlccccc:cooooooollccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccoxO0XNNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNNNK0kxocccccccccccllllllcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccclodxkO0KKXXNNNNNNNNNNNNNNNXXXKK0Okxdolcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccclloodxxxkkkkkkkkkkxxxddollcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//    cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc    //
//                                                                                                                                                              //
//                                                                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract muyi is ERC721Creator {
    constructor() ERC721Creator("Muyi", "muyi") {}
}