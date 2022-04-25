#!/bin/bash

## 如果容器已启动则删除
docker rm -f blkchain1

## 启动空壳容器
CMD="sleep" docker-compose -f 1/docker-compose.yml up -d 

## 初始化数据目录
if [ ! -d '1/blkchain1/geth' ]; then
	docker exec -it blkchain1 make init
fi

## 创建账户
if test -n "$(find 1/blkchain1/keystore/ -maxdepth 0 -empty)" ; then
	docker exec -it blkchain1 make newAccount
fi

## 删除空壳并重启一个带控制台的节点
docker rm -f blkchain1 && CMD="console" docker-compose -f 1/docker-compose.yml up -d 

## 显示挖矿账户
ETHERBASE=$(docker exec -it blkchain1 make getCoinbase)

docker rm -f blkchain1 && CMD="miner" ETHERBASE=$ETHERBASE docker-compose -f 1/docker-compose.yml up -d 
