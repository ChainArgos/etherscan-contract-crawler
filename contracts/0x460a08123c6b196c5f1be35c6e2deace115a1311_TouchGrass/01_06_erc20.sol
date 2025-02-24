// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TouchGrass is ERC20, Ownable {

    uint256 private TEAM_WALLET_PERCENTAGE = 45;
    uint256 private MARKET_WALLET_PERCENTAGE = 49;
    uint256 private TOTAL_SUPPLY = 360_000_000_000 ether;    
    bool private _limitBuyEnabled = true;
    uint256 private _maxWalletPercentage = 5;
    uint256 private _maxTransferPercentage = 4;
    address private _uniswapPair;
    address private _teamAddress;
    address private _marketingAddress;
    bool private _constructionPhase;

    constructor(address teamAddress, address marketAddress) ERC20("Touch Grass", "TOUCHGRASS") {

        _constructionPhase = true;
        uint256 devFee = (TOTAL_SUPPLY * TEAM_WALLET_PERCENTAGE) / 1000;
        uint256 marketingFee = (TOTAL_SUPPLY * MARKET_WALLET_PERCENTAGE) / 1000;
        _marketingAddress = marketAddress;
        _teamAddress = teamAddress;
        _mint(teamAddress, devFee);
        _mint(marketAddress, marketingFee);
        _mint(msg.sender, TOTAL_SUPPLY - devFee - marketingFee);
        _constructionPhase = false;
    }    

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) override internal virtual {

        if(_constructionPhase){
            return;
        }

        if(_ownerAddress(from, to)){
            return;
        }

        if (_uniswapPair == address(0)) {
            require(_ownerAddress(from, to), "Contract not active");
            return;
        }

        bool buy = _isUniswap(from);
        bool sell = _isUniswap(to);

        if (_limitBuyEnabled && (buy || sell)){
            uint256 maxWhaleTransferAllowance = (TOTAL_SUPPLY * _maxTransferPercentage) / 100;
            require(amount <= maxWhaleTransferAllowance, "Buy or sell amount to high");
        }
        
        if(_limitBuyEnabled && buy){
            uint256 whaleMaxWalletAllowance = (TOTAL_SUPPLY * _maxWalletPercentage) / 100;
            require(super.balanceOf(to) + amount <= whaleMaxWalletAllowance, "Wallet holds to many coins");
        }
    }

    function setMaxBuy(uint256 maxWalletPercentage, uint256 maxTransferPercentage) external onlyOwner {
        _maxTransferPercentage = maxTransferPercentage;
        _maxWalletPercentage = maxWalletPercentage;
    }

    function setUniswapPair(address uniswapPair) external onlyOwner {
        _uniswapPair = uniswapPair;
    }

    function disableLimitBuy() external onlyOwner {
        _limitBuyEnabled = false;
    }

    function _isUniswap(address pair) private view returns (bool) {
        return pair == _uniswapPair;
    }

    function _ownerAddress(address from, address to) private view returns (bool) {
        return from == owner() || to == owner() || from == _marketingAddress || to == _marketingAddress || from == _teamAddress || to == _teamAddress;
    }
}