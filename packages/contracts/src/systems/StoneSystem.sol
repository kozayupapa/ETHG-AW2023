// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { 
  Stone,
  StoneData,
  StoneTableId 
} from "../codegen/Tables.sol";
import { 
  Player,
  PlayerData,
  PlayerTableId 
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
    checkStone(x,y,token,color);
    playerAdd(x,y);

    /*
    for(int32 i=0;i<100;i++){
      StoneData memory existing = Stone.get(x-i,y);
      if(existing.owner != address(0)){
        changeStone(x-i,y,token,color);
      }
    }

  }
  function changeStone(int32 x, int32 y, address  token, string memory color) private {
    */
  }
  function checkStone(int32 x, int32 y, address  token, string memory color) private {
    bytes32 player = bytes32(uint256(uint160(_msgSender())));
    PlayerData memory _player = Player.get(player);
    for(uint i=0; i < _player.x.length; i++){
      if(x==_player.x[i]){
        for(int32 j=1; j < (_player.y[i] - y); j++){
          Stone.set(x,y+j,x,y+j,token,_msgSender(),color);
        }
      }
      if(y==_player.y[i]){
        for(int32 j=1; j < (_player.x[i] - x); j++){
          Stone.set(x+j,y,x+j,y,token,_msgSender(),color);
        }
      }
    }
  }
  function playerAdd(int32 x, int32 y) private {
    //require(x != 0 || y != 0, "cannot spawn at 0");
    //address player = _msgSender();
    //bytes32(uint256(uint160(addr))))
    bytes32 player = bytes32(uint256(uint160(_msgSender())));

    PlayerData memory existingPosition = Player.get(player);
    //require(existingPosition.x == 0 && existingPosition.y == 0,"initial pos should be 0");

    //bytes32[] memory playersAtPos = getKeysWithValue(PositionTableId, Position.encode(x,y));
    //require(playersAtPos.length == 0, "spawn location occupied");
    Player.pushX(player, x);
    Player.pushY(player, y);    
  }

}
