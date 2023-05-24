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
    Player: {
      schema:{
        last: "uint256",
        x: "int32[]",
        y: "int32[]",
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
    StonePos: {
      keySchema:{
        xk: "int32",
        yk: "int32",
      },
      schema:{
        x: "int32",
        y: "int32",
      },
    },
    StoneToken: {
      keySchema:{
        xk: "int32",
        yk: "int32",
      },
      schema:{
        token: "address",
      },
    },
    StoneUser: {
      keySchema:{
        xk: "int32",
        yk: "int32",
      },
      schema:{
        owner: "address",
      },
    },
    UserToken: {
      keySchema:{
        ka: "address",
        ko: "address",
      },
      schema:{
        token: "address",
        owner: "address",
        count: "int32",
      },
    },
    UserName:{
      keySchema:{
        ko: "address",
      },
      schema:{
        name: "string",
      },      
    },
    Token: {
      keySchema:{
        ka: "address",
      },
      schema:{
        adr: "address",
        name: "string",
        uri: "string",
      },
    },
    TokenCount: {
      keySchema:{
        ka: "address",
      },
      schema:{
        total: "int32",
        used: "int32",
        vacant: "int32",
      },
    }
  },
  modules:[
    {
      name: "KeysWithValueModule",
      root: true,
      args: [resolveTableId("Player")]
    },
    {
      name: "KeysWithValueModule",
      root: true,
      args: [resolveTableId("Stone")]
    }

  ]
});
