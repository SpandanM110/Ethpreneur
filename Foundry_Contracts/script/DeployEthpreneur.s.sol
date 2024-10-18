// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Script} from "forge-std/Script.sol";
import {Ethpreneur1155} from "../src/Ethpreneur1155.sol";

contract Deploy is Script {
    Ethpreneur1155 ethpre;

    function run() public returns (Ethpreneur1155) {
        vm.startBroadcast(msg.sender);
        ethpre = new Ethpreneur1155();
        vm.stopBroadcast();
        return ethpre;
    }
}
