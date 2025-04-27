import { ethers } from "hardhat";

const main = async () => {
  const myToken = await ethers.deployContract("MyToken");
  myToken.waitForDeployment();
  console.log(`MyToken deployed to ${myToken.target}`);
};

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });