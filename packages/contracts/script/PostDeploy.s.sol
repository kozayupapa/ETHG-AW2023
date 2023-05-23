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
    IWorld world = IWorld(worldAddress);
    address adr1 = deployCode("MockTokenWhite.sol");
    console.log("Deployed MockWhite: ", adr1);
    MockTokenWhite t1 = MockTokenWhite(adr1);
    uint256 id1 = t1.mint("https://data.nounsjp.wtf/pfp/images/107.png");
    console.log("owner of id:",id1 , " addr:",t1.ownerOf(id1));

    address adr2 = deployCode("MockTokenBlack.sol");
    console.log("Deployed MockBlack: ", adr2);
    MockTokenBlack t2 = MockTokenBlack(adr2);
    uint256 id2 = t2.mint("https://data.nounsjp.wtf/pfp/images/8.png");
    console.log("owner of id:",id2 , " addr:",t2.ownerOf(id2));

    world.setToken(adr1,t1.name(),t1.tokenURI(id1));
    world.setToken(adr2,t2.name(),t2.tokenURI(id2));

    vm.stopBroadcast();
  }
}
