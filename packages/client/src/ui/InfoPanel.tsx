import { useState } from "react";
import { twMerge } from "tailwind-merge";
import { useComponentValue,useEntityQuery } from "@latticexyz/react";
import { Has, HasValue, getComponentValueStrict } from "@latticexyz/recs";
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

  const entities = useEntityQuery([Has(Player)]);
  console.log(entities);
  const players =   entities.map(entity => getComponentValueStrict(Player, entity));
  console.log(players);
  players.sort((a,b)=>Number(b.last - a.last));
  const top3 = players.slice(0,3);

  
  return (
    <div
      className={twMerge( 
        "flex flex-col gap-10 items-center justify-center bg-black text-white transition-opacity duration-1000",
        appear ? "opacity-100" : "opacity-0"
      )}
    >
      <div className="text-8xl animate-bounce">{monsterEmoji}</div>
      <div>Player point: {player ? player.last.toString() : 0}</div>      
      <ul>
      {players.map(playerp => (
        <li>{playerp.last.toString()} {playerp.x} {playerp.y} <br/></li>
      ))}
      </ul>  
    </div>    
  );
};

