/* Autogenerated file. Do not edit manually. */

import { TableId } from "@latticexyz/utils";
import { defineComponent, Type as RecsType, World } from "@latticexyz/recs";

export function defineContractComponents(world: World) {
  return {
    Counter: (() => {
      const tableId = new TableId("", "Counter");
      return defineComponent(
        world,
        {
          value: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Player: (() => {
      const tableId = new TableId("", "Player");
      return defineComponent(
        world,
        {
          last: RecsType.BigInt,
          x: RecsType.NumberArray,
          y: RecsType.NumberArray,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Stone: (() => {
      const tableId = new TableId("", "Stone");
      return defineComponent(
        world,
        {
          x: RecsType.Number,
          y: RecsType.Number,
          token: RecsType.String,
          owner: RecsType.String,
          color: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    StonePos: (() => {
      const tableId = new TableId("", "StonePos");
      return defineComponent(
        world,
        {
          x: RecsType.Number,
          y: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    StoneToken: (() => {
      const tableId = new TableId("", "StoneToken");
      return defineComponent(
        world,
        {
          token: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    StoneUser: (() => {
      const tableId = new TableId("", "StoneUser");
      return defineComponent(
        world,
        {
          owner: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    UserToken: (() => {
      const tableId = new TableId("", "UserToken");
      return defineComponent(
        world,
        {
          token: RecsType.String,
          owner: RecsType.String,
          count: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    UserName: (() => {
      const tableId = new TableId("", "UserName");
      return defineComponent(
        world,
        {
          name: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    Token: (() => {
      const tableId = new TableId("", "Token");
      return defineComponent(
        world,
        {
          adr: RecsType.String,
          name: RecsType.String,
          uri: RecsType.String,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
    TokenCount: (() => {
      const tableId = new TableId("", "TokenCount");
      return defineComponent(
        world,
        {
          total: RecsType.Number,
          used: RecsType.Number,
          vacant: RecsType.Number,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
  };
}
