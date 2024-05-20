pragma solidity ^0.5.5;

// Import necessary OpenZeppelin contracts
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

// Define a new contract named `KaseiCoin`
contract KaseiCoin is ERC20, ERC20Detailed, ERC20Mintable {

    // Constructor function to initialize the KaseiCoin contract
    constructor(
        string memory name,    // Name of the token, e.g., "KaseiCoin"
        string memory symbol,  // Symbol of the token, e.g., "KAI"
        uint initial_supply    // Initial supply of tokens, if any
    )
        // Call the ERC20Detailed constructor to set the token details
        ERC20Detailed(name, symbol, 18)
        public
    {
        // The constructor can remain empty as minting is handled by ERC20Mintable
    }
}
