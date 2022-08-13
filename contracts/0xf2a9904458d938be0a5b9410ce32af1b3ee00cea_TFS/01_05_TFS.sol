// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Thanks for simping
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0Ok0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWNXXKK0OOOOO00KNWWWNNWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXXKkollodo;cKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNX0kocc:;,'............';;;;;;:clodk0KNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNxcloox0NMMWk;;OWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKOdl:,....;clodxkkkxxxddddolc:'........ ..';lONWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXdxXWMMMMMMMMk'cXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOo:...,;:lxOXWMMMMMMMMMMMMMMMMMMWNKKK00Okdlcc,...,lxOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXxOMMMMMMMMMMK;;0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKd,...:xKNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWXOo;. ..,:lkKNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNodWMMMMMMMMMNc.xWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNX0l'.,lkKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNkl;;,. .':d0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNolNMMMMMMMMMWk';0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNk:'',l0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNNXOc....':kXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWocKMMMMMMMMMMNc.dWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNk;.;lxXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0Ox:. .;OWMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWd:0MMMMMMMMMMMk.:XMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0c.;kNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNk;. 'oXWMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKc,xWMMMMMMMMMMK;.xWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXo.'dXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXo. .;OWMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKol:cXMMMMMMMMMMWx.:KMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMK:.;OWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNd' .;kWMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0ldXd;kMMMMMMMMMMMX:.lNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMK:.cKMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWk, .'xWMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0lxNMO;oNMMMMMMMMMMM0,.kMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMK:.oXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNd.  ;KMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0ldNMMXc;KMMMMMMMMMMMNo.cXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNl.cXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWk'  'OMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMM0cdNMMMWd,kMMMMMMMMMMMMk.;XMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWk.'OWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO,  .oNMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMMKclXMMMMM0;lNMMMMMMMMMMM0',0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMK;.oNMMMMMMWKOxdkXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXc  .;0MMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMMXlcKMMMMMMXc,OMMMMMMMMMMMX:.dWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNl.,0MMMMMMMXl.. .dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWo.  ,OMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMM0cxWMMMMMMWx'lNMMMMMMMMMMWo.:XMMMMMMMMMMMMMMMMMMMMMMMMMMMMMX;.lNMMMMMMMNd;'.;kWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXl.  ,OMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMWx:0MMMMMMMMK:;0MMMMMMMMMMMk.;KMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO'.xWMMMMMMMMWNXXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO'   cXMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMXlcKMMMMMMMMNo.dWMMMMMMMMMMK;'OMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO'.xWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO'  .lXMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMO;oWMMMMMMMMMk':XMMMMMMMMMMXc.dWMMMMMMMMMMMMMMMMMMMMMMMMMMMMK;.dWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0,  .cKMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMk,xWMMMMMMMMMK;,0MMMMMMMMMMWo.lNMMMMMMMMMMMMMMMMMMMMMMMMMMMMNc.cXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXl.  ;0WMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMO;xWMMMMMMMMMNc.kMMMMMMMMMMMO';KMMMMMMMMMMMMMMMMMMMMMMMMMMMMWx.'OMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0OOXWMMMM0;  .cXMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMO:dWMMMMMMMMMWo'xWMMMMMMMMMMX:.xWMMMMMMMMMMMMMMMMMMMMMMMMMMMWO,.oNWNNXXXXKKXXNNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWx'..'l0WMMNl.  ,OMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMKcdNMMMMMMMMMWd.dWMMMMMMMMMMWx.:XMMMMMMMMMMMMMMMMMMMMMMWNXK0Oo. .cl:;,,,,,,,,,;:cldk0XWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWd.   'xWMMNo.  'OMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMK:lNMMMMMMMMMWd.lNMMMMMMMMMMMO',0MMMMMMMMMMMMMMMWNKOxdoc:;,,,'..'',,,,;;::;;,''.......,:lkKXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXxl:lkNMMMM0,  .dNMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMK:cXMMMMMMMMMMO';XMMMMMMMMMMMX:'kMMMMMMMMMMMMNOdl:;''',,,;;;;;;;,;;;;;;,,'...........     ..,lkKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWMMMMMMK:  .cKMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMK;cXMMMMMMMMMMK;,0MMMMMMMMMMMWd.oNMMMMMMMNKko:'',,,,;;;;;;;;;,,,,''......',,,;;:::c:;,'......  .,cldONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO'  .oNMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMK;:XMMMMMMMMMMNl'kMMMMMMMMMMMMO''0MMMMN0d:,'',;;,,,;;;;;;,,'........';:::::::;:cc:::::;;;::::;'..   .:OWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO'  .oWMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMX:;0MMMMMMMMMMWx.cNMMMMMMMMMMMXc.lNWKd:'',;:::;;;;;;;;,'...  ....',;;:::;;;;,,;:::;::::;;:cc::;;;,.   ,0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0,..,kWMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMXc'kMMMMMMMMMMMO';KMMMMMMMMMMMWx.,xd;,;::::::;;;;;;;,'.   ..,;;;,,;;;;;,,,,,,,;:;;;;::;,;;:::;,,'..  .oNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXl. .lXMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMNo'xMMMMMMMMMMMX:;KMMMMMMMMMMMMX:..,:cccc:::::c::;,... ..,:cc:;;;;,;;;;;,,,,,;::;;,,,,'''',,'....',,cOWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNx.  ;0WMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMMMMXc.oWMMMMMMMMMMNc'OMMMMMMMMMMMMX: .:ccccc:cc::cc;'....',;;:cc:;;;;;;;;::,'''''''',;:ccldxxkxkkO0KNNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXd'. 'kWMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMMMNOddl.:XMMMMMMMMMMWo.oWMMMMMMMMMMNo. .,c::::::::::,...';:;;;;:cc:;;;;;;;'...,;:codk0KXNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXk:...;xNMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMMW0:;oX0,,0MMMMMMMMMMMk'cNMMMMMMMMMWk'.. .;,,;;:::::'..'::;;;;;::cccc::,'.''. ,d0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNXOl,...'dXWMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMMMXd;c0WMX:'OMMMMMMMMMMM0,:XMMMMMMMMMXc.'. .';;:;;:c:.  .:::;;,;;;;::::;',ck0Kx;..';o0NWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNOo:,...':d0WMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMMWO:;dXMMMK;'OMMMMMMMMMMMX:'OMMMMMMMMW0c,:;. .,;;;;;;.. .;::;;;;;;;;;;,'.lKWMMMWXkc;'..;:cok0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKko;. .':x0KNMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMMNx;lKWMMMNx..xMMMMMMMMMMMNl.dWMMMMMMMWOoloo:..',,,,,.. .,::::;;;;;;;:;..oNMMMMMMMMWNXOo;'....':okKXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWXOxoc,...;c;;o0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMMWd,oNMMMMNOOl.dWMMMMMMMMMMWx.lNMMMMMMMW0olool' .;;,,'. ..;;:ccc:;;;;::,.lXMMMMMMMMMMMMMMNXK0kdc,...,:ox0XXNNWWMMMMMMMMMMMMMMMMMMWNNNXKkdc,...':ox0NWKo,,xNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMMWk;lXMMMMWOONx'cXMMMMMMMMMMM0,;0MMMMMMMMKolooo;..;:;;.  .::::ccc:;:::;,'lXMMMMMMMMMMMMMMMMMMMMMWX0xc,....'',:ccllllloodxxxddooool:;,,,'..';lxOXWMMMMMMNd..dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMM0;:KMMMMMKkKM0,,0MMMMMMMMMMMX:'OMMMMMMMMNxlloo:..:cc;. .;ccc:;;:::ccc:',OMMMMMMMMMMMMMMMMMMMMMMMMMMWNXOdlllc::;;,;;'..''....'',,;,...:dxkKNWMMMMMMMMMMMNd'.lKMMMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMMXc;OWMMMMNkkWMK;.kMMMMMMMMMMMNo'kMMMMMMMMWKdllol..;ooc'';::::ccccllooollkWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWWWNNNNXK0KKKKKKKXXNNNKo:xNMMMMMMMMMMMMMMMMMNx'.:KWMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMMWd'dWMMMMM0dKMMNc.dWMMMMMMMMMMMk,oWMMMMMMMMWOlloo,.,loollllllllllllooold0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXo;dNMMMMMMMMMMMMMMMMMNo..cKMMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMM0;;KMMMMMNxxWMMWo.oNMMMMMMMMMMMO,cNMMMMMMMMMNOoll;..cooooooooooooooxOkkKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXc,dNMMMMMMMMMMMMMMMMMK:..lKMMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMWx,dWMMMMMKoOMMMMO'cXMMMMMMMMMMMO';XMMMMMMMMMMWKxo:..;ooooooooooollokKXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0;'dNMMMMMMMMMMMMMMMMWKc..lXMMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMMK::KMMMMMWkoKMMMM0;;0MMMMMMMMMMMK;,0MMMMMMMMMMMMWXO:.'cloxxxdolllldOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWx''dNMMMMMMMMMMMMMMMMM0:..oXMMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMWd,xWMMMMMNooNMMMMNl.oNMMMMMMMMMMNc'kMMMMMMMMMMMMMMWx.'ldkOOkxdk00KNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNo.,kWMMMMMMMMMMMMMMMMWk' .dNMMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMMK;:KMMMMMMXldWMMMMMO':XMMMMMMMMMMWd.lNMMMMMMMMMMMMMMK;'kNNXXXXNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0;.,kWMMMMMMMMMMMMMMMMNd. .dNMMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMWd'dWMMMMMMXloWMMMMMK;,0MMMMMMMMMMM0,;KMMMMMMMMMMMMMMX:'kMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWk' 'kWMMMMMMMMMMMMMMMMNd'..oXMMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMMK::KMMMMMMMNloNMMMMMNl'dNMMMMMMMMMMXc'kMMMMMMMMMMMMMMNl'xWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWk'.;0MMMMMMMMMMMMMMMMMWx...dNMMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMM0;lNMMMMMMMNllNMMMMMM0;,kMMMMMMMMMMWx,dWMMMMMMMMMMMMMNl.dWMMMMMWXXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNo..lXMMMMMMMMMMMMMMMMMXl. .xNMMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMWd,xWMMMMMMMXloNMMMMMMM0;;0MMMMMMMMMM0;,0MMMMMMMMMMMMMWx.lNMMMMWXkk0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWK:..oNMMMMMMMMMMMMMMMMMXc..,kWMMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMXc;0MMMMMMMMK:oWMMMMMMMWk,:KWMMMMMMMMNo.dWMMMMMMMMMMMMMx.:XMMMMN0kkk0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWx..;0MMMMMMMMMMMMMMMMMMXc..;OWMMMMMMMMMMMMMMMM    //
//    MMMMMMMMMK:cXMMMMMMMM0:oWMMMMMMMMWx,;0MMMMMMMMMO,cXMMMMMMMMMMMMM0,:KMMMWXOkkkOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO' .xWMMMMMMMMMMMMMMMMMMKc..;OWMMMMMMMMMMMMMMM    //
//    MMMMMMMMM0,cNMMMMMMMMK:oWMMMMMMMMMNd'cKMMMMMMMMXc,OMMMMMMMMMMMMMXc'kMMMWKkkkk0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMX:..oNMMMMMMMMMMMMMMMMMMWk. .cKMMMMMMMMMMMMMMM    //
//    MMMMMMMMM0;lNMMMMMMMMXclNMMMMMMMMMMNx,c0WMMMMMMWd.oNMMMMMMMMMMMMWd.oWMMWKOOOOKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNl..cXMMMMMMMMMMMMMMMMMMMNd' .lXMMMMMMMMMMMMMM    //
//    MMMMMMMMM0;cNMMMMMMMMNo;0MMMMMMMMMMMWk,,xNMMMMMM0,;KMMMMMMMMMMMMMk.:XMMMWK00KNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWx. .xWMMMMMMMMMMMMMMMMMMMNl..'xWMMMMMMMMMMMMM    //
//    MMMMMMMMMK;:XMMMMMMMMMk;xWMMMMMMMMMMMW0:'cOWMMMMNc'kWMMMMMMMMMMMMK;'0MMMMWNNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMK;..oNMMMMMMMMMMMMMMMMMMMW0:..:KMMMMMMMMMMMMM    //
//    MMMMMMMMMK:;KMMMMMMMMM0:lNMMMMMMMMMMMMMNO:'lKWMMMO,cXMMMMMMMMMMMMNc.xWMMMMMMMMMMMWXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXc..oNMMMMMMMMMMMMMMMMMMMMWx...xWMMMMMMMMMMMM    //
//    MMMMMMMMMNl;0MMMMMMMMMNo,kWMMMMMMMMMMMMMMXd,,lkKNXc'xWMMMMMMMMMMMMO':XMMMMMMMMMMWXk0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMX: .:XMMMMMMMMMMMMMMMMMMMMMK:..:KMMMMMMMMMMMM    //
//    MMMMMMMMMWd,xWMMMMMMMMM0;:KMMMMMMMMMMMMMMMWXkl;';do';KMMMMMMMMMMMMX:,OMMMMMMMMMMN0kOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNl. ;KMMMMMMMMMMMMMMMMMMMMMWx. .cKMMMMMMMMMMM    //
//    MMMMMMMMMM0;cXMMMMMMMMMWd'dWMMMMMMMMMMMMMMMMMWNOo,'..oNMMMMMMMMMMMWk'lNMMMMMMMMWKkkk0NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMk. 'OMMMMMMMMMMMMMMMMMMMMMMNx...xWMMMMMMMMMM    //
//    MMMMMMMMMMNl;0MMMMMMMMMMK:,0MMMMMMMMMMMMMMMMMMMMWKx; .xWMMMMMMMMMMMK:'OMMMMMMMMW0kkkOXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO' 'kWMMMMMMMMMMMMMMMMMMMMMMXl..;0MMMMMMMMMM    //
//    MMMMMMMMMMWk;xWMMMMMMMMMWk,:KMMMMMMMMMMMMMMMMMMMMMMXc.cNMMMMMMMMMMMWx'lNMMMMMMMWK00O0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMk. .kWMMMMMMMMMMMMMMMMMMMMMMMK:..lNMMMMMMMMM    //
//    MMMMMMMMMMMK:oNMMMMMMMMMMWk,;kWMMMMMMMMMMMMMMMMMMMMWk.:XMMMMMMMMMMMMNl,OMMMMMMMMWNNNNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWd. 'OMMMMMMMMMMMMMMMMMMMMMMMMWk' ,OMMMMMMMMM    //
//    MMMMMMMMMMMNolXMMMMMMMMMMMW0c,lKWMMMMMMMMMMMMMMMMMMMXc'kWMMMMMMMMMMMMO;lNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNo. ,OWMMMMMMMMMMMMMMMMMMMMMMMMXc..cXMMMMMMMM    //
//    MMMMMMMMMMMNo:0MMMMMMMMMMMMMWO:;dXWMMMMMMMMMMMMMMMMMM0:,xKXWMMMMMMMMMNo,OMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWd. 'kWMMMMMMMMMMMMMMMMMMMMMMMMWk. 'OMMMMMMMM    //
//    MMMMMMMMMMMWx;kMMMMMMMMMMMMMMMXklcoONWMMMMMMMMMMMMMMMMKdclccxXMMMMMMMMO,lNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNd..:XMMMMMMMMMMMMMMMMMMMMMMMMMMXc..oNMMMMMMM    //
//    MMMMMMMMMMMMk;kMMMMMMMMMMMMMMMMMWKdc:o0WMMMMMMMMMMMMMMMMWWXklcok00kkkkd';KMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                                                                              //
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract TFS is ERC1155Creator {
    constructor() ERC1155Creator() {}
}