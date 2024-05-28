// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    // Declare the owner of the contract
    address public owner;
    // Variable to store the initial supply of tokens
    uint256 private _initialSupply;

    // Constructor function to initialize the token with name, symbol, and initial supply
    constructor() ERC20("JENCEN", "JMW") {
        owner = msg.sender;
        uint256 initialSupply = 20000000 * (10 ** decimals());
        _mint(msg.sender, initialSupply);
        _initialSupply = initialSupply;
    }

    // Function to mint new tokens, can only be called by the owner
    function mint(address _to, uint256 _amount) public onlyOwner returns (bool) {
        _mint(_to, _amount);
        return true;
    }

    // Function to burn tokens from the caller's address
    function burn(uint256 _amount) public returns (bool) {
        _burn(msg.sender, _amount);
        return true;
    }

    // Override the transfer function to add custom logic if needed
    function transfer(address _to, uint256 _value) public override returns (bool) {
       
        _transfer(msg.sender, _to, _value);
        return true;
    }

    // Modifier to restrict functions to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}
