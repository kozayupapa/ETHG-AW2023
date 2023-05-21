// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { 
  Stone,
  StoneData,
  StoneTableId 
} from "../codegen/Tables.sol";
import {Direction} from "../codegen/Types.sol";

import {getKeysWithValue} from "@latticexyz/world/src/modules/keyswithvalue/getKeysWithValue.sol";

//import {addressToEntity} from 

contract StoneSystem is System {
  function spawnStone(int32 x, int32 y, address  token, string memory color) public {
    require(x != 0 || y != 0, "cannot spawn at 0");

    StoneData memory existing = Stone.get(x,y);
    require(existing.owner == address(0) ,"stone pos occupied");

    //bytes32[] memory playersAtPos = getKeysWithValue(StoneTableId, Stone.encode(x,y));
    //require(playersAtPos.length == 0, "spawn location occupied");
    Stone.set(x, y,x,y,token,_msgSender(),color);
  }

}
