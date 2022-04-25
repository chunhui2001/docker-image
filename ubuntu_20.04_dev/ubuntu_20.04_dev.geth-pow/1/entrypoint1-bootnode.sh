#!/bin/bash

geth --identity "blkchain1" \
	 --nodekey='/root/nodekey' \
	 --allow-insecure-unlock \
	 --unlock 0 --password='/root/password.sec' \
 	 --datadir /root/blkchain1 --verbosity 6 --nodiscover \
	 --port 30303 \
	 --nat=extip:172.16.197.179 \
	 --networkid 4321 \
	 --syncmode "full" -cache=4096 --http --metrics --maxpeers 30
