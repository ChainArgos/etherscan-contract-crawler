// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

import "../IERC1155.sol";
import "../IERC1155Receiver.sol";
import "./ERC1155BaseInternal.sol";

/**
 * @title Base ERC1155 contract
 * @dev derived from https://github.com/OpenZeppelin/openzeppelin-contracts/ (MIT license)
 */
contract ERC1155Base is IERC1155, ERC1155BaseInternal {
    /**
     * @inheritdoc IERC1155
     */
    function balanceOf(address account, uint256 id) public view virtual returns (uint256) {
        return _balanceOf(account, id);
    }

    /**
     * @inheritdoc IERC1155
     */
    function balanceOfBatch(address[] memory accounts, uint256[] memory ids)
        public
        view
        virtual
        returns (uint256[] memory)
    {
        require(accounts.length == ids.length, "ERC1155: accounts and ids length mismatch");

        mapping(uint256 => mapping(address => uint256)) storage balances = ERC1155BaseStorage.layout().balances;

        uint256[] memory batchBalances = new uint256[](accounts.length);

        unchecked {
            for (uint256 i; i < accounts.length; i++) {
                require(accounts[i] != address(0), "ERC1155: batch balance query for the zero address");
                batchBalances[i] = balances[ids[i]][accounts[i]];
            }
        }

        return batchBalances;
    }

    /**
     * @inheritdoc IERC1155
     */
    function isApprovedForAll(address account, address operator) public view virtual returns (bool) {
        return ERC1155BaseStorage.layout().operatorApprovals[account][operator];
    }

    /**
     * @inheritdoc IERC1155
     */
    function setApprovalForAll(address operator, bool status) public virtual {
        address sender = _msgSender();
        require(sender != operator, "ERC1155: setting approval status for self");
        ERC1155BaseStorage.layout().operatorApprovals[sender][operator] = status;
        emit ApprovalForAll(sender, operator, status);
    }

    /**
     * @inheritdoc IERC1155
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) public virtual {
        address sender = _msgSender();
        require(from == sender || isApprovedForAll(from, sender), "ERC1155: caller is not owner nor approved");
        _safeTransfer(sender, from, to, id, amount, data);
    }

    /**
     * @inheritdoc IERC1155
     */
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) public virtual {
        address sender = _msgSender();
        require(from == sender || isApprovedForAll(from, sender), "ERC1155: caller is not owner nor approved");
        _safeTransferBatch(sender, from, to, ids, amounts, data);
    }
}