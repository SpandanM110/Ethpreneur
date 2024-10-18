# Ethpreneur1155 and EthStock Contracts

## Overview
The `Ethpreneur1155` contract allows companies to register and create their own stock contracts based on ERC1155, enabling stock creation, buying, and selling functionalities. The `EthStock` contract handles the stock management (supply, pricing, and transfers).

## Contracts

### `EthStock`
This contract is an implementation of the ERC1155 token standard, representing a company’s stocks as fungible tokens. The contract allows companies to create and manage their stocks, enabling functionalities like creating, buying, and selling stock types.

#### Key Features:
- **Create Stock**: Allows a company to create new stocks with an initial supply and price.
- **Add Stock Supply**: Adds additional supply to existing stock types.
- **Buy Stock**: Allows buyers to purchase stocks from the company by transferring ETH.
- **Sell Stock**: Allows stockholders to sell their stocks back to the company for ETH.

#### Functions:

- **`createStock(uint256 _price, uint256 _initialSupply)`**: Allows the company owner to create a new stock type with an initial supply and price.
  
- **`addStocks(uint256 sType, uint256 supply)`**: Increases the supply of a specific stock type.
  
- **`buyStock(address buyer, uint256 sType, uint256 amount)`**: Facilitates the buying of stocks by transferring ownership from the company to the buyer. Requires payment to match the total price of the stocks.
  
- **`sellStock(address seller, uint256 sType, uint256 amount)`**: Allows stockholders to sell their stocks back to the company in exchange for ETH.

- **`getStockDetails(uint256 sType)`**: Returns details about a specific stock type, including its total supply, available supply, and price.

- **`getStockPrice(uint256 sType)`**: Retrieves the price of a specific stock type.

- **`getAvailableSupply(uint256 sType)`**: Returns the available supply of a specific stock type.

#### Events:
- **`StockCreated(address stockContract, uint256 stockType)`**: Emitted when a new stock is created.

- **`StockBought(address indexed buyer, uint256 stockType, uint256 amount)`**: Emitted when stocks are bought.

- **`StockSold(address indexed seller, uint256 stockType, uint256 amount)`**: Emitted when stocks are sold.

#### Errors:
- **`Stock__NotEnoughStocks()`**: Thrown when attempting to buy or sell more stocks than are available or owned.
- **`Stock__IncorrectPayment()`**: Thrown when the payment amount doesn't match the total cost of the stocks.

### `Ethpreneur1155`
This contract allows companies to register themselves and create their own stock contracts using the `EthStock` contract. It acts as a registry and controller for multiple companies and their respective stock contracts.

#### Key Features:
- **Company Registration**: A company can register itself and create a stock contract.
- **Create Stock**: Registered companies can create their stocks.
- **Buy and Sell Stock**: Facilitates buying and selling of stocks for registered companies.

#### Functions:

- **`registerCompany(string memory uri)`**: Allows a company to register and deploy a new `EthStock` contract for managing their stocks.
  
- **`createCompanyStock(uint256 _initialSupply, uint256 _price)`**: Allows a registered company to create a new stock type.

- **`buyCompanyStock(address _company, uint256 stockType, uint256 _amount)`**: Enables users to buy stocks from a company's stock contract by paying the required ETH amount.

- **`sellCompanyStock(address _company, uint256 stockType, uint256 _amount)`**: Allows users to sell stocks back to the company's stock contract in exchange for ETH.

- **`getCompanyStockContract(address company)`**: Retrieves the address of a company's `EthStock` contract.

- **`getCompanyStockPrice(address _company, uint256 stockType)`**: Returns the price of a specific stock type for a given company.

- **`getCompanyAvailableStocks(address _company, uint256 stockType)`**: Retrieves the available supply of a stock type for a given company.

- **`getTotalTypeOfStocks(address _company)`**: Returns the total number of stock types created by a company.

#### Events:
- **`CompanyCreated(address indexed owner, address stockContract)`**: Emitted when a new company registers and creates its stock contract.

- **`StockCreated(address stockContract, uint256 stockType)`**: Emitted when a new stock type is created.

- **`StockBought(address indexed buyer, uint256 stockType, uint256 amount)`**: Emitted when a buyer purchases stocks.

- **`StockSold(address indexed seller, uint256 stockType, uint256 amount)`**: Emitted when stocks are sold back to the company.

#### Errors:
- **`EthPreneur__NoStockContract()`**: Thrown when trying to interact with a company that hasn't registered a stock contract.
- **`EthPreneur__NoStock()`**: Thrown when trying to interact with a non-existent stock type.
- **`EthPreneur__InvalidStockType()`**: Thrown when referencing an invalid stock type.
- **`EthPreneur__NotEnoughStockAvailable()`**: Thrown when trying to buy more stocks than are available.
- **`EthPreneur__IncorrectPayment()`**: Thrown when the buyer doesn't send the correct payment amount.
- **`EthPreneur__CompanyAlreadyCreatedStock()`**: Thrown when a company tries to register after already creating a stock contract.
- **`EthPreneur__CompanyAlreadyHasStock()`**: Thrown when trying to create a stock contract when one already exists.

## Usage Example

1. **Register a Company**:
   A company can register by calling `registerCompany(uri)` and passing a URI for metadata. This will deploy a new `EthStock` contract for the company.

   ```solidity
   ethpreneur.registerCompany("https://example.com/metadata");
   ```

2. **Create Stock**:
   After registering, the company can create a new stock type by calling createCompanyStock(initialSupply, price).

   ```solidity
   ethpreneur.createCompanyStock(1000, 1 ether);
   ```
3. **Buy Stock**:
 Users can buy stocks from the company by calling buyCompanyStock with the amount of stocks they want to buy and the price of each stock.

   ```solidity
   ethpreneur.buyCompanyStock(companyAddress, stockType, amount, { value: price * amount });
   ```
   
4. **Sell Stock**:
 Users can sell their stocks back to the company by calling sellCompanyStock.

   ```solidity
   ethpreneur.sellCompanyStock(companyAddress, stockType, amount);
   ```