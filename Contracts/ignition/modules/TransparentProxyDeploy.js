const {ethers} = require("hardhat");
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("TransparentProxyDeployModule", (m) => {
  const deploy = m.contract("TransparentProxy");

  return { deploy };
});