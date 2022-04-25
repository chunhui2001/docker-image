#!/bin/bash

geth --identity "blkchain3" \
	 --bootnodes "enode://349bea226789dc71029b20f2d1be40a379d8454a73762e3a628038d039d2e7e7be8fbbe835553717d3c347a214db005bb9dff0ac10ebd4f1296bf49dfd89ebf9@172.16.197.179:30303" \
	 --allow-insecure-unlock \
	 --unlock 0 --password='/root/password.sec' \
 	 --datadir /root/blkchain3 --verbosity 6 --nodiscover \
     --port 30303 \
	 --nat=extip:172.16.197.181 \
	 --http.addr "0.0.0.0" --http.corsdomain "*" --http.port 8545 \
	 --http.api 'personal,eth,net,web3,txpool,miner' \
	 --mine --miner.threads=1 \
	 --miner.etherbase='0x79160c630d092ef1c4c8e0c33388e9f3ffb4602d' \
	 --networkid 4321 \
	 --syncmode "full" -cache=4096 --http --metrics --maxpeers 30

