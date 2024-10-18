// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {EthStock} from "./EthStock.sol";

contract Ethpreneur1155 {
    // Struct to store company details
    struct Company {
        address owner; // onwer of company / company address
        address stockContract; // address of stock smart contract created
    }

    mapping(address => Company) public companies; // mapping of company address / owner address to Company details

    //////////// EVENTS ////////////
    event CompanyCreated(address indexed owner, address stockContract);
    event StockCreated(address stockContract, uint256 stockType);
    event StockAdded(address stockContract, uint256 stockType);
    event StockBought(address indexed buyer,uint256 stockType, uint256 amount);
    event StockSold(address indexed seller,uint256 stockType, uint256 amount);

    //////////// ERRORS ////////////
    error EthPreneur__NoStockContract();
    error EthPreneur__NoStock();
    error EthPreneur__InvalidStockType();
    error EthPreneur__NotEnoughStockAvailable();
    error EthPreneur__IncorrectPayment();
    error EthPreneur__CompanyAlreadyCreatedStock();
    error EthPreneur__CompanyAlreadyHasStock();

    //////////// MODIFIERS ////////////
    // modifier to check if company has created stock contract and stock
    modifier hasStockContractAndStocks(address _company, uint256 stockType) {
        require(getCompanyStockContract(_company) != address(0), EthPreneur__NoStockContract());
        require(EthStock(getCompanyStockContract(_company)).getTotalSupply(stockType) != 0, EthPreneur__NoStock());
        _;
    }

    //////////// FUNCTIONS ////////////
    // Company Registers itself using a URI
    function registerCompany(string memory uri) public {
        require(companies[msg.sender].stockContract == address(0), EthPreneur__CompanyAlreadyCreatedStock());
        EthStock newStockContract = new EthStock(uri, msg.sender);
        companies[msg.sender] = Company({owner: msg.sender, stockContract: address(newStockContract)});
        emit CompanyCreated(msg.sender, address(newStockContract));
    }

    // Create stock for a registered company
    function createCompanyStock(uint256 _initialSupply, uint256 _price) public {
        address stockContractAddress = getCompanyStockContract(msg.sender);
        require(stockContractAddress != address(0), EthPreneur__NoStockContract());
        EthStock stockContract = EthStock(stockContractAddress);
        uint256 stockType = stockContract.getTotalTypeOfStocks();
        stockContract.createStock(_price, _initialSupply);
        emit StockCreated(stockContractAddress,stockType);
    }

    // Buy stock from a company's stock contract
    function buyCompanyStock(address _company, uint256 stockType, uint256 _amount) public payable hasStockContractAndStocks(_company, stockType) {
        address stockContractAddress = getCompanyStockContract(_company);
        EthStock stockContract = EthStock(stockContractAddress);
        uint256 totalStockTypes = stockContract.getTotalTypeOfStocks();
        require(stockType < totalStockTypes, EthPreneur__InvalidStockType());
        uint256 stockPrice = stockContract.getStockPrice(stockType);
        require(msg.value == stockPrice * _amount, EthPreneur__IncorrectPayment());
        uint256 availableSupply = stockContract.getAvailableSupply(stockType);
        require(_amount <= availableSupply, EthPreneur__NotEnoughStockAvailable());
        stockContract.buyStock{value: msg.value}(msg.sender,stockType, _amount);
        emit StockBought(msg.sender,stockType, _amount);
    }

    // Sell stock back to the company's stock contract
    function sellCompanyStock(address _company,uint256 stockType, uint256 _amount) public hasStockContractAndStocks(_company,stockType) {
        address stockContractAddress = getCompanyStockContract(_company);
        EthStock stockContract = EthStock(stockContractAddress);
        stockContract.sellStock(msg.sender, stockType, _amount);
        emit StockSold(msg.sender,stockType, _amount);
    }

    // Retrieve the stock contract for a company
    function getCompanyStockContract(address company) public view returns (address) {
        return companies[company].stockContract;
    }

    // Get a company's stock price
    function getCompanyStockPrice(address _company, uint256 stockType) public view hasStockContractAndStocks(_company, stockType) returns (uint256) {
        address stockContractAddress = getCompanyStockContract(_company);
        EthStock stockContract = EthStock(stockContractAddress);
        return stockContract.getStockPrice(stockType);
    }

    // Get a company's available stocks to buy
    function getCompanyAvailableStocks(address _company, uint256 stockType) public view hasStockContractAndStocks(_company, stockType) returns (uint256) {
        address stockContractAddress = getCompanyStockContract(_company);
        EthStock stockContract = EthStock(stockContractAddress);
        return stockContract.getAvailableSupply(stockType);
    }

    // Get a company's available stocks to buy
    function getTotalTypeOfStocks(address _company) public view returns (uint256) {
        address stockContractAddress = getCompanyStockContract(_company);
        require(stockContractAddress != address(0), EthPreneur__NoStockContract());
        EthStock stockContract = EthStock(stockContractAddress);
        return stockContract.getTotalTypeOfStocks();
    }
}
