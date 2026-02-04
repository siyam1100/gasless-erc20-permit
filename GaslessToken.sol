// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/**
 * @title GaslessToken
 * @dev Implementation of an ERC20 token with EIP-2612 permit capabilities.
 */
contract GaslessToken is ERC20, ERC20Permit {
    constructor(uint256 initialSupply) 
        ERC20("GaslessToken", "GLT") 
        ERC20Permit("GaslessToken") 
    {
        _mint(msg.sender, initialSupply);
    }

    /**
     * @dev Example function to demonstrate a 'transfer with permit'.
     * In a real scenario, a relayer would call this.
     */
    function transferWithPermit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        permit(owner, spender, value, deadline, v, r, s);
        transferFrom(owner, spender, value);
    }
}
