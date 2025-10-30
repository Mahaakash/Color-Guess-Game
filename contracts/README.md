**# 🎮 Color Guess Game Smart Contract

A fun and interactive blockchain-based color guessing game built with Solidity! Players compete to guess the secret color and become the winner. Perfect for learning Solidity fundamentals.

---

## 📋 Project Description

**Color Guess Game** is a decentralized smart contract deployed on the Ethereum blockchain that implements a simple yet engaging guessing game. Players call different color-guessing functions to predict the secret color without needing to input any parameters. The first player to guess correctly wins the game and their address is recorded on the blockchain forever.

This project is designed as an educational tool for beginners learning Solidity smart contract development, demonstrating key concepts like state management, function calls, events, and access control.

---

## 🎯 What It Does

The smart contract allows multiple players to interact with it by calling predefined color-guessing functions:

- **Players call simple functions** like `guessRed()`, `guessBlue()`, `guessGreen()`, or `guessYellow()` — no parameters needed
- **Instant feedback**: Each guess returns whether it's correct or incorrect
- **Winner tracking**: The first player to guess correctly becomes the winner and the game ends
- **Game statistics**: Track total guesses and view current game status
- **Owner controls**: The contract owner can reset the game with a new secret color
- **Transparent events**: All guesses and game resets are logged as blockchain events

---

## ✨ Features

✅ **No Input Parameters** - Players just call functions like buttons; no complex input required  
✅ **Simple & Beginner-Friendly** - Perfect for learning Solidity basics  
✅ **Transparent Gameplay** - All game actions are recorded on the blockchain  
✅ **Event Logging** - Every guess and game reset emits events for easy tracking  
✅ **Owner Controls** - Contract owner can manage and reset the game  
✅ **Multiple Guess Options** - Four different color functions to try  
✅ **State Tracking** - Monitor game status, winner address, and total guesses  
✅ **Fully Deployable** - Ready to deploy on Remix IDE or any EVM-compatible chain  

---

## 🔗 Deployed Smart Contract

**Contract Address:** 
🔗 Deployed Smart Contract
Contract Address: 0xd91ea846d91250940ad474bc1a812976049516e3

Transaction Hash: 0x5223a103078eb7d93b90edb20fd8752088eebff6206f3e42c7f8bdb6612fcc1c

Block Number: 8529671

From: 0xDa64B5c72A1335C40b07F1e8de0b9E43a33ee120

Gas Used: 1,281,272 gas
<img width="1920" height="1140" alt="Screenshot 2025-10-30 144746" src="https://github.com/user-attachments/assets/57234d9a-af0e-4948-9b37-a4b0c6ed7a88" />





## 💻 Smart Contract Code

```solidity

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
```

---

## 🎮 How to Play

1. **Deploy** the contract using Remix or Hardhat
2. **Call a guess function** from the deployed contract:
   - `guessRed()`
   - `guessBlue()`
   - `guessGreen()`
   - `guessYellow()`
3. **Check the result**: The function returns `true` if correct, `false` if wrong
4. **View game status** using `getGameStatus()` to see:
   - If the game is active
   - Total number of guesses made
   - Current winner's address
5. **Keep guessing** until someone (maybe you!) guesses correctly
6. **Reset the game** (owner only) using `resetGame()` with a new color

---

## 📊 Contract Functions

| Function | Description | Parameters |
|----------|-------------|-----------|
| `guessRed()` | Guess "Red" as the secret color | None |
| `guessBlue()` | Guess "Blue" as the secret color | None |
| `guessGreen()` | Guess "Green" as the secret color | None |
| `guessYellow()` | Guess "Yellow" as the secret color | None |
| `resetGame(string newColor)` | Reset game with new secret color | `newColor` - new secret color string |
| `getGameStatus()` | View current game state | None |

---

## 📖 Learning Concepts

This smart contract demonstrates important Solidity concepts for beginners:

- **State Variables** - Storing data persistently on the blockchain
- **Functions** - Creating callable contract methods
- **Events** - Logging important actions for off-chain tracking
- **Access Control** - Using `require()` statements to restrict functions
- **String Handling** - Comparing strings using `keccak256()` hashing
- **Return Values** - Functions returning boolean results
- **Constructor** - Initializing contract state on deployment

---

## 🔒 Security Notes

⚠️ **Educational Purpose**: This contract is designed for learning and demonstration only. It is **not recommended for production use** with real funds.

**Important Considerations:**
- The secret color is stored openly in the contract (readable by anyone)
- This is intentional for beginners to understand basic logic
- For production games, use cryptographic commitments and randomness (Chainlink VRF)
- Always audit smart contracts before deploying with real value

---

## 🛠️ Technologies Used

- **Solidity** `^0.8.20` - Smart contract programming language
- **Ethereum** - Blockchain network
- **Remix IDE** - Browser-based development environment
- **Web3.js or Ethers.js** - For frontend interaction (optional)

---

## 📚 Resources for Learning

- [Solidity Official Documentation](https://docs.soliditylang.org/)
- [Ethereum Development Guide](https://ethereum.org/developers)
- [Remix IDE Tutorial](https://remix-ide.readthedocs.io/)
- [Smart Contract Best Practices](https://consensys.github.io/smart-contract-best-practices/)

---

## 🤝 Contributing

This is an educational project. Feel free to fork, modify, and use it for learning purposes. If you have improvements or suggestions, create an issue or pull request!

---

## 📝 License

This project is licensed under the **MIT License** - see the SPDX identifier in the contract code.

---

## 🎓 Next Steps

After mastering this contract, try:
- Adding **betting/prizes** functionality
- Implementing **difficulty levels** with hints
- Using **Chainlink VRF** for true randomness
- Building a **frontend UI** with React or Web3.js
- Deploying to **mainnet** or multiple blockchains

---

**Happy guessing! 🎲**


**
