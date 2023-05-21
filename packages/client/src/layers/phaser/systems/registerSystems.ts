import { PhaserLayer } from "../createPhaserLayer";
import { createCamera } from "./createCamera";
import { createMapSystem } from "./createMapSystem";
//import { createPlayerSystem } from "./createPlayerSystem";
import { createStoneSystem } from "./createStoneSystem";

export const registerSystems = (layer: PhaserLayer) => {
  createCamera(layer);
  createMapSystem(layer);
  //createPlayerSystem(layer);
  createStoneSystem(layer);
};
