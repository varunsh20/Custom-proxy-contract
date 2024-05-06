const { expect } = require("chai");
const {ethers} = require("hardhat");


describe("Tests for Transfer Tokens contract",()=>{
  let transfer;
  let addr1, addr2, addr3;

  beforeEach(async()=>{
    transfer = await ethers.getContractFactory("Transfer");
    [addr1,addr2,addr3] = await ethers.getSigners();
    deployTransfer = await transfer.deploy();
    await deployTransfer.waitForDeployment();
  })

  describe("Tests related to transfer tokens functions",()=>{

    it("Checks whether correct number of tokens are minted or not",async()=>{
      await deployTransfer.mint(addr1,100);
      expect(await deployTransfer.viewBalance(addr1)).to.equal(100);
    })

    it("Should transfer correct number of tokens",async()=>{
      await deployTransfer.mint(addr1,100);
      await deployTransfer.transferFrom(addr1,addr2,50);
      expect(await deployTransfer.viewBalance(addr2)).to.equal(50);
    })
  })
})