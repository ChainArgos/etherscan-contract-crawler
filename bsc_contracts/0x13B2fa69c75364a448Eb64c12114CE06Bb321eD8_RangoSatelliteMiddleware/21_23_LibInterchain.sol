// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../interfaces/IUniswapV2.sol";
import "../interfaces/IUniswapV3.sol";
import "../interfaces/IWETH.sol";
import "../interfaces/IRangoStargate.sol";
import "../interfaces/IStargateReceiver.sol";
import "../interfaces/IRangoMessageReceiver.sol";
import "./LibSwapper.sol";
import "../interfaces/IRango.sol";
import "../interfaces/IRangoInterchainHelper.sol";

library LibInterchain {

    /// @dev keccak256("exchange.rango.library.interchain")
    bytes32 internal constant BASE_MESSAGING_CONTRACT_NAMESPACE = hex"ff95014231b901d2b22bd69b4e83dacd84ac05e8c2d1e9fba0c7e2f3ed0db0eb";

    struct BaseInterchainStorage {
        mapping(address => bool) whitelistMessagingContracts;
    }

    // @notice Adds a contract to the whitelisted messaging dApps that can be called
    /// @param _dapp The address of dApp
    function addMessagingDApp(address _dapp) internal {
        BaseInterchainStorage storage baseStorage = getBaseMessagingContractStorage();
        baseStorage.whitelistMessagingContracts[_dapp] = true;
    }

    /// @notice Removes a contract from dApps that can be called
    /// @param _dapp The address of dApp
    function removeMessagingDApp(address _dapp) internal {
        BaseInterchainStorage storage baseStorage = getBaseMessagingContractStorage();

        require(baseStorage.whitelistMessagingContracts[_dapp], "contract not whitelisted");
        delete baseStorage.whitelistMessagingContracts[_dapp];
    }

    /// @notice This event indicates that a dApp used Rango messaging (dAppMessage field) and we delivered the message to it
    /// @param _receiverContract The address of dApp's contract that was called
    /// @param _token The address of the token that is sent to the dApp, ETH for native token
    /// @param _amount The amount of the token sent to them
    /// @param _status The status of operation, informing the dApp that the whole process was a success or refund
    /// @param _appMessage The custom message that the dApp asked Rango to deliver
    /// @param success Indicates that the function call to the dApp encountered error or not
    /// @param failReason If success = false, failReason will be the string reason of the failure (aka message of require)
    event CrossChainMessageCalled(
        address _receiverContract,
        address _token,
        uint _amount,
        IRangoMessageReceiver.ProcessStatus _status,
        bytes _appMessage,
        bool success,
        string failReason
    );

    event ActionDone(Interchain.ActionType actionType, address contractAddress, bool success, string reason);
    event SubActionDone(Interchain.CallSubActionType subActionType, address contractAddress, bool success, string reason);

    function encodeIm(Interchain.RangoInterChainMessage memory im) external pure returns (bytes memory) {
        return abi.encode(im);
    }

    function handleDestinationMessageWithTryCatchRefund(
        address _token,
        uint _amount,
        Interchain.RangoInterChainMessage memory m
    ) internal returns (address, uint256, IRango.CrossChainOperationStatus){
        try IRangoInterchainHelper(address(this)).helplerHandleDestinationMessageWithTryCatch(
            _token,
            _amount,
            m
        ) returns (address t, uint256 a, IRango.CrossChainOperationStatus s)
        {
            return (t, a, s);
        }
        catch {
            address recipient = m.recipient;
            if (recipient != LibSwapper.ETH) {
                if (_token == LibSwapper.ETH) {
                    LibSwapper._sendNative(recipient, _amount);
                } else {
                    SafeERC20.safeTransfer(IERC20(_token), recipient, _amount);
                }
                IRango.CrossChainOperationStatus stat = IRango.CrossChainOperationStatus.RefundInDestination;
                return (_token, _amount, stat);
            }
            IRango.CrossChainOperationStatus statFailed = IRango.CrossChainOperationStatus.SwapFailedInDestination;
            return (_token, _amount, statFailed);
        }
    }


    function handleDestinationMessageInternal(
        address _token,
        uint _amount,
        Interchain.RangoInterChainMessage memory m
    ) internal returns (address receivedToken, uint256 dstAmount, IRango.CrossChainOperationStatus status) {

        LibSwapper.BaseSwapperStorage storage baseStorage = LibSwapper.getBaseSwapperStorage();
        address sourceToken = m.bridgeRealOutput == LibSwapper.ETH && _token == baseStorage.WETH ? LibSwapper.ETH : _token;

        bool ok = true;
        address outToken = sourceToken;
        dstAmount = _amount;

        if (m.actionType == Interchain.ActionType.UNI_V2)
            (ok, dstAmount, outToken) = _handleUniswapV2(sourceToken, _amount, m, baseStorage);
        else if (m.actionType == Interchain.ActionType.UNI_V3)
            (ok, dstAmount, outToken) = _handleUniswapV3(sourceToken, _amount, m, baseStorage);
        else if (m.actionType == Interchain.ActionType.CALL)
            (ok, dstAmount, outToken) = _handleCall(sourceToken, _amount, m, baseStorage);
        else if (m.actionType != Interchain.ActionType.NO_ACTION)
            revert("Unsupported actionType");

        if (ok && m.postAction != Interchain.CallSubActionType.NO_ACTION) {
            (ok, dstAmount, outToken) = _handlePostAction(outToken, dstAmount, m.postAction, baseStorage);
        }

        status = ok ? IRango.CrossChainOperationStatus.Succeeded : IRango.CrossChainOperationStatus.SwapFailedInDestination;
        IRangoMessageReceiver.ProcessStatus dAppStatus = ok
            ? IRangoMessageReceiver.ProcessStatus.SUCCESS
            : IRangoMessageReceiver.ProcessStatus.REFUND_IN_DESTINATION;

        _sendTokenWithDApp(outToken, dstAmount, m.recipient, m.dAppMessage, m.dAppDestContract, dAppStatus);

        return (receivedToken, dstAmount, status);
    }

    /// @notice Performs a uniswap-v2 operation
    /// @param _message The interchain message that contains the swap info
    /// @param _amount The amount of input token
    /// @return ok Indicates that the swap operation was success or fail
    /// @return amountOut If ok = true, amountOut is the output amount of the swap
    function _handleUniswapV2(
        address _token,
        uint _amount,
        Interchain.RangoInterChainMessage memory _message,
        LibSwapper.BaseSwapperStorage storage baseStorage
    ) private returns (bool ok, uint256 amountOut, address outToken) {
        Interchain.UniswapV2Action memory action = abi.decode((_message.action), (Interchain.UniswapV2Action));
        require(baseStorage.whitelistContracts[action.dexAddress] == true, "Dex address is not whitelisted");
        require(action.path.length >= 2, "Invalid uniswap-V2 path");

        bool shouldDeposit = _token == LibSwapper.ETH && action.path[0] == baseStorage.WETH;
        if (!shouldDeposit)
            require(_token == action.path[0], "bridged token must be the same as the first token in destination swap path");
        else {
            require(action.path[0] == baseStorage.WETH, "Invalid uniswap-V2 path");
            IWETH(baseStorage.WETH).deposit{value: _amount}();
        }

        LibSwapper.approve(action.path[0], action.dexAddress, _amount);

        try
            IUniswapV2(action.dexAddress).swapExactTokensForTokens(
                _amount,
                action.amountOutMin,
                action.path,
                address(this),
                action.deadline
            )
        returns (uint256[] memory amounts) {
            emit ActionDone(Interchain.ActionType.UNI_V2, action.dexAddress, true, "");
            return (true, amounts[amounts.length - 1], action.path[action.path.length - 1]);
        } catch {
            emit ActionDone(Interchain.ActionType.UNI_V2, action.dexAddress, true, "Uniswap-V2 call failed");
            return (false, _amount, shouldDeposit ? baseStorage.WETH : _token);
        }
    }

    /// @notice Performs a uniswap-v3 operation
    /// @param _message The interchain message that contains the swap info
    /// @param _amount The amount of input token
    /// @return ok Indicates that the swap operation was success or fail
    /// @return amountOut If ok = true, amountOut is the output amount of the swap
    function _handleUniswapV3(
        address _token,
        uint _amount,
        Interchain.RangoInterChainMessage memory _message,
        LibSwapper.BaseSwapperStorage storage baseStorage
    ) private returns (bool, uint256, address) {
        Interchain.UniswapV3ActionExactInputSingleParams memory action = abi
            .decode((_message.action), (Interchain.UniswapV3ActionExactInputSingleParams));

        require(baseStorage.whitelistContracts[action.dexAddress] == true, "Dex address is not whitelisted");

        bool shouldDeposit = _token == LibSwapper.ETH && action.tokenIn == baseStorage.WETH;
        if (!shouldDeposit)
            require(_token == action.tokenIn, "bridged token must be the same as the tokenIn in uniswapV3");
        else {
            require(action.tokenIn == baseStorage.WETH, "Invalid uniswap-V2 path");
            IWETH(baseStorage.WETH).deposit{value: _amount}();
        }

        LibSwapper.approve(action.tokenIn, action.dexAddress, _amount);

        try
            IUniswapV3(action.dexAddress).exactInputSingle(IUniswapV3.ExactInputSingleParams({
                tokenIn : action.tokenIn,
                tokenOut : action.tokenOut,
                fee : action.fee,
                recipient : address(this),
                deadline : action.deadline,
                amountIn : _amount,
                amountOutMinimum : action.amountOutMinimum,
                sqrtPriceLimitX96 : action.sqrtPriceLimitX96
            }))
        returns (uint amountOut) {
            emit ActionDone(Interchain.ActionType.UNI_V3, action.dexAddress, true, "");
            return (true, amountOut, action.tokenOut);
        } catch {
            emit ActionDone(Interchain.ActionType.UNI_V3, action.dexAddress, false, "Uniswap-V3 call failed");
            return (false, _amount, shouldDeposit ? baseStorage.WETH : _token);
        }
    }

    /// @notice Performs a uniswap-v2 operation
    /// @param _message The interchain message that contains the swap info
    /// @param _amount The amount of input token
    /// @return ok Indicates that the swap operation was success or fail
    /// @return amountOut If ok = true, amountOut is the output amount of the swap
    function _handleCall(
        address _token,
        uint _amount,
        Interchain.RangoInterChainMessage memory _message,
        LibSwapper.BaseSwapperStorage storage baseStorage
    ) private returns (bool ok, uint256 amountOut, address outToken) {
        Interchain.CallAction memory action = abi.decode((_message.action), (Interchain.CallAction));

        require(baseStorage.whitelistContracts[action.target] == true, "Action.target is not whitelisted");
        require(baseStorage.whitelistContracts[action.spender] == true, "Action.spender is not whitelisted");

        address sourceToken = _token;

        if (action.preAction == Interchain.CallSubActionType.WRAP) {
            require(_token == LibSwapper.ETH, "Cannot wrap non-native");
            require(action.tokenIn == baseStorage.WETH, "action.tokenIn must be WETH");
            (ok, amountOut, sourceToken) = _handleWrap(_token, _amount, baseStorage);
        } else if (action.preAction == Interchain.CallSubActionType.UNWRAP) {
            require(_token == baseStorage.WETH, "Cannot unwrap non-WETH");
            require(action.tokenIn == LibSwapper.ETH, "action.tokenIn must be ETH");
            (ok, amountOut, sourceToken) = _handleUnwrap(_token, _amount, baseStorage);
        } else {
            require(action.tokenIn == _token, "_message.tokenIn mismatch in call");
        }
        if (!ok)
            return (false, _amount, _token);

        if (sourceToken != LibSwapper.ETH)
            LibSwapper.approve(sourceToken, action.spender, _amount);

        uint value = sourceToken == LibSwapper.ETH ? _amount : 0;
        uint toBalanceBefore = LibSwapper.getBalanceOf(_message.toToken);

        (bool success, bytes memory ret) = action.target.call{value: value}(action.callData);
        if (success) {
            emit ActionDone(Interchain.ActionType.CALL, action.target, true, "");

            uint toBalanceAfter = LibSwapper.getBalanceOf(_message.toToken);
            return (true, toBalanceAfter - toBalanceBefore, _message.toToken);
        } else {
            emit ActionDone(Interchain.ActionType.CALL, action.target, false, LibSwapper._getRevertMsg(ret));
            return (false, _amount, _token);
        }
    }

    /// @notice Performs a uniswap-v2 operation
    /// @param _postAction The type of action to perform such as WRAP, UNWRAP
    /// @param _amount The amount of input token
    /// @return ok Indicates that the swap operation was success or fail
    /// @return amountOut If ok = true, amountOut is the output amount of the swap
    function _handlePostAction(
        address _token,
        uint _amount,
        Interchain.CallSubActionType _postAction,
        LibSwapper.BaseSwapperStorage storage baseStorage
    ) private returns (bool ok, uint256 amountOut, address outToken) {

        if (_postAction == Interchain.CallSubActionType.WRAP) {
            require(_token == LibSwapper.ETH, "Cannot wrap non-native");
            (ok, amountOut, outToken) = _handleWrap(_token, _amount, baseStorage);
        } else if (_postAction == Interchain.CallSubActionType.UNWRAP) {
            require(_token == baseStorage.WETH, "Cannot unwrap non-WETH");
            (ok, amountOut, outToken) = _handleUnwrap(_token, _amount, baseStorage);
        } else {
            revert("Unsupported post-action");
        }
        if (!ok)
            return (false, _amount, _token);
        return (ok, amountOut, outToken);
    }

    /// @notice Performs a WETH.deposit operation
    /// @param _amount The amount of input token
    /// @return ok Indicates that the swap operation was success or fail
    /// @return amountOut If ok = true, amountOut is the output amount of the swap
    function _handleWrap(
        address _token,
        uint _amount,
        LibSwapper.BaseSwapperStorage storage baseStorage
    ) private returns (bool ok, uint256 amountOut, address outToken) {
        require(_token == LibSwapper.ETH, "Cannot wrap non-ETH tokens");

        IWETH(baseStorage.WETH).deposit{value: _amount}();
        emit SubActionDone(Interchain.CallSubActionType.WRAP, baseStorage.WETH, true, "");

        return (true, _amount, baseStorage.WETH);
    }

    /// @notice Performs a WETH.deposit operation
    /// @param _amount The amount of input token
    /// @return ok Indicates that the swap operation was success or fail
    /// @return amountOut If ok = true, amountOut is the output amount of the swap
    function _handleUnwrap(
        address _token,
        uint _amount,
        LibSwapper.BaseSwapperStorage storage baseStorage
    ) private returns (bool ok, uint256 amountOut, address outToken) {
        if (_token != baseStorage.WETH)
            revert("Non-WETH tokens unwrapped");

        IWETH(baseStorage.WETH).withdraw(_amount);
        emit SubActionDone(Interchain.CallSubActionType.UNWRAP, baseStorage.WETH, true, "");

        return (true, _amount, LibSwapper.ETH);
    }
    
    /// @notice An internal function to send a token from the current contract to another contract or wallet
    /// @dev This function also can convert WETH to ETH before sending if _withdraw flat is set to true
    /// @dev To send native token _nativeOut param should be set to true, otherwise we assume it's an ERC20 transfer
    /// @dev If there is a message from a dApp it sends the money to the contract instead of the end-user and calls its handleRangoMessage
    /// @param _token The token that is going to be sent to a wallet, ZERO address for native
    /// @param _amount The sent amount
    /// @param _receiver The receiver wallet address or contract
    function _sendTokenWithDApp(
        address _token,
        uint256 _amount,
        address _receiver,
        bytes memory _dAppMessage,
        address _dAppReceiverContract,
        IRangoMessageReceiver.ProcessStatus processStatus
    ) internal {
        bool thereIsAMessage = _dAppReceiverContract != LibSwapper.ETH;
        address immediateReceiver = thereIsAMessage ? _dAppReceiverContract : _receiver;
        BaseInterchainStorage storage messagingStorage = getBaseMessagingContractStorage();
        emit LibSwapper.SendToken(_token, _amount, immediateReceiver);

        if (_token == LibSwapper.ETH) {
            LibSwapper._sendNative(immediateReceiver, _amount);
        } else {
            SafeERC20.safeTransfer(IERC20(_token), immediateReceiver, _amount);
        }

        if (thereIsAMessage) {
            require(
                messagingStorage.whitelistMessagingContracts[_dAppReceiverContract],
                "3rd-party contract not whitelisted"
            );

            try IRangoMessageReceiver(_dAppReceiverContract)
                .handleRangoMessage(_token, _amount, processStatus, _dAppMessage)
            {
                emit CrossChainMessageCalled(_dAppReceiverContract, _token, _amount, processStatus, _dAppMessage, true, "");
            } catch Error(string memory reason) {
                emit CrossChainMessageCalled(_dAppReceiverContract, _token, _amount, processStatus, _dAppMessage, false, reason);
            } catch (bytes memory lowLevelData) {
                emit CrossChainMessageCalled(_dAppReceiverContract, _token, _amount, processStatus, _dAppMessage, false, LibSwapper._getRevertMsg(lowLevelData));
            }
        }
    }

    /// @notice A utility function to fetch storage from a predefined random slot using assembly
    /// @return s The storage object
    function getBaseMessagingContractStorage() internal pure returns (BaseInterchainStorage storage s) {
        bytes32 namespace = BASE_MESSAGING_CONTRACT_NAMESPACE;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            s.slot := namespace
        }
    }
}