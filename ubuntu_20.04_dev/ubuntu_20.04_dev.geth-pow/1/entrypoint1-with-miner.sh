#!/bin/bash

geth --identity "blkchain1" \
	 --allow-insecure-unlock \
 	 --datadir /root/blkchain1 --verbosity 4 --nodiscover \
     --port 30303 \
	 --nat=extip:172.16.197.179 \
	 --http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
	 --http.api 'personal,eth,net,web3,txpool,miner' \
	 --mine --miner.threads=1 \
	 --miner.etherbase='0x79160c630d092ef1c4c8e0c33388e9f3ffb4602d' \
	 --networkid 4321 \
	 --syncmode "full" -cache=4096 --http --metrics --maxpeers 30

