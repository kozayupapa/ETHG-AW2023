import { Has, HasValue, runQuery, defineEnterSystem, defineExitSystem, defineSystem, getComponentEntities, getComponentValueStrict, getComponentValue } from "@latticexyz/recs";
import { PhaserLayer } from "../createPhaserLayer";
import { pixelCoordToTileCoord, tileCoordToPixelCoord } from "@latticexyz/phaserx";
import { Animations, Direction, TILE_HEIGHT, TILE_WIDTH } from "../constants";
import { getAddress } from "ethers/src.ts/utils";
import { Entity } from "@latticexyz/recs";
import { useEntityQuery } from "@latticexyz/react";

const mycolor = Math.ceil(Math.random() * 0xffffff);
export const createStoneSystem = (layer: PhaserLayer) => {
  const {
    world,
    networkLayer:{
      components:{Stone,StoneUser,UserToken},
      systemCalls:{
        spawnStone,
      },
      playerEntity
    },
    scenes:{
      Main:{
        objectPool,
        input
      }
    },
  } = layer;
  
  input.pointerdown$.subscribe((event)=>{
    if(!event.pointer) return;
    const owner = String(playerEntity);
    const userStoneCount = runQuery([Has(StoneUser), HasValue(StoneUser, {owner})]).size;
  
    const euts = getComponentEntities(UserToken);
    let tokenCount=0; 
    let token;
    for(const entity of euts){
      const ut = getComponentValue(UserToken,entity);
      if(ut?.owner == playerEntity){
        tokenCount += ut?.count ? ut.count : 0;
        token = ut?.token;
      }
    }
    console.log(userStoneCount, tokenCount);

    if(userStoneCount >= tokenCount) {
      console.log("already put");
      return;
    }
    
    const x = event.pointer.worldX;
    const y = event.pointer.worldY;    
    const position = pixelCoordToTileCoord({x,y},TILE_WIDTH,TILE_HEIGHT);
    if(position.x === 0 && position.y === 0) return;
    console.log("spawn to",position.x,position.y)
    spawnStone(position.x,position.y,getAddress(token as string),mycolor.toString());

  });

  /*
  input.onKeyPress((keys)=>keys.has("W"),()=>{
    move(Direction.Up);
  });
  input.onKeyPress((keys)=>keys.has("S"),()=>{
    move(Direction.Down);
  });
  input.onKeyPress((keys)=>keys.has("A"),()=>{
    move(Direction.Left);
  });
  input.onKeyPress((keys)=>keys.has("D"),()=>{
    move(Direction.Right);
  });
  */

  defineEnterSystem(world,[Has(Stone)],({entity})=>{
    //const playerObj = objectPool.get(entity,"Sprite");
    const stone = getComponentValueStrict(Stone,entity);
    console.log({stone});
    const stoneObj = objectPool.get(entity,"Rectangle");
    stoneObj.setComponent({
      id:'animation',
      once: (obj)=>{
        obj.setSize(20,20);
        obj.setFillStyle(Number(stone.color));
      }
    });

  });
  /*
  defineExitSystem(world,[Has(Stone)],({entity})=>{
    objectPool.remove(entity);  
  });
  */
  interface UT {token:String, owner:String, count:Number};
  const userTokens :UT[] = [];
  defineSystem(world,[Has(UserToken)],({entity})=>{
    const ut = getComponentValueStrict(UserToken,entity);
    let found = false;
    for(let i=0; i<userTokens.length; i++){
      if (String(userTokens[i].owner) == ut.owner && String(userTokens[i].token) == ut.token){
        userTokens[i].count = ut.count;
        found = true;
      }
    }
    if(!found) userTokens.push(ut);
    console.log(userTokens);
  });

  defineSystem(world,[Has(Stone)],({entity})=>{
    const stone = getComponentValueStrict(Stone,entity);
    console.log({stone});    
    const pixelPosition = tileCoordToPixelCoord({x:stone.x, y:stone.y},TILE_WIDTH,TILE_HEIGHT);
    //const playerObj = objectPool.get(entity, "Sprite")
    const stoneObj = objectPool.get(entity, "Rectangle")
    stoneObj.setComponent({
      id:'position',
      once: (obj)=>{
        obj.setPosition(pixelPosition.x,pixelPosition.y);
      }    
    });
    stoneObj.setComponent({
      id:'animation',
      once: (obj)=>{
        obj.setSize(20,20);
        obj.setFillStyle(Number(stone.color));
      }
    });
  });    
};
