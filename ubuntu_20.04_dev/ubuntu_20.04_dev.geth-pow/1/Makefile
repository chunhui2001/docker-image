### 当前 Makefile 文件物理路径
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

IP 			?='172.16.197.179'
IDENTITY 	?='blkchain1'
ETHERBASE 	?='0x79160c630d092ef1c4c8e0c33388e9f3ffb4602d'


init:
	geth 	--datadir $(IDENTITY) --nodekey='/root/nodekey' init genesis.json

console:
	geth 	--identity $(IDENTITY) \
			--nodekey='/root/nodekey' \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--nat=extip:$(IP) \
			--networkid 4321 console

miner:	
	geth 	--identity $(IDENTITY) \
			--nodekey='/root/nodekey' \
			--allow-insecure-unlock \
			--unlock 0 --password='/root/password.sec' \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--port 30303 \
			--nat=extip:$(IP) \
			--http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
			--http.api 'personal,eth,net,web3,txpool,miner' \
			--mine --miner.threads=1 \
			--miner.etherbase=$(ETHERBASE) \
			--networkid 4321 \
			--syncmode "full" -cache=4096 --http --metrics --maxpeers 30 console

bootnode:
	geth 	--identity $(IDENTITY) \
			--nodekey='/root/nodekey' \
			--allow-insecure-unlock \
			--unlock 0 --password='/root/password.sec' \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--port 30303 \
			--nat=extip:$(IP) \
			--networkid 4321 \
			--syncmode "full" -cache=4096 --http --metrics --maxpeers 30













