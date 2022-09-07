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

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    mapping(address => uint256) accountBalance;

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return accountBalance[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        address sender = msg.sender;
        if (balanceOf(sender) >= _value) {
            accountBalance[sender] -= _value;
            accountBalance[_to] += _value;
            emit Transfer(sender, _to, _value);
            // Here I should fire the Transfer event
            // I should decide to allow 0 transfer or not
            return true;
        }
        else {
            // I should throw
        }
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        address sender = msg.sender;
        if (accountBalance[_from] >= _value && allowances[_from][sender] >= _value) {
            accountBalance[_from] -= _value;
            allowances[_from][sender] -= _value;
            accountBalance[_to] += _value;
            emit Transfer(_from, _to, _value);
            return true;
            // allow 0 transfer ?
        } else {
            // Throw
        }
    }

    mapping(address => mapping(address => uint256)) allowances;

    // This function has a vulnerability (An Attack Vector on Approve/TransferFrom Methods)
    function approve(address _spender, uint256 _value) public returns (bool success) {
        address owner = msg.sender;
        allowances[owner][_spender] = _value;
        emit Approval(owner, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }

    constructor() {
        address contractCreator = msg.sender;
        accountBalance[contractCreator] += 1000000000000000000;
        emit Transfer(0x0000000000000000000000000000000000000000, contractCreator, 1000000000000000000);
    }
}
