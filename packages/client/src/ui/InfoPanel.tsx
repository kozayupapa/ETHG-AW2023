import { useState } from "react";
import { twMerge } from "tailwind-merge";
import { useComponentValue,useEntityQuery } from "@latticexyz/react";
import { Has, HasValue, getComponentValueStrict } from "@latticexyz/recs";
import { useMUD } from "../store";

export const InfoPanel = () => {
  const {
    networkLayer: {
      components: { Player, Token },
      playerEntity,
      mint,
    },
  } = useMUD();
  const [appear, setAppear] = useState(true);
  const player = useComponentValue(Player,playerEntity);
  console.log(player);

  const entities = useEntityQuery([Has(Player)]);
  console.log(entities);
  const players =   entities.map(entity => getComponentValueStrict(Player, entity));
  console.log(players);
  players.sort((a,b)=>Number(b.last - a.last));
  const top3 = players.slice(0,3);

  const etokens = useEntityQuery([Has(Token)]);
  const tokens =   etokens.map(entity => getComponentValueStrict(Token, entity));
  console.log(tokens);

  return (
    <div 
      className={twMerge( 
        "grid grid-rows-1 grid-cols-5 gap-10 items-center justify-center bg-black text-white transition-opacity duration-1000",
        appear ? "opacity-100" : "opacity-0"
      )}
    >
      <div className={twMerge("row-start-1 col-start-1 col-span-2 row-span-1 justify-center items-center ")}>
        <div>Your point: {player ? player.last.toString() : 0}</div>      
      </div>
      <div className={twMerge("row-start-1 col-start-2 col-span-1 row-span-1 justify-center items-center ")}>
        Current Top 3<br/>
        <ul>
        {players.map(playerp => (
          <li className="text-white">
            {playerp.last.toString()}  <br/>
          </li>
        ))}
        </ul>  
      </div>
      <div className={twMerge("row-start-1 col-start-4 col-span-2 row-span-1 justify-center items-center ")}>
        <ul className={twMerge("flex-col")}>
        {tokens.map(token => (
          <li className="text-white" onClick={()=>{mint(token.adr)}}>
            {token.name} <img src={token.uri} className="h-16 object-cover rounded-md"></img> 
            <button >mint</button>
            <br/>
          </li>
        ))}  
        </ul>  
      </div>
    </div>    
  );
};

