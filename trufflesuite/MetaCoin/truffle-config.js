const path = require('path');

module.exports = {

  contracts_directory: path.join(__dirname, "contracts"),
  build_directory: path.join(__dirname, "build"),
  contracts_directory: path.join(__dirname, "contracts"),
  contracts_build_directory: path.join(__dirname, "build/contracts"),
  migrations_directory: path.join(__dirname, "migrations"),
  test_directory: path.join(__dirname, "test"),

  networks: {
   development: {
     host: "127.0.0.1",
     port: 17888,
     network_id: "1024879"
   },
   test: {
     host: "127.0.0.1",
     port: 17888,
     network_id: "1024879"
   }
  }
};
