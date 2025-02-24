// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: FTREKT
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//    FFFFFFFFFFFFFFFFFFFFFFTTTTTTTTTTTTTTTTTTTTTTTRRRRRRRRRRRRRRRRR   EEEEEEEEEEEEEEEEEEEEEEKKKKKKKKK    KKKKKKKTTTTTTTTTTTTTTTTTTTTTTT    //
//    F::::::::::::::::::::FT:::::::::::::::::::::TR::::::::::::::::R  E::::::::::::::::::::EK:::::::K    K:::::KT:::::::::::::::::::::T    //
//    F::::::::::::::::::::FT:::::::::::::::::::::TR::::::RRRRRR:::::R E::::::::::::::::::::EK:::::::K    K:::::KT:::::::::::::::::::::T    //
//    FF::::::FFFFFFFFF::::FT:::::TT:::::::TT:::::TRR:::::R     R:::::REE::::::EEEEEEEEE::::EK:::::::K   K::::::KT:::::TT:::::::TT:::::T    //
//      F:::::F       FFFFFFTTTTTT  T:::::T  TTTTTT  R::::R     R:::::R  E:::::E       EEEEEEKK::::::K  K:::::KKKTTTTTT  T:::::T  TTTTTT    //
//      F:::::F                     T:::::T          R::::R     R:::::R  E:::::E               K:::::K K:::::K           T:::::T            //
//      F::::::FFFFFFFFFF           T:::::T          R::::RRRRRR:::::R   E::::::EEEEEEEEEE     K::::::K:::::K            T:::::T            //
//      F:::::::::::::::F           T:::::T          R:::::::::::::RR    E:::::::::::::::E     K:::::::::::K             T:::::T            //
//      F:::::::::::::::F           T:::::T          R::::RRRRRR:::::R   E:::::::::::::::E     K:::::::::::K             T:::::T            //
//      F::::::FFFFFFFFFF           T:::::T          R::::R     R:::::R  E::::::EEEEEEEEEE     K::::::K:::::K            T:::::T            //
//      F:::::F                     T:::::T          R::::R     R:::::R  E:::::E               K:::::K K:::::K           T:::::T            //
//      F:::::F                     T:::::T          R::::R     R:::::R  E:::::E       EEEEEEKK::::::K  K:::::KKK        T:::::T            //
//    FF:::::::FF                 TT:::::::TT      RR:::::R     R:::::REE::::::EEEEEEEE:::::EK:::::::K   K::::::K      TT:::::::TT          //
//    F::::::::FF                 T:::::::::T      R::::::R     R:::::RE::::::::::::::::::::EK:::::::K    K:::::K      T:::::::::T          //
//    F::::::::FF                 T:::::::::T      R::::::R     R:::::RE::::::::::::::::::::EK:::::::K    K:::::K      T:::::::::T          //
//    FFFFFFFFFFF                 TTTTTTTTTTT      RRRRRRRR     RRRRRRREEEEEEEEEEEEEEEEEEEEEEKKKKKKKKK    KKKKKKK      TTTTTTTTTTT          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//                                                                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract FTREKT is ERC1155Creator {
    constructor() ERC1155Creator("FTREKT", "FTREKT") {}
}