#!/bin/bash

geth --identity "blkchain2" \
 	 --datadir /root/blkchain2 --verbosity 6 --nodiscover \
	 --nat=extip:172.16.197.180 \
	 --networkid 4321 \
	 --nodekey='a3c400a42c312eadd07029c95e7f2baff6dbfc01618f33e3506b33b213b72648' console
