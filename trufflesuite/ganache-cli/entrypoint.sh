
### Ganache CLI Configuration and usage
# https://docs.nethereum.com/en/latest/ethereum-and-clients/ganache-cli/

### The complete Truffle suite on Docker (Truffle + Ganache + Drizzle)
# https://liyi-zhou.medium.com/the-complete-truffle-suite-on-docker-truffle-ganache-drizzle-47ab18b1ec83

node /app/ganache-core.docker.cli.js \
	--chainId=1024879 \
	--account="0x873c254263b17925b686f971d7724267710895f1585bb0533db8e693a2af32ff,100000000000000000000" \
	--account="0x8c0ba8fece2e596a9acfc56c6c1bf57b6892df2cf136256dfcb49f6188d67940,100000000000000000000000000000000" \
	--db=/data \
	--secure -u 0 -u 1 \
	--debug