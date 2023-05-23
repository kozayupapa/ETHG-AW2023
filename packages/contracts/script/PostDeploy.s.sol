// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";
import {MockTokenWhite} from "../src/example/MockTokenWhite.sol";
import {MockTokenBlack} from "../src/example/MockTokenBlack.sol";

contract PostDeploy is Script {
  function run(address worldAddress) external {
    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // Start broadcasting transactions from the deployer account
    vm.startBroadcast(deployerPrivateKey);
    uint256 id;
    address adr1 = deployCode("MockTokenWhite.sol");
    console.log("Deployed MockWhite: ", adr1);
    MockTokenWhite t1 = MockTokenWhite(adr1);
    id = t1.mint("ipfs://metadata_url");
    console.log("owner of id:",id , " addr:",t1.ownerOf(id));

    address adr2 = deployCode("MockTokenBlack.sol");
    console.log("Deployed MockBlack: ", adr2);
    MockTokenBlack t2 = MockTokenBlack(adr2);
    id = t1.mint("ipfs://metadata_url");
    console.log("owner of id:",id , " addr:",t2.ownerOf(id));


    vm.stopBroadcast();
  }
}
