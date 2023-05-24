import { useState } from "react";
import { twMerge } from "tailwind-merge";
import { useComponentValue,useEntityQuery } from "@latticexyz/react";
import { Has, HasValue, getComponentValueStrict } from "@latticexyz/recs";
import { useMUD } from "../store";
import { Entity } from "@latticexyz/recs";
export const InfoPanel = () => {
  const {
    networkLayer: {
      components: { Player, Token, TokenCount, UserToken, UserName },
      playerEntity,
      mint,
      setUser,
    },
  } = useMUD();
  const [appear, setAppear] = useState(true);
  const player = useComponentValue(Player,playerEntity);
  console.log(player);

  const entities = useEntityQuery([Has(Player)]);
  const players =   entities.map(entity => getComponentValueStrict(Player, entity));
  console.log(players);
  players.sort((a,b)=>Number(b.last - a.last));
  const top3 = players.slice(0,2);

  const etokens = useEntityQuery([Has(Token)]);
  const tokens =   etokens.map(entity => getComponentValueStrict(Token, entity));
  console.log(tokens);

  const euts = useEntityQuery([Has(UserToken)]);
  const userTokens =   euts.map(entity => getComponentValueStrict(UserToken, entity));
  const playerTokens = userTokens.filter(u=>u.owner == playerEntity).map(pt=>{return {"tname":tokens.filter(t=>t.adr==pt.token)[0].name, "count":pt.count}});
  console.log(playerTokens);

  const euns = useEntityQuery([Has(UserName)]);
  const unames =   euns.filter(v=>v==playerEntity).map(entity => getComponentValueStrict(UserName, entity));
  console.log(unames);

  const [uname, setUname] = useState("");
  console.log(playerEntity);

  return (
    <div 
      className={twMerge( 
        "grid grid-rows-1 grid-cols-5 p-5 items-center justify-center bg-black text-white transition-opacity duration-1000",
        appear ? "opacity-100" : "opacity-0"
      )}
    >
      <div className={twMerge("row-start-1 col-start-1 col-span-2 row-span-1 justify-center items-center ")}>
      <input type="text" 
       className="text-sm rounded-md py-1 font-semibold text-gray-800 border border-gray-800 text-center"
       onChange={(e)=>{setUname(e.target.value)}}
      /><button onClick={()=>{setUser(uname)}}></button>

      <div> Hello {unames.length ? unames[0].name:""}<br/> 
      Your point: {player ? player.last.toString() : 0}<br/></div>      
      <div>Your Have:<br/> 
        <ul>
          {playerTokens.map(pt => (
            <li className="text-white">
              {"  " + pt.tname} : {pt.count}  <br/>
            </li>
          ))}
        </ul>  
        <br/></div>      
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

