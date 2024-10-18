//SPDX-License-Identifier:MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {Deploy} from "../script/DeployEthpreneur.s.sol";
import {Ethpreneur1155} from "../src/Ethpreneur1155.sol";
import {EthStock} from "../src/EthStock.sol";

contract Trade is Test {
    Deploy deploy;
    Ethpreneur1155 ethPreneur;
    EthStock ethStock;

    address public companyOwner = makeAddr("CompanyOwner");
    address public buyer = makeAddr("Buyer");

    function setUp() public {
        deploy = new Deploy();
        ethPreneur = deploy.run();
    }

    function testRegisterCompany() public {
        vm.startPrank(companyOwner);
        ethPreneur.registerCompany("abc.com");
        ethPreneur.createCompanyStock(100, 20);
        vm.stopPrank();
        assertEq(ethPreneur.getCompanyAvailableStocks(companyOwner,0), 100);
        assertEq(ethPreneur.getCompanyStockPrice(companyOwner,0), 20);
    }

    function testCreateMultipleStocks() public {
        vm.startPrank(companyOwner);
        ethPreneur.registerCompany("abc.com");
        ethPreneur.createCompanyStock(100, 20);
        ethPreneur.createCompanyStock(300, 40);
        vm.stopPrank();
        assertEq(ethPreneur.getCompanyAvailableStocks(companyOwner,1), 300);
        assertEq(ethPreneur.getCompanyStockPrice(companyOwner,1), 40);
    }

    function testBuyCompanyStock() public {
        vm.startPrank(companyOwner);
        ethPreneur.registerCompany("abc.com");
        ethPreneur.createCompanyStock(100, 20);
        vm.stopPrank();
        vm.deal(buyer, 200);
        vm.startPrank(buyer);
        ethPreneur.buyCompanyStock{value: 200}(companyOwner,0,10);
        vm.stopPrank();
        assertEq(ethPreneur.getCompanyAvailableStocks(companyOwner,0), 90);
        address stockAddress = ethPreneur.getCompanyStockContract(companyOwner);
        ethStock = EthStock(stockAddress);
        assertEq(ethStock.balanceOf(buyer, 0), 10);
    }

    function testSellCompanyStock() public {
        vm.startPrank(companyOwner);
        ethPreneur.registerCompany("abc.com");
        ethPreneur.createCompanyStock(100, 20);
        vm.stopPrank();
        vm.deal(buyer, 1000);
        vm.startPrank(buyer);
        ethPreneur.buyCompanyStock{value: 400}(companyOwner, 0, 20);
        ethPreneur.sellCompanyStock(companyOwner,0,10);
        vm.stopPrank();
        assertEq(ethPreneur.getCompanyAvailableStocks(companyOwner,0), 90);
        address stockAddress = ethPreneur.getCompanyStockContract(companyOwner);
        ethStock = EthStock(stockAddress);
        assertEq(ethStock.balanceOf(buyer, 0), 10);
    }
}
