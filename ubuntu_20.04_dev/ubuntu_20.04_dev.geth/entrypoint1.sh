#!/bin/bash

geth --datadir /root/blkchain1 --verbosity 4 --nodiscover \
	 --port 30303 \
	 --nat=extip:172.16.197.179 \
	 --http.addr "0.0.0.0" --http.port 8545 \
	 --syncmode "full" -cache=4096 --http --metrics --maxpeers 30 
