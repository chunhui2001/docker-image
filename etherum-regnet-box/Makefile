### 当前 Makefile 文件物理路径
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

start:
	./scripts/start_bootnode.sh

clear:
	docker rm -f blkchain1 >/dev/null 2>&1 && rm -rf 1/blkchain1 >/dev/null 2>&1


