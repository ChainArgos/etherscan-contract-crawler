// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.19;

import 'XfaiLibrary.sol';
import 'TransferHelper.sol';

import 'IXfaiV0Core.sol';
import 'IXfaiPool.sol';
import 'IXfaiV0Periphery01.sol';
import 'IXfaiFactory.sol';
import 'IxfETH.sol';
import 'IXfaiINFT.sol';
import 'IERC20.sol';
import 'IWETH.sol';

/**
 * @title Xfai's Xfai Periphery Contract
 * @author Xfai
 * @notice XfaiV0Periphery01 performs the necessary high level safety checks to interact with XfaiV0Core. It does not store any pool related state.
 */
contract XfaiV0Periphery01 is IXfaiV0Periphery01 {
  /**
   * @notice The factory address of Xfai
   */
  address private immutable factory;

  /**
   * @notice The address of the xfETH token
   */
  address private immutable xfETH;

  /**
   * @notice The address of the XfaiV0Core contract
   */
  address private immutable core;

  /**
   * @notice The weth address.
   * @dev In the case of a chain ID other than Ethereum, the wrapped ERC20 token address of the chain's native coin
   */
  address private immutable weth;

  /**
   * @notice The code hash od XfaiPool
   * @dev keccak256(type(XfaiPool).creationCode)
   */
  bytes32 private immutable poolCodeHash;

  modifier ensure(uint deadline) {
    require(deadline >= block.timestamp, 'XfaiV0Periphery01: EXPIRED');
    _;
  }

  /**
   * @notice XfaiV0Periphery01 constructor
   * @param _factory The factory address of Xfai
   * @param _weth The weth address
   * @param _xfETH The xfETH address
   */
  constructor(address _factory, address _weth, address _xfETH) {
    factory = _factory;
    core = IXfaiFactory(_factory).getXfaiCore();
    xfETH = _xfETH;
    weth = _weth;
    poolCodeHash = IXfaiFactory(_factory).poolCodeHash();
  }

  receive() external payable {
    assert(msg.sender == weth || msg.sender == xfETH); // only accept ETH via fallback from the weth contract
  }

  // **** ADD LIQUIDITY ****

  function _getLiquidityAmounts(
    address _token,
    uint _amountTokenDesired,
    uint _amountXfETHDesired,
    uint _amountTokenMin,
    uint _amountXfETHMin
  ) internal returns (uint amountToken, uint amountXfETH) {
    address pool = IXfaiFactory(factory).getPool(_token);
    if (pool == address(0)) {
      // create the pool if it doesn't exist yet
      pool = IXfaiFactory(factory).createPool(_token);
    }
    (uint reserve, uint weight) = IXfaiPool(pool).getStates();
    if (reserve == 0 && weight == 0) {
      (amountToken, amountXfETH) = (_amountTokenDesired, _amountXfETHDesired);
    } else {
      uint amountXfETHOptimal = XfaiLibrary.quote(_amountTokenDesired, weight, reserve);
      if (amountXfETHOptimal <= _amountXfETHDesired) {
        require(amountXfETHOptimal >= _amountXfETHMin, 'XfaiV0Periphery01: INSUFFICIENT_1_AMOUNT');
        (amountToken, amountXfETH) = (_amountTokenDesired, amountXfETHOptimal);
      } else {
        uint amountTokenOptimal = XfaiLibrary.quote(_amountXfETHDesired, reserve, weight);
        assert(amountTokenOptimal <= _amountTokenDesired);
        require(amountTokenOptimal >= _amountTokenMin, 'XfaiV0Periphery01: INSUFFICIENT_0_AMOUNT');
        (amountToken, amountXfETH) = (amountTokenOptimal, _amountXfETHDesired);
      }
    }
  }

  function _addLiquidity(
    address _token,
    uint _amountTokenDesired,
    uint _amountETHDesired,
    uint _amountTokenMin,
    uint _amountETHMin
  ) internal returns (uint amountToken, uint amountETH) {
    address _xfETH = xfETH; // gas saving
    uint amountXfETH;
    (amountToken, amountXfETH) = _getLiquidityAmounts(
      _token,
      _amountTokenDesired,
      IXFETH(_xfETH).ETHToXfETH(_amountETHDesired),
      _amountTokenMin,
      IXFETH(_xfETH).ETHToXfETH(_amountETHMin)
    );
    amountETH = IXFETH(_xfETH).xfETHToETH(amountXfETH);
  }

  /**
   * @notice Provide two-sided liquidity to a pool
   * @dev Requires _token approval. A given amount of _token and ETH get consumed and a given amount of liquidity tokens is minted
   * @param _to The address of the recipient
   * @param _token An ERC20 token address
   * @param _amountTokenDesired The input amount of _token to be provided
   * @param _amountTokenMin The minimal amount that the user will accept for _amountTokenDesired
   * @param _amountETHMin The minimal amount that the user will accept for the provided ETH
   * @param _deadline The UTC timestamp that if reached, causes the transaction to fail automatically
   */
  function addLiquidity(
    address _to,
    address _token,
    uint _amountTokenDesired,
    uint _amountTokenMin,
    uint _amountETHMin,
    uint _deadline
  ) external payable override ensure(_deadline) returns (uint liquidity) {
    address pool = XfaiLibrary.poolFor(_token, factory, poolCodeHash);
    (uint amount0, uint amount1) = _addLiquidity(
      _token,
      _amountTokenDesired,
      msg.value,
      _amountTokenMin,
      _amountETHMin
    );
    TransferHelper.safeTransferFrom(_token, msg.sender, pool, amount0);
    uint amountXfETH = IXFETH(xfETH).deposit{value: amount1}();
    TransferHelper.safeTransfer(xfETH, pool, amountXfETH);
    liquidity = IXfaiV0Core(core).mint(_token, _to);
    // refund dust eth, if any
    if (msg.value > amount1) TransferHelper.safeTransferETH(msg.sender, msg.value - amount1);
  }

  /**
   * @notice Provide one-sided liquidity to the ETH pool
   * @dev A given amount of ETH get consumed and a given amount of liquidity tokens is minted
   * @param _to The address of the recipient
   * @param _deadline The UTC timestamp that if reached, causes the transaction to fail automatically
   */
  function addLiquidityETH(
    address _to,
    uint _deadline
  ) external payable override ensure(_deadline) returns (uint liquidity) {
    address _weth = weth; // gas saving
    uint amountETH;
    uint amountXfETHtoETH;
    address pool = IXfaiFactory(factory).getPool(_weth);
    if (pool == address(0)) {
      // create the pool if it doesn't exist yet
      pool = IXfaiFactory(factory).createPool(_weth);
    }
    (uint ETHReserve, uint xfETHReserve) = IXfaiPool(pool).getStates();
    if (ETHReserve == 0 && xfETHReserve == 0) {
      (amountETH, amountXfETHtoETH) = (msg.value / 2, msg.value / 2);
    } else {
      amountETH = (msg.value * ETHReserve) / (ETHReserve + xfETHReserve);
      amountXfETHtoETH = msg.value - amountETH;
    }
    uint amountXfETH = IXFETH(xfETH).deposit{value: amountXfETHtoETH}();
    IWETH(_weth).deposit{value: amountETH}();
    TransferHelper.safeTransfer(xfETH, pool, amountXfETH);
    TransferHelper.safeTransfer(_weth, pool, amountETH);
    liquidity = IXfaiV0Core(core).mint(_weth, _to);
    require(msg.value == amountETH + amountXfETHtoETH, 'XfaiV0Periphery01: INSUFFICIENT_AMOUNT');
  }

  // **** REMOVE LIQUIDITY ****

  function _removeLiquidity(
    address _token0,
    address _token1,
    uint _liquidity,
    uint _amount0Min,
    uint _amount1Min,
    address _to
  ) private returns (uint amount0, uint amount1) {
    address _core = core; // gas saving
    address pool = XfaiLibrary.poolFor(_token0, factory, poolCodeHash);
    TransferHelper.safeTransferFrom(pool, msg.sender, _core, _liquidity);
    (amount0, amount1) = IXfaiV0Core(_core).burn(_token0, _token1, _to);
    require(amount0 >= _amount0Min, 'XfaiV0Periphery01: INSUFFICIENT_AMOUNT0');
    require(amount1 >= _amount1Min, 'XfaiV0Periphery01: INSUFFICIENT_AMOUNT1');
  }

  function _removeLiquidityOptions(
    address _to,
    address _token0,
    address _token1,
    uint _liquidity,
    uint _amount0Min,
    uint _amount1Min
  ) private returns (uint amount0, uint amount1) {
    address wrappedETH = weth; // gas saving
    if (_token0 == wrappedETH && _token1 == wrappedETH) {
      (amount0, amount1) = _removeLiquidity(
        _token0,
        xfETH,
        _liquidity,
        _amount0Min,
        _amount1Min,
        address(this)
      );
      IWETH(_token0).withdraw(amount0);
      uint amountInETH = IXFETH(xfETH).withdraw(amount1);
      TransferHelper.safeTransferETH(_to, amount0 + amountInETH);
    } else if (_token0 == wrappedETH) {
      (amount0, amount1) = _removeLiquidity(
        _token0,
        _token1,
        _liquidity,
        _amount0Min,
        _amount1Min,
        address(this)
      );
      IWETH(_token0).withdraw(amount0);
      TransferHelper.safeTransferETH(_to, amount0);
      TransferHelper.safeTransfer(_token1, _to, amount1);
    } else if (_token1 == wrappedETH) {
      (amount0, amount1) = _removeLiquidity(
        _token0,
        _token1,
        _liquidity,
        _amount0Min,
        _amount1Min,
        address(this)
      );
      IWETH(_token1).withdraw(amount1);
      TransferHelper.safeTransferETH(_to, amount1);
      TransferHelper.safeTransfer(_token0, _to, amount0);
    } else {
      (amount0, amount1) = _removeLiquidity(
        _token0,
        _token1,
        _liquidity,
        _amount0Min,
        _amount1Min,
        _to
      );
    }
  }

  /**
   * @notice Remove liquidity from pool0
   * @dev Requires approval of the pool's liquidity token. At the end of the function call, a given amount of LP tokens are burned, and a given amount of _token0 and _token1 are returned to the recipient.
   * @param _to The address of the recipient
   * @param _token0 The address of an ERC20 token
   * @param _token1 The address of an ERC20 token
   * @param _liquidity The amount of LP tokens to be burned
   * @param _amount0Min The minimal amount of _token that the user will accept for a given amount of _liquidity
   * @param _amount1Min The minimal amount of _token that the user will accept for a given amount of _liquidity
   * @param _deadline The UTC timestamp that if reached, causes the transaction to fail automatically
   * @return amount0 The amount of _token that are returned to the recipient
   * @return amount1 The amount of ether that are returned to the recipient
   */
  function removeLiquidity(
    address _to,
    address _token0,
    address _token1,
    uint _liquidity,
    uint _amount0Min,
    uint _amount1Min,
    uint _deadline
  ) external override ensure(_deadline) returns (uint amount0, uint amount1) {
    (amount0, amount1) = _removeLiquidityOptions(
      _to,
      _token0,
      _token1,
      _liquidity,
      _amount0Min,
      _amount1Min
    );
  }

  // **** SWAP ****
  // requires the initial amount to have already been sent to the primary pool
  function _swap(
    address _token0,
    address _token1,
    address _to
  ) internal returns (uint input, uint output) {
    (input, output) = IXfaiV0Core(core).swap(_token0, _token1, _to);
  }

  /**
   * @notice Swap an exact amount of one ERC20 token (_token0) for another one (_token1)
   * @dev Requires _token0  approval. At the end of the function call, an amount _amount0In of _token0 is deposited into Xfai, and a given amount (larger than _amount1OutMin) of _token1 is returned to the recipient.
   * @param _to The address of the recipient
   * @param _token0 An ERC20 token address
   * @param _token1 An ERC20 token address
   * @param _amount0In The amount of _token0 to be swapped
   * @param _amount1OutMin The minimal amount of _token1 that the user will accept for a given amount of _amount0In
   * @param _deadline The UTC timestamp that if reached, causes the transaction to fail automatically
   */
  function swapExactTokensForTokens(
    address _to,
    address _token0,
    address _token1,
    uint _amount0In,
    uint _amount1OutMin,
    uint _deadline
  ) external override ensure(_deadline) returns (uint) {
    address pool;
    if (_token0 == xfETH) {
      pool = XfaiLibrary.poolFor(_token1, factory, poolCodeHash);
    } else {
      pool = XfaiLibrary.poolFor(_token0, factory, poolCodeHash);
    }
    TransferHelper.safeTransferFrom(_token0, msg.sender, pool, _amount0In);
    (, uint amount1Out) = _swap(_token0, _token1, _to);
    require(amount1Out >= _amount1OutMin, 'XfaiV0Periphery01: INSUFFICIENT_OUTPUT_AMOUNT');
    return amount1Out;
  }

  /**
   * @notice Swap an amount of one ERC20 token (_token0) for an exact amount of another one (_token1)
   * @dev Requires _token0  approval. At the end of the function call, an amount (smaller than _amount0InMax) of _token0 is deposited into xfai, and an amount _amount1Out og _token1 is returned to the recipient.
   * @param _to The address of the recipient
   * @param _token0 An ERC20 token address
   * @param _token1 An ERC20 token address
   * @param _amount1Out The amount of _token1 that one wants to receive
   * @param _amount0InMax The maximal amount of _token0 that the user is willing to trade for a given amount of _amount1Out
   * @param _deadline The UTC timestamp that if reached, causes the swap transaction to fail automatically
   */
  function swapTokensForExactTokens(
    address _to,
    address _token0,
    address _token1,
    uint _amount1Out,
    uint _amount0InMax,
    uint _deadline
  ) external override ensure(_deadline) returns (uint amount0In) {
    address pool0;
    address pool1;
    if (_token0 == xfETH) {
      pool0 = XfaiLibrary.poolFor(_token1, factory, poolCodeHash);
      pool1 = XfaiLibrary.poolFor(_token1, factory, poolCodeHash);
      (uint r, uint w) = IXfaiPool(pool0).getStates();
      amount0In = XfaiLibrary.getAmountIn(w, r, _amount1Out, IXfaiV0Core(core).getTotalFee());
    } else if (_token1 == xfETH) {
      pool0 = XfaiLibrary.poolFor(_token0, factory, poolCodeHash);
      pool1 = XfaiLibrary.poolFor(_token0, factory, poolCodeHash);
      (uint r, uint w) = IXfaiPool(pool0).getStates();
      amount0In = XfaiLibrary.getAmountIn(r, w, _amount1Out, IXfaiV0Core(core).getTotalFee());
    } else {
      pool0 = XfaiLibrary.poolFor(_token0, factory, poolCodeHash);
      pool1 = XfaiLibrary.poolFor(_token1, factory, poolCodeHash);
      amount0In = XfaiLibrary.getAmountsIn(
        pool0,
        pool1,
        _amount1Out,
        IXfaiV0Core(core).getTotalFee()
      );
    }
    require(amount0In <= _amount0InMax, 'XfaiV0Periphery01: INSUFFICIENT_INPUT_AMOUNT');
    TransferHelper.safeTransferFrom(_token0, msg.sender, pool0, amount0In);
    _swap(_token0, _token1, _to);
  }

  /**
   * @notice Swap an exact amount of ether for an ERC20 token (_token1)
   * @dev At the end of the function call, an exact amount of ether is deposited into Xfai, and a given amount (larger than _amount1OutMin) of _token1 is returned to the recipient.
   * @param _to The address of the recipient
   * @param _token1 An ERC20 token address
   * @param _amount1OutMin The minimal amount of _token1 that the user will accept for a given amount of _amount0In
   * @param _deadline The UTC timestamp that if reached, causes the swap transaction to fail automatically
   */
  function swapExactETHForTokens(
    address _to,
    address _token1,
    uint _amount1OutMin,
    uint _deadline
  ) external payable override ensure(_deadline) returns (uint amount1Out) {
    address wrappedETH = weth; // gas savings
    uint amount0In = msg.value;
    address pool0 = XfaiLibrary.poolFor(wrappedETH, factory, poolCodeHash);
    IWETH(wrappedETH).deposit{value: amount0In}();
    assert(IWETH(weth).transfer(pool0, amount0In));
    if (_token1 == xfETH) {
      (, amount1Out) = _swap(wrappedETH, xfETH, _to);
    } else {
      (, amount1Out) = _swap(wrappedETH, _token1, _to);
    }
    require(amount1Out >= _amount1OutMin, 'XfaiV0Periphery01: INSUFFICIENT_OUTPUT_AMOUNT');
  }

  /**
   * @notice Swap an amount of one ERC20 token (_token0) for an exact amount of ether
   * @dev Requires _token0  approval. At the end of the function call, a given amount (smaller than _amount0InMax) of _token0 is deposited into xfai, and and the amount _amount1Out of ether is returned to the recipient.
   * @param _to The address of the recipient
   * @param _token0 An ERC20 token address
   * @param _amount1Out The amount of ether that one wants to receive
   * @param _amount0InMax The maximal amount of _token0 that the user is willing to trade for a given amount of _amount1Out
   * @param _deadline The UTC timestamp that if reached, causes the swap transaction to fail automatically
   */
  function swapTokensForExactETH(
    address _to,
    address _token0,
    uint _amount1Out,
    uint _amount0InMax,
    uint _deadline
  ) external override ensure(_deadline) returns (uint amount0In) {
    address wrappedETH = weth; // gas savings
    address pool0;
    if (_token0 == xfETH) {
      pool0 = XfaiLibrary.poolFor(wrappedETH, factory, poolCodeHash);
      (uint r, uint w) = IXfaiPool(pool0).getStates();
      amount0In = XfaiLibrary.getAmountIn(w, r, _amount1Out, IXfaiV0Core(core).getTotalFee());
    } else {
      pool0 = XfaiLibrary.poolFor(_token0, factory, poolCodeHash);
      amount0In = XfaiLibrary.getAmountsIn(
        pool0,
        XfaiLibrary.poolFor(wrappedETH, factory, poolCodeHash),
        _amount1Out,
        IXfaiV0Core(core).getTotalFee()
      );
    }
    require(amount0In <= _amount0InMax, 'XfaiV0Periphery01: INSUFFICIENT_INPUT_AMOUNT');
    TransferHelper.safeTransferFrom(_token0, msg.sender, pool0, amount0In);
    _swap(_token0, wrappedETH, address(this));
    IWETH(wrappedETH).withdraw(_amount1Out);
    TransferHelper.safeTransferETH(_to, _amount1Out);
    return amount0In;
  }

  /**
   * @notice Swap an exact amount of one ERC20 token (_token0) for ether
   * @dev Requires _token0  approval. At the end of the function call, a given amount _amount0In of _token0 is deposited into Xfai, and an amount (larger than _amount1OutMin) of ether is returned to the recipient.
   * @param _to The address of the recipient
   * @param _token0 An ERC20 token address
   * @param _amount0In The amount of _token0 to be swapped
   * @param _amount1OutMin The minimal amount of ether that the user will accept for a given amount of _amount0In
   * @param _deadline The UTC timestamp that if reached, causes the transaction to fail automatically
   */
  function swapExactTokensForETH(
    address _to,
    address _token0,
    uint _amount0In,
    uint _amount1OutMin,
    uint _deadline
  ) external override ensure(_deadline) returns (uint amount1Out) {
    address pool0;
    address wrappedETH = weth;
    if (_token0 == xfETH) {
      pool0 = XfaiLibrary.poolFor(wrappedETH, factory, poolCodeHash);
    } else {
      pool0 = XfaiLibrary.poolFor(_token0, factory, poolCodeHash);
    }
    TransferHelper.safeTransferFrom(_token0, msg.sender, pool0, _amount0In);
    (, amount1Out) = _swap(_token0, wrappedETH, address(this));
    require(amount1Out >= _amount1OutMin, 'XfaiV0Periphery01: INSUFFICIENT_OUTPUT_AMOUNT');
    IWETH(wrappedETH).withdraw(amount1Out);
    TransferHelper.safeTransferETH(_to, amount1Out);
  }

  /**
   * @notice Swap an amount of ether for an exact amount of ERC20 tokens (_token1)
   * @dev At the end of the function call, a given amount of ether is deposited into xfai, and a given amount _amount1Out of _token1 is returned to the recipient.
   * @param _to The address of the recipient
   * @param _token1 An ERC20 token address
   * @param _amount1Out The amount of _token1 that the user accepts for a given amount of ether
   * @param _deadline The UTC timestamp that if reached, causes the swap transaction to fail automatically
   */
  function swapETHForExactTokens(
    address _to,
    address _token1,
    uint _amount1Out,
    uint _deadline
  ) external payable override ensure(_deadline) returns (uint input) {
    address wrappedETH = weth; // gas savings
    address pool0 = XfaiLibrary.poolFor(wrappedETH, factory, poolCodeHash);
    address pool1;
    if (_token1 == xfETH) {
      pool1 = XfaiLibrary.poolFor(wrappedETH, factory, poolCodeHash);
      (uint r, uint w) = IXfaiPool(pool1).getStates();
      input = XfaiLibrary.getAmountIn(r, w, _amount1Out, IXfaiV0Core(core).getTotalFee());
    } else {
      pool1 = XfaiLibrary.poolFor(_token1, factory, poolCodeHash);
      input = XfaiLibrary.getAmountsIn(pool0, pool1, _amount1Out, IXfaiV0Core(core).getTotalFee());
    }
    require(input <= msg.value, 'XfaiV0Periphery01: INSUFFICIENT_INPUT_AMOUNT');
    IWETH(wrappedETH).deposit{value: input}();
    assert(IWETH(weth).transfer(pool0, input));
    _swap(wrappedETH, _token1, _to);
    // refund dust eth, if any
    if (msg.value > input) TransferHelper.safeTransferETH(msg.sender, msg.value - input);
  }
}
