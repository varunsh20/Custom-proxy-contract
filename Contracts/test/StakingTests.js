const { expect } = require("chai");
const {ethers} = require("hardhat");


describe("Tests for Staking Tokens contract",()=>{
  let staking;
  let addr1, addr2, addr3;

  beforeEach(async()=>{
    staking = await ethers.getContractFactory("Staking");
    [addr1,addr2,addr3] = await ethers.getSigners();
    deployStaking = await staking.deploy();
    await deployStaking.waitForDeployment();
  })

  describe("Tests related to staking tokens functions",()=>{

    it("Checks whether correct number of tokens are staked or not",async()=>{
      await deployStaking.stake(100,addr1);
      expect(await deployStaking.viewStake(addr1)).to.equal(100);
    })

    it("Should unstake correct number of tokens",async()=>{
        await deployStaking.stake(100,addr1);
        await deployStaking.unstake(50,addr1);
        expect(await deployStaking.viewStake(addr1)).to.equal(50);
    })
  })
})