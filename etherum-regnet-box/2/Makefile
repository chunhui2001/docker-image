### 当前 Makefile 文件物理路径
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

IP 			?='172.16.254.11'
IDENTITY 	?='blkchain2'
BOOTNODES 	?='enode://3323afadb83a002a8f77766ded46fadceed29fd47b2c83b1d9ed038ffb9dafaecd506decc865facc1cab12245f77378356e4b53e5c5682257c9cb9670a2ed618@172.16.254.10:30303'
ETHERBASE 	:=

sleep:
	while true; do echo 1 >/dev/null 2>/dev/null; sleep 1; done

init:
	geth 	--datadir $(IDENTITY) init genesis.json

console:
	geth 	--identity $(IDENTITY) \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--nat=extip:$(IP) \
			--networkid 4321

newAccount:
	geth 	--datadir $(IDENTITY) account new --password '/root/password.sec'

listAccount:
	geth 	--datadir $(IDENTITY) account list 

miner:	
	geth 	--identity $(IDENTITY) \
			--networkid 4321 --port 30303 --nat=extip:$(IP) \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--syncmode "full" -cache=4096 --http --metrics --maxpeers 30 \
			--allow-insecure-unlock --unlock 0 --password='/root/password.sec' \
			--mine --miner.threads=1 --miner.etherbase=$(ETHERBASE)

rpcnode:
	geth 	--identity $(IDENTITY) \
			--networkid 4321 --port 30303 --nat=extip:$(IP) \
			--datadir /root/$(IDENTITY) --verbosity 6 --nodiscover \
			--syncmode "full" -cache=4096 --http --metrics --maxpeers 30 \
			--http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
			--http.api 'eth,net,web3,txpool'

getCoinbase:
	geth attach $(IDENTITY)/geth.ipc --exec "eth.coinbase"

getPeers:
	geth attach $(IDENTITY)/geth.ipc --exec "admin.peers"

getNodeInfo:
	geth attach $(IDENTITY)/geth.ipc --exec "admin.nodeInfo"

getLastBlockNumber:
	@geth attach $(IDENTITY)/geth.ipc --exec "eth.blockNumber"

