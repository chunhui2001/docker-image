#!/bin/bash

geth --datadir /root/blkchain2 --verbosity 4 --nodiscover \
     --port 30303 \
	--nat=extip:172.16.197.180 \
	--http.addr "0.0.0.0" --http.port 8546 \
	--syncmode "full" -cache=4096 --http --metrics --maxpeers 30

