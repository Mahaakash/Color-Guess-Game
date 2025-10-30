
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ColorGuessGame {
    // The secret color is stored here
    string private secretColor = "Red";
    
    // Track game statistics
    address public owner;
    address public winner;
    uint256 public totalGuesses;
    bool public gameActive;
    
    // Events to log guesses and wins
    event GuessedColor(address player, string color, bool correct);
    event GameReset(string newColor);
    
    constructor() {
        owner = msg.sender;
        gameActive = true;
    }
    
    // Players call these functions directly to guess colors
    function guessRed() public returns (bool) {
        require(gameActive, "Game is over!");
        totalGuesses++;
        
        if (keccak256(abi.encodePacked(secretColor)) == keccak256(abi.encodePacked("Red"))) {
            winner = msg.sender;
            gameActive = false;
            emit GuessedColor(msg.sender, "Red", true);
            return true;
        } else {
            emit GuessedColor(msg.sender, "Red", false);
            return false;
        }
    }
    
    function guessBlue() public returns (bool) {
        require(gameActive, "Game is over!");
        totalGuesses++;
        
        if (keccak256(abi.encodePacked(secretColor)) == keccak256(abi.encodePacked("Blue"))) {
            winner = msg.sender;
            gameActive = false;
            emit GuessedColor(msg.sender, "Blue", true);
            return true;
        } else {
            emit GuessedColor(msg.sender, "Blue", false);
            return false;
        }
    }
    
    function guessGreen() public returns (bool) {
        require(gameActive, "Game is over!");
        totalGuesses++;
        
        if (keccak256(abi.encodePacked(secretColor)) == keccak256(abi.encodePacked("Green"))) {
            winner = msg.sender;
            gameActive = false;
            emit GuessedColor(msg.sender, "Green", true);
            return true;
        } else {
            emit GuessedColor(msg.sender, "Green", false);
            return false;
        }
    }
    
    function guessYellow() public returns (bool) {
        require(gameActive, "Game is over!");
        totalGuesses++;
        
        if (keccak256(abi.encodePacked(secretColor)) == keccak256(abi.encodePacked("Yellow"))) {
            winner = msg.sender;
            gameActive = false;
            emit GuessedColor(msg.sender, "Yellow", true);
            return true;
        } else {
            emit GuessedColor(msg.sender, "Yellow", false);
            return false;
        }
    }
    
    // Owner can reset the game with a new color
    function resetGame(string memory newColor) public {
        require(msg.sender == owner, "Only owner can reset the game");
        secretColor = newColor;
        winner = address(0);
        totalGuesses = 0;
        gameActive = true;
        emit GameReset(newColor);
    }
    
    // View functions to check game status
    function getGameStatus() public view returns (bool, uint256, address) {
        return (gameActive, totalGuesses, winner);
    }
}

---

## 🚀 How to Deploy

### Option 1: Remix IDE (Easiest for Beginners)

1. Go to [Remix IDE](https://remix.ethereum.org)
2. Create a new file named `ColorGuessGame.sol`
3. Paste the smart contract code above
4. Select Solidity compiler version `0.8.20` or higher
5. Click **Compile**
6. Go to **Deploy & Run Transactions** tab
7. Select a network (Sepolia testnet recommended)
8. Click **Deploy**
9. Confirm the transaction in your Web3 wallet

### Option 2: Hardhat (For Advanced Users)

```bash
npm install --save-dev hardhat
npx hardhat init
# Copy contract to contracts/ColorGuessGame.sol
npx hardhat compile
npx hardhat run scripts/deploy.js --network sepolia
