// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "./Itp20.sol";
import "./ItpDetails.sol";
import "./IItpDesign.sol";
import "./IOracle.sol";

contract ItpTokenV2 is ERC721Upgradeable, AccessControlUpgradeable, PausableUpgradeable, UUPSUpgradeable {
  struct CreateTokenRequest {
    // Use with Chainlink VRF.
    // bytes32 requestId; // For Chainlink VRF request ID.
    // uint32 orderId; // Differentiate with other requests with the same request ID.

    uint256 targetBlock; // Use future block.
    uint16 count; // Amount of tokens to mint.
    uint8 rarity; // 0: random rarity, 1 - 6: specified rarity.
  }

  using Counters for Counters.Counter;
  using ItpDetails for ItpDetails.Details;

  // Use with Chainlink VRF.
  // event TokenCreateRequested(bytes32 requestId);
  // event TokenCreateFulfilled(bytes32 requestId);
  
  event TokenCreateRequested(address to, uint256 block);
  event TokenProcessed(address to, uint256 tokenId, uint256 details, bool burned);

  bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
  bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
  bytes32 public constant UPGRADER_ROLE = keccak256("UPGRADER_ROLE");
  bytes32 public constant DESIGNER_ROLE = keccak256("DESIGNER_ROLE");
  bytes32 public constant CLAIMER_ROLE = keccak256("CLAIMER_ROLE");
  bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
  bytes32 public constant TRADER_ROLE = keccak256("TRADER_ROLE");

  // Use with Chainlink VRF.
  // bytes32 public constant RANDOM_CREATOR_ROLE = keccak256("RANDOM_CREATOR_ROLE");
  // bytes32 public constant RANDOM_GENERATOR_ROLE = keccak256("RANDOM_GENERATOR_ROLE");

  uint256 private constant maskLast8Bits = uint256(0xff);
  uint256 private constant maskFirst248Bits = ~uint256(0xff);

  IItp20 public token; 
  Counters.Counter public tokenIdCounter;

  address public treasuryWallet;
  string public baseUri;

  IOracle public oracle;

  // Mapping from owner address to token ID.
  mapping(address => uint256[]) public tokenIds;

  // Mapping from token ID to token details.
  mapping(uint256 => uint256) public tokenDetails;

  // Mapping from owner address to claimable token count.
  mapping(address => mapping(uint256 => uint256)) public claimableTokens;

  // Mapping from owner address to token requests.
  mapping(address => CreateTokenRequest[]) public tokenRequests;

  IItpDesign public design;

  // Use with Chainlink VRF.
  // IRandomGenerator public randomGenerator;

  function initialize(address _design, address _oracle, address _token, address _treasury, string memory _baseUri) public initializer {
    __ERC721_init("IdleTreasureParty", "PARTY"); 
    __AccessControl_init();
    __Pausable_init();
    __UUPSUpgradeable_init();

    baseUri = _baseUri;

    token = IItp20(_token); 
    oracle = IOracle(_oracle); 
    design = IItpDesign(_design);
    treasuryWallet = _treasury;
    
    _setupRole(ADMIN_ROLE, msg.sender);
    _setupRole(PAUSER_ROLE, msg.sender);
    _setupRole(UPGRADER_ROLE, msg.sender);
    _setupRole(DESIGNER_ROLE, msg.sender);
    _setupRole(CLAIMER_ROLE, msg.sender);
    _setupRole(BURNER_ROLE, msg.sender);
    _setupRole(TRADER_ROLE, msg.sender);

    // Use with Chainlink VRF.
    // _setupRole(RANDOM_CREATOR_ROLE, msg.sender);
  }

  function pause() public onlyRole(PAUSER_ROLE) {
    _pause();
  }

  function unpause() public onlyRole(PAUSER_ROLE) {
    _unpause();
  }

  function _authorizeUpgrade(address newImplementation) internal override onlyRole(UPGRADER_ROLE) {}

  function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721Upgradeable, AccessControlUpgradeable)
    returns (bool)
  {
    return super.supportsInterface(interfaceId);
  }

  function withdraw() external onlyRole(ADMIN_ROLE) {
    token.transfer(msg.sender, token.balanceOf(address(this)));
    payable(address(msg.sender)).transfer(address(this).balance);
  }

  /** Burns a list of heroes. */
  function burn(uint256[] memory ids) external onlyRole(BURNER_ROLE) {
    for (uint256 i = 0; i < ids.length; ++i) {
      _burn(ids[i]);
      emit TokenProcessed(msg.sender, ids[i], tokenDetails[ids[i]],true);
    }
  }

  function setCommonURI(string memory _baseUri) external onlyRole(UPGRADER_ROLE) {
    baseUri = _baseUri;
  }

  function _baseURI() internal view virtual override(ERC721Upgradeable) returns (string memory) {
    return baseUri;
  }

  // Use with Chainlink VRF.
  /** Sets the random generator. */
  // function createRandomGenerator() external onlyRole(RANDOM_CREATOR_ROLE) {
  //   randomGenerator = new RandomGenerator();
  //   _setupRole(RANDOM_GENERATOR_ROLE, address(randomGenerator));
  // }

  /** Sets the design. */
  function setDesign(address contractAddress) external onlyRole(DESIGNER_ROLE) {
    design = IItpDesign(contractAddress);
  }

  function setOracle(address contractAddress) external onlyRole(UPGRADER_ROLE) {
    require(contractAddress != address(0), "Invalid oracle address");
    require(contractAddress != address(oracle), "Oracle address is the same");
    oracle = IOracle(contractAddress);
  }

  function setTreasuryWallet(address wallet) external onlyRole(UPGRADER_ROLE) {
    require(wallet != address(0), "ItpToken: treasury wallet is the zero address");
    require(wallet != treasuryWallet, "ItpToken: treasury wallet is the same");
    treasuryWallet = wallet;
  }

  function setTokenContract(address contractAddress) external onlyRole(UPGRADER_ROLE) {
    require(contractAddress != address(0), "Invalid token address");
    require(contractAddress != address(token), "Token address is the same");
    token = IItp20(contractAddress);
  }

  /** Gets token details for the specified owner. */
  function getTokenDetailsByOwner(address to) external view returns (uint256[] memory) {
    uint256[] storage ids = tokenIds[to];
    uint256[] memory result = new uint256[](ids.length);
    for (uint256 i = 0; i < ids.length; ++i) {
      result[i] = tokenDetails[ids[i]];
    }
    return result;
  }

  struct Recipient {
    address to;
    uint256 count;
  }

  /** Increase claimable tokens. */
  function increaseClaimableTokens(Recipient[] memory recipients, uint256 rarity) external onlyRole(CLAIMER_ROLE) {
    for (uint256 i = 0; i < recipients.length; ++i) {
      claimableTokens[recipients[i].to][rarity] += recipients[i].count;
    }
  }

  function decreaseClaimableTokens(Recipient[] memory recipients, uint256 rarity) external onlyRole(CLAIMER_ROLE) {
    for (uint256 i = 0; i < recipients.length; ++i) {
      claimableTokens[recipients[i].to][rarity] -= recipients[i].count;
    }
  }

  function getClaimableTokens(address to) external view returns (uint256) {
    uint256 result;
    for (uint256 i = 0; i <= 6; ++i) {
      result += claimableTokens[to][i];
    }
    return result;
  }

  /** Claims tokens. */
  function claim() external { 
    // Check limit.
    address to = msg.sender;
    uint256 size = tokenIds[to].length;
    uint256 limit = design.getTokenLimit();
    require(size < limit, "User limit reached");

    mapping(uint256 => uint256) storage tokens = claimableTokens[to];
    for (uint256 rarity = 0; rarity <= 6; ++rarity) {
      uint256 mintCount = tokens[rarity];
      if (mintCount == 0) {
        continue;
      }
      requestCreateToken(to, mintCount, rarity);
      tokens[rarity] -= mintCount;
    }
  }

  function getTokenCost(uint256 count) external view returns (uint256) {
    uint256 amount = design.getMintCost() * count;
    return amount;
  }

  function getBNBCost(uint256 count) external view returns (uint256) {
    uint256 bnbAmount = oracle.getNFTPrice(design.getMintCostBNB() * count);
    return bnbAmount;
  }

  /** Mints tokens. */
  function mint(uint256 count) payable external {
    require(count > 0, "No token to mint"); 

    // Check limit.
    address to = msg.sender;
    require(tokenIds[to].length + count <= design.getTokenLimit(), "User limit reached");

    // Transfer coin token.
    uint256 amount = design.getMintCost() * count;
    uint256 bnbAmount = oracle.getNFTPrice(design.getMintCostBNB() * count);
    require(msg.value >= bnbAmount, "Insufficient BNB");
    
    payable(treasuryWallet).transfer(bnbAmount);
    payable(msg.sender).transfer(msg.value - bnbAmount);

    token.transferFrom(to, address(this), amount);

    // Create requests.
    requestCreateToken(to, count, ItpDetails.ALL_RARITY);
  }

  function airdrop(address[] memory recipients, uint256[] memory counts) external onlyRole(ADMIN_ROLE) {
    require(recipients.length == counts.length, "Invalid recipients or counts");
    uint256 limit = design.getTokenLimit();    
    for (uint256 i = 0; i < recipients.length; ++i) {
      address to = recipients[i];
      uint256 count = counts[i];
      uint256 size = tokenIds[to].length;
      count = (size + count) > limit ? limit - size : count;
      if (count > 0) {
        requestCreateToken(to, count, ItpDetails.ALL_RARITY);
      }
    }
  }

  /** Requests a create token request. */
  function requestCreateToken(
    address to,
    uint256 count,
    uint256 rarity
  ) internal {
    // Use with Chainlink VRF.
    // Request randomness.
    // bytes32 requestId;
    // uint256 orderId;
    // (requestId, orderId) = randomGenerator.requestRandom();

    // Create request.
    uint256 targetBlock = block.number + 5;
    tokenRequests[to].push(CreateTokenRequest(targetBlock, uint16(count), uint8(rarity)));

    // Use with Chainlink VRF.
    // emit TokenCreateRequested(requestId);

    emit TokenCreateRequested(to, targetBlock);
  }

  // Use with Chainlink VRF.
  /** Called by random generator. */
  // function requestRandomFulfilled(bytes32 requestId) external override onlyRole(RANDOM_GENERATOR_ROLE) {
  //   emit TokenCreateFulfilled(requestId);
  // }

  /** Gets the number of tokens that can be processed at the moment. */
  function getPendingTokens(address to) external view returns (uint256) {
    uint256 result;
    CreateTokenRequest[] storage requests = tokenRequests[to];
    for (uint256 i = 0; i < requests.length; ++i) {
      CreateTokenRequest storage request = requests[i];
      if (block.number > request.targetBlock) {
        result += request.count;
      } else {
        break;
      }
    }
    return result;
  }

  /** Gets the number of tokens that can be processed.  */
  function getProcessableTokens(address to) external view returns (uint256) {
    uint256 result;
    CreateTokenRequest[] storage requests = tokenRequests[to];
    for (uint256 i = 0; i < requests.length; ++i) {
      result += requests[i].count;
    }
    return result;
  }

  /** Processes token requests. */
  function processTokenRequests() external {  
    address to = msg.sender;
    uint256 size = tokenIds[to].length;
    uint256 limit = design.getTokenLimit(); 
    require(size < limit, "User limit reached");

    uint256 available = limit - size;
    CreateTokenRequest[] storage requests = tokenRequests[to];
    for (uint256 i = requests.length; i > 0; --i) {
      CreateTokenRequest storage request = requests[i - 1];

      uint256 targetBlock = request.targetBlock;
      require(block.number > targetBlock, "Target block not arrived");
      uint256 seed = uint256(blockhash(targetBlock));
      uint256 rarity = request.rarity;
      if (seed == 0) {
        if (rarity == ItpDetails.ALL_RARITY) {
          // Expired, forced common.
          rarity = 1;
        }

        // Re-roll seed.
        targetBlock = (block.number & maskFirst248Bits) + (targetBlock & maskLast8Bits); 
        if (targetBlock >= block.number) {
          targetBlock -= 256;
        }
        seed = uint256(blockhash(targetBlock)); 
      }

      if (available < request.count) {
        request.count -= uint16(available);
        createToken(to, available, rarity, seed);
        break;
      }
      available -= request.count;
      createToken(to, request.count, rarity, seed);
      requests.pop();
      if (available == 0) {
        break;
      }
    }
  }

  /** Processes token requests. */
  function processTokenRequestsTo(address to) external onlyRole(ADMIN_ROLE){  
    uint256 size = tokenIds[to].length;
    uint256 limit = design.getTokenLimit(); 
    require(size < limit, "User limit reached");

    uint256 available = limit - size;

    CreateTokenRequest[] storage requests = tokenRequests[to];
    for (uint256 i = requests.length; i > 0; --i) {
      CreateTokenRequest storage request = requests[i - 1];
      uint256 targetBlock = request.targetBlock;
      require(block.number > targetBlock, "Target block not arrived");
      uint256 seed = uint256(blockhash(targetBlock));
      uint256 rarity = request.rarity;
      if (seed == 0) {
        if (rarity == ItpDetails.ALL_RARITY) {
          // Expired, forced common.
          rarity = 1;
        }

        // Re-roll seed.
        targetBlock = (block.number & maskFirst248Bits) + (targetBlock & maskLast8Bits); 
        if (targetBlock >= block.number) {
          targetBlock -= 256;
        }
        seed = uint256(blockhash(targetBlock)); 
      }

      if (available < request.count) {
        request.count -= uint16(available);
        createToken(to, available, rarity, seed);
        break;
      }
      require(available >= request.count, "Invalid request");
      available -= request.count;
      createToken(to, request.count, rarity, seed);
      requests.pop();
      if (available == 0) {
        break;
      }
    }
  }

  /** Creates token(s) with a random seed. */
  function createToken(
    address to,
    uint256 count,
    uint256 rarity,
    uint256 seed
  ) internal {
    uint256 details;
    for (uint256 i = 0; i < count; ++i) {
      uint256 id = tokenIdCounter.current();
      uint256 tokenSeed = uint256(keccak256(abi.encode(seed, id)));
      (, details) = design.createRandomToken(tokenSeed, id, rarity);
      tokenIdCounter.increment();
      tokenDetails[id] = details;
      _safeMint(to, id);
      emit TokenProcessed(to, id, details,false);
    }
  }

  /** Upgrades the specified token. */
  function upgrade(uint256 baseId, uint256 materialId, bool _bnbFee) payable external {
    require(baseId != materialId, "Same token");

    address to = msg.sender;
    require(ownerOf(baseId) == to, "Base token not owned");
    require(ownerOf(materialId) == to, "Material token not owned");

    uint256 cost = design.getUpgradeCost(1, 1);
    uint256 bnbCost = oracle.getNFTPrice(design.getUpgradeCostBNB(1, 1)); 
    require(msg.value >= bnbCost, "Insufficient BNB");
    payable(treasuryWallet).transfer(bnbCost);
    payable(msg.sender).transfer(msg.value - bnbCost);
    
    token.transferFrom(to, address(this), cost);
    emit TokenProcessed(to, baseId, tokenDetails[baseId],false); 

    _burn(materialId);

    emit TokenProcessed(to, materialId, tokenDetails[materialId],true);
  }

  function _transfer(
    address from,
    address to,
    uint256 tokenId
  ) internal override onlyRole(TRADER_ROLE) { 
    ERC721Upgradeable._transfer(from, to, tokenId);
  }

  function _beforeTokenTransfer(
    address from,
    address to,
    uint256 id
  ) internal override {
    if (from == address(0)) {
      // Mint.
    } else {
      // Transfer or burn.
      // Swap and pop.
      uint256[] storage ids = tokenIds[from];
      uint256 index = ItpDetails.decodeIndex(tokenDetails[id]);
      uint256 lastId = ids[ids.length - 1];
      ids[index] = lastId;
      ids.pop();

      // Update index.
      tokenDetails[lastId] = ItpDetails.setIndex(tokenDetails[lastId], index);
    }
    if (to == address(0)) {
      // Burn.
      delete tokenDetails[id];
    } else {
      // Transfer or mint.
      uint256[] storage ids = tokenIds[to];
      uint256 index = ids.length;
      ids.push(id);
      tokenDetails[id] = ItpDetails.setIndex(tokenDetails[id], index);

      // Check limit.
      require(index + 1 <= design.getTokenLimit(), "User limit reached");
    }
  }
}