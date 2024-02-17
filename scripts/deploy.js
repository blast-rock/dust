const { ethers } = require("hardhat");
require("dotenv").config()

async function main() {
  console.log("Deploy DUST");
  const contract = await ethers.getContractFactory(
    "contracts/DUST.sol:DUST"
  );

  console.log("Deploying..");
  const dust = await contract.deploy(
    "Dust Token",
    "DUST"
  );

  console.log("wait for deployment..");
  await dust.waitForDeployment();

  console.log("DUST deployed: ", await dust.target);

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error)
    process.exit(1)
  });

