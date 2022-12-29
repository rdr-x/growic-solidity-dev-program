import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require('dotenv').config();

const config: HardhatUserConfig = {
  solidity: "0.8.17",
  networks: {
  goerli: {
    url: process.env.TEST_URL,
    accounts: [`${process.env.TEST_PVK}`]
    }
  }
};

export default config;
