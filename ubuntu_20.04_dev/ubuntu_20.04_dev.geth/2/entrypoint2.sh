#!/bin/bash

geth --identity "blkchain2" --allow-insecure-unlock \
 	--datadir /root/blkchain2 --verbosity 6 --nodiscover \
     --port 30303 \
	--nat=extip:172.16.197.180 \
	--http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
	--http.api 'personal,eth,net,web3,txpool,miner' \
	--networkid 4321 \
	--syncmode "full" -cache=4096 --http --metrics --maxpeers 30 console

