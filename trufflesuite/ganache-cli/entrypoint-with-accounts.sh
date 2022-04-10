
### Ganache CLI Configuration and usage
# https://docs.nethereum.com/en/latest/ethereum-and-clients/ganache-cli/

### The complete Truffle suite on Docker (Truffle + Ganache + Drizzle)
# https://liyi-zhou.medium.com/the-complete-truffle-suite-on-docker-truffle-ganache-drizzle-47ab18b1ec83

node /app/ganache-core.docker.cli.js \
	--chainId=1024879 --networkId=1024879 \
	--account="0x873c254263b17925b686f971d7724267710895f1585bb0533db8e693a2af32ff,100000000000000000000000000000000" \
	--account="0x8c0ba8fece2e596a9acfc56c6c1bf57b6892df2cf136256dfcb49f6188d67940,100000000000000000000" \
	--account="0x696c41c53f045512ba5949fc5e78e4b415c34266f88df3d11da12fb9733cdd8e,100000000000000000000" \
	--account="0xda9c77db7c5dc04fbd62119f80a935c754ac6865715be04efc7a45712a2ea6e5,100000000000000000000" \
	--account="0x32cf9ba8011d9de65ca368f4f5c3f8fd911031a95af80428a0138736c71f41f2,100000000000000000000" \
	--account="0x4356371a01c9deffb47c5e5a2c6f71242c1abe489f46f8a08caea676cd3e9666,100000000000000000000" \
	--account="0x23bdc17f50a7cccb1792c2f00211f1f180bd4cb893f5c3722807c4ac78e2701b,100000000000000000000" \
	--account="0x2e951d1781f0bf24e63999a91d4dcba9d8e110e3a11b01532347ef0bb6caa9b9,100000000000000000000" \
	--account="0x673336c77e5ad76b78574e641d057f36ee8d64593494881ebbb96f193d75c700,100000000000000000000" \
	--account="0x3b1a4f16f0d2ddf50450c4e16d7ba3510c320d56fa181407a0937d4c36088607,100000000000000000000" \
	--db=/data \
	--secure -u 0 -u 1 -u 2 -u 3 -u 4 -u 5 -u 6 -u 7 -u 8 -u 9 \
	--debug