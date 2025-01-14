// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

// name: LAVACOLADA
// contract by: buildship.xyz

import "./ERC721Community.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                             //
//                                                                                                                             //
//                                                                                                                             //
//                                                                                                                             //
//        / /        // | | ||   / /     // | |       //   ) )     //   ) )     / /        // | |     //    ) )     // | |     //
//       / /        //__| | ||  / /     //__| |      //           //   / /     / /        //__| |    //    / /     //__| |     //
//      / /        / ___  | || / /     / ___  |     //           //   / /     / /        / ___  |   //    / /     / ___  |     //
//     / /        //    | | ||/ /     //    | |    //           //   / /     / /        //    | |  //    / /     //    | |     //
//    / /____/ / //     | | |  /     //     | |   ((____/ /    ((___/ /     / /____/ / //     | | //____/ /     //     | |     //
//                                                                                                                             //
//                                                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

contract LAVA is ERC721Community {
    constructor() ERC721Community("LAVACOLADA", "LAVA", 1270, 20, START_FROM_ONE, "ipfs://bafybeicfojo4qjinp4rqxsx2rjwfgapucbz6gcroajwm34wqtypnm3txhi/",
                                  MintConfig(0.025 ether, 20, 20, 0, 0x9aF6F1fc2818B493b071b979643B005912efc484, false, false, false)) {}
}