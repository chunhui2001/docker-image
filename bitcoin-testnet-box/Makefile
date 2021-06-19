BITCOIND=bitcoind
BITCOINGUI=bitcoin-qt
BITCOINCLI=bitcoin-cli
B1_FLAGS=
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=
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
	$(BITCOINCLI) $(B2) -getinfo
getinfo2:
	curl --user admin1:123 \
	--data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "getblockchaininfo", "params": []}' \
	-H 'content-type: text/plain;' http://127.0.0.1:19001/
### Sending bitcoins
sendfrom1:
	$(BITCOINCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)
sendfrom2:
	$(BITCOINCLI) $(B2) sendtoaddress $(ADDRESS) $(AMOUNT)
### 列出所有钱包
listwallets1:
	$(BITCOINCLI) $(B1) listwallets
listwallets2:
	$(BITCOINCLI) $(B2) listwallets
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
create_wallet2:
	$(BITCOINCLI) $(B2) createwallet $(WALLET_NAME)
### Generate a wallet address for the first wallet
create_address1:
	$(BITCOINCLI) $(B1) getnewaddress $(ACCOUNT)
### Generate a wallet address for the second wallet
create_address2:
	$(BITCOINCLI) $(B2) getnewaddress $(ACCOUNT)
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
