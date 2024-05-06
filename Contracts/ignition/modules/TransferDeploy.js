const {ethers} = require("hardhat");
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("TransferDeployModule", (m) => {
  const deploy = m.contract("Transfer");

  return { deploy };
});