import { getComponentValue } from "@latticexyz/recs";
import { awaitStreamValue } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";
import { Direction } from "../layers/phaser/constants";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { worldSend, txReduced$, singletonEntity }: SetupNetworkResult,
  { Counter }: ClientComponents
) {
  const increment = async () => {
    const tx = await worldSend("increment", []);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(Counter, singletonEntity);
  };

  const spawn = (x:number, y:number) => {
    worldSend("spawn",[x,y]);
  }
  const move = ( dir:Direction) => {
    worldSend("move",[dir]);
  }
  return {
    increment,
    spawn,
    move,
  };
}
