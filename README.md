# ERC20-Assessment---Module-3

## MyToken Smart Contract

MyToken is an ERC20 token implemented using Solidity. This token, named "JENCEN" with the symbol "JMW", includes functionalities for minting, burning, and transferring tokens. The contract owner has exclusive rights to mint new tokens.
## Overview

The `MyToken` contract extends the OpenZeppelin ERC20 implementation and includes additional functionality such as minting and burning tokens. The contract owner has the exclusive rights to mint new tokens.

## Features

- **Minting:** The owner can mint new tokens to a specified address.
- **Burning:** Any token holder can burn their own tokens.
- **Transfers:** Standard ERC20 transfer functionality is supported.

## Contract Details

- **Name:** JENCEN
- **Symbol:** JMW
- **Decimals:** 18 (default for ERC20)
- **Initial Supply:** 20,000,000 JMW

## Functions

`constructor()`
-  Description: The constructor is executed once when the contract is deployed. It sets the deployer as the contract owner and mints the initial supply of tokens to the owner's address.
-  Parameters: None
-  Events: Mints 20,000,000 JMW tokens to the owner's address.

`mint(address _to, uint256 _amount)`
-  Description: Mints new tokens and assigns them to the specified address. Only the contract owner can call this function.
-  Parameters:
    *  `_to`: Address to receive the newly minted tokens.
    *  `_amount`: Number of tokens to mint.
-  Returns: Boolean indicating success (`true`).
-  Modifiers: `onlyOwner`
  
`burn(uint256 _amount)`
-  Description: Burns a specified amount of tokens from the caller's balance.
-  Parameters:
  *  `_amount`: Number of tokens to burn.
  *  Returns: Boolean indicating success (`true`).

`transfer(address _to, uint256 _value)`

-  escription: Transfers tokens from the caller's address to the specified address. Overrides the `transfer` function of the ERC20 standard.
-  Parameters:
  *  `_to`: Address to receive the tokens.
  *  `_value`: Number of tokens to transfer.
  *  Returns Boolean indicating success (`true`).

`onlyOwer`
- Description: Modifier to restrict function access to only the contract owner.
- Usage: Precedes the function body to restrict access. 

# Author

Wee,Jencen M. 
8212778@ntc.edu.ph
