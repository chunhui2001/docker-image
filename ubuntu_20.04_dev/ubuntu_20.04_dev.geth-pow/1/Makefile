### 当前 Makefile 文件物理路径
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

IP 			?='172.16.254.10'
IDENTITY 	?='blkchain1'
ETHERBASE 	:='0xa88aaa4c6f0057ff4f07c740b297567ac946329d'

sleep:
	while true; do echo 1 >/dev/null 2>/dev/null; sleep 1; done

init:
	geth 	--datadir $(IDENTITY) --nodekey='/root/nodekey' init genesis.json

console:
	geth 	--identity $(IDENTITY) \
			--nodekey='/root/nodekey' \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--nat=extip:$(IP) \
			--networkid 4321 console

newAccount:
	geth 	--datadir $(IDENTITY) account new 

listAccount:
	geth 	--datadir $(IDENTITY) account list 

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

rpcnode:
	geth 	--identity $(IDENTITY) \
			--nodekey='/root/nodekey' \
			--allow-insecure-unlock \
			--unlock 0 --password='/root/password.sec' \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--port 30303 \
			--nat=extip:$(IP) \
			--http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
			--http.api 'eth,net,web3,txpool' \
			--networkid 4321 \
			--syncmode "full" -cache=4096 --http --metrics --maxpeers 30

bootnode:
	geth 	--identity $(IDENTITY) \
			--nodekey='/root/nodekey' \
			--allow-insecure-unlock \
			--unlock 0 --password='/root/password.sec' \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--port 30303 \
			--nat=extip:$(IP) \
			--http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
			--http.api 'eth,net,web3,txpool' \
			--networkid 4321 \
			--syncmode "full" -cache=4096 --http --metrics --maxpeers 30

getCoinbase:
	geth attach $(IDENTITY)/geth.ipc --exec "eth.coinbase"

getPeers:
	geth attach $(IDENTITY)/geth.ipc --exec "admin.peers"

getLastBlockNumber:
	geth attach $(IDENTITY)/geth.ipc --exec "eth.blockNumber"





