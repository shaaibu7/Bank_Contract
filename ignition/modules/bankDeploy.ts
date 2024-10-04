import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

// const tokenAddress = "0x233A66dB39b5BA93993383b2B4E08E6FA81be8AB";

const BankModule = buildModule("BankModule", (m) => {

    const Bank = m.contract("Bank");

    return { Bank };
});

export default BankModule;
