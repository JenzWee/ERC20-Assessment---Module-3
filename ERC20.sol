// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DungeonQuest is ERC20 {
    // Declare the state variable
    address public owner;
    uint256 private _initialSupply;
    uint256 private _maxRedeemItems = 10;
    
    // These mappings hold user-specific information:
    mapping(address => mapping(string => uint256)) private _redeemedItems;
    mapping(address => uint256) private _redeemLimits;
    mapping(address => uint256) private _itemCounts;
    mapping(address => string) private _itemTypes;

     // Event to log item redemption
    event ItemRedeemed(address indexed user, string indexed itemType);

    // Constructor function to initialize the token with name, symbol, and initial supply
    constructor() ERC20("DungeonQuest", "DQ") {
        owner = msg.sender;
        uint256 initialSupply = 20000 * (10 ** decimals());
        _mint(msg.sender, initialSupply);
        _initialSupply = initialSupply;
    }

    // Functopn to mint token
    function mint(address _to, uint256 _amount) public onlyOwner returns (bool) {
        _mint(_to, _amount);
        return true;
    }

    //Function to burn tokens
    function burn(uint256 _amount) public returns (bool) {
        _burn(msg.sender, _amount);
        return true;
    }

     // Overriding ERC20 transfer function
    function transfer(address _to, uint256 _value) public override returns (bool) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    // Redeem an item for every player
    function redeemItem(uint256 amount, string memory itemType) public returns (bool) {
        require(_redeemedItems[msg.sender][itemType] + amount <= _maxRedeemItems, "Exceeded maximum redeemable items");
        require(balanceOf(msg.sender) >= amount, "Player is not enough balance");

        _burn(msg.sender, amount);
        _redeemedItems[msg.sender][itemType] += amount;
        _itemCounts[msg.sender]++;
        _itemTypes[msg.sender] = itemType;

        emit ItemRedeemed(msg.sender, itemType);
        return true;
    }

    // To set redeem limit for a user
    function setRedeemLimit(address player, uint256 limit) public onlyOwner {
        _redeemLimits[player] = limit;
    }

    // Function to get the count and type of the last redeemed item for a user
    function getItemCountAndType(address user) public view returns (uint256 itemCount, string memory itemType) {
        return (_itemCounts[user], _itemTypes[user]);
    }

    // Modifier to restrict access to certain functions to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}
