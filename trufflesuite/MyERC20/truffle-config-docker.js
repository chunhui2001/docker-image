const path = require('path')
const yargs = require('yargs');
var provider, address;

const privKeyrinkeby = "0x3b1a4f16f0d2ddf50450c4e16d7ba3510c320d56fa181407a0937d4c36088607"
const PrivateKeyProvider = require("truffle-privatekey-provider");

module.exports = {
  
  contracts_directory: path.join(__dirname, "contracts"),
  build_directory: path.join(__dirname, "build"),
  contracts_directory: path.join(__dirname, "contracts"),
  contracts_build_directory: path.join(__dirname, "build/contracts"),
  migrations_directory: path.join(__dirname, "migrations"),
  test_directory: path.join(__dirname, "test"),

  networks: {
   development: {
     network_id: "1024879",
     provider: () => new PrivateKeyProvider(privKeyrinkeby, "http://127.0.0.1:17888"),
     gasPrice: 50000000000, // 50 gwei,
   },
   test: {
     host: "127.0.0.1",
     port: 17888,
     network_id: "1024879"
   }
  },
  
  compilers: {
    solc: {
      version: "0.6.10",
      // docker: true,
      settings: {          // See the solidity docs for advice about optimization and evmVersion
        optimizer: {
          enabled: false,
          runs: 200
        },
        evmVersion: "byzantium"
       }
    }
  }

};
