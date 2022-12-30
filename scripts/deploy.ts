import { ethers } from "hardhat";

async function main() {

  const InheritanceTaskContract = await ethers.getContractFactory("InheritenceTaskContract");
  const ITT = await InheritanceTaskContract.deploy();

  await ITT.deployed();

  console.log(`task6-inheritanceTaskContract deployed to ${ITT.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
