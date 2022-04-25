#!/bin/bash

geth --identity "blkchain2" \
	 --bootnodes "enode://7b7ccb1d35301186441331d393dd9199ed07d2b5fa8f994f724a04ea9e3dc3802eb26c7c47df342e2302b2b6a42d7224df5bf0297e109d4f38273189992c1d6f@172.16.197.179:30303" \
	 --allow-insecure-unlock \
	 --unlock 0 --password='/root/password.sec' \
 	 --datadir /root/blkchain2 --verbosity 6 --nodiscover \
     --port 30303 \
	 --nat=extip:172.16.197.180 \
	 --http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
	 --http.api 'eth,net,web3,txpool' \
	 --networkid 4321 \
	 --syncmode "full" -cache=4096 --http --metrics --maxpeers 30

