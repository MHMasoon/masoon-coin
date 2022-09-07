import {ethers} from 'ethers';
import {readFileSync} from 'fs';
import * as dotenv from 'dotenv';

dotenv.config();

const JSON_RPC_URL = process.env.JSON_RPC_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

const contractAbi = readFileSync('./masoon-coin_sol_MasoonCoin.abi', 'utf-8');
const contractBin = readFileSync('./masoon-coin_sol_MasoonCoin.bin', 'binary');

const provider = new ethers.providers.JsonRpcProvider(JSON_RPC_URL);
const wallet = new ethers.Wallet(PRIVATE_KEY, provider);
const masoonCoinFactory = new ethers.ContractFactory(contractAbi, contractBin, wallet);

masoonCoinFactory.deploy()
.then((masoonCoin)=> {
    console.log(masoonCoin.address);
})
.catch((err)=> {
    console.log('Error');
})
