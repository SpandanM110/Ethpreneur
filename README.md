

# Ethpreneur

Ethpreneur is a decentralized platform for listing companies where users can tokenize and trade company shares in the form of NFTs. This project is built using **TypeScript**, **Next.js**, and **Thirdweb**, leveraging the power of blockchain for decentralized business ownership.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the Project](#running-the-project)
- [Smart Contracts](#smart-contracts)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Overview

Ethpreneur allows users to list decentralized companies and tokenize their shares as **NFTs**, enabling fractional ownership and transparent trading. Companies can issue shares, and users can purchase, sell, and transfer ownership of these shares in the form of NFTs on the platform.

By using **Thirdweb** for smart contract interactions and **Next.js** for the frontend, this project ensures secure and efficient decentralized business operations.

## Features

- **Decentralized Company Listing**: List your company and tokenize its shares as NFTs.
- **Fractional Ownership**: Trade shares of companies on the blockchain as NFTs.
- **Secure Smart Contracts**: Using Thirdweb for deploying and managing smart contracts.
- **User-friendly Interface**: Built with Next.js for a modern, responsive UI.
- **Typescript-first Development**: Ensures type safety and robust code.
  
## Tech Stack

- **Frontend**: Next.js (React-based framework for server-side rendering and static site generation)
- **Smart Contracts**: Thirdweb for Ethereum smart contract interactions
- **Programming Language**: TypeScript (JavaScript with static types)
- **Blockchain**: Ethereum (or compatible EVM chains, depending on deployment)
- **API**: Thirdweb SDK for blockchain interactions

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- **Node.js** installed (>= 14.x)
- **Yarn** or **npm** as your package manager
- **Metamask** (or any other Web3 wallet) for testing blockchain transactions
- **Thirdweb account** for managing smart contracts

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/ethpreneur.git
   cd ethpreneur
   ```

2. Install the dependencies:

   ```bash
   # Using Yarn
   yarn install

   # Or using npm
   npm install
   ```

### Running the Project

1. Create an `.env.local` file in the root directory and add the following environment variables:

   ```bash
   NEXT_PUBLIC_THIRDWEB_PROJECT_ID=your_thirdweb_project_id
   NEXT_PUBLIC_THIRDWEB_API_KEY=your_thirdweb_api_key
   ```

2. Run the development server:

   ```bash
   yarn dev
   ```

   The project should now be running at `http://localhost:3000`.

3. Open your browser and interact with the platform via the **Metamask** extension.

## Smart Contracts

Ethpreneur uses **Thirdweb** for deploying and interacting with Ethereum-based smart contracts.

- **NFT Drop**: Tokenizes company shares as NFTs.
- **Marketplace**: Manages listing and transfer of NFTs representing company shares.

To deploy and interact with these contracts, follow the Thirdweb documentation and use your Thirdweb project credentials in the `.env.local` file.

### Contract Addresses:

- **Company Shares NFT Collection**: `0x11Ba544b59A6d3552fe2899308CEDB474505ECAF`
- **Marketplace Contract**: `0xA600229C84eCCD9a22468D30EB0704Fb5abdA319`

## Project Structure

```
├── components     # Reusable React components
├── contracts      # Smart contract interaction logic using Thirdweb
├── pages          # Next.js pages
├── public         # Public assets (images, etc.)
├── styles         # Global and component-specific styles
├── utils          # Helper functions and utilities
└── .env.local     # Environment variables (do not commit this file)
```

## Contributing

We welcome contributions to Ethpreneur! To get started:

1. Fork the repository
2. Create a new branch: `git checkout -b feature-branch-name`
3. Make your changes
4. Commit the changes: `git commit -m 'Add new feature'`
5. Push to the branch: `git push origin feature-branch-name`
6. Open a pull request for review

### Code of Conduct

Please adhere to our [Code of Conduct](CODE_OF_CONDUCT.md) to ensure a positive experience for everyone.

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

## Acknowledgements

- [Thirdweb](https://thirdweb.com/) for blockchain and NFT contract management
- [Next.js](https://nextjs.org/) for the frontend framework
- [Ethereum](https://ethereum.org/) for the blockchain infrastructure

---

