const DAI = artifacts.require("DAI");

module.exports = function(deployer) {
  deployer.deploy(DAI);
};
