// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Kior Editions
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////
//                                                        //
//                                                        //
//    ∭++⊙++++++++×++++++++∘+++++++++++++++++⊙++++++∭     //
//    ∭+++++++++++++++++++++++++++⊙++++++++++++×+++++     //
//    ++∘+++++++++++ ------------- +++++ -- +++++++++     //
//    ++++++++++  ⎛⎛⎛⎛⎛⎛⎛⎛⎛⎪⎪⎞⎞⎞⎞⎞⎞⎞⎞ ⎛⎛⎛⎞⎞⎞⎞ ++++++∬     //
//    +++++++++ ⎛⎛⎛⎛⎛⎛⎛⎛⎛⎪⎪⎪⎪⎪⎞⎞⎞⎞⎞⎞⎞⊙⎛⎛⎛⎠⎠⎠⎠ ++∘+++∫     //
//    +⊙++++++  ⎝⎝⎝⎝⎝⎝⎝⎝⎝⎪⎪⎪⎪⎪⎞⎞⎞⎞⎞⎞⎞⎞⊙⎠⎠⎠⎠⎠ ++++++++     //
//    ++++++++   ∖∖∖∖∖∖∖∖∖⎝⎝⎝⎝⎝⎝⎞⎞⎞⎞⎞⎞⎞⎞ ⎝⎝ +++++++++     //
//    ∬+++++++     ∖∖∖∖∖∖∖∖⎝⎝⎝⎝⎝⎝⎞⎞⎞⎞⎞⎞⎞  ⎝⎝⎝ +++++++     //
//    +++++ ●●●●●●●●●∖∖∖∖∖∖∖∖⎝⎝⎝⎝⎝⎞⎞⎞⎞⎞⎞⎞  ⎝⎝⎝⎝ +++++     //
//    +++++ ●∶          ∖∖∖∖∖∖∖⎝⎝⎝⎝⎞⎞⎞⎞⎞⎞⎞ +++++++++∘     //
//    +++++ ●∶           ∖⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝ +++++++++++     //
//    ++++++ ●●           |⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝ ++++⊙++++++     //
//    +∘++++++            |⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝ ++++++++++     //
//    ++++++++            |⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝ ++++++++∫     //
//    ∬+++++++            |⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝ +++++++∭     //
//    ++×++++++           |⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝⎝ +++++++     //
//    ++++⊙+++++                     +++++++++++++++∬     //
//    ++++++++++++++++               +++×++++++++++++     //
//    ++++++++++++++++               +++++++++∘++++++     //
//    ∘+++++++∘+++++++               +++++++++++++++∘     //
//    +++++×+++++++++                 ++++⊙++++++++++     //
//    ++++++++++++++                   ++++++++++++++     //
//    +++⊙++++++++                        ++++++++++∘     //
//    ++++++                                    ++++∬     //
//    ∬+++++++++++++++++++++⊙++++++++++++++++++++++++     //
//    ∭+++⊙++++++++++++++++++++++++++∘+×++ ∕< 𝝄 +++⊙∭    //
//                                                        //
//                                                        //
////////////////////////////////////////////////////////////


contract KRED is ERC1155Creator {
    constructor() ERC1155Creator("Kior Editions", "KRED") {}
}