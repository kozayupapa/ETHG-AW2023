// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { 
  Token,
  TokenData,
  TokenTableId,
  TokenCount,
  TokenCountData,
  TokenCountTableId 
} from "../codegen/Tables.sol";

import {getKeysWithValue} from "@latticexyz/world/src/modules/keyswithvalue/getKeysWithValue.sol";

//import {addressToEntity} from 

contract TokenSystem is System {
  function setToken(address adr, string memory name,  string memory uri) public {
    require(adr != address(0), "cannot set address 0");
    TokenData memory existing = Token.get(adr);
    require(existing.adr == address(0) ,"token already set");
    Token.set(adr,adr,name,uri);
  }
  function minted(address adr, uint256 tokenId) public {
    require(adr != address(0), "cannot mint to address 0");
    TokenCountData memory existing = TokenCount.get(adr);
    TokenCount.set(adr,existing.total++,existing.used,existing.vacant++);
  }
}
