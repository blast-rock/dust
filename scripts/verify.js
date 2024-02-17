const hre = require("hardhat");
require("dotenv").config()

const DUST_ADDRESS = "0x334973611d7d2e37Eb0d88fB1Aa00642cdB9537f";

async function main() {
    console.log("verify : " + DUST_ADDRESS);
    await hre.run("verify:verify", {
        address: DUST_ADDRESS,
        constructorArguments: [
            "Dust Token",
            "DUST"
        ]
    });

    console.log("Finished");
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error)
        process.exit(1)
    });

