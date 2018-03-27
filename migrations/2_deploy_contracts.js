var LrxAirdrop = artifacts.require('./LrxAirdrop.sol')
var LrxToken = artifacts.require('./DummyToken.sol')

module.exports = function(deployer) {
  deployer.deploy(LrxAirdrop);
  deployer.deploy(LrxToken, "LRX TOKEN", "LRX", 18, 1e26);
};
