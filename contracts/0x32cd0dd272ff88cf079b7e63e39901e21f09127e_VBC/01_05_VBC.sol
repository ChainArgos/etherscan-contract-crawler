// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Viki_Biyanova-contests
/// @author: manifold.xyz

import "./manifold/ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                   //
//                                                                                                                                   //
//    '##::::'##:'####:'##:::'##:'####::::::::::'########::'####:'##:::'##::::'###::::'##::: ##::'#######::'##::::'##::::'###::::    //
//     ##:::: ##:. ##:: ##::'##::. ##::::::::::: ##.... ##:. ##::. ##:'##::::'## ##::: ###:: ##:'##.... ##: ##:::: ##:::'## ##:::    //
//     ##:::: ##:: ##:: ##:'##:::: ##::::::::::: ##:::: ##:: ##:::. ####::::'##:. ##:: ####: ##: ##:::: ##: ##:::: ##::'##:. ##::    //
//     ##:::: ##:: ##:: #####::::: ##::::::::::: ########::: ##::::. ##::::'##:::. ##: ## ## ##: ##:::: ##: ##:::: ##:'##:::. ##:    //
//    . ##:: ##::: ##:: ##. ##:::: ##::::::::::: ##.... ##:: ##::::: ##:::: #########: ##. ####: ##:::: ##:. ##:: ##:: #########:    //
//    :. ## ##:::: ##:: ##:. ##::: ##::::::::::: ##:::: ##:: ##::::: ##:::: ##.... ##: ##:. ###: ##:::: ##::. ## ##::: ##.... ##:    //
//    ::. ###::::'####: ##::. ##:'####:'#######: ########::'####:::: ##:::: ##:::: ##: ##::. ##:. #######::::. ###:::: ##:::: ##:    //
//    :::...:::::....::..::::..::....::.......::........:::....:::::..:::::..:::::..::..::::..:::.......::::::...:::::..:::::..::    //
//    you bought art from -Victoria Biyanova- an illustrator and Nft artist.                                                         //
//    twitter.com/Viki_Biyanova                                                                                                      //
//                                                                                                                                   //
//                                                                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract VBC is ERC721Creator {
    constructor() ERC721Creator("Viki_Biyanova-contests", "VBC") {}
}