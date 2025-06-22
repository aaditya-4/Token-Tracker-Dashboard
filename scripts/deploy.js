const hre = require("hardhat");

async function main() {
  const TokenTrackerDashboard = await hre.ethers.getContractFactory("TokenTrackerDashboard");
  const dashboard = await TokenTrackerDashboard.deploy();

  await dashboard.deployed();

  console.log("TokenTrackerDashboard deployed to:", dashboard.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
