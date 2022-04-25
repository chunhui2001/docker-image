#!/bin/bash

geth --identity "blkchain3" \
	 --bootnodes "enode://3323afadb83a002a8f77766ded46fadceed29fd47b2c83b1d9ed038ffb9dafaecd506decc865facc1cab12245f77378356e4b53e5c5682257c9cb9670a2ed618@172.16.197.179:30303" \
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

