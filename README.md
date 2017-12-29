# Loopring on Qtum

This is the implementation of the Loopring Protocol on Qtum public blockchain. Given Qtum and Ethereum are similiar in terms of smart-contract support, we will try to make sure the protocol is implemented consistently between these two blockchains.

Based on current status, new versions of the protocol will likely to be developped in the [Ethereum protocol repository](https://github.com/Loopring/protocol).

## LRQ
Loopring is not a cross-chain protocol, Loopring token issued on one blockchain cannot be used by the protocol on another blockchain. Therefore for the ecosystem of each blockchain, we have to issue a new Loopring token. In case of Qtum, it is LRQ; in case of Ethereum, it is LRC. LRQ and LRC should be considered irrelevent and they don't have no conflict of interest at all.

If the Loopring Protocol can evolve into a cross-chain protocol, we'll propose a way to merge these different tokens based on their total market caps. However, this is not happening any time soon.

## compile
```
    npm install
    npm run compile
```    
 
## Deployed on qtum main-net:  

### LRQ token:
```
    qtum address: QQruCwurjS9Nqy5PGmdSNrALhRsbZCeWvK
    hex address: 2eb2a66afd4e465fb06d8b71f30fb1b93e18788d
    link: https://explorer.qtum.org/address/QQruCwurjS9Nqy5PGmdSNrALhRsbZCeWvK
```

### Loopring Protocol version1.0:
```
1. TokenTransferDelegate:
    * qtum address: QV2aQmR4FppywaQAn6ArMBEa5UgQhCJqbk
    * hex address: 5c679f5dd70832ce2b08a231b9176e8cd1c5d6ea
2. TokenRegistry:
    * qtum address: QSjBxNvcwyyWsN5wc8wD6DQ7YyVaS31ASo
    * hex address: 432d8e1e4c612b251836c3f2cb15f2b705ede06d
3. RinghashRegistry:
    * qtum address: QddZU75Vuua2BNA7JvGKKYipR16ovE4zpf
    * hex address: bac66698008b8c307cf1727cfe4adbb5b1e5a90d
4. LoopringProtocolImpl:
    * qtum address: QdT9We7mo2oaBFnmDXWDRAPHBuhSCaq9SA
    * hex address: b8ce3e51bf21cb2611c3840d6066d1acac348d1b
```
