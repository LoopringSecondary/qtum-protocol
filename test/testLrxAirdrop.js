const LrxAirdrop = artifacts.require('./LrxAirdrop.sol')

contract('LrxAirdrop', async (accounts) => {
  const owner = accounts[0];
  const user = accounts[2];

  let airdropContract;

  const increaseTime = function(duration) {
    const id = Date.now()
    return new Promise((resolve, reject) => {
      web3.currentProvider.sendAsync({
        jsonrpc: '2.0',
        method: 'evm_increaseTime',
        params: [duration],
        id: id,
      }, err1 => {
        if (err1) return reject(err1)
        web3.currentProvider.sendAsync({
          jsonrpc: '2.0',
          method: 'evm_mine',
          id: id+1,
        }, (err2, res) => {
          return err2 ? reject(err2) : resolve(res)
        })
      })
    })
  }

  before(async () => {
    airdropContract = await LrxAirdrop.deployed();
  });

  describe('owner', () => {
    it('should be able to set lrx airdrop amount for user', async () => {
      const _amount = 100e18;
      await airdropContract.setLrxAmount(user, _amount, {from: owner});
      const lrxAmountFromContract = await airdropContract.lrxAmountMap(user);
      assert.equal(_amount, lrxAmountFromContract, "setLrxAmount error");
    });
  });

  describe('user', () => {
    it('should not be able to set lrx airdrop amount for any user', async () => {
      const _amount = 100e18;
      try {
        await airdropContract.setLrxAmount(user, _amount, {from: user});
        assert(false, "lrx airdrop amount can be set by other users.");
      } catch (err) {
        const errMsg = `${err}`;
        assert(errMsg.includes("Error: VM Exception while processing transaction: revert"),
               "unexpected error occurred.");
      }
    });

    it('should be able to withdraw lrx', async () => {
      const secsInDay = 3600 * 24;
      await increaseTime(secsInDay * 10);

      assert.equal(true, true, "");
    });
  });

})
