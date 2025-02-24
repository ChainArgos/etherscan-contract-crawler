// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

//import "../_external/IWETH.sol";

import "../IUSDI.sol";

import "./IVault.sol";
import "./IVaultController.sol";
import "./VotingVaultController.sol";

import "../_external/CompLike.sol";
import "../_external/IERC20.sol";
import "../_external/Context.sol";
import "../_external/openzeppelin/SafeERC20Upgradeable.sol";

import "../_external/balancer/IGauge.sol";

contract VaultBPT is Context {
  using SafeERC20Upgradeable for IERC20;

  /// @title VaultInfo struct
  /// @notice This vault holds the underlying token
  /// @notice The Capped token is held by the parent vault
  /// @notice Withdrawls must be initiated by the withdrawErc20() function on the parent vault

  /// @notice this struct is used to store the vault metadata
  /// this should reduce the cost of minting by ~15,000
  /// by limiting us to max 2**96-1 vaults
  struct VaultInfo {
    uint96 id;
    address vault_address;
  }
  /// @notice Metadata of vault, aka the id & the minter's address
  VaultInfo public _vaultInfo;

  VotingVaultController public _votingController;
  IVaultController public _controller;

  /// @notice checks if _msgSender is the controller of the voting vault
  modifier onlyVotingVaultController() {
    require(_msgSender() == address(_votingController), "sender not VotingVaultController");
    _;
  }
  /// @notice checks if _msgSender is the controller of the vault
  modifier onlyVaultController() {
    require(_msgSender() == address(_controller), "sender not VaultController");
    _;
  }
  /// @notice checks if _msgSender is the minter of the vault
  modifier onlyMinter() {
    require(_msgSender() == IVault(_vaultInfo.vault_address).minter(), "sender not minter");
    _;
  }

  /// @notice must be called by VotingVaultController, else it will not be registered as a vault in system
  /// @param id_ is the shared ID of both the voting vault and the standard vault
  /// @param vault_address address of the vault this is attached to
  /// @param controller_address address of the vault controller
  /// @param voting_controller_address address of the voting vault controller
  constructor(
    uint96 id_,
    address vault_address,
    address controller_address,
    address voting_controller_address
  ) {
    _vaultInfo = VaultInfo(id_, vault_address);
    _controller = IVaultController(controller_address);
    _votingController = VotingVaultController(voting_controller_address);
  }

  function parentVault() external view returns (address) {
    return address(_vaultInfo.vault_address);
  }

  /// @notice id of the vault
  /// @return address of minter
  function id() external view returns (uint96) {
    return _vaultInfo.id;
  }

  ///@notice claim rewards to external wallet
  ///todo TX: https://etherscan.io/tx/0x4d5950df8da6b93a435a9b9762a3e54745bc4e67adbfcab3ebf459beb9baaf52
  function claimRewards(address recipient, IGauge gauge) external onlyMinter {
    gauge.claim_rewards(recipient);
  }

  /// @notice function used by the VaultController to transfer tokens
  /// callable by the VaultController only
  /// not currently in use, available for future upgrades
  /// @param _token token to transfer
  /// @param _to person to send the coins to
  /// @param _amount amount of coins to move
  function controllerTransfer(
    address _token,
    address _to,
    uint256 _amount
  ) external onlyVaultController {
    SafeERC20Upgradeable.safeTransfer(IERC20Upgradeable(_token), _to, _amount);
  }

  /// @notice function used by the VotingVaultController to transfer tokens
  /// callable by the VotingVaultController only
  /// @param _token token to transfer
  /// @param _to person to send the coins to
  /// @param _amount amount of coins to move
  function votingVaultControllerTransfer(
    address _token,
    address _to,
    uint256 _amount
  ) external onlyVotingVaultController {
    SafeERC20Upgradeable.safeTransfer(IERC20Upgradeable(_token), _to, _amount);
  }
}