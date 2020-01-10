#!/bin/bash

## 创建容器网络
docker network create --driver=bridge --subnet=172.16.254.0/28 priv-eth-net  >/dev/null 2>&1

IDENTITY="$1"

######################
### BLKCHAIN1 BEGIN ##
######################
## 如果容器已启动则删除
docker rm -f $IDENTITY  >/dev/null 2>&1

## 启动空壳容器
current_random_name=`CMD="sleep" docker-compose -f 1/docker-compose.yml up -d 2>&1 | tail -n 1 | awk '{split($0, array, " "); print array[2]}'`
echo 'CURRENT-RANDOM-CONTAINER-NAME-WILL-BE-RENAMED: '$current_random_name
docker rename $current_random_name $IDENTITY

## 初始化数据目录
if [ ! -d 1/$IDENTITY/geth ]; then
	echo '>>>>>>>>>>>>>> ['$IDENTITY']初始化节点数据目录 <<<<<<<<<<<<<<<<<<<<'
	docker exec -it $IDENTITY make init
fi

## 创建账户
if test -n "$(find 1/$IDENTITY/keystore/ -maxdepth 0 -empty)" ; then
	echo '>>>>>>>>>>>>>> [$IDENTITY]创建节点账户 <<<<<<<<<<<<<<<<<<<<'
	docker exec -it $IDENTITY make newAccount
	ls 1/$IDENTITY/keystore/
fi

## 当前的挖矿账户密钥文件路径
ETHERBASE1=$(ls -tr 1/$IDENTITY/keystore/ | tail -n 1)
ETHERBASE2=0x$(printf %s\\n "${ETHERBASE1[@]: -40}")

## 当前节点的挖矿账户
echo '>>>>>>>>>>>>>> ['$IDENTITY']当前节点账户: '$ETHERBASE2' <<<<<<<<<<<<<<<<<<<<'

docker rm -f $IDENTITY  >/dev/null 2>&1
current_random_name=`CMD="bootnode" docker-compose -f 1/docker-compose.yml up -d 2>&1 | tail -n 1 | awk '{split($0, array, " "); print array[2]}'`
echo 'CURRENT-RANDOM-CONTAINER-NAME-WILL-BE-RENAMED: '$current_random_name
docker rename $current_random_name $IDENTITY

echo '>>>>>>>>>>>>>> ['$IDENTITY']节点启动成功 <<<<<<<<<<<<<<<<<<<<'
lastblocknumber=`docker exec -it $IDENTITY make getLastBlockNumber`
echo $IDENTITY'.lastBlockNumber='$lastblocknumber

enode=`docker exec -it $IDENTITY make getNodeInfo | grep enode | cut -d"?" -f1 | awk '{split($0, array, "://"); print array[2]}'`
echo '>>>>>>>>>>>>>> '$IDENTITY'-enode: <<<<<<<<<<<<<<<<<<<<'
echo $IDENTITY'.enode='$enode

#####################
### BLKCHAIN1 END ###
#####################

# docker rm -f blkchain1 && CMD="miner" ETHERBASE=$ETHERBASE docker-compose -f 1/docker-compose.yml up -d 
# lastblocknumber=`curl --location --request POST 'http://127.0.0.1:8545' --header 'Content-Type: application/json' --data-raw '[{"id":"eth_blockNumber","jsonrpc":"2.0","method":"eth_blockNumber"}]'`

