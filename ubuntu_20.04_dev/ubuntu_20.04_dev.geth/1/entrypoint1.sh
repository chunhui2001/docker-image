#!/bin/bash

geth --allow-insecure-unlock \
 	 --datadir /root/blkchain1 --verbosity 4 --nodiscover \
	 --port 30303 \
	 --nat=extip:172.16.197.179 \
	 --http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
	 --http.api 'personal,eth,net,web3,txpool,miner' \
	 --syncmode "full" -cache=4096 --http --metrics --maxpeers 30 console

# geth --datadir /root/blkchain1 --verbosity 4 --nodiscover \
# 	 --port 30303 \
# 	 --nat=extip:172.16.197.179 \
# 	 --http.addr "0.0.0.0" --http.port 8545 \
# 	 --http.api 'personal,eth,net,web3,txpool,miner' \
# 	 --mine --miner.etherbase=YOUR_ETHEREUM_ADDRESS_HERE \
# 	 --syncmode "full" -cache=4096 --http --metrics --maxpeers 30 console
