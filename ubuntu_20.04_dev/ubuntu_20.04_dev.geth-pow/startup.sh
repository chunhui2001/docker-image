#!/bin/bash

## 当前文件绝对路径
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

######################
### BLKCHAIN1 BEGIN ##
######################
## 如果容器已启动则删除
docker rm -f blkchain1

## 启动空壳容器
CMD="sleep" docker-compose -f ${SCRIPTPATH}/1/docker-compose.yml up -d 

## 初始化数据目录
if [ ! -d `${SCRIPTPATH}/1/blkchain1/geth` ]; then
	echo '初始化数据目录: blkchain1'
	docker exec -it blkchain1 make init
fi

## 创建账户
if test -n "$(find ${SCRIPTPATH}/1/blkchain1/keystore/ -maxdepth 0 -empty)" ; then
	echo 'blkchain1创建账户'
	docker exec -it blkchain1 make newAccount
	ls ${SCRIPTPATH}/1/blkchain1/keystore/
fi

## 计算当前的创世账户
ETHERBASE1=$(ls -tr ${SCRIPTPATH}/1/blkchain1/keystore/ | tail -n 1)
ETHERBASE2=0x$(printf %s\\n "${ETHERBASE1[@]: -40}")

## 当前节点的账户
echo 'blkchain1账户: '$ETHERBASE2

#docker rm -f blkchain1 && CMD="miner" ETHERBASE=$ETHERBASE docker-compose -f 1/docker-compose.yml up -d 

echo 'blkchain1启动种子节点: '$ETHERBASE2
docker rm -f blkchain1 && CMD="bootnode" docker-compose -f ${SCRIPTPATH}/1/docker-compose.yml up -d 
#####################
### BLKCHAIN1 END ###
#####################

