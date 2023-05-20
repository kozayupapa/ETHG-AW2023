import { Has, defineEnterSystem, defineSystem, getComponentValueStrict } from "@latticexyz/recs";
import { PhaserLayer } from "../createPhaserLayer";
import { pixelCoordToTileCoord, tileCoordToPixelCoord } from "@latticexyz/phaserx";
import { Animations, TILE_HEIGHT, TILE_WIDTH } from "../constants";

export const createPlayerSystem = (layer: PhaserLayer) => {
  const {
    world,
    networkLayer:{
      components:{Position},
      systemCalls:{spawn,}
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
    spawn(position.x,position.y);

  });

  defineEnterSystem(world,[Has(Position)],({entity})=>{
    const playerObj = objectPool.get(entity,"Sprite");
    //const playerObj = objectPool.get(entity,"Rectangle");
    playerObj.setComponent({
      id:'animation',
      once: (obj)=>{
        //rect.setSize(20,20);
        //rect.setFillStyle(0xff0000);
        obj.play(Animations.Golem);
      }
      /*once: (sprite)=>{
        sprite.play(Animations.go)
      }*/

    })

  });

  defineSystem(world,[Has(Position)],({entity})=>{
    const position = getComponentValueStrict(Position,entity);
    const pixelPosition = tileCoordToPixelCoord(position,TILE_WIDTH,TILE_HEIGHT);
    const playerObj = objectPool.get(entity, "Sprite")
    playerObj.setComponent({
      id:'position',
      once: (rect)=>{
        rect.setPosition(pixelPosition.x,pixelPosition.y);
      }    
    });    
  });    
};
