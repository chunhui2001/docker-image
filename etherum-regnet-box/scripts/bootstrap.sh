#!/bin/bash

######################
### BLKCHAIN1 BEGIN ##
######################
## 如果容器已启动则删除
docker rm -f blkchain1  >/dev/null 2>&1

## 启动空壳容器
CMD="sleep" docker-compose -f 1/docker-compose.yml up -d 

## 初始化数据目录
if [ ! -d 1/blkchain1/geth ]; then
	echo '>>>>>>>>>>>>>> 初始化数据目录: blkchain1 <<<<<<<<<<<<<<<<<<<<'
	docker exec -it blkchain1 make init
fi

## 创建账户
if test -n "$(find 1/blkchain1/keystore/ -maxdepth 0 -empty)" ; then
	echo '>>>>>>>>>>>>>> blkchain1创建挖矿账户 <<<<<<<<<<<<<<<<<<<<'
	docker exec -it blkchain1 make newAccount
	ls 1/blkchain1/keystore/
fi

## 当前的挖矿账户密钥文件路径
ETHERBASE1=$(ls -tr 1/blkchain1/keystore/ | tail -n 1)
ETHERBASE2=0x$(printf %s\\n "${ETHERBASE1[@]: -40}")

## 当前节点的挖矿账户
echo '>>>>>>>>>>>>>> blkchain1当前挖矿账户: '$ETHERBASE2' <<<<<<<<<<<<<<<<<<<<'

docker rm -f blkchain1  >/dev/null 2>&1 && CMD="bootnode" docker-compose -f 1/docker-compose.yml up -d 
echo '>>>>>>>>>>>>>> blkchain1种子节点启动成功 <<<<<<<<<<<<<<<<<<<<'

## 等待2秒查询节点信息
sleep 2s
lastblocknumber=`curl --location --request POST 'http://127.0.0.1:8545' --header 'Content-Type: application/json' --data-raw '[{"id":"eth_blockNumber","jsonrpc":"2.0","method":"eth_blockNumber"}]'`
echo 'blkchain1.lastBlockNumber='$lastblocknumber

enode=`docker exec -it blkchain1 make getNodeInfo | grep enode | cut -d"?" -f1 | awk '{split($0, array, "://"); print array[2]}'`
echo '>>>>>>>>>>>>>> blkchain1-enode: <<<<<<<<<<<<<<<<<<<<'
echo 'blkchain1.enode='$enode

#####################
### BLKCHAIN1 END ###
#####################


#docker rm -f blkchain1 && CMD="miner" ETHERBASE=$ETHERBASE docker-compose -f 1/docker-compose.yml up -d 
