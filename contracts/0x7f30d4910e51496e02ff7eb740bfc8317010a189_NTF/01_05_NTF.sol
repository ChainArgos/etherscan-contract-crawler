// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Varrin Thakral
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

//////////////////////////////////////////////////////
//                                                  //
//                                                  //
//    :'#######::'########::'#######::'########:    //
//    '##.... ##:... ##..::'##.... ##: ##.....::    //
//     ##:::: ##:::: ##:::: ##:::: ##: ##:::::::    //
//    : ########:::: ##:::: ##:::: ##: #######::    //
//    :...... ##:::: ##:::: ##:::: ##:...... ##:    //
//    '##:::: ##:::: ##:::: ##:::: ##:'##::: ##:    //
//    . #######::::: ##::::. #######::. ######::    //
//    :.......::::::..::::::.......::::......:::    //
//                                                  //
//                                                  //
//////////////////////////////////////////////////////


contract NTF is ERC721Creator {
    constructor() ERC721Creator("Varrin Thakral", "NTF") {}
}