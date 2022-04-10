
### 显示所有已安装的组件
$ npm list -g --depth=0

### 安装 truffle
$ npm install -g truffle

### 编译
$ truffle compile

### 部署
$ truffle migrate
OR
$ truffle migrate --reset
OR 
$ truffle migrate --network=development
OR 
$ truffle migrate --reset --network=development --config=MyERC20/truffle-config-docker.js

### flattener
truffle-flattener contracts/MyERC20.sol | \
	awk '/SPDX-License-Identifier/&&c++>0 {next} 1' | \
	awk '!/\/\/ File/' | \
	awk '/pragma/&&c++>0 {next} 1' | uniq > contracts_fat/MyERC20.fat.sol  
