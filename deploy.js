import {ethers} from 'ethers';
import {readFileSync} from 'fs';
import * as dotenv from 'dotenv';

dotenv.config();

const JSON_RPC_URL = process.env.JSON_RPC_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

const contractAbi = readFileSync('./token_sol_Token.abi', 'utf-8');
const contractBin = readFileSync('./token_sol_Token.bin', 'binary');

const provider = new ethers.providers.JsonRpcProvider(JSON_RPC_URL);
const wallet = new ethers.Wallet(PRIVATE_KEY, provider);
const masoonCoinFactory = new ethers.ContractFactory(contractAbi, contractBin, wallet);

masoonCoinFactory.deploy()
.then((token)=> {
    console.log(token.address);
})
.catch((err)=> {
    console.log(err);
})
