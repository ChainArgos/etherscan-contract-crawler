// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";
import "@openzeppelin/contracts/utils/Multicall.sol";
import "@openzeppelin/contracts/metatx/ERC2771Context.sol";

contract SparkbloxRegistry is Multicall, ERC2771Context, AccessControlEnumerable {
    bytes32 public constant OPERATOR_ROLE = keccak256("OPERATOR_ROLE");

    using EnumerableSet for EnumerableSet.AddressSet;
    using EnumerableSet for EnumerableSet.UintSet;

    mapping(address => mapping(uint256 => EnumerableSet.AddressSet)) private deployments;

    EnumerableSet.UintSet private chainIds;
    
    struct Deployment {
        address deploymentAddress;
        uint256 chainId;
    }

    event Added(address indexed deployer, address indexed deployment, uint256 indexed chainId);
    event Deleted(address indexed deployer, address indexed deployment, uint256 indexed chainId);

    constructor(address _trustedForwarder) ERC2771Context(_trustedForwarder) {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function add(
        address _deployer,
        address _deployment,
        uint256 _chainId
    ) external {
        require(hasRole(OPERATOR_ROLE, _msgSender()) || _deployer == _msgSender(), "not operator or deployer.");

        bool added = deployments[_deployer][_chainId].add(_deployment);
        require(added, "failed to add");

        chainIds.add(_chainId);

        emit Added(_deployer, _deployment, _chainId);
    }

    function remove(
        address _deployer,
        address _deployment,
        uint256 _chainId
    ) external {
        require(hasRole(OPERATOR_ROLE, _msgSender()) || _deployer == _msgSender(), "not operator or deployer.");

        bool removed = deployments[_deployer][_chainId].remove(_deployment);
        require(removed, "failed to remove");

        emit Deleted(_deployer, _deployment, _chainId);
    }

    function getAll(address _deployer) external view returns (Deployment[] memory allDeployments) {
        uint256 totalDeployments;
        uint256 chainIdsLen = chainIds.length();

        for (uint256 i = 0; i < chainIdsLen; i += 1) {
            uint256 chainId = chainIds.at(i);

            totalDeployments += deployments[_deployer][chainId].length();
        }

        allDeployments = new Deployment[](totalDeployments);
        uint256 idx;

        for (uint256 j = 0; j < chainIdsLen; j += 1) {
            uint256 chainId = chainIds.at(j);

            uint256 len = deployments[_deployer][chainId].length();
            address[] memory deploymentAddrs = deployments[_deployer][chainId].values();

            for (uint256 k = 0; k < len; k += 1) {
                allDeployments[idx] = Deployment({ deploymentAddress: deploymentAddrs[k], chainId: chainId });
                idx += 1;
            }
        }
    }

    function count(address _deployer) external view returns (uint256 deploymentCount) {
        uint256 chainIdsLen = chainIds.length();

        for (uint256 i = 0; i < chainIdsLen; i += 1) {
            uint256 chainId = chainIds.at(i);

            deploymentCount += deployments[_deployer][chainId].length();
        }
    }

    function _msgSender() internal view virtual override(Context, ERC2771Context) returns (address sender) {
        return ERC2771Context._msgSender();
    }

    function _msgData() internal view virtual override(Context, ERC2771Context) returns (bytes calldata) {
        return ERC2771Context._msgData();
    }
}