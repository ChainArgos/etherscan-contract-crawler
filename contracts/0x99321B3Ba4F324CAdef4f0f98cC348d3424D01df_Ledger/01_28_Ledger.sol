// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

/// @title: Ledger
/// @author: x0r - Michael Blau

import {LicenseVersion, CantBeEvil} from "@a16z/contracts/licenses/CantBeEvil.sol";
import {ERC721Creator} from "@manifoldxyz/creator-core-solidity/contracts/ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//    ....................................................................................................    //
//    ....................................................................................................    //
//    ....................................................................................................    //
//    ........................................;++*!!????????!!**+;;.......................................    //
//    .................................;+*?%$&&0101010101010101010&@$?*+;.................................    //
//    .............................;*?$&10101010101010101010101010101010&@?*;.............................    //
//    ..........................+!$&[email protected]?+;.........................    //
//    [email protected]0101010101&%+.......................    //
//    ....................;*$0101010101010101010101&&&@@@@&&&[email protected]?;....................    //
//    ..................;?&0101010101010101&@%?!*+;;.........;;+*?%@&0101010101010101&%+..................    //
//    ................;?&[email protected]%!+;.....*????????????!.....;+*%@010101010101010%+................    //
//    ...............!&[email protected];.........;*%&1010101010101%;..............    //
//    [email protected]@!;.............$0101010101010;............;*$101010101010&!.............    //
//    ............?101010101010%+................$1010101010101;...............;?&01010101010$;...........    //
//    ..........;$10101010101%+..................$0101010101010;.................;!&1010101010&*..........    //
//    .........+&1010101010$+....................$1010101010101;...................;?01010101010!.........    //
//    ........*&101010101&*......................$0101010101010;.....................+$1010101010?........    //
//    .......*1010101010$;.......................$1010101010101;.......................?0101010101?.......    //
//    ......+&010101010?.........................$1010101010101;........................*&010101010!......    //
//    .....;@101010101!..........................$0101010101010;.........................+&101010101*.....    //
//    .....%010101010!...........................$1010101010101;..........................+&01010101&;....    //
//    ....*010101010%............................$1010101010101;...........................*010101010?....    //
//    [email protected]@;............................$1010101010101;............................%010101010+...    //
//    ...*101010101*.............................$0101010101010;............................;&10101010%...    //
//    ...$10101010$..............................$101010101010&;.............................!10101010&;..    //
//    ..;&10101010*..+***************************@1010101010101!***************************..;&01010101*..    //
//    ..+01010101&;..%01010101010101010101010101010101010101010101010101010101010101010101&...$01010101?..    //
//    [email protected]%01010[email protected]...?01010101$..    //
//    ..?01010101%...%01010[email protected]...*[email protected]    //
//    ..?01010101%...%01010[email protected]...*[email protected]    //
//    ..?01010101%...%01010[email protected][email protected]    //
//    [email protected]%01010[email protected]...?01010101$..    //
//    ..+01010101&;..%01010[email protected]...$01010101?..    //
//    ..;&01010101!..;[email protected]*+++++++++++++++++++++++++++..;101010101*..    //
//    ...%[email protected]$0101010101010;.............................?10101010&;..    //
//    ...*101010101*.............................$0101010101010;............................;&10101010?...    //
//    ....$10101010&;............................$1010101010101;............................%01010101&;...    //
//    ....+010101010%............................$1010101010101;...........................!010101010?....    //
//    .....?101010101?...........................$0101010101010;..........................*[email protected];....    //
//    .....;@010101010?..........................$1010101010101;.........................*0101010101+.....    //
//    ......;&010101010%;........................$1010101010101;........................!0101010101*......    //
//    .......+&[email protected]+.......................$1010101010101;......................;%0101010101!.......    //
//    ........+&010101010&!......................$1010101010101;.....................*@0101010101!........    //
//    [email protected]@*....................$0101010101010;...................;%10101010101*.........    //
//    ..........;%01010101010$+..................$1010101010101;.................;?&[email protected]+..........    //
//    ............!&01010101010$*;...............$1010101010101;...............+%&01010101010%;...........    //
//    .............+$101010101010&?+.............$1010101010101;............;[email protected]@*.............    //
//    ...............*@[email protected]?*;[email protected];........;+?$0101010101010&?;..............    //
//    ................;[email protected]&$?*+;....+!*!!!!!!!!!**.....;*!$&10101010101010&?;................    //
//    ..................;[email protected]&$%?!*+;;;....;;;++*?%[email protected]&?;..................    //
//    .....................*%&10101010101010101010101&&&&&&010101010101010101010101$!;....................    //
//    .......................;!$&[email protected]?+.......................    //
//    ..........................;*%@1010101010101010101010101010101010101010&$!+..........................    //
//    ..............................+!%@&[email protected]$!+;.............................    //
//    ..................................;+!?%@&&0101010101010101&&@$%!*;..................................    //
//    .........................................;++**!!!!!!!!**++;;........................................    //
//    ....................................................................................................    //
//    ....................................................................................................    //
//    ....................................................................................................    //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

contract Ledger is ERC721Creator, CantBeEvil(LicenseVersion.PUBLIC){ 

    constructor() ERC721Creator("Ledger", "LDGR") {}

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721Creator, CantBeEvil) returns (bool) {
        return ERC721Creator.supportsInterface(interfaceId) || CantBeEvil.supportsInterface(interfaceId);
    }

}