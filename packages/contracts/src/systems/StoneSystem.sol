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
    Stone.set(x, y,x,y,token,_msgSender(),color);
    judgeStones(x,y,token,color);
    addPlayerStone(x,y);
  }

  //Othello logic. check between new stone and owned stone   
  function judgeStones(int32 x, int32 y, address  token, string memory color) private {
    bytes32 player = bytes32(uint256(uint160(_msgSender())));

    PlayerData memory _player = Player.get(player);
    console.log(_player.x.length);
    //for existing player's stones
    for(uint i=0; i < _player.x.length; i++){
      judgeStone(x, y, _player.x[i], _player.y[i],token, color);
    }
  }
  //currently suppot only stone which is on same x or y stone 
  // not supported diagonal judgement
  function judgeStone(int32 x, int32 y, int32 nx, int32 ny, address  token, string memory color) private {
    address myaddress = _msgSender();
    if(x==nx){
      int32 ydiff = ny-y;
      int32 dir = 1;
      if(ny<y){
        ydiff *= -1;
        dir = -1;
      }
      for(int32 j=1; j < ydiff; j++){
        StoneData memory tstone = Stone.get(x,y+j*dir);
        // if target has empty spcae or my stone,  skip 
        if(tstone.owner == address(0) || tstone.owner == myaddress ) return;
      }
      for(int32 j=1; j < ydiff; j++){
        changeStone(x,y+j*dir,token,color);
      }
    }
    if(y==ny){
      int32 xdiff = nx-x;
      int32 dir = 1;
      if(nx<x){
        xdiff *= -1;
        dir = -1;
      }
      for(int32 j=1; j < xdiff; j++){
        StoneData memory tstone = Stone.get(x+j*dir,y);
        // if target has empty spcae or my stone,  skip 
        if(tstone.owner == address(0) || tstone.owner == myaddress ) return;
      }
      for(int32 j=1; j < xdiff; j++){
        changeStone(x+j*dir,y,token,color);
      }
    }
  }

  function changeStone(int32 x, int32 y, address  token, string memory color) private {
    Stone.set(x,y,x,y,token,_msgSender(),color);
    addPlayerStone(x,y);
  }

  function addPlayerStone(int32 x, int32 y) private {
    bytes32 player = bytes32(uint256(uint160(_msgSender())));
    PlayerData memory existingPosition = Player.get(player);
    Player.pushX(player, x);
    Player.pushY(player, y);    
  }

}
