import { mudConfig, resolveTableId } from "@latticexyz/world/register";

export default mudConfig({
  enums:{
    Direction:[
      "Unknown",
      "Up",
      "Down",
      "Left",
      "Right"
    ]
  },
  tables: {
    Counter: {
      keySchema: {},
      schema: "uint32",
    },
    Position: {
      schema:{
        x: "int32",
        y: "int32",
      },
    },
    Stone: {
      keySchema:{
        xk: "int32",
        yk: "int32",
      },
      schema:{
        x: "int32",
        y: "int32",
        token: "address",
        owner: "address",
        color: "string",
      },
    },
  },
  modules:[
    {
      name: "KeysWithValueModule",
      root: true,
      args: [resolveTableId("Position")]
    }
  ]
});
