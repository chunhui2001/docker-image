### 当前 Makefile 文件物理路径
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

IP 			?='172.16.254.11'
IDENTITY 	?='blkchain2'
BOOTNODES 	?='enode://3323afadb83a002a8f77766ded46fadceed29fd47b2c83b1d9ed038ffb9dafaecd506decc865facc1cab12245f77378356e4b53e5c5682257c9cb9670a2ed618@172.16.254.10:30303'
ETHERBASE 	?='0x79160c630d092ef1c4c8e0c33388e9f3ffb4602d'


init:
	geth 	--datadir $(IDENTITY) init genesis.json

console:
	geth 	--identity $(IDENTITY) \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--nat=extip:$(IP) \
			--networkid 4321 console

newAccount:
	geth 	--datadir $(IDENTITY) account new 

listAccount:
	geth 	--datadir $(IDENTITY) account list 

miner:	
	geth 	--identity $(IDENTITY) \
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
			--syncmode "full" -cache=4096 --http --metrics --maxpeers 30

rpcnode:
	geth 	--identity $(IDENTITY) \
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

