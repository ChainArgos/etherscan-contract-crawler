// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Starcrossed
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                          //
//                                                                                                                                                                                          //
//           _           _       _   _              _         _           _                  _           _            _          _           _          _           _         _             //
//          /\ \        / /\    / /\/\ \           / /\      /\ \        / /\               /\ \       /\ \          /\ \       /\ \        / /\       / /\        /\ \      /\ \           //
//          \_\ \      / / /   / / /  \ \         / /  \     \_\ \      / /  \             /  \ \     /  \ \        /  \ \     /  \ \      / /  \     / /  \      /  \ \    /  \ \____      //
//          /\__ \    / /_/   / / / /\ \ \       / / /\ \__  /\__ \    / / /\ \           / /\ \ \   / /\ \ \      / /\ \ \   / /\ \ \    / / /\ \__ / / /\ \__  / /\ \ \  / /\ \_____\     //
//         / /_ \ \  / /\ \__/ / / / /\ \_\     / / /\ \___\/ /_ \ \  / / /\ \ \         / / /\ \_\ / / /\ \ \    / / /\ \_\ / / /\ \ \  / / /\ \___/ / /\ \___\/ / /\ \_\/ / /\/___  /     //
//        / / /\ \ \/ /\ \___\/ / /_/_ \/_/     \ \ \ \/___/ / /\ \ \/ / /  \ \ \       / / /_/ / // / /  \ \_\  / / /_/ / // / /  \ \_\ \ \ \ \/___\ \ \ \/___/ /_/_ \/_/ / /   / / /      //
//       / / /  \/_/ / /\/___/ / /____/\         \ \ \    / / /  \/_/ / /___/ /\ \     / / /__\/ // / /    \/_/ / / /__\/ // / /   / / /  \ \ \      \ \ \    / /____/\ / / /   / / /       //
//      / / /     / / /   / / / /\____\/     _    \ \ \  / / /     / / /_____/ /\ \   / / /_____// / /         / / /_____// / /   / / _    \ \ \ _    \ \ \  / /\____\// / /   / / /        //
//     / / /     / / /   / / / / /______    /_/\__/ / / / / /     / /_________/\ \ \ / / /\ \ \ / / /________ / / /\ \ \ / / /___/ / /_/\__/ / //_/\__/ / / / / /______\ \ \__/ / /         //
//    /_/ /     / / /   / / / / /_______\   \ \/___/ / /_/ /     / / /_       __\ \_/ / /  \ \ / / /_________/ / /  \ \ / / /____\/ /\ \/___/ / \ \/___/ / / / /_______\\ \___\/ /          //
//    \_\/      \/_/    \/_/\/__________/    \_____\/  \_\/      \_\___\     /____/_\/_/    \_\\/____________\/_/    \_\\/_________/  \_____\/   \_____\/  \/__________/ \/_____/           //
//                                                                                                                                                                                          //
//                                ?????====                                                                                                                                                 //
//                              ?0???%%&0?%00=                                                                                                                                              //
//                             ??=??0%&&&%%&%0?===                                                                                                                                          //
//                           ==??000%%&&%%&%00????====                                                                                                                                      //
//                       =====?00%%%00??0%%%%%%000000000                                                                                                                                    //
//                     =====?00??====???0%000000%%0%%0%%%                                                                                                                                   //
//                    ===???======???0????=??00%%%%&%%%%%?                                                                                                                                  //
//                  =??????==?????%%%%%0??000000000000??%%                                                                                                                                  //
//                 ===??????00000%%%&%&&&&&&&&%%%%%%0??0%&                                                                                                                                  //
//                ??=??000%%%00%&&&&&&%000000000%%%%%?0%%%                                                                                                                                  //
//               ===?00%%%%%%%%%%000???0000%%%%%%%%&%%%%?     ==                                                                                                                            //
//             =======?0%%%%%%00??00%%&&&&&&&&&&&%%%%%0=   ===                                                                                                                              //
//            ========?0%%%000%%&&&&&%&&%&&&&&&&&&&&&%  =                                                                                                                                   //
//          =======????00%%%%%%00%%&&&&&&&&%&%%%%&%0=      ??===                            =                                                                                               //
//         ??=====??0?==?????00%%%%%&&&%%%&%&&&%?       =?0%%0%00=                                                                                                                          //
//        ??====??000%0??0%00000%%%%&&&%%&&&&%0       ==?%0?====%%=                                                                                                                         //
//      =?====???000%%&&%&%000%%%&%%&%%%&&&&%?       ?%%%0=00===?%0                      ==?=                                                                                               //
//     ??=???0000000%%%%%000%%0&%%&&&%?           =??%%&%?==??000%?                        =??=                                                                                             //
//    ?====0??00000???00%%%%%0&&%&&&0              00%&0??=?????%%?                        =?=?                                                                                             //
//    ?===?0%000?00000%&&&%%%0&&%&%?             =?%%%%%%?==?0?%%00=                   ====????                                                                                             //
//    ==????0&&&%&&&%%%&%&%%00&&%&?              0%%%%%&%%%%00%%&%%%%=              =?????=                                                                                                 //
//    ?????00%&&%%%%&%???0000%&&%?               ?0%%%%%0%%%%&&&&%000?====     =????????0%%?                                                                                                //
//    ???0??00%%%%%%0==?????0%&%=                 ?%%%%%??0%%&&&&&%%%%%%%&%%%%%%%&%?0???0%&%%%00?=                                                                                          //
//    000?000%%%%%%0??????0%%%?                   0%%%%%??0%%%%%%&%&%&&%&&&&&&&%&%=??????00%%&%%%%%?                                                                                        //
//    ??0000%%??0%%00?=?0%%%%%                    ?0000%%%%%%%%&&&&&&&&&%%%&%&%%00=?====???%&&%%%%%%0                                                                                       //
//    ?00?00%000000?=?0%%%%%%0                   ==??=??0=00000??0&&&&&&&&&%&&%???==???==??%&%&&%%&%%?                                                                                      //
//    ??%000000%00????%&&&&%%0                   ==?======??======%&&&&&&&&&&&%???=======?0%&&&%%%%%%0?                                                                                     //
//    ??0%%%%%00%%00?0%&%%%%%=    =????          =?===?==??======?&&&&&&&&&&&&%0??===??==000&%%%&%%%%%%?                                                                                    //
//    0000%&%%%00000?%&&%&%%%   ?00?00?%?        =======?0==?===?%%&&&&%&&&&&&%%0====?0==00%%%%&%%%%%%%%0=                                                                                  //
//    00000?0&&%%%%00%%&&%&&%? ???0=%   %      =0======000======0%%&%%%%%%&&&&&%%?===??==?0%%%%%%%%%%%%%00?                                                                                 //
//    00??===?%%0%%0%&%&&&&%0 ????==0  ?0?=    ?%0=?0%%00%%===?0%%%&&&&&&%&&&&%&0???==??0%%%%%%%%%%%%%%%0000=                ?0%%0=                                                         //
//    000?===??000??%&%&&&&%%=?=====?  0?00=    ?&?%%&%%%%?==?0%&%&&&&&&&%&&&&%%?????%%%%&%&%&%00000%%%%%00%0         ===?=?%&&&%??=                                                        //
//    %00???????00??%&&&&&&&&%0???==?  00%0?=    %&%0%&%%0???===?000&&&&&&&&&&%??=?=%&&&%&%&&%%0%%%%%%%%%%0%0=     =?%%&%&&&%%%00?0?==                                                      //
//    %%0000000???0%&&&&&&&&&%00000=0  =&%000===?%%%%00?00000?==?00?0%&&&&&&&&&%%%0?&&&&%&&&%%%%0%%%%%%%%%%%%0  =?%&&&&%%%&&&%&?0%0?===                                                     //
//    %%%%0%0000%%%%%&%&&&&&&%%0000??= ??=00%0?????=======??00?0%0000%%%%&&%%%%0%%?%&&&&&&&%%%%000%%%%%%%00???=?%%&&&%%%%%%%%&&0%&0%0===                                                    //
//    %%%%%%%%%%%%%%%%&&&&&&&%%%000000 %   =???????????=0%0??0000?%%0????&&%%%%0%00%&&&&&&&&%%%000%%%%%%%%%%0%&&&&&&%%%%%%%%%%%%%%%%?==?                                                    //
//    %%&%%%%%%%%&&&&%%&%&&&&%&&%%%00?0?   ???==?????????===??00??%??==?=%&%%%%%%00%&&&&&&&&%%%%%00%00?%&&&%%&&&&&&&%&%%%%%0%0???0%%%?==                                                    //
//    %%&%%%%%%&&&%%&&%&&&&%&&&&&&&%%0?0 ==???===???00????????000=0%%00==%&%%%%%0?0&&&&&&&&&%%%0%%%0???%%&%%%&&&&%%%%%%%00?????????%0==                                                     //
//    %%%%%%%%&&&&&&%&&&&&&%%&&&%%%%%%%%%????=====0%%0000??000000??%%%0=%&&%%%%%%?%&&&&&&&&&&%%%0%%%&%&%%&&%%%&&&%%%&%%%??????????=?0?=                                                     //
//    %%%%%00&&&&&&%&&&&&&&%%%%%%%%%%&&%??0?=?0===%%00000%%00000?=?%%%?%&&%%%%%%%?%&&&&&&&&&&%%%00%&%%%%%&&%%&&&%%&&%00??????00%?=?0?                                                       //
//    000%%%%&&&&&&&&&%%%%%%%%%%%%&%&&%??0??==%0=?000?0%%0%????????%%0=0%%%%%%%%%%%%%%%%&&%%&%00??%%%%&%%&&%%%%%%%%0???0????00000?                                                          //
//    %000%%%&&&&&&&&&&&%%%%%%%&&&&%%0??0??===0%%0??0??0000?==??0%%%%?=?%%?0%%%%0?000%0000=?%%%&%%%&&%&%%%%%&%%%%0?0?=?????????=                                                            //
//    %%00%0%&&&&&&&&&&&&&&%%%%%%&%???00?=?===?0%%0==0????????????%%000=???0%%00%%%%%%%%0===?0%%%%%%%%&%%&%&%%%?%??0?==??????0?                         ?%0                                 //
//    %0%%00?%&&&&&&&&%&%%%0%%0%%%?==00?====????0%%==???0???000?===%%00=?%%0%0%%%0%%%%%%0=??%0000%%&%%%%%%%%???00?????==?????==                        =00?                                 //
//    0%%00?0&&%&%00?000000000??0?==?0??====00000%%?=?0?????????===%%???000%&%%%%00%%%%%%0?======?00%%%%%%%0????=???0==??0                           =000                                   //
//    ?0%000&&&%?==?????000%%?==??=?000?=====00%000??0000??=?%0?==?%0000%%&&&&&&%%0%%%%0?========??0%%%%%%%&???==??0%0?=??                          ?%%%=                                   //
//    ?0000%&&%%0==?=????0?0%?==0?==%%000????=??====???????0%%0000000==%&%&&&&%%%%%%%%0?=======????0%&&%%%?0%??======00???                         0%%%?                                    //
//    000%00&&%%%===?????%0?????%0==0000%00?00=====%0?????=?0%%0?=%0??0&&%&&%%%&%%0??0?=======??0000&%&%%0??%%?????000000?0                       %%%%?                                     //
//    000%00%%%%?=?????000%00??????0????===??=?=???%%%0???????===???%%%&%%%%&%%00==?0======?00%0%%%%%&&%%???%%??%00%00???000?                   =%%%%=                                      //
//    000%0%&&0===??00000???0?00==?0%%0??===????000000%00????0?==0=?0%%%%%%00000%0%%0===?0%&&&%%%%%%%&&%%?0%%%%%??%00?=000%000?                ?%%%?%=                                      //
//    ?%%%&&%%0????0000%0???0=0%0000%%=?%???=000????00=%%%%%%0??%?=00%%%%%?=0%%0%%%%?=?0%&&%&&&%%%%%%&&%%00????%0%00????000000?%?             ?0%%00%                                       //
//    ?0&%0%%&%%??0%000%%00%%00%000%%%0?00000??0??0?0%00%%%%0%%%0?0%0%0%%??000000%%0??0&&&&&%&&&%%&%%%%%%0====?0%%%0?=?0?000%0%&0           =%%%%%%0                                        //
//    ?0%%%00%%000%%%00000000000000000??00?0%0000=?%%%00%%%%0%%?? ??%%%%%%%%%0?0%%%0??%&&&&&&&&&&%%%%%%%%?0==?0%%%%%0?=?0%%0%%%%0==        =%0??000?=                                       //
//    %%0%%%000000?000?????????????0?=====?0%00%?0?00%%?0&0?%%0?000=%%%%%%%%%%000?%%0?&&&&&&&&&%&%%%%%%00?00?%%%%%%%%00%%%%%%%%%%?0?=     ?00?%%%000?=                                      //
//    %%%%%0???????????????=????????========0%?%%%%&%0%000?0%%00%?  =%%%%&%%%%%%%%00%?%&&&&&&&&&%%%%%%%%0%%%%%%%%%%%&%%00%%%%%%00??=     0%%0?0%%%%0??                                      //
//    &&%%%0????????????????????????=======?=00%%%%%%%%00?0%%%%==    0%%%%%%%%%%%00%%%?%&&&&&&&%%%%00%%%%%%%%%%%%%%&%%%000%%%%%%%=        0%%??%%%%%%0                                      //
//    &&%%%%00?0000000??????????00??======???0%?0%%%%%%%%%%%%0???=    %%%%%%%&%%%%%&&&%0&&&&&&&&%%00000%%%%%%%%%%%%%%%%00%%%%%%000           0?0%%&%?=                                      //
//    &&&%%%%%%%%%%%%%%%%000000000??=======????0?0%0?0%?0%?=?00??0=   0&&&&%&&%%&%0?0%%%0%&&&%&%%%%0%0%%%%%%&%%%%%%%%%%%0%%%%%%%%%?        ??0?0?%%?                                        //
//    &&&&%%&&%%%00%%0%&&&&%%%%%%%00?????======0??0%00000%?==??00%0    0&%%%&%%%0????00?0=?0%%%%%%%%%%%%%%%%%%%%%%%%%%0= =%%%%%%%%%=    =0%&&0?000=                                         //
//    &&&&&%&&%0%%%%%%%&&&%%&%%%%%%0??????======???0000000====???=?=    ?%%%%%%&?     =?%    ==???%%%%%%0000%%%%%%%%%0    ?%%%%%%%%0 =?00%%%%%00=                                           //
//    &&&&&%%%&%%&%%0&&&%&%%%%%%%0????=??=======0?????????====?======    =%%%%%%?       =00?     ?%%?000?00?000%%%%%=      0%%%%%%%%%%%%%%%%%%%0                                            //
//    &&&&&&%%0?00?%&&%&%%00%%%%%%00?????=======?==?????================   0%%%%0         0%===??%%%000%0??00000000=        %%%%%%%%%%%%%%%%%%%%                                            //
//    &&&%&&&&%%%%%%&&&&&%00%%000%00%00??=======???????=======?===========  %&%%%%?   0%%0?0%0%&%%%%%%%%%%%%%%%%%%0=        ?%%%%%%%%%%%%%%%%%0?                                            //
//    &&%%%%%&%%%%%%&&%%%%0?%%00%%000%0%%0?======????=========?=?=========? ?%%%%%??0?     %00&%%%0%%%%0%0%%%%%%%%00=        0%%%%%%&%%%%%%%?                                               //
//    &%%%%%%%%%%%%0%&&&%00?00%%%%000000%%0?=====????=========???========?0??%%%%%%=      000%%00%%%%%&%%%%%%%%%%%%%%?        0%%%%%%%%%%%?                                                 //
//    &%&%%%%%%&%00%%%&%%00??0%%%00????0%%0??====???=========?00???======?%0?%%%%%&0=    =%0%%00%0%0%%%%%%%%%%%%%%%%%%?        ?%%%%%%%0=                                                   //
//    &&&&&&%&%%%%%00%%&%0000%%%%00????000?0??===???=======?%%%%0??=========?0%%%%%%?    0%0%%000000%%%%%0%%%%%%%00%%%00?        ????=                                                      //
//    &%&&&&%%%%%%%%00%%%0000%%%%%%00?0000?===?=?0???????==&&&&%%0??========?0%%%%%%0=   0%0%%%00000%%%%000000&%%%%0%%%%%=                                                                  //
//    %%%%&&%%%%%%%%%00%0000?%%%%%%%%%%00?=====?000%000???%&&&&%%%0??========?%%%%%%%?=  &%%%%0000000%%0000000%%%0%&%00%%0    =                                                             //
//    %0=?%%%&&&%%%%%%%%0%0??0&%%%&%%%0?======00?0?000????%&&%%%&%%%0??=======%%00%%%%= ?%%&%%%0000000%00000000%%%00%%0000?===                                                              //
//    &?==?0%%%%%%%%%%%%00????&&%%%%%%0?=====%0?????0===?0%&%%%%%&&%%00???===?%00%%%%&0=?&&&%%%000000%00?00%0000%%00000000%=                                                                //
//    %&%????0%%%%%%%%%%00????0&&%%%%00?==?0%%?????0?====0&%%%%%&%%&%%%00%00%%%%0%%%%%%=0&&%%%%000000%0?000%00%%%%%000000000                                                                //
//    ?0%%??00%%%%%%%%%%%????00%&&&%&%%%%%%&%%%00000?===?&&%%%%%%%%%&%%%%%%%%%%%%%%%%%%00&%%%%%%%000000%0000?000%&%%00000%%%=                                                               //
//    ??0%%%%%%00%%%0000%0000000%%%%%%%0?0%&%%%%%0??=??0%&&%%%&%%%%%%%%%%%%%%%%%%%%%%%%%?&%%%%%%0000%?0?0?0?000%%%&%%00000%%0                                                               //
//    ????0%%%%%%%%000??0%%0%%%%%%&&%%0%%00000??000%%%%%%%%%%&&&&%%%%%%%%%%%%%%%%%%%%%&&?&&??%%%000%%%0??????0%%%%%%0%%%%%%%%=                                                              //
//    0???0%%%%%%%000????00%%%%%%&&%%%%%?=?0%%%%%%%%%%%%0000%%%%&%%&%%&%%%%%%%%%%%%%%%%%0?% ?%%%000%%0%%0???00%%000%00??==??%0                                                              //
//    %0??&%%%%%%?????????%%%%%%&&%%%0?==0%%%%%%%%%%0?=     =0%%%%%%%%%%%%%%%%%%%%%%%%%%%?=  0%%000%%%00%%000%%00000?========0                                                              //
//    %%00%%%%%%%%0??????00%%%%%%0%%0==?0%%%%%%%%00=          =%%%%%%%%%%%%%%%%%%%%%%%%%?      00%0%%%%%%%00%%0000?===========                                                              //
//    %&%%%%%&%%%%%%000000000%%%0%%0??0%%%%%%%%0?=              0%%%%%%%%%%%%%%%%%0  ===       =0%%000000000%%000?============                                                              //
//    %&%%%&&&%&%&%%%%00%%%%%%%%?%%0?=0%%%%%00?                  ?%%%%%%%%%%%%%%%%%    ==?=     =0?=???=????0%000?===========                                                               //
//    &&0?%&%&%&%%%%%%%%%%%%%%%000%%?=?0000?=                     =0%%%%%%%%%%%%%%%0 =??000      ?????=?????0%00??===========                                                               //
//    &%&%&&&&%&%%%%%%%%%%%%%%%?0%%%??=??=                          0%%%%%%%%%%%%%%%%0%%000?     =0?????????0%00??==========                                                                //
//    &&&&&&&%&%%%%%%%%%%%%%%%0=0%%%??==                             0%%%%%%%%%%%%%%%%%%%%00      ??????????0%%0??==========                                                                //
//    &%&&&&%&%%%%%%%00%%&%%%%??0%%%==?==                             0%%%0%%%%%%%%%%%%%%%%0=      ??????=??0%%0?==========                                                                 //
//    &&&&&&%&%%%&%%%%0?0%%%%0=0%%%?==??==                             ?00%00000%%%%%%%%%%%%?       ????????0&%0?==========                                                                 //
//    &&&&%&&%%%%%%%%%0                                                                                                                                                                     //
//                                                                                                                                                                                          //
//                                                                                                                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract SRXD is ERC721Creator {
    constructor() ERC721Creator("The Starcrossed", "SRXD") {}
}