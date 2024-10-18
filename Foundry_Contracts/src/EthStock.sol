// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EthStock is ERC1155, Ownable {

    // Stocks structure to hold details of each stock type
    struct Stocks{
        uint256 totalSupply;
        uint256 availableSupply;
        uint256 price;
    }

    mapping(uint256 => Stocks) private typeToStocks; // Mapping of type of stock to details of stock
    uint256 private stockType;
    address public companyOwner;

    //////////// ERRORS ////////////
    error Stock__NotEnoughStocks();
    error Stock__IncorrectPayment();
    

   
    //////////// CONSTRUCTOR ////////////
    // Constructor called when contract is created
    constructor(string memory _uri, address _owner) ERC1155(_uri) Ownable(msg.sender) {
        companyOwner = _owner;
        stockType=0;
    }

    //////////// FUNCTIONS ////////////
    // Create stock with initial(total) supply and price
    function createStock(uint256 _price, uint256 _initialSupply) external onlyOwner {
        Stocks memory newStock = Stocks({
            totalSupply: _initialSupply,
            availableSupply: _initialSupply,
            price: _price
        });
        typeToStocks[stockType] = newStock;
        _mint(companyOwner, stockType, _initialSupply, "");
        stockType++;
    }

    // Function to add stocks to the existing stock type
    function addStocks(uint256 sType, uint256 supply) external onlyOwner {
        typeToStocks[sType].availableSupply+=supply;
        typeToStocks[sType].totalSupply+=supply;
    }

    // Buy stocks
    function buyStock(address buyer, uint256 sType, uint256 amount) external payable onlyOwner {
        uint256 price = getStockPrice(sType);
        uint256 availableSupply = getAvailableSupply(sType);
        uint256 totalPrice = price * amount;
        require(msg.value == totalPrice, Stock__IncorrectPayment());
        require(amount <= availableSupply, Stock__NotEnoughStocks());
        boughtStock(sType, amount);
        _safeTransferFrom(companyOwner, buyer, sType, amount, "");
    }

    // Sell stocks
    function sellStock(address seller, uint256 sType, uint256 amount) external onlyOwner {
        require(balanceOf(seller, sType) >= amount, Stock__NotEnoughStocks());
        uint256 stockPrice = getStockPrice(sType);
        uint256 totalPrice = stockPrice * amount;
        _safeTransferFrom(seller, companyOwner, sType, amount, "");
        soldStock(sType, amount);
        payable(seller).transfer(totalPrice);
    }

    // Decrease stock by amount
    function boughtStock(uint256 sType, uint256 amount) internal {
        typeToStocks[sType].availableSupply-=amount;
    }

    // Increase stock by amount
    function soldStock(uint256 sType, uint256 amount) internal {
        typeToStocks[sType].availableSupply+=amount;
    }

    // Get stock details from its type
    function getStockDetails(uint256 sType) public view returns (uint256, uint256, uint256) {
        Stocks memory stock = typeToStocks[sType];
        return (stock.totalSupply, stock.availableSupply, stock.price);
    }

    // Retrieve price of the stock
    function getStockPrice(uint256 sType) public view returns (uint256) {
        (,, uint256 price) = getStockDetails(sType);
        return price;
    }

    // Retrieve total supply of the stock
    function getTotalSupply(uint256 sType) public view returns (uint256) {
        (uint256 totalSupply, , ) = getStockDetails(sType);
        return totalSupply;
    }

    // Retrieve available supply of the stock
    function getAvailableSupply(uint256 sType) public view returns (uint256) {
        (, uint256 availableSupply, ) = getStockDetails(sType);
        return availableSupply;
    }

    // Get total type of stocks available
    function getTotalTypeOfStocks() public view returns(uint256) {
        return stockType;
    }
}
