import { useState } from "react";
import { twMerge } from "tailwind-merge";
import { useComponentValue } from "@latticexyz/react";
import { useMUD } from "../store";

export const InfoPanel = () => {
  const {
    networkLayer: {
      components: { Player },
      playerEntity,
    },
  } = useMUD();
  const [appear, setAppear] = useState(true);
  const monsterEmoji = "🤠";
  const player = useComponentValue(Player,playerEntity);
  console.log(player);

  return (
    <div
    className={twMerge( 
      "flex flex-col gap-10 items-center justify-center bg-black text-white transition-opacity duration-1000",
      appear ? "opacity-100" : "opacity-0"
    )}
  >
    <div className="text-8xl animate-bounce">{monsterEmoji}</div>
    <div>Player point: {player ? player.last.toString() : 0}</div>      
  </div>    
  );
};

