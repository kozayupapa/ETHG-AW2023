import { Has, defineEnterSystem, defineExitSystem, defineSystem, getComponentEntities, getComponentValueStrict } from "@latticexyz/recs";
import { PhaserLayer } from "../createPhaserLayer";
import { pixelCoordToTileCoord, tileCoordToPixelCoord } from "@latticexyz/phaserx";
import { Animations, Direction, TILE_HEIGHT, TILE_WIDTH } from "../constants";
import { getAddress } from "ethers/src.ts/utils";

const mycolor = Math.ceil(Math.random() * 0xffffff);
export const createStoneSystem = (layer: PhaserLayer) => {
  const {
    world,
    networkLayer:{
      components:{Stone},
      systemCalls:{
        spawnStone,
      }
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
    const x = event.pointer.worldX;
    const y = event.pointer.worldY;    
    const position = pixelCoordToTileCoord({x,y},TILE_WIDTH,TILE_HEIGHT);
    if(position.x === 0 && position.y === 0) return;
    console.log("spawn to",position.x,position.y)
    spawnStone(position.x,position.y,getAddress("0x8ba1f109551bd432803012645ac136ddd64dba72"),mycolor.toString());

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
