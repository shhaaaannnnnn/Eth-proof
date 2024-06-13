// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {

    // Public variables
    string public name;
    string public symbol;
    uint256 public totalSupply;

    // Mapping of addresses to balances
    mapping(address => uint256) public balances;

    // Constructor to set the initial values
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply; // Assign the initial supply to the contract deployer
    }

    // Mint function to create new tokens
    function mint(address _to, uint256 _amount) public {
        require(_to != address(0), "Invalid address");

        totalSupply += _amount;
        balances[_to] += _amount;
    }

    // Burn function to destroy tokens
    function burn(address _from, uint256 _amount) public {
        require(_from != address(0), "Invalid address");
        require(balances[_from] >= _amount, "Insufficient balance");

        totalSupply -= _amount;
        balances[_from] -= _amount;
    }
}
