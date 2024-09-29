

# **Ethpreneur** 🌐

> **A decentralized platform for listing companies as NFTs and allowing users to trade company stocks as digital assets.**

## **Overview**
**Ethpreneur** empowers users to create, manage, and trade company shares as NFTs on the blockchain. Built with **Next.js**, **TypeScript**, and **Thirdweb**, it provides a secure and user-friendly interface to interact with decentralized companies, with features like wallet-based authentication, company listings, and NFT shares trading.

## **Key Features**
- 🏢 **Company Listings**: Decentralized companies listed and represented as NFTs.
- 💼 **NFT Stocks**: Trade company shares as NFTs, enabling decentralized ownership.
- 🔐 **Wallet Authentication**: Secure login via crypto wallets like MetaMask.
- 📊 **Dashboard for Company Owners**: Manage company performance, issue new shares, and track ownership.
- 💻 **Cross-chain Support**: Supports multiple chains for seamless cross-network transactions.
- 🎨 **Dark Mode**: Toggle between light and dark themes for a personalized user experience.

## **Tech Stack**
- **Frontend**: Next.js (React Framework), Tailwind CSS
- **Blockchain**: Thirdweb, Ethereum/Sepolia Testnet
- **Language**: TypeScript
- **Testing**: Jest (for frontend), Hardhat (for smart contracts)
- **Deployment**: Vercel (for frontend), Thirdweb (for smart contracts)

---

## **Getting Started**

### **Prerequisites**
Make sure you have the following installed:
- **Node.js**: >= v14
- **Yarn**: Recommended package manager
- **MetaMask** (or another Ethereum wallet)

### **Installation**

1. **Clone the repo:**

   ```bash
   git clone https://github.com/SpandanM110/ethpreneur.git
   cd ethpreneur
   ```

2. **Install dependencies:**

   ```bash
   yarn install
   ```

3. **Set up environment variables:**
   
   - Create a `.env.local` file in the root directory.
   - Add your Thirdweb, Ethereum, and other necessary keys:

     ```bash
     NEXT_PUBLIC_THIRDWEB_API_KEY=your_thirdweb_api_key
     NEXT_PUBLIC_INFURA_PROJECT_ID=your_infura_project_id
     ```

4. **Start the development server:**

   ```bash
   yarn dev
   ```

   Open [http://localhost:3000](http://localhost:3000) to see the application in action.

---

## **How to Contribute**

We welcome contributions from everyone! To contribute:

1. **Fork the repository**.
2. **Create a new branch** for each feature or fix:  
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes** and test thoroughly.
4. **Create a Pull Request** and follow the PR template.

Be sure to check out our [Code of Conduct](link-to-code-of-conduct) before contributing.

---

## **Project Structure**
Here’s a breakdown of the major folders:

```
ethpreneur/
│
├── /components/    # Reusable React components
├── /pages/         # Next.js pages and routing
├── /public/        # Static files (images, etc.)
├── /styles/        # Tailwind CSS styles
├── /contracts/     # Smart contracts
└── README.md       # Project documentation
```

---

## **Learn More**

If you want to learn more about **Ethpreneur**, check out the following resources:
- [Next.js Documentation](https://nextjs.org/docs) - Learn about Next.js features and API.
- [Thirdweb Documentation](https://portal.thirdweb.com/) - Explore blockchain features like NFT minting.
- [TypeScript Documentation](https://www.typescriptlang.org/docs/) - Learn TypeScript basics and advanced techniques.

---

## **Contributors** 🤝

We want to recognize all the fantastic people who have contributed to the project. You can view the full list of contributors [here](https://github.com/your-username/ethpreneur/graphs/contributors).

**How to add yourself as a contributor**:
- Fork the repository.
- Add yourself to the `CONTRIBUTORS.md` file.
- Submit a pull request!

---

## **License** 📝

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.

---

## **Contact**
If you have any questions or feedback, feel free to reach out:

- **GitHub**: [SpandanM110](https://github.com/SpandanM110)
- **Twitter**: [@spandan_twts](https://twitter.com/spandan_twts)

---

### **Where to List Contributors**

You can list contributors in a **`CONTRIBUTORS.md`** file inside the root directory of your project. The file should follow this format:

```md
# Contributors

Thank you to everyone who has contributed to Ethpreneur! 🎉

## Contributors List
- **Your Name** – Core Developer  
- **Contributor Name** – Bug Fixes  
- **Another Contributor** – Feature Development  

Feel free to add your name to this file when you make your first contribution!
```


```markdown
View the [list of contributors](https://github.com/your-username/ethpreneur/graphs/contributors) who have helped build this project!
```

---
