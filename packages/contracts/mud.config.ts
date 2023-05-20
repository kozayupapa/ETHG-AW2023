import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    Counter: {
      keySchema: {},
      schema: "uint32",
    },
    Position: {
      keySchema: {},
      schema:{
        x: "int32",
        y: "int32",
      },
    },
  },
});
