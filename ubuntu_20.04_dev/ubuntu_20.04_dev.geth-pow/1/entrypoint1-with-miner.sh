#!/bin/bash

geth --identity "blkchain1" \
	 --nodekey='/root/nodekey' \
	 --allow-insecure-unlock \
	 --unlock 0 --password='/root/password.sec' \
 	 --datadir /root/blkchain1 --verbosity 6 --nodiscover \
     --port 30303 \
	 --nat=extip:172.16.197.179 \
	 --http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
	 --http.api 'personal,eth,net,web3,txpool,miner' \
	 --mine --miner.threads=1 \
	 --miner.etherbase='0x2392c61e0a318dc0c7b7314bf190fbf0ca3ede33' \
	 --networkid 4321 \
	 --syncmode "full" -cache=4096 --http --metrics --maxpeers 30

