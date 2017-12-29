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
    hex address: 2eb2a66afd4e465fb06d8b71f30fb1b93e18788d
    link: https://explorer.qtum.org/address/QQruCwurjS9Nqy5PGmdSNrALhRsbZCeWvK
```

