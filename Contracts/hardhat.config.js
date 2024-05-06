require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config()

const SEPOLIA_RPC_URL = process.env.SEPOLIA_RPC_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const S_API = process.env.S_API;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork:"hardhat",
  networks:{
    sepolia :{
      url: SEPOLIA_RPC_URL,
      accounts: [PRIVATE_KEY],
    }
  },
  etherscan:{
    apiKey: {
      sepolia : S_API
  }},
  solidity: "0.8.24",
};
