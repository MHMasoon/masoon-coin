# An ERC-20 Token

It is an ERC-20 token implementation with minimum functionality that comply with the standards.

**Note:** This token has security issues and has not been tested.
For more secure and well-tested token implementations, you can check [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts).

---

## How to create your own token with this contract

**:one: Provide environmental variables**

create a .env file in the root of the project and write your information with the following format:

JSON_RPC_URL='Your json rpc url'<br>
PRIVATE_KEY='Your account private key'

**:two: Change your token settings**

Open the token.sol file. At the begining of the contract there are some variables that you can change their values to customize your token.

Things that you can change:
- Name
- Symbol
- Total Supply
- Decimals

**:three: Compile the contract**

You should compile your contract before you can send it to the network. In order to do that, run ```npm run compile``` in your terminal. This command will create contarct ABI and BIN files.

**:four: Deploy the contract**

Now everything is ready to deploy the contract. Run ```npm run deploy``` in your terminal. This will deploy the contract to the network and return the contract address. At contract creation, all the tokens will be sent to the contract creator.

