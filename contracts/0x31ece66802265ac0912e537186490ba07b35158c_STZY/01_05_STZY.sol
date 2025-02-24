// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Steezy Design x SSD - 'Bounty Hunter'
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                           //
//                                                                                                                           //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKkk0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKdcldOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWOc;:lkKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWO:;:clxXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNd;::::o0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMOc:::cclOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMXkk0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0c;::cc:coOWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMWKo:oONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWO:,;::::;;lKMMMMMMMMMMMMMMMMMMMNXKOOkkkKNMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMWKocco0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNd;;;;:cc::ckWMMMMMMMMMMMMMWN0OxolcccokKWMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMWOlcccxNMMMMMMMMMMMMMWXO0WMMMMMMMMMMW0l:;;;;::cc:xWMMMMMMMMMMMN0xlccccccoONWMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMXdcc::kNMMMMMMMMMMWXkll0WMMMMMMMMMMXd:::col:::::xWMMMMMMMMMN0o:;:lllllkXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMWk::;:l0WMMMMMMMMNOl:ckWMMMMMMMMMMXdcc::dOkc:::cOWMMMMMMMWKdc:;;:clllOWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMWk:;,;:dXMMMMMMMXxcc:lKMMMMMMMMMMXo::;:lk0Oo:::oXMMMMMMMW0o::cc::ccckNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMXd:;;;:lKMMMMMMNx:cccdXMMMMMMMMW0l;;;;lk00Od:::oKMMMMMMWKo:cldxoccldXMMMMMMMMMMMMMWXXWMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMNkc:::::l0MMMMMWO::oocdNMMMMMMMXkc::;:okO00Oo;;:cdXWMMMWKo:cok0kl:clOWMMMMMMMMMMMMMMKdd0WMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMM0c;::oo:lKMMMMMWx:okdcl0WMMMWXkl::::cdkO00OOo::c:cldkOOxl::lkO0OocclOWMMMMMMMMMMMMMMW0lcxXMMMMMMMMMMMMMMM    //
//    MMMMMMMMMWk:;;lkxclKMMMMMXd:dOko:lxOOxoc:;;;cdkO0KXX0Od::::::;;;::::lxOOOOxlclOWMMMMMMMMMMMMMMMNx::dXMMMMMMMMMMMMMM    //
//    MMMMMMMMMWk:::dOOocoKNWNKd:;o00koc:;;,,,:codkO0KXNWNK0koc:;,;;;;;:cok0KKOOkoccdXMMMMMMMMMMMMMMMWk:ccxNMMMMMMMMMMMMM    //
//    MMMMMMMMMMKl:lxO0Oo:clolc;;;o000OkdoooodxkOO0KXNWWWWNKOOkxxoooooddxO0XNX0OOkoccxNMMMMMMMMMMMMMMWkcccl0MMMMMMMMMMMMM    //
//    MMMMMMMMMMWOlcok00Oxlc::cclok0XXK00OOOOOO0KXNNWWWWWWNNK000000OOOOO0KXNWNK00OkoccxXWMMMMMMMMMMMMXdclc:xWMMMMMMMMMMMM    //
//    MMMMMMMMMMMNkc:oO00OOkxdxxkO0KNWNNXXXXXXXNNNNNNNNNNNNNNNXXKKKKKKKXNNWWWWNKO00koc:lOXWMMMMMMMMMXx:col:xNMMMMMMMMMMMM    //
//    MMMMMMMMMWWWW0lcok000000000KXNWWWWNNXK00OOOdoxkkkkkkOOOO000KKXNNWWWWWWWWNNKOO0Odl;;cxOKNWWWNXkl;:ddc:xWMMMMMMMMMMMM    //
//    MMMMMMWKkkKWMWOc:oOXXXXXXXNNWWNX0Okkxxdddxd::xxxxkxxxxxxddddxxkO0KXNWWWWWWNX0OOOkdc:;;:loddo:;;cdkd::OWMMMMMMMMMMMM    //
//    MMMMMNk:cOWMMNx::lk0XWWWWWNX0OkxdxxkkO00KKKdo0XNNNNNXXXKKKK0OkkxddxkO0XNWWWWNX0OOOOxolc::cccclxOOkl;oXMMMMMMMMMMMMM    //
//    MMMMM0c,ckKK0d:;:ok0XWWNX0kxdxk0KKXNWWMMMMMKdkKXNMMMMMMMWWNNWWNXK0Okxdxk0KNWWNNXK00OOOOkkkkkOO00kl;:OWMMMMMMMMMMMMM    //
//    MMMMWkcloccc:::cokOKNNKOxxO0KNWMMMMMMMMMMMMN0XWXXKKXXXKKXXNWMMMMMMWNXKOkxxk0XNWWNNXXKK0000KKK00kl;:kWMMMMMMMMMMMMMM    //
//    MMMMMKookkxddddxO0KXKkkOKNWMMMMMMMMMMMMMMMMKONMMMW0OXNXXNNWMMMMMMMMMMMWNKOxdxOKNWWWWWNNNNNNNX0ko;cOWMMMMMMMMMMMMMMM    //
//    MMMMMWOlok0KKK00KXKOOKNWMMMMMMMMMMMMMMMMMMWKXWMMMMWX0XMMMMMMMMMMMMMMMMMMMWNKOxxkKNWWWWWWWWWX0Od::kWMMMMMMMMMWXXMMMM    //
//    MMMMMMWKxoodkKXNNKKXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKKKKXXNMMMMMMMMMMMMMMMMWKOxdkKNWWWWWWNK0Oo:lKMMMMMMMMMMWkoKWMM    //
//    MMMMMMMMWKo:cxKXKNWMMMMMMMMMMMMMMMMMMMMMMMMWWNNNNNNNNWWNNXXKNMMMMMMMMMMMMMMMMMWKkxxOXNWWWWNKOOo:l0WMMMMMMMMMNd:oKMM    //
//    MMMW0ONMMWkccdOKNMMMMMMMMMMMMMMMMMMMMMMMWNNNNWWWMMWWNKXWMMMWWMMMMMMMMMMMMMMMWWNNX0xdx0NWWWNK0OxlcdXWMMMMMMMNklccOWM    //
//    MMMKolONNOoccd0NMMMMMMMMMMMMMMMMMMMMMWNNNNWMMMMMMMMMMW0KWMMMMMMMMMMMWNXXXNNNNWNXKNKkxxOXWWNX00OxlldOXWMMWNKd::cckWM    //
//    MMNxccclc;;:lONMMMMMMMMMMMMMMMMMMMWNNXKKK0KN0dl:cdKWMMNKXWMMMMMMMMMMWNXXKOOKXXXXO0NXOxdkXWWNKOOOkdl:codxdocc:ccl0WM    //
//    MMXdcodoc;:lxXMMMMMMMMMMMMMMMMMMWNXK0Oxkkdc,.     .xNMMWWMMMWWNXNWMMMMMWNNWMMMMWNXXXXOxdkXWWNK0OOOkdolllloddl::dNMM    //
//    MMNdcok0OkkkKWMMMMMMNKK0KWWNWMWNXKOxxkxo,.         .kMMWNWWMWNNNNWMMMMMMMMMMMWWNNNX0OkxxdkXWWNXK0OO0OOOOOOko:;oKMMM    //
//    MMWOccx0XXK0NMMMMWX0kxxkKNNWWNXKOxxkxc.             cNMWNNWMMWWWWWMMMMMMMMMMMMMMMMWWXOdoddONWWWNXXKK0000Oxl::dXMMMM    //
//    MMMXxcoxKXK0NMMMMNKOOkOXNNWMNK0kxkd:.               .oNMMMWXXWMMMMMMMMMMMMMMMMMMMMMMMXOxood0WWWWNXK0OOkdc::lONMMMMM    //
//    MMMMXxlok0kxO0XNWWWNNXNWNWMNKOxkx:.                  .lXMMMN00NMMMMMMMMMMMMMMMMMMMMMMXK0xxdkXWNX0OOOxoc::lkXWMMMMMM    //
//    MMMMMNklldoodddxkO0KNWMMMMMN0kxl.                      oWMMMNOONMMMMMMMMMMMMMMMMMMMMMNK0kxdx0NK0OOOdc:coOXWMMMMMMMM    //
//    MMMMMMW0l;:odxO0KXXXXNWMMMMMXk,                        ;XMMMMKx0WMNNMMMMMMMMMMMMMMMWX0kOkxxdOK0OOkdc:lONMMMMMMMMMMM    //
//    MMMMMMMWkcdOXNWMMMMMMMWNWMMMNc                        .oNMMMMXkONMN00XWMMMMMMMMMMMWNK0K0xdxdxOOOOdc;oKWMMMMMMMMMMMM    //
//    MMMMMMWKk0XNKOkxxk0XNWNK00XWWx.                     .,dNMMMMMXk0WMMWKOO0XNWMMMMMMMMMXXWXxodddk00kl,c0WMMMMMMMMMMMMM    //
//    MMMMMMN0XXd,.      .,o00xxxO0Kkl;'....''........';cd0NMMMMMMN00NMMMMMWNKKKKKXNWMMMMMWWWXkdoodkOOo;,oNMMMMMMMNXWMMMM    //
//    MMMMMMNKXx.          ,xxodxxxxxkOOO0KXNNNXKK0KKXNWMMMMMMMMMWNXWMMMMMMMMMMMWNNNWWNWMMMMW0xxolokOOo;;lKWMMMMMMKdkWMMM    //
//    MMMMMMWXK0;          ,c. .:dxxxxxxxxkOXNWWWWWMMMMMMMWWWWMMMMMMMMMMMMMMMMMMMMMMMMNNWMMMNOxxdloO0Od:,;l0WMMMMWOcl0MMM    //
//    MMMMMMMWXKO'         ;l.   .cdxxxxxxkKNNNNNNNWWNNWNNNWWMMMMMMMMMMMMMWNNXK000KNKKNNMMMWKxxxxdk0OOOd:;;cd0XXKklcckWMM    //
//    MMMMMMMMWXKx.        :o.     .:dxxxOXMMMMWWMMMMMMMMMMMMMMMMMMMMWWNKOkkxxddxd0WK0WMMMMXkxxxdkXKOOOOkdlccclllcc:ckWMM    //
//    MMMMMMMMMNK0:      .cxd,       .cx0NWMMMMWNNWMMMMMMMMMMMMMMMMWKKNXOxxxxxxxxx0WK0WMMMNOxxxdxKWNK0000OOkxxdddlc:lKMMM    //
//    MMMMMMMMMMK0d.     :X0x:.       .xWMMWMMMMWNXNWMMMMMMMWNWMMWWNlcXWXOxxxxxxdkKNK0WMMNOxxxdxKNWWNNXXXKK000Oxoc:o0WMMM    //
//    MMMMMMMMMMXKKl.  .:KMXko.       ,0MMMWNWMMMMWNXWMMMMMMNNMMMXKNd.lNWXKOkxxk0NWWK0WMNOxxxdxKNWWWNNXKK00Oxdoc:cxKWMMMM    //
//    MMMMMMMMMMNNMWKOk0NMMWOd:';::clxKWMMMMWNNMMMMMNNNWMMMMWWMMWKkXK;.dWMMWWNNWMMMMKONNOxxxxkKNWNXXK0OkxdoolclokKWMMMMMM    //
//    MMMMMMMMMMNNMMMMMWNWMMXkd0WMMMMMMMMMMMMWNNNWMMMWNNWMMMMMMMN0OXWx..kMMMMMMMMMMMKkK0xxxdkXNNXK0Okdlc:cldk0XNWMMMMMMMM    //
//    MMMMMMMMMMWNNMMWXO0NMWNXXWMNNMMMMMMMMMMMWNKKNWMMMWMMWWNWMMWNNXO:  ;KMMMMMMMMMMXkdxxxdxKNK0OOkdc;;:okKNMMMMMMMMMMMMM    //
//    MMMMMMMMMMMWNNKOxxxOXNNWMMMNNWMMMMMWXKKOO0KKOddkKK0O0KKkookOo:lc.  :XMMMMMMMMMMXxodxxOK0OOxlc:::oONWMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMWXOkxxdx0XWMMMWWNK0Okdx0XKddXMMWd.lNMKdOWWkccON0ok0:   ;KMMMMMMMMMMNOook00Oxoc::cxKWMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMWNXK0xkXNX00K0dkXXOclXMMWOdKWWk..:l:..;;....,'...     ;KMMMMMMMMMMW0dk0koc::cxKWMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMNKOxkk0MNk0MMMNkkNNKl..;,.                        cNMMMMMMMMMMW0ol:::cdKWMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMXkkO0MM0ONWWXkoxkd:.                         .':dKMMMMMMMMMMMXl;:coONMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMWKOkONWKxxOkxxxxxxdc.      ..''''......';:ldkKNWXXMMMMMMMMMMMXo:lkXMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMWNXKXNWXkxxxxxxxxxdc. .:xOKXNNNNNNNXXNNWMMMMMMMXXMMMMMMMMMMMXocONMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0xxxxxxxxxdc:OWMMMMMMMMMMMMMMMMMMWNXNNKNMMMMMMMMMMM0okWMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKkxxxxxxxxdxKWMMMMMMMMMMMMMMMMWXKKOdd0WMMMMMMMMMMNOOWMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXkxxxxxxxxdxKWMMMMMMMMMMMMMMMX0NWKxONMMMMMMMMMMW0OXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0xxxxxxxxdxKMMMMMMMMMMMWNNN0dk0OXWMMMMMMMMMMWKOXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKxxxxxxxxdkNMMMMMMWNN00NXx;,l0WMMMMMMMMMMMN00NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0xxxxxxxxx0WMMMMWXXWXOKKlckXWMMMMMMMMMMNK0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNkdxxxxxxxxXMMMMWXXNNkldkXWMMMMMMMMMMWX0KWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0xxxxxxxxdkXXXWWOlcdxONMMMMMMMMMMMMN0KNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXxxxxxddxdxXN0xo:coONMMMMMMMMMMMMWKOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0ooxxkKOddodKx:o0NWMMMMMMMMMMMMMNOONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNkkOOKKNNd;,:xO0NMMMMMMMMMMMMMMMXkONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKk0kxxoxddx0NMMMMMMMMMMMMMMMMWXkONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0odxk0XNWWMMMMMMMMMMMMMMMMMMXkkXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWOkXWMMMMMMMMMMMMMMMMMMMMMWKkxKMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNOkXWMMMMMMMMMMMMMMMMMMMN0xd0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNOkXMMMMMMMMMMMMMMMMMNKkxdONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNkkXWMMMMMMMMMMMWNX0kxdx0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXkx0NWMMMWWNXKKOkxdxk0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0xxO00OOkkxxxdxk0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0kxxdxxkOO0KXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNXXXXNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//                                                                                                                           //
//                                                                                                                           //
//                                                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract STZY is ERC1155Creator {
    constructor() ERC1155Creator("Steezy Design x SSD - 'Bounty Hunter'", "STZY") {}
}