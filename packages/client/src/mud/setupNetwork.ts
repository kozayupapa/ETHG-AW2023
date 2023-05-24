import { setupMUDV2Network } from "@latticexyz/std-client";
import { createFastTxExecutor, createFaucetService, getSnapSyncRecords } from "@latticexyz/network";
import { getNetworkConfig } from "./getNetworkConfig";
import { defineContractComponents } from "./contractComponents";
import { world } from "./world";
import { Contract, Signer, utils } from "ethers";
import { JsonRpcProvider } from "@ethersproject/providers";
import { IWorld__factory } from "contracts/types/ethers-contracts/factories/IWorld__factory";
import { getTableIds } from "@latticexyz/utils";
import storeConfig from "contracts/mud.config";
import OthelloToken from  "./OthelloToken.sol/OthelloToken.json";

export type SetupNetworkResult = Awaited<ReturnType<typeof setupNetwork>>;

export async function setupNetwork() {
  const contractComponents = defineContractComponents(world);
  const networkConfig = await getNetworkConfig();
  const result = await setupMUDV2Network<typeof contractComponents, typeof storeConfig>({
    networkConfig,
    world,
    contractComponents,
    syncThread: "main",
    storeConfig,
    worldAbi: IWorld__factory.abi,
  });

  // Request drip from faucet
  const signer = result.network.signer.get();
  if (networkConfig.faucetServiceUrl && signer) {
    const address = await signer.getAddress();
    console.info("[Dev Faucet]: Player address -> ", address);

    const faucet = createFaucetService(networkConfig.faucetServiceUrl);

    const requestDrip = async () => {
      const balance = await signer.getBalance();
      console.info(`[Dev Faucet]: Player balance -> ${balance}`);
      const lowBalance = balance?.lte(utils.parseEther("1"));
      if (lowBalance) {
        console.info("[Dev Faucet]: Balance is low, dripping funds to player");
        // Double drip
        await faucet.dripDev({ address });
        await faucet.dripDev({ address });
      }
    };

    requestDrip();
    // Request a drip every 20 seconds
    setInterval(requestDrip, 20000);
  }

  const provider = result.network.providers.get().json;
  const signerOrProvider = signer ?? provider;
  // Create a World contract instance
  const worldContract = IWorld__factory.connect(networkConfig.worldAddress, signerOrProvider);

  // Register player entity
  const address = result.network.connectedAddress.get();
  const playerEntityId = address;
  const playerEntity = playerEntityId ? world.registerEntity({ id: playerEntityId }) : undefined;
  console.log(address,playerEntity);

  if (networkConfig.snapSync) {
    const currentBlockNumber = await provider.getBlockNumber();
    const tableRecords = await getSnapSyncRecords(
      networkConfig.worldAddress,
      getTableIds(storeConfig),
      currentBlockNumber,
      signerOrProvider
    );

    console.log(`Syncing ${tableRecords.length} records`);
    result.startSync(tableRecords, currentBlockNumber);
  } else {
    result.startSync();
  }

  // Create a fast tx executor
  const fastTxExecutor =
    signer?.provider instanceof JsonRpcProvider
      ? await createFastTxExecutor(signer as Signer & { provider: JsonRpcProvider })
      : null;

  // TODO: infer this from fastTxExecute signature?
  type BoundFastTxExecuteFn<C extends Contract> = <F extends keyof C>(
    func: F,
    args: Parameters<C[F]>,
    options?: {
      retryCount?: number;
    }
  ) => Promise<ReturnType<C[F]>>;

  function bindFastTxExecute<C extends Contract>(contract: C): BoundFastTxExecuteFn<C> {
    return async function (...args) {
      if (!fastTxExecutor) {
        throw new Error("no signer");
      }
      const { tx } = await fastTxExecutor.fastTxExecute(contract, ...args);
      return await tx;
    };
  }

  const mint = async (address :string) => {
    console.log("mint to ",address);
    const tokenContract = new Contract(address, OthelloToken.abi, signerOrProvider);
    const tokenTx = bindFastTxExecute(tokenContract);
    const count = await tokenContract.totalSupply();
    console.log(count);
    const tx1 = await tokenTx("mint",[]);
    console.log(tx1);
    const tx2  = await tokenTx("approve",[networkConfig.worldAddress,count]);
    console.log(tx2);
    const worldSend = bindFastTxExecute(worldContract);
    await worldSend("minted",[address,count]);
  }
  const setUser = async (name :string) => {
    console.log("set Name ",name);
    const worldSend = bindFastTxExecute(worldContract);
    await worldSend("setUser",[name]);
  }

  return {
    ...result,
    worldContract,
    worldSend: bindFastTxExecute(worldContract),
    fastTxExecutor,
    playerEntity,
    mint,
    setUser,
  };
}
