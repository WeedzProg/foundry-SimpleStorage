//SPDX-License-Identifier:MIT

pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        vm.startBroadcast();

        //between start and stop broadcast is where we put required code
        // for transaction, deployments, interactions etc...
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorage.store(42);
        simpleStorage.retrieve();
        vm.stopBroadcast();
        return simpleStorage;
    }
}
