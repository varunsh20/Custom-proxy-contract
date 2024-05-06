const {ethers} = require("hardhat");
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("VotingContractDeployModule", (m) => {
  const deploy = m.contract("VotingContract");

  return { deploy };
});