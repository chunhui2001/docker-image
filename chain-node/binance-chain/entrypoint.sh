#!/bin/bash
geth --config /usr/local/binance-chain/mainnet/config.toml --datadir /usr/local/binance-chain/mainnet_node --cache 18000 --rpc.allow-unprotected-txs --txlookuplimit 0 --nodiscover
