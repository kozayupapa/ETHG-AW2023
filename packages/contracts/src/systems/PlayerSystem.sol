// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { 
  Position,
  PositionData,
  PositionTableId 
} from "../codegen/Tables.sol";

import {getKeysWithValue} from "@latticexyz/world/src/modules/keyswithvalue/getKeysWithValue.sol";
//import {addressToEntity} from 

contract PlayerSystem is System {
  function spawn(int32 x, int32 y) public {
    require(x != 0 || y != 0, "cannot spawn at 0");
    address player = _msgSender();
    console.log(player);
    //bytes32 player = bytes32(uint256(uint160(_msgSender())) << 96);
    PositionData memory existingPosition = Position.get(player);
    require(existingPosition.x == 0 && existingPosition.y == 0,"initial pos should be 0");

    bytes32[] memory playersAtPos = getKeysWithValue(PositionTableId, Position.encode(x,y));
    require(playersAtPos.length == 0, "spawn location occupied");
    Position.set(player, x, y);
  }
}
