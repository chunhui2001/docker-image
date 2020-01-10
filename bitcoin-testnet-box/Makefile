BITCOIND=bitcoind
BITCOINGUI=bitcoin-qt
BITCOINCLI=bitcoin-cli
B1_FLAGS=-rpcconnect=127.0.0.1 -rpcport=19001 -rpcuser=admin1 -rpcpassword=123
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=--user admin1:123
start:
	$(BITCOIND) $(B1) -daemon
	$(BITCOIND) $(B2) -daemon
start-gui:
	$(BITCOINGUI) $(B1) &
	$(BITCOINGUI) $(B2) &
### To generate a block:
### To generate more than 1 block: 
# >> make generate BLOCKS=10
generate:
	$(BITCOINCLI) $(B1) -generate $(BLOCKS)
#### Check the status of the nodes
getinfo:
	$(BITCOINCLI) $(B1) -getinfo
	#$(BITCOINCLI) $(B2) -getinfo
getinfo_by_curl:
	curl $(ACCOUNT) --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "getblockchaininfo", "params": []}' -H 'content-type: text/plain;' http://127.0.0.1:19001
### Sending bitcoins
sendfrom1:
	$(BITCOINCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)
sendfrom2:
	$(BITCOINCLI) $(B2) sendtoaddress $(ADDRESS) $(AMOUNT)
### 列出所有钱包
listwallets1:
	$(BITCOINCLI) $(B1) listwallets
listwallets1_by_curl:
	curl $(ACCOUNT) --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "listwallets", "params": []}' -H 'content-type: text/plain;' http://127.0.0.1:19001
### 根据地址查询账户
# >> make getaccount1 ADDRESS=1D1ZrZNe3JUo7ZycKEYQQiQAWd9y54F4XX
getaccount1:
	$(BITCOINCLI) $(B1) getaccount $(ADDRESS)
getaccount2:
	$(BITCOINCLI) $(B1) getaccount $(ADDRESS)
### 创建钱包 
# >> make create_wallet1 WALLET_NAME=chunhui.zhang.wallet1
create_wallet1:
	$(BITCOINCLI) $(B1) createwallet $(WALLET_NAME)
### Generate a wallet address for the first wallet
create_address1:
	$(BITCOINCLI) $(B1) getnewaddress $(ACCOUNT)
### 导入地址
# >> make import_address WALLET_NAME=my-first-wallet-1 ADDRESS=mpQnMXrxbkkQxwfNQqGMyz1mHmrAfiJYCG LABEL=my-primary-address-label1 SCAN=false
import_address:
	$(BITCOINCLI) $(B1) -rpcwallet=$(WALLET_NAME) importaddress $(ADDRESS) $(LABEL) $(SCAN)
# >> make import_address_by_curl WALLET_NAME=my-first-wallet-1 ADDRESS=mpQnMXrxbkkQxwfNQqGMyz1mHmrAfiJYCG LABEL=my-primary-address-label1 SCAN=false
import_address_by_curl:
	curl $(ACCOUNT) --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "importaddress", "params": ["$(ADDRESS)","$(LABEL)",$(SCAN)]}' -H 'content-type: text/plain;' "http://127.0.0.1:19001/wallet/$(WALLET_NAME)"
# >> make import_pubkey_by_curl WALLET_NAME=my-first-wallet-1 PUBKEY=02d61e729c277aa4f28c698f68d9fb68be2166b3f27dec29f0b9eaed118547c86d LABEL=my-primary-address-label1 SCAN=false
import_pubkey_by_curl:
	curl $(ACCOUNT) --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "importpubkey", "params": ["$(PUBKEY)","$(LABEL)",$(SCAN)]}' -H 'content-type: text/plain;' "http://127.0.0.1:19001/wallet/$(WALLET_NAME)"
### 查询余额    
# >> make getbalance1 WALLET_NAME=my-first-wallet-1
getbalance1:
	$(BITCOINCLI) $(B1) -rpcwallet=$(WALLET_NAME) getbalance "*" 6 true
# >> make getbalance1_by_curl WALLET_NAME=my-first-wallet-1
getbalance1_by_curl:
	curl $(ACCOUNT) --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "getbalance", "params": ["*", 6, true]}' -H 'content-type: text/plain;' "http://127.0.0.1:19001/wallet/$(WALLET_NAME)"
### 查询钱包中所有剩余的从之前交易中已确认的支出    
listunspent1:
	$(BITCOINCLI) $(B1) listunspent
stop:
	$(BITCOINCLI) $(B1) stop
	$(BITCOINCLI) $(B2) stop
clean:
	find 1/regtest/* -not -name 'server.*' -delete
	find 2/regtest/* -not -name 'server.*' -delete
docker-build:
	docker build --tag bitcoin-testnet-box .
docker-run:
	docker run -ti bitcoin-testnet-box
