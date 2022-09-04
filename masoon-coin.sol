// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract MasoonCoin {
    function name() pure public returns (string memory) {
        return 'MasoonCoin';
    }

    function symbol() pure public returns (string memory) {
        return 'MSC';
    }

    function decimals() pure public returns (uint8) {
        return 0;
    }

    function totalSupply() pure public returns (uint256) {
        return 1000000000000000000; // 10^18
    }
}
