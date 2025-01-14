// SPDX-License-Identifier: MIT

//                                                                                                                        
//                                                                                                                        
//                                                                                                                        
//                                                                                                                        
//                                                                                                                        
//                                                                                                 .                      
//                                                                                             #@#&&%&@@@@                
//                                                                                           .##(((((###%%%&@@&           
//                                                                                         &((((////*  /(###%%%&@&&%@     
//                                             , ,%@@&&&&%@@@/                         .%(((((*,(/       ,((####%%%%&/    
//                ,,.                      ./.&%%#%%#((((((((##%%@..                  #((((((. ..,******    /(######&,    
//               @&&&&&&@@@*              &@%##/(///////////////((#&%@ @@#,./%%%&&&&#/  *((.  *******/     ,*(######&     
//              @&&&&&%%%%%%%&@@       .(@&#((///, (#%(*.   .*(/, //(#%./(####(###########/,.******///      ((((((#((#    
//            [email protected]&&&&%##((((((###@      &@&#((/ &&(,#%#*/#/.   ./(/  //(# (((//#######%&@# ,(((///*             *(((((%    
//            @&&&%##((. /////((#&*.   @%((( &*&%.&%. ,*/*.  *(##( /# /( *(.,#%%###%&@@&/.,(#%/,.(                .((%    
//          ,@&&%##(((  .,/ ,//(((((% @.#((/*#./#.,#@@@@@@&&&&&((,/% /./( ((((,      ,/(((((##& %,                   #    
//         @%%%%#((((  ./****. //((.&((#(((/% #.(@@@@@@@@%######@&((., /(( %&*/.     &&&&&%%%#  (%                    %   
//        %&%%##((((/ ./******. // ,#,##((#/,(,%@@@@&@#&( . ,,./((##(..//(.&  .  &@   %%%%%%%%%%&%,/                      
//        @%###((((   ,/*******/ . ###(((.((. #@@@@@&/,. ../,.   *(#%*,////&         #########%%/%,%                      
//       %%###((*          *****/.%&&#####*(   &%%#.   .,/(((///*////( //(#      .*((*   .(#((*.#%%%                      
//       @###(            .//***. @@%%#####((*#####%%%%%%###((//////*,(###%%%(((/(##########(( *%%%/#@                    
//       @## ,                *#/@%%%%%%####(##*,##/##/#%&@@&%/*#/ .(%(%%%%%%%%%%%. ,**/#%#(*#%%%%#(%&&&                  
//       #                    &#/%%%%%%%%%%%%%%%**##%%%%%%%%%%/#%%%%%%%#/*,,........,/#%%%%%%%%%%%%#%#&&&                 
//      ,                   ,&%%%#%%%%%%%%%%%%%%%%%%##*..         .***/########%%%%%%%%#((((##((/. .#%%&@                 
//                          ,@%&##&%%%%%,(/%/     /##%%%%&&&%#(/////***************************//(&@##/ %#                
//                          %&&&/#&,( % .*#%&#@#((///******************,.      ,.          ,,,,, ,***/#/ #                
//                          .&%&..# *&%%#((//********,                                        .    .,*///                 
//                           .#%  &@&&//*******.            ,*...,.**.*,, .    .          .  .  * ** */*                  
//                            .# /(@**,.*,   .,,,. ,. ,. , ,/(((((((((((((((. //((((/*(/       *.***** /                  
//                              ,,/**,, ,   **,..*.,*.. ,*,,./(((((((((((((((///((((((((( ,* ,,****, /,                   
//                                 /****//,  .,.,,.*.,,.*,.,,,..((((((((((((((/((((((((( ,  *****,  / .                   
//                                   /****/#///    .,*,..***..*, ((((((((((((((((((((   .*(/**, .*                        
//                                     . ,*******(#(////((((((((((/,,**/////*//((((((//***.                               
//                                             *,  ,********************************,   *.                                
//                                                 */ */**    .,***,,.         ....,.                                     
//                                                    ,    ,****,..           .      %/%(,                                
//                                                  / %##*           .,*,..,* ,. .#(*  */(###@,                           
//                                              #@%#/@&&%#((/***,  ,*,((%(/**   *##(/* *****/(#&(                         
//                                            @&&(**,(#&&##(((.***,****(((/** ,.###(** ********,/(@                       
//                                         /&%@/*,*** #%%#(((((( /**,***/(/*,.,(###/****************//@,                  
//                                       /%##(/,****, (*(((((((((/.*********, */ */,*************,,,,***/(%@@@%           
//                                     ,*/(((/*,*******  .,,*****.***,*,,,,, ******/./&@&%######(/(@&******/(%,*/#        
//                              .  (##(/***********,./%&@&&&&&&&%%##(((//,*,,* %/(####((((((((((((/**,****//(((///%,      
//                         &@&%%#(//.,#@%%%&%**/&&&###((((////////////((((/****////////(##(//////*******///(##%%##(/(,    
//                     #@%%#(((&%#/%/(###(((/.(/////****/////////*/*********,,,//((((((((((((((((/*,***,///((#####(,/(.   
//                   @%#(/*&&%%#((/(////**,***/#%##%##%&&%%%########(((//*.,***.*/(%(((#####%%((((/**,***/(((((###(//(&   

pragma solidity ^0.8.17;

import "erc721a/contracts/extensions/ERC721AQueryable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import {UpdatableOperatorFilterer} from "operator-filter-registry/src/UpdatableOperatorFilterer.sol";
import {RevokableDefaultOperatorFilterer} from "operator-filter-registry/src/RevokableDefaultOperatorFilterer.sol";

contract Peepee is ERC721AQueryable, Ownable, RevokableDefaultOperatorFilterer {

    address public burnContract;
    string public _metadata = "ipfs://QmWTL2jFwRgzHWYiv7Y7dQKyMtWxTaWQh9ywJXtNQSsHUV/";
    uint256 public tokens = 690;
    bool public burnActive = false;

    constructor() ERC721A("PEEPEE", "PEEPEE") {}

    function airdrop(address[] calldata _wallet) public onlyOwner {
        require(totalSupply() + _wallet.length <= tokens);
        for(uint256 i = 0; i < _wallet.length; i++)
            _mint(_wallet[i], 1);
    }

    function burn(uint256 tokenId) external {
        require(burnActive);
        require(msg.sender == burnContract);
        _burn(tokenId);        
    }

    function setBurn(address _burnContract, bool _status) public onlyOwner {
        burnContract = _burnContract;
        burnActive = _status;
    }

    function _baseURI() internal view virtual override returns(string memory) {
        return _metadata;
    }

    function updateMetadata(string memory _uri) external onlyOwner {
        _metadata = _uri;
    }

    function withdraw() public payable onlyOwner {
        (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(success);
    }

    function setApprovalForAll(
        address operator,
        bool approved
    ) public override(IERC721A, ERC721A) onlyAllowedOperatorApproval(operator) {
        super.setApprovalForAll(operator, approved);
    }

    function approve(
        address operator,
        uint256 tokenId
    ) public payable override(IERC721A, ERC721A) onlyAllowedOperatorApproval(operator) {
        super.approve(operator, tokenId);
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public payable override(IERC721A, ERC721A) onlyAllowedOperator(from) {
        super.transferFrom(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public payable override(IERC721A, ERC721A) onlyAllowedOperator(from) {
        super.safeTransferFrom(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public payable override(IERC721A, ERC721A) onlyAllowedOperator(from) {
        super.safeTransferFrom(from, to, tokenId, data);
    }

    function owner() public view override(Ownable, UpdatableOperatorFilterer) returns (address) {
        return Ownable.owner();
    }

}