#!/bin/bash

geth --datadir /root/blkchain2 --verbosity 4 --nodiscover \
     --port 30303 \
	--bootnodes enode://fb7551da65969d9aea58f1e69f6b49919acdc270d5805455b1cdaf5463430adbb0aacc3a9c59e6733f86726c2b207d4841bfc22cd36a04d05e6f459fd7a96971@127.0.0.1:30303 \
	--nat=extip:172.16.197.180 \
	--http.addr "0.0.0.0" --http.port 8546 \
	--syncmode "full" -cache=4096 --http --metrics --maxpeers 30 \
	--unlock primary --minerthreads 2 --mine 1

