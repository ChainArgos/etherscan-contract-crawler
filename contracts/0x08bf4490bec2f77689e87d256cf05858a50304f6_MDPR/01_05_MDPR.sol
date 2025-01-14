// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Mike Daley Presents:
/// @author: manifold.xyz

import "./manifold/ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                    j▌╣╬▒▓╬╣╫╬╣╬╬╬╬╣╢╣╣╣╬╬╬╬╬╢╬╬╣╠╬╬╬╬╬╬╢╫▓▓▓╬▓╣╟▓▌╣╬╫▒       ''││││░░││    //
//                     ▌╬╬▒▓╫╬╬╬╬╣╣▓╬▓╬╣▓╬╫╬╬╫╣╣╬╬╣╬╣╣▓╣╣╣╣╣╬╬╬╫▓▓╬╣▌╬▓╣▌        ''│││││││    //
//                    j▌╬╢╬╬╬╣╣╬╫╬╬╣╣╬╬╬╬╬╫╣╣╬╬╬╬╬╬╬╬╬╬╬╬╬╫╫╫╫╫╬╬╬╬╬╣╣╬╣▌         '''│││││    //
//                    j▌╬╬▒╠╠╠╠╠╠╬╬╠╬╠╠╠╠╬╬╬╠╬▒╬█████╬╠╬╬╩╬╠▒╬╬╬╬╬╬╬╬╬╬╣▒         ' ''││││    //
//                     └└╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙█▓╩╙▓██▀▀▀▀▀▀▀▀▀▀▀╙╙╙╙└└─             .;;░░    //
//        ≤φ░░'~      ; ',░░░░░>░░░░░░░╚╝░╚╩╠▒▄╠Γ▒░░╠▓▒╠▒▒╠╠╩╬╬▒▒╩╠▒╩╩╬╬╠╠╩╬╩╬╬╬╬╩╬╬╩╬╬▓▓╬    //
//         ,░░░  "⌐   7   ^⌠ ~'╙░╚░∩└░7∩╔▓█████▒░░▒▒▓▓▄░Σ▒╚▒╙#▒▒▒Φ╙╠╙φ▒╠╙▒▒▒▒▒╙╠▒╬▒▒▒╬╠▒▒▒    //
//        , .░-  .░   j,   ╔≡  ;░[,░φ░Q╟███████░Θ▄▓█████▄▄▄▒╠▒╠╠▒▒╠╬▒Θ╠╬▒▒╠▒▓▓▓▓▓╬╫╬╠#╬╬╩╬    //
//        █╢µ░   "░ ▒╬▒##φ╗▒▄φ╥╦@▒▒╠╬╬╟██████████████████╬╬▒╬╠╬╣╬╬╬▓╣╬╣╬▓╬╫╬╬╣▓╣▓███▓▌╬φ╩▒    //
//        ░▄.╠~   ▒ ╫╟▒╢▒╠▒╠╬╬╬╬╬╬╬╬╬╬╣██████████████████╬╣▓╠╬╬╬╣╬╣╬╠╣╬╬╬╬╣╬╬╢╬╬╣╫╬▓╣▒╬╬▒▒    //
//        ░▓░╠Γ``░φ.╚▒▓▒╠╬╬▒╬╣╬╬╠╠╬╬╠╬╬██████████████████▓╬╬╠╬╬╫╬╬╬╬╣╣╬╬╬╬╬╬╬╬╬╬╬╬╣▒▓╠▒▒▒▒    //
//        ▒╬ ╚ '. ░;≤▓╠▒▒╠╠▒╠╠╬╢╬╬╬╬╠╠╢██████████▀▀███████╬╬╠╬╬╬╬╬╬╬╣╢╬╬╬╬▓╣╬╫╬╣╣╬╬▒▓╟╬╢╬╬    //
//        ▌╬▒╠░"^7╠╚,╫▒╬▒▒▒╠╠▒╠╩╝╠╬╠╬╬╣███████░░░░░╙╙░╠╬██▓╬╠╬╬╣╬╫╬╬╬╣╣╣▓▓╣▓▓▓▓╬╣╣▓╟╬╬╬╬╬╠    //
//        ▓▓▒╚░\\^╠░ⁿ╙▒╠╬╠╬╬╬╬╬╫╣╫╬╬╢▓██████████▓▓▓▓▓███████▓╬╬▓▓▓▓▓▓▓▓▓▓╣▓▓╬▓╣╢▓╬▓╫╝║╬╫╬╬    //
//        ╬▓▓▒▒░5"φδ"5╬▒▓╬╬╬╬╬╬╬╬╬╬╬╣╬██████████████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓╬╠╠╬▒╟    //
//        ▓██░░░∩░░░░ª╟╬╟╬╬╬╬╬╬╣╬╬╬╬╬╬██████▓╬╬╬╬╬╫╬╬╣███████▓▓▓▓▓█████▓▓▓▓▓╬▓▓▓╬╬▓▓╠░╠╬▒╩    //
//        ███░φ≥≥░░░░>"╬░╩▀▀▀▀▀▀▀▀╬╬╬▓█████▓▓▓▓╬▓╬╬╣▓▓▓████████████████▓███████▓██▓▓▄╣▓▓▓▓    //
//        ███░╠░="░░"=.╫▒▒φφ▒▒▒╬╣╣╣╣▓▓█████▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓▓▓███████████▓████████▓▓▓▓██    //
//        ██▓▌╬╬φ╔φφ╔ε░╫▓▓▓▓▓▓▓╬╬╬▓▓▓████████▓▓▓▓█████████████████████████████████████████    //
//        ██▓▌▒╠╬╝╫╢╠║╠╣██████████████████████████████████████████████████████████████████    //
//        ████▓▓▓▓▓▓▓▓╬╣███████████████████████████████▓█████████████████████████████▓██▓█    //
//        ███▓╬▓╬╬╬╬╬╩╠╟▌██████████████████████████████╝██▀▀█████████████████████▓▓▓╣▓▓▓▓▓    //
//        ██▓╬╬╬╬▒▒╣▒╠╠╟██▓▓████████████▒╬████████▓▓▓▓▓▓φ╬▓╬▓▓╬╬╬╣╢╬╬╬╬╬╬╬╬╬╣╬╬╣╬╬╣╬╣╫╣▓╬╬    //
//        ▓▓▓╬▓╬╬╬╣╣╬╠▒╣▓▓╬▓▓▓▓▓▓╫╣╫╬╬╬╣╣╬╬╬╬╬╬╬╬╬╬╬╬╣╬╣╬╬╬╬╬╬╬╬╬╬╣▓▓▓╣╬╬╣╬╬╬╬╣╬╬╬╣╬╬╬╣╣▓▓    //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract MDPR is ERC1155Creator {
    constructor() ERC1155Creator("Mike Daley Presents:", "MDPR") {}
}