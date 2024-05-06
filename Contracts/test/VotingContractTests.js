const { expect } = require("chai");
const {ethers} = require("hardhat");


describe("Tests for Staking Tokens contract",()=>{
  let voting;
  let addr1, addr2, addr3;

  beforeEach(async()=>{
    voting = await ethers.getContractFactory("VotingContract");
    [addr1,addr2,addr3] = await ethers.getSigners();
    deployVoting = await voting.deploy();
    await deployVoting.waitForDeployment();
  })

  describe("Tests related to voting contract functions",()=>{

    it("Should increase the vote count of a candidate of a campaign",async()=>{
      await deployVoting.vote(0,0,addr1);
      expect(await deployVoting.getVotes(0,0)).to.equal(1);
    })
  })
})