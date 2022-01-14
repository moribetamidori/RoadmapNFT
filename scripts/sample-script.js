const hre = require("hardhat");

async function main() {
  const Contract = await hre.ethers.getContractFactory("Roadmaps");
  const contract = await Contract.deploy();

  await contract.deployed();

  let txn = await contract.claim(999)
  // Wait for it to be mined.
  await txn.wait()

  console.log("Contract deployed to:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
