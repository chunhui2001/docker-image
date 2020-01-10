#!/bin/bash
# geth --config /binance-chain/config.toml --datadir /binance-chain/mainnet_node --cache 18000 --rpc.allow-unprotected-txs --txlookuplimit 0 --nodiscover
cd /binance-chain && 
geth --config config.toml --datadir ./node  --cache 18000 --rpc.allow-unprotected-txs --txlookuplimit 0 
