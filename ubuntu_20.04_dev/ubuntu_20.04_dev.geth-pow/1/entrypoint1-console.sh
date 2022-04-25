#!/bin/bash

geth --identity "blkchain1" \
	 --nodekey='/root/nodekey' \
 	 --datadir /root/blkchain1 --verbosity 6 --nodiscover \
	 --nat=extip:172.16.197.179 \
	 --networkid 4321 console
