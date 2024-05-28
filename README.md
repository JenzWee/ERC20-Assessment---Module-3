# ERC20-Assessment---Module-3

## MyToken Smart Contract

MyToken is an ERC20 token implemented using Solidity. This token, named "JENCEN" with the symbol "JMW", includes functionalities for minting, burning, and transferring tokens. The contract owner has exclusive rights to mint new tokens.
## Overview

The `MyToken` contract extends the OpenZeppelin ERC20 implementation and includes additional functionality such as minting and burning tokens. The contract owner has the exclusive rights to mint new tokens.

## Features

- **ERC-20 Standard**: Complies with the ERC-20 token standard.
- **Initial Supply**: A fixed initial supply of 20,000,000 tokens.
- **Minting**: Allows the contract owner to mint new tokens.
- **Burning**: Allows any token holder to burn their tokens.
- **Custom Transfer**: Overrides the default transfer function to add custom logic.

## Contract Details

- **Name:** JENCEN
- **Symbol:** JMW
- **Decimals:** 18 (default for ERC20)
- **Initial Supply:** 20,000,000 JMW

## State Variables
- `owner`: The address of the contract owner.
- `_initialSupply`: The initial supply of tokens.

## Functions
- `mint(address _to, uint256 _amount)`: Mints new tokens to the specified address. Only the owner can call this function.
- `burn(uint256 _amount)`: Burns tokens from the caller's address.
- `transfer(address _to, uint256 _value)`: Transfers tokens from the caller to another address.

# Author

Wee,Jencen M. 
8212778@ntc.edu.ph
