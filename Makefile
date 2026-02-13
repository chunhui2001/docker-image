
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

br0:
	@$(ROOT_DIR)/dip.sh