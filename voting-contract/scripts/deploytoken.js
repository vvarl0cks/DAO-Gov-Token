import { ethers } from "hardhat";

async function main() {
    // Grab the contract factory 
    const AMAN = await ethers.getContractFactory("AMAN");
  
    // Start deployment, returning a promise that resolves to a contract object
    const myToken = await AMAN.deploy(); // Instance of the contract 

    await myToken.deployed(); // Wait for the deployment to be mined

    console.log("Contract deployed to address:", myToken.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
