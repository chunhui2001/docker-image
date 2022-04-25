
### 也许是国内第一篇把以太坊工作量证明从算法层讲清楚的
https://cloud.tencent.com/developer/article/1625710

### Generating DAG in progress
注意，在 FNV 哈希计算中，初始大小 1GB 数据集累积需要约 42 亿次（16777216 * 256）次计算。即使并发计算，也需要一定的时间才能完成一次数据集生成。这也就是为什么在启动一个 geth 挖矿节点时，刚开始时会看到一段 “Generating DAG in progress” 的日志，直到生成数据集完成后，才可以开始挖矿。



注意：挖矿的奖励会存入第一个用户的钱包中。挖矿过程中，先会出现如下信息，大致的意思是正在计算过程中，直到 percentage 到 100 时，计算完毕就开始矿了。

INFO [07-02|17:03:27] Generating DAG in progress epoch=0 percentage=0 elapsed=3.072s
INFO [07-02|17:03:29] Generating DAG in progress epoch=0 percentage=1 elapsed=5.604s
INFO [07-02|17:03:32] Generating DAG in progress epoch=0 percentage=2 elapsed=8.263s
INFO [07-02|17:03:34] Generating DAG in progress epoch=0 percentage=3 elapsed=10.788s
INFO [07-02|17:03:37] Generating DAG in progress epoch=0 percentage=4 elapsed=13.659s

之后，会提示以下信息（说明挖到矿了）：

INFO [11-15|10:05:56] block reached canonical chain number=127 hash=dcd6c2…399870
INFO [11-15|10:05:56] Commit new mining work number=133 txs=0 uncles=0 elapsed=0s
INFO [11-15|10:05:56] mined potential block number=132 hash=aaf21e…bbd961


## 查看版本
# go version
# geth version

## 根据创世文件初始化区块链
# geth --datadir blkchain1 init genesis.json

## 进入控制台
# geth --datadir blkchain1 --nodiscover --networkid 4321 console

## 创建第一个账户
# personal.newAccount()
# OR
# geth --datadir blkchain1 account new 

## 查看账户列表
# personal.listAccounts
# OR 
# geth --datadir blkchain1 account list

## 设置 etherbase
# miner.setEtherbase(eth.coinbase)

## 查看节点信息
# admin.nodeInfo

## 查看 enode
# admin.nodeInfo.enode

## if the block looks identical to the below then your custom genesis block hasn't been created successfully.
#> delete your data directory and reinitialise
# eth.getBlock(0)

## 查看默认账户
eth.coinbase

## 查看账户余额
# eth.getBalance('your account address here')

## 解除锁定账户
# personal.unlockAccount(eth.accounts[0])

## 转账
# eth.sendTransaction({from: eth.accounts[0], to: eth.accounts[1], value: 500000})

## 查看种子节点
# admin.peers

## 手动添加种子节点
# admin.addPeer(“//enode id”):

## 启动挖矿进程
# miner.start(1)

## 查看当前块高
# eth.blockNumber

## 通过ipc进程连接
# geth attach geth.ipc

## 修复数据库
geth removedb

