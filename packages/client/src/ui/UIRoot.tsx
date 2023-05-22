import { useEffect, useState } from "react";
import { useStore } from "../store";
import { LoadingScreen } from "./LoadingScreen";
import { Wrapper } from "./Wrapper";
import { twMerge } from "tailwind-merge";
import { toast } from "react-toastify";
import { PhaserLayer } from "./PhaserLayer";
import { useComponentValue, useEntityQuery } from "@latticexyz/react";

export const UIRoot = () => {
  const layers = useStore((state) => {
    return {
      networkLayer: state.networkLayer,
      phaserLayer: state.phaserLayer,
    };
  });
  const [appear, setAppear] = useState(true);
  const monsterEmoji = "🤠";

  if (!layers.networkLayer || !layers.phaserLayer) return <></>;

  const player = useComponentValue(layers.networkLayer.components.Player,layers.networkLayer.playerEntity);
  console.log(player);

  return (
    <Wrapper>
      <div
      className={twMerge( 
        "flex flex-col gap-10 items-center justify-center bg-black text-white transition-opacity duration-1000",
        appear ? "opacity-100" : "opacity-0"
      )}
    >
      <div className="text-8xl animate-bounce">{monsterEmoji}</div>
      <div>A wild PaPa appears!: {player ? player.last.toString() : 0}</div>      
    </div>
      <LoadingScreen />
    </Wrapper>
  );
};
