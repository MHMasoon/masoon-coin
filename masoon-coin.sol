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

    mapping(address => uint64) accountBalance;

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return accountBalance[_owner];
    }

    function transfer(address _to, uint64 _value) public returns (bool success) {
        address sender = msg.sender;
        if (balanceOf(sender) >= _value) {
            accountBalance[sender] -= _value;
            accountBalance[_to] += _value;
            // Here I should fire the Transfer event
            // I should decide to allow 0 transfer or not
            return true;
        }
        else {
            // I should throw
        }
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // At first I should check if the msg.sender has the authority to transfer from this accout
        if (accountBalance[_from] >= _value) {
            accountBalance[_from] -= _value;
            accountBalance[_to] += _value;
            // Fire the transfer event
            // allow 0 transfer ?
        } else {
            // Throw
        }
    }
}
