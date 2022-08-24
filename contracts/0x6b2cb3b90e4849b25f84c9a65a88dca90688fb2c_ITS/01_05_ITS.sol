// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: In The Shadows
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  //
//                                                                                                  //
//                                                                                                  //
//    .-..-. .-.    .-----..-. .-..----.     .----..-. .-.  .--.  .----.  .---. .-.  .-. .----.     //
//    { ||  \{ |    `-' '-'{ {_} |} |__}    { {__-`{ {_} | / {} \ } {-. \/ {-. \| {  } |{ {__-`     //
//    | }| }\  {      } {  | { } }} '__}    .-._} }| { } }/  /\  \} '-} /\ '-} /{  /\  }.-._} }     //
//    `-'`-' `-'      `-'  `-' `-'`----'    `----' `-' `-'`-'  `-'`----'  `---' `-'  `-'`----'      //
//                                                                                                  //
//                                                                                                  //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////


contract ITS is ERC721Creator {
    constructor() ERC721Creator("In The Shadows", "ITS") {}
}