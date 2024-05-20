pragma solidity ^0.5.5;

// Import the KaseiCoin token and OpenZeppelin Crowdsale contracts
import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

// Define a contract for KaseiCoin crowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale {
    
    // Constructor to initialize the crowdsale
    constructor(
        uint256 rate,              // Rate (number of token units per wei)
        address payable wallet,    // Wallet address to send raised Ether
        KaseiCoin token            // Token to be sold
    )
        // Call the parent Crowdsale contract constructor with rate, wallet, and token
        Crowdsale(rate, wallet, token)
        public
    {
        // Constructor body is empty as initialization is handled by parent constructors
    }
}

// Define a deployer contract for setting up KaseiCoin and its crowdsale
contract KaseiCoinCrowdsaleDeployer {

    // Public addresses for the deployed KaseiCoin token and crowdsale contracts
    address public kasei_token_address;
    address public kasei_crowdsale_address;

    // Constructor for deploying and setting up KaseiCoin and its crowdsale
    constructor(
        string memory name,            // Name of the KaseiCoin token
        string memory symbol,          // Symbol of the KaseiCoin token
        address payable wallet         // Wallet address to send raised funds
    )
        public
    {
        // Deploy the KaseiCoin token contract with zero initial supply
        KaseiCoin token = new KaseiCoin(name, symbol, 0);
        kasei_token_address = address(token);

        // Deploy the KaseiCoinCrowdsale contract
        KaseiCoinCrowdsale kasei_crowdsale = new KaseiCoinCrowdsale(1, wallet, token);
        kasei_crowdsale_address = address(kasei_crowdsale);

        // Grant the crowdsale contract the minter role on the token contract
        token.addMinter(kasei_crowdsale_address);
        
        // Renounce the minter role from the deployer to ensure it cannot mint tokens
        token.renounceMinter();
    }
}
