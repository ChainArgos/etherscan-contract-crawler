/**
 *Submitted for verification at BscScan.com on 2023-02-17
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IERC20 {
    function approve(address spender, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

interface IXxx {
    function registrationFor(address userAddress) external;
    function levelPrice(uint8 level) external view returns(uint);
    function buyNewLevelFor(address userAddress, uint8 level) external;
}

interface IXGold {
    function buyNewLevel(uint8 level) external payable;
    function levelPrice(uint8 level) external view returns(uint);
    function buyNewLevelFor(address userAddress, uint8 level) external payable;
}

interface IForsage {
    function registrationFor(address userAddress, address referrerAddress) external;
    function buyNewLevelFor(address userAddress, uint8 matrix, uint8 level) external;
    function BASIC_PRICE() external view returns(uint);
    function levelPrice(uint8 level) external view returns(uint);
    function users(address userAddress) external view returns(uint id, address referrer, uint partnersCount);
}

interface IForsageExpress {
    function buyNewLevelFor(address userAddress, uint8 level) external payable;
    function levelPrice(uint8 level) external view returns(uint);
}

interface IMaxDrive {
    function buyNewLevelFor(address userAddress, uint8 level) external payable;
    function levelPrice(uint8 level) external view returns(uint);
}

interface IPancakeRouter {
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
    external
    payable
    returns (uint[] memory amounts);
}

abstract contract Proxy {
    /**
     * @dev Delegates the current call to `implementation`.
     * 
     * This function does not return to its internall call site, it will return directly to the external caller.
     */
    function _delegate(address implementation) internal {
        // solhint-disable-next-line no-inline-assembly
        assembly {
        // Copy msg.data. We take full control of memory in this inline assembly
        // block because it will not return to Solidity code. We overwrite the
        // Solidity scratch pad at memory position 0.
            calldatacopy(0, 0, calldatasize())

        // Call the implementation.
        // out and outsize are 0 because we don't know the size yet.
            let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)

        // Copy the returned data.
            returndatacopy(0, 0, returndatasize())

            switch result
            // delegatecall returns 0 on error.
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }

    /**
     * @dev This is a virtual function that should be overriden so it returns the address to which the fallback function
     * and {_fallback} should delegate.
     */
    function _implementation() internal virtual view returns (address);

    /**
     * @dev Delegates the current call to the address returned by `_implementation()`.
     * 
     * This function does not return to its internall call site, it will return directly to the external caller.
     */
    function _fallback() internal {
        _beforeFallback();
        _delegate(_implementation());
    }

    /**
     * @dev Fallback function that delegates calls to the address returned by `_implementation()`. Will run if no other
     * function in the contract matches the call data.
     */
    fallback () payable external {
        _fallback();
    }

    /**
     * @dev Fallback function that delegates calls to the address returned by `_implementation()`. Will run if call data
     * is empty.
     */
    receive () payable external {
        _fallback();
    }

    /**
     * @dev Hook that is called before falling back to the implementation. Can happen as part of a manual `_fallback`
     * call, or as part of the Solidity `fallback` or `receive` functions.
     * 
     * If overriden should call `super._beforeFallback()`.
     */
    function _beforeFallback() internal virtual {
    }
}


contract RouterProxy is Proxy {

    address public impl;
    address public contractOwner;

    modifier onlyContractOwner() {
        require(msg.sender == contractOwner);
        _;
    }

    constructor(address _impl) public {
        impl = _impl;
        contractOwner = msg.sender;
    }

    function update(address newImpl) public onlyContractOwner {
        impl = newImpl;
    }

    function removeOwnership() public onlyContractOwner {
        contractOwner = address(0);
    }

    function _implementation() internal override view returns (address) {
        return impl;
    }
}

interface IForsageLottery {
    function buyTicketFor(address to, uint amount, uint8[] memory levels) external;
    function ticketPrice() external view returns(uint);
    function ticketFee() external view returns(uint);
    function startTime() external view returns(uint);
    function endTime() external view returns(uint);
}

interface IForsageRouter {
    function forsageExpressRegistration(address referrerAddress) external payable;
}

contract ForsageRouterBasic {
    address public impl;
    address public contractOwner;

    IERC20 public busd;

    IPancakeRouter public pancakeRouter;
    IForsage public forsage;
    IForsageExpress public forsageExpress;
    IXGold public xGold;
    IXxx public xxx;
    IMaxDrive public maxDrive;


    address public feeWallet;
    uint public busdFee;

    IForsageLottery public forsageLottery;
}

contract ForsageRouter is ForsageRouterBasic {

    //forsage - 0x5acc84a3e955bdd76467d3348077d003f00ffb97
    //pancakeRouter - 0x10ED43C718714eb63d5aA57B78B54704E256024E
    function init(IForsage _forsage,
        IForsageExpress _forsageExpress,
        IXxx _xxx,
        IXGold _xGold,
        IPancakeRouter _pancakeRouter,
        IMaxDrive _maxDrive
    ) public {
        require(msg.sender == contractOwner, "onlyContractOwner");
        busd = IERC20(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56);
        forsage = _forsage;
        pancakeRouter = _pancakeRouter;
        forsageExpress = _forsageExpress;
        xGold = _xGold;
        xxx = _xxx;
        maxDrive = _maxDrive;

        busd.approve(address(forsage), type(uint256).max);
        busd.approve(address(xxx), type(uint256).max);
        busd.approve(address(xGold), type(uint256).max);
        busd.approve(address(forsageExpress), type(uint256).max);
        busd.approve(address(maxDrive), type(uint256).max);
    }

    receive() external payable {

    }

    fallback() external payable {

    }

    function setForsageLottery(IForsageLottery _forsageLottery) public {
        require(msg.sender == contractOwner, "onlyContractOwner");
        forsageLottery = _forsageLottery;
    }

    function setFeeData(address _feeWallet, uint _busdFee) public {
        require(msg.sender == contractOwner, "onlyContractOwner");
        feeWallet = _feeWallet;
        busdFee = _busdFee;
    }

    function forsageRegistration(address referrerAddress) public payable {
        uint amountOut = forsage.BASIC_PRICE() * 2;

        address[] memory path = new address[](2);
        path[0] = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
        address to = address(this);
        uint deadline = block.timestamp + 1000;

        pancakeRouter.swapETHForExactTokens{value: msg.value}(amountOut, path, to, deadline);

        forsage.registrationFor(msg.sender, referrerAddress);

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }
    }

    function forsageRegistrationBUSD(address referrerAddress) public payable {
        uint amountOut = forsage.BASIC_PRICE() * 2;

        busd.transferFrom(msg.sender, address(this), amountOut);

        forsage.registrationFor(msg.sender, referrerAddress);
    }

    function forsageAndXGoldRegistration(address referrerAddress) public payable {
        uint amountOut = forsage.BASIC_PRICE() * 2 + xGold.levelPrice(1);

        address[] memory path = new address[](2);
        path[0] = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
        address to = address(this);
        uint deadline = block.timestamp + 1000;

        pancakeRouter.swapETHForExactTokens{value: msg.value}(amountOut, path, to, deadline);

        forsage.registrationFor(msg.sender, referrerAddress);
        xGold.buyNewLevelFor(msg.sender, 1);

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }
    }

    function forsageAndXxxRegistration(address referrerAddress) public payable {
        uint amountOut = forsage.BASIC_PRICE() * 2 + xxx.levelPrice(1);

        address[] memory path = new address[](2);
        path[0] = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
        address to = address(this);
        uint deadline = block.timestamp + 1000;

        pancakeRouter.swapETHForExactTokens{value: msg.value}(amountOut, path, to, deadline);

        forsage.registrationFor(msg.sender, referrerAddress);
        xxx.buyNewLevelFor(msg.sender, 1);

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }
    }

    function xxxActivation() public payable {
        uint amountOut = busdFee + xxx.levelPrice(1);

        address[] memory path = new address[](2);
        path[0] = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
        address to = address(this);
        uint deadline = block.timestamp + 1000;

        pancakeRouter.swapETHForExactTokens{value: msg.value}(amountOut, path, to, deadline);

        xxx.buyNewLevelFor(msg.sender, 1);

        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }
    }

    function xxxActivationBusd() public payable {
        uint amountOut = busdFee + xxx.levelPrice(1);
        busd.transferFrom(msg.sender, address(this), amountOut);

        xxx.buyNewLevelFor(msg.sender, 1);

        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }
    }

    function xGoldActivation() public payable {
        uint amountOut = busdFee + xGold.levelPrice(1);

        address[] memory path = new address[](2);
        path[0] = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
        address to = address(this);
        uint deadline = block.timestamp + 1000;

        pancakeRouter.swapETHForExactTokens{value: msg.value}(amountOut, path, to, deadline);

        xGold.buyNewLevelFor(msg.sender, 1);

        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }
    }

    function xGoldActivationBusd() public {
        uint amountOut = busdFee + xGold.levelPrice(1);
        busd.transferFrom(msg.sender, address(this), amountOut);

        xGold.buyNewLevelFor(msg.sender, 1);

        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }
    }

    function x3x4BuyLevelBatch(uint8 matrixType, uint8[] memory _levels) public payable {
        uint amountOut = busdFee;
        for(uint i = 0; i < _levels.length; i++) {
            amountOut+= forsage.levelPrice(_levels[i]);
        }

        address[] memory path = new address[](2);
        path[0] = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
        address to = address(this);
        uint deadline = block.timestamp + 1000;

        pancakeRouter.swapETHForExactTokens{value: msg.value}(amountOut, path, to, deadline);

        for(uint i = 0; i < _levels.length; i++) {
            forsage.buyNewLevelFor(msg.sender, matrixType, _levels[i]);
        }

        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }

        if(address(forsageLottery) != address(0)) {
            forsageLottery.buyTicketFor(msg.sender, 0, _levels);
        }
    }

    function x3x4BuyLevelBatchBusd(uint8 matrixType, uint8[] memory _levels) public {

        uint amountOut = busdFee;
        for(uint i = 0; i < _levels.length; i++) {
            amountOut+= forsage.levelPrice(_levels[i]);
        }

        busd.transferFrom(msg.sender, address(this), amountOut);
        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }

        for(uint i = 0; i < _levels.length; i++) {
            forsage.buyNewLevelFor(msg.sender, matrixType, _levels[i]);
        }

        if(address(forsageLottery) != address(0)) {
            forsageLottery.buyTicketFor(msg.sender, 0, _levels);
        }
    }

    function xGoldBuyLevelBatch(uint8[] memory _levels) public payable {
        uint amountOut = busdFee;
        for(uint i = 0; i < _levels.length; i++) {
            amountOut+= xGold.levelPrice(_levels[i]);
        }

        address[] memory path = new address[](2);
        path[0] = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
        address to = address(this);
        uint deadline = block.timestamp + 1000;

        pancakeRouter.swapETHForExactTokens{value: msg.value}(amountOut, path, to, deadline);

        for(uint i = 0; i < _levels.length; i++) {
            xGold.buyNewLevelFor(msg.sender, _levels[i]);
        }

        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }

        if(address(forsageLottery) != address(0)) {
            forsageLottery.buyTicketFor(msg.sender, 0, _levels);
        }
    }

    function xGoldBuyLevelBatchBusd(uint8[] memory _levels) public {
        uint amountOut = busdFee;
        for(uint i = 0; i < _levels.length; i++) {
            amountOut+= xGold.levelPrice(_levels[i]);
        }

        busd.transferFrom(msg.sender, address(this), amountOut);
        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }

        for(uint i = 0; i < _levels.length; i++) {
            xGold.buyNewLevelFor(msg.sender, _levels[i]);
        }

        if(address(forsageLottery) != address(0)) {
            forsageLottery.buyTicketFor(msg.sender, 0, _levels);
        }
    }

    function xxxBuyLevelBatch(uint8[] memory _levels) public payable {
        uint amountOut = busdFee;
        for(uint i = 0; i < _levels.length; i++) {
            amountOut+= xxx.levelPrice(_levels[i]);
        }

        address[] memory path = new address[](2);
        path[0] = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
        address to = address(this);
        uint deadline = block.timestamp + 1000;

        pancakeRouter.swapETHForExactTokens{value: msg.value}(amountOut, path, to, deadline);

        for(uint i = 0; i < _levels.length; i++) {
            xxx.buyNewLevelFor(msg.sender, _levels[i]);
        }

        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }

        if(address(forsageLottery) != address(0)) {
            forsageLottery.buyTicketFor(msg.sender, 0, _levels);
        }
    }

    function xxxBuyLevelBatchBusd(uint8[] memory _levels) public {
        uint amountOut = busdFee;
        for(uint i = 0; i < _levels.length; i++) {
            amountOut+= xxx.levelPrice(_levels[i]);
        }

        busd.transferFrom(msg.sender, address(this), amountOut);

        for(uint i = 0; i < _levels.length; i++) {
            xxx.buyNewLevelFor(msg.sender, _levels[i]);
        }

        if(busdFee > 0) {
            busd.transfer(feeWallet, busdFee);
        }

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }

        if(address(forsageLottery) != address(0)) {
            forsageLottery.buyTicketFor(msg.sender, 0, _levels);
        }
    }

    function buyTicket(uint amount) public {
        (uint id, , ) = forsage.users(msg.sender);

        require(id > 0, "register in Forsage first");
        require(amount <= 10, "max 10 tickets per transaction");

        uint startTime = forsageLottery.startTime();
        uint endTime = forsageLottery.endTime();

        require(startTime <= block.timestamp && block.timestamp < endTime, "loterry is not active");

        uint ticketPrice = forsageLottery.ticketPrice();
        uint ticketFee = forsageLottery.ticketFee();

        uint totalPrice = ticketPrice * amount + ticketFee;

        busd.transferFrom(msg.sender, address(this), totalPrice);
        busd.approve(address(forsageLottery), type(uint256).max);

        require(address(forsageLottery) != address(0), "lottery inactive");
        uint8[] memory _levels;
        forsageLottery.buyTicketFor(msg.sender, amount, _levels);
    }

    function buyTicketBnb(uint amount) public payable {
        (uint id, , ) = forsage.users(msg.sender);

        require(id > 0, "register in Forsage first");
        require(amount <= 10, "max 10 tickets per transaction");

        uint startTime = forsageLottery.startTime();
        uint endTime = forsageLottery.endTime();

        require(startTime <= block.timestamp && block.timestamp < endTime, "loterry is not active");

        uint ticketPrice = forsageLottery.ticketPrice();
        uint ticketFee = forsageLottery.ticketFee();

        uint totalPrice = ticketPrice * amount + ticketFee;

        address[] memory path = new address[](2);
        path[0] = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;
        address to = address(this);
        uint deadline = block.timestamp + 1000;

        pancakeRouter.swapETHForExactTokens{value: msg.value}(totalPrice, path, to, deadline);

        busd.approve(address(forsageLottery), type(uint256).max);

        require(address(forsageLottery) != address(0), "lottery inactive");
        uint8[] memory _levels;
        forsageLottery.buyTicketFor(msg.sender, amount, _levels);

        if(address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }
    }
}