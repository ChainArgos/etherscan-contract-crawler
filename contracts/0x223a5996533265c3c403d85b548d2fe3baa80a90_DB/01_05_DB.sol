// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Dead Bones
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                     //
//                                                                                                     //
//    @@@@@@@   @@@@@@@@   @@@@@@   @@@@@@@      @@@@@@@    @@@@@@   @@@  @@@  @@@@@@@@   @@@@@@       //
//    @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@     @@@@@@@@  @@@@@@@@  @@@@ @@@  @@@@@@@@  @@@@@@@       //
//    @@!  @@@  @@!       @@!  @@@  @@!  @@@     @@!  @@@  @@!  @@@  @@[email protected][email protected]@@  @@!       [email protected]@           //
//    [email protected]!  @[email protected]  [email protected]!       [email protected]!  @[email protected]  [email protected]!  @[email protected]     [email protected]   @[email protected]  [email protected]!  @[email protected]  [email protected][email protected][email protected]!  [email protected]!       [email protected]!           //
//    @[email protected]  [email protected]!  @!!!:!    @[email protected][email protected][email protected]!  @[email protected]  [email protected]!     @[email protected][email protected][email protected]   @[email protected]  [email protected]!  @[email protected] [email protected]!  @!!!:!    [email protected]@!!        //
//    [email protected]!  !!!  !!!!!:    [email protected]!!!!  [email protected]!  !!!     [email protected]!!!!  [email protected]!  !!!  [email protected]!  !!!  !!!!!:     [email protected]!!!       //
//    !!:  !!!  !!:       !!:  !!!  !!:  !!!     !!:  !!!  !!:  !!!  !!:  !!!  !!:            !:!      //
//    :!:  !:!  :!:       :!:  !:!  :!:  !:!     :!:  !:!  :!:  !:!  :!:  !:!  :!:           !:!       //
//     :::: ::   :: ::::  ::   :::   :::: ::      :: ::::  ::::: ::   ::   ::   :: ::::  :::: ::       //
//    :: :  :   : :: ::    :   : :  :: :  :      :: : ::    : :  :   ::    :   : :: ::   :: : :        //
//                                                                                                     //
//                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////


contract DB is ERC721Creator {
    constructor() ERC721Creator("Dead Bones", "DB") {}
}