# ⛓️ Blockchain-Based Subscription Service

A Solidity smart contract deployed on Ethereum implementing a fully automated tiered subscription model.

## 📌 Overview
This project demonstrates real-world DeFi concepts by building a subscription service directly on the Ethereum blockchain — no middlemen, no manual processing, fully automated.

## 🎯 Features
- 3 subscription tiers — Basic, Premium, and VIP
- Automated payment validation using ETH
- 30-day subscription expiry logic built into the contract
- On-chain state management using Solidity mappings and structs
- ETH withdrawal restricted securely to contract owner only

## 🛠️ Tech Stack
- **Language:** Solidity ^0.8.20
- **Platform:** Ethereum Blockchain
- **Tools:** VS Code

## 📂 Project Structure
blockchain-subscription-service/
│
├── subscription.sol      # Main smart contract
├── case_study.docx       # Project case study and analysis
└── Project_Proposal.docx # Original project proposal

## 🔍 Contract Functions
| Function | Description |
|----------|-------------|
| `subscribe(uint _plan)` | Subscribe to Basic, Premium or VIP plan |
| `checkSubscription(address)` | Check plan and expiry for any address |
| `isActive(address)` | Returns true if subscription is still active |
| `withdraw()` | Owner-only ETH withdrawal |

## 💡 Key Concepts Demonstrated
- Smart contract development in Solidity
- Ethereum payment handling (msg.value)
- Access control and security patterns
- Blockchain-based state management
