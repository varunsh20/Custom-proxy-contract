const {ethers} = require("hardhat");
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("StakingDeployModule", (m) => {
  const deploy = m.contract("Staking");

  return { deploy };
});