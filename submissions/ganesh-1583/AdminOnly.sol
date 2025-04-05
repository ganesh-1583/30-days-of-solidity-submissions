// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdminOnly {
    address owner;
    uint256 totalTreasure;
    mapping(address => uint256) allowance;
    mapping(address => bool) public hasWithdrawn;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addTreasure(uint256 amount) external onlyOwner {
        totalTreasure += amount;
    }

    function ownerWithdraw(uint256 amount) external onlyOwner {
        require(amount <= totalTreasure, "Not enough treasure");
        totalTreasure -= amount;
    }

    function approveWithdrawal(address user, uint256 amount) external onlyOwner {
        allowance[user] = amount;
        hasWithdrawn[user] = false; // reset withdraw status if needed
    }

    function withdraw() external {
        require(allowance[msg.sender] > 0, "No allowance");
        require(!hasWithdrawn[msg.sender], "Already withdrawn");
        require(allowance[msg.sender] <= totalTreasure, "Not enough treasure");

        totalTreasure -= allowance[msg.sender];
        hasWithdrawn[msg.sender] = true;
    }

    function resetWithdrawalStatus(address user) external onlyOwner {
        hasWithdrawn[user] = false;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid new owner");
        owner = newOwner;
    }
}
