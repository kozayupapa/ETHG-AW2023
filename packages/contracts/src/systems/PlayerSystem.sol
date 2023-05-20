// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { 
  Position,
  PositionData,
  PositionTableId 
} from "../codegen/Tables.sol";
import {Direction} from "../codegen/Types.sol";

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
  function move(Direction dir) public {
    require(dir != Direction.Unknown, "invalid direction");

    address player = _msgSender();
    PositionData memory existingPosition = Position.get(player);
    require(existingPosition.x != 0 || existingPosition.y != 0,"pos should be setted");
    int32 x = existingPosition.x;
    int32 y = existingPosition.y;

    if(dir == Direction.Up){
      y -= 1;
    } else if (dir == Direction.Down){
      y += 1;
    } else if (dir == Direction.Left){
      x -= 1;
    } else if (dir == Direction.Right){
      x += 1;
    }
    Position.set(player,x,y);

  }
}
