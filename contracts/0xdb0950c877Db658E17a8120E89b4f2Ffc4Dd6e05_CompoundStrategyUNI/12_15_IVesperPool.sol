// SPDX-License-Identifier: MIT

pragma solidity 0.8.3;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../bloq/IAddressList.sol";

interface IVesperPool is IERC20 {
    function deposit() external payable;

    function deposit(uint256 _share) external;

    function multiTransfer(address[] memory _recipients, uint256[] memory _amounts) external returns (bool);

    function excessDebt(address _strategy) external view returns (uint256);

    function permit(
        address,
        address,
        uint256,
        uint256,
        uint8,
        bytes32,
        bytes32
    ) external;

    function reportEarning(
        uint256 _profit,
        uint256 _loss,
        uint256 _payback
    ) external;

    function reportLoss(uint256 _loss) external;

    function resetApproval() external;

    function sweepERC20(address _fromToken) external;

    function withdraw(uint256 _amount) external;

    function withdrawETH(uint256 _amount) external;

    function whitelistedWithdraw(uint256 _amount) external;

    function governor() external view returns (address);

    function keepers() external view returns (IAddressList);

    function maintainers() external view returns (IAddressList);

    function feeCollector() external view returns (address);

    function pricePerShare() external view returns (uint256);

    function stopEverything() external view returns (bool);

    function token() external view returns (IERC20);

    function tokensHere() external view returns (uint256);

    function totalDebtOf(address _strategy) external view returns (uint256);

    function totalValue() external view returns (uint256);

    function withdrawFee() external view returns (uint256);
}