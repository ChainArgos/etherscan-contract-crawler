// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Abstract
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                          //
//                                                                                                                                          //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWWWMMMMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWNNNWWMMMMMMMMMWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWMMMWWWWMMMMMWWWWWWWWWWMMMWWWWWMMMMMWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNXXNNWWMMMMMMMMMWWWWMMMMMMMWWWWNNXNWWWMWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKKXXXNWMMMMMMMMMWWWMMMMMMMNX0xddxxkkO0KXXXNWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWK0XXKXWMMMMMMMMMWWWMMNXWMMWOddooOXWWMMMWMWNXNWMMMMWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNXNOkXWKXMMMMMMMMMMMWWMWKdkNWNx,ck0NWMMMMMMMMMMMMMMMMMMWWWNNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKkOOdOWN0XMMMMMMMMMMMMMW0:,x0xl''dXNMMMMMMMMMMMMMMMMMMMMWXXWXKXNWMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXdoOklOWWK0NMMMMMMMMMMMMKc.;dc'''oXMMMMMMMMMMMMMMMMMMMMMWO:cdkKK0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXlcO0ldNMWXXWWWWMMMWWMMWOc;;:,..:0MMMMMMMMMMMMMMMMMMMMMMKc.'''oKK0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNd:dkdcdXWMMWWWWWWWWMMMMXOxc,'''oNMMMMMMMMMMMMMMMMMMMMMWk,.':c,dXXXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXo:loc:lkXWMMMMMMMMMMMWKOd;'.':OWMMMMMMMMMMMMMMMMMMMMMKc'.;dc.:0WNNNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0l:c:;::cox0XNNWWWXKKK0o;'.'.;0MMMMMMMMMMMMMMMMMMMMMXo''':l,.,kWWNXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKkoc;',:ccclooooddool;'..'.,dXMMMMMMMMMMMMMMMMMMMMXo'..';:'.,xWMWXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXxc;,'';::::;;cl:;;'...,lONMMMMMMMMMMMMMMMMMMMWKl'.'.',;;okKNNWNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0xl:;;,'..''',,;:,:lx0NMMMMMMMMMMMMMMMMMMMMWO:'','':ok0OdxKKKNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0Oxdoc::cclodxOXWWMMMMMMMMMMMMMMMMMMMMWWKxc;;,;o0Kxl;,l0NNNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWNNNNWWMMMMMMMMMMMMMMMMMMMMMMMMMMNKOOK0d:lxoll;;;;lONWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWNNNXKOkkddxdcc:::ckXXNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWNKKXx:::colclc:ckXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWNNXXXXXXNNXKNXklllcccclocckXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNXKK0OOOOkkkkkkkO0KXWNKOxdollllclkNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWNKOkxkkO0KXNNNNNNXNNNXXKXXKOkxdoolclONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWNXKkxkOKXNWWMMMMMMMMMMMMMMMWNKK0kddxdoclOWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWNXKOkk0XNWMMMMMMMMMMMMMMMMMMMMMMWXOkOkxx0KO0WWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNNXKOkk0XNWMMMMMMMMMMMMMMMMMMMMMMMMMMMNKkdxxONXXWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNXK0kk0XNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0xxxxKXXWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNNX0OO0KNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0OKXXNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNXKOOOKNWMMMMMMMMMWWX0kxxxxkO0XNWWMMMMMMMMMMWWMWKx0WMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXKNWWWWNXK000KXWMMMMMMMMWNKkoc;'......',;:lxOXWMMMMMMMWNNWXolONWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMWNOkO00KXXXXXXNWMMMMMMMMMWXxc,'...........'....':oxKWMMMMMWNXXOdx0NWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMWKxxO0OOXWWMMMMMMMMMMMMMWNkc,'''........'''......'cdooONMMMMMWX0OO0KNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMNkox0O0KNWWMMMMMMMMMMMMMWKo,.........';c:;coooxxol:;:;',:dKWMMMMWNXKXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMN0xx0XKKNWMMMMMMMMMMMMMMMNOxc','....;c;',,:d0NX0OO0KKkxol:;,;o0NMMMMMWNNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMN0xOKXXXNWMMMMMMMMMMMMMMWXxc:,'''...'od,.';dXNKdok0KNNXXXKOdol:;lONMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMWXK0KXXXXWMMMMMMMMMMMMMMW0c'.......'''dd'..'';lkOxoONWMMMMMWXKOdc;,ckNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMWNK0O000XXNWMMMMMMMMMMMMMWXkc'........cxkKO;......,:,.,:d0WMMMMMMWX0kl:;ckNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMWN0kOkkkOXWMMMMMMMMMMMMMMWNx;'....'''..;kWWKc..........'',dNMMMMMMMMMWNOd:,ckNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMNOxxkxolo0WMMMMMMMMMMMMMMWXd,.....'oo:okxd0WWKkc,'......',:xXMMMMMMMMMMMMWKxc:lONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMNOdoodo:lKWMMMMMMMMMMMMMMMKc'....,lONOcoXWNNWMMWNKx:'......oOkXWMMMMMMMMMWMMWXkl:oKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMWOlodo;,oXWMMMMMMMMMMMMMMMNd.....'xWMMN00WMMMMMMMMMWNOl,...'dNX0XWMMMMMMMMWWMMWWXklckNMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMW0lcdx:,dNMMMMMMMMMMMMMMMMMO;.....:0WMMMMMMMMMMMMMMMMMMNOc'.,kNMWWWMMMMMMMMMMMMMMMWXkll0WMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMXdldo,'oNMMMMMMMMMMMMMMMMMWkll:...lXMMMMMMMMMMMMMMMMMMMMWNOxdkXMMMMMMMMMMMMWWMMMMMMMWKockNMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMWkoxl'.lXMMMMMMMMMMMMMMMMMMKlkNd'..oNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMWNkcdXWMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMXkdc,.;OMMMMMMMMMMMMMMMMMMMXllx;..'xWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMMMWW0llKWMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMWXd;;,.oNMMMMMMMMMMMMMMMMMMMWd,;'..lXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMWWKol0WMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMWXk,':,'kMMMMMMMMMMMMMMMMWMMWk;...'oXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMWNKocONMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMWNx';c',OMMMMMMMMMMMMMMMMWXOo,..'lONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNWMMMMMMMMMWN0lckNMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMWW0;;:.'kMMMMMMMMMMMMMMWXx:'..;o0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXNMMMMMMMMMMNXkllkWMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMWWXo''.'xMMMMMMMMMMMMWKd:'':okXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWMMMMMMMMMXNMMMMMMMMMMWN0xdo0MMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMWNX0l;;:0MMMMMMMWNNN0o::ok0NWMMMMMMMMMMMMMMWWWWWWWWWWWWWWWWWWWWWWWWWWWMMMMMMMMMMNKNMMMMMMMMMMWNXkxoxWMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMWXXKXXKNMMMMMWNKkkOkOKWWMMMMMMMMMWWWWWWWWWWWWWWWWWWWWWWWWWWWWWMMMMMMMMMMMMMMMWX0XWMMMMMMMMMMNXNkdxkNMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMWXKNWMMMMMMMMWWWWMMMMMMMWWWNNNNNNNNWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNNXKKKNMMMMMMMMMMMWXXNkk0KWMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMWNXXNWWMMMMMMMMMWWWNNNNNNNNWWWMMMMMMMMWWWWWWNNNNNNNNNNNNNNNNNNNNXXXXXXXKKXNWMMMMMMMMMMMMNK0NKkXNNMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMWWWWWNNNNNNNNNNNNNNNNNWWMMMMWWWNNNNNNNNNNXXXXXXXXXXXXXXXXXXXXXXNNNNNNWWMMMMMMMMMMMMMMMMWNK0NXOKWWMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMWWWWWWMWNXXXXNNWWWWWWWWWWWWWWNNNWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWNNNX0OXWMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMWWWWWNXXXNNWNNNWWWWWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWNKO0NMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWNNNXXXXXNNWWWNNWMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWWWWWWNXNNXKKKXXKKKKKKKKK0000000000000000000000000000000000000KXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMWWWMWWWWWWNNX0KXKKKKXXXXXXXNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNWWWWWNNWNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMWMMMMWWMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWWWWWNNNNNNNNNNNNXNNNNNNNXXXXXXXXXXXXXXXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//                                                                                                                                          //
//                                                                                                                                          //
//    Back to start                                                                                                                         //
//                                                                                                                                          //
//                                                                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract Feel is ERC721Creator {
    constructor() ERC721Creator("Abstract", "Feel") {}
}