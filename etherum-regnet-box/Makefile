### 当前 Makefile 文件物理路径
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

## 用于处理传递给 start 的命令行参数
ifeq (start, $(firstword $(MAKECMDGOALS)))
  startargs := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  $(eval $(runargs):;@true)
endif

start:
	./scripts/start_bootnode.sh $(runargs)

clear:
	docker rm -f blkchain1 >/dev/null 2>&1 && rm -rf 1/blkchain1 >/dev/null 2>&1

%:
	@: