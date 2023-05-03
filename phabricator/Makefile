
### 当前 Makefile 文件物理路径
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

upgrade:
	/var/www/bin/storage upgrade

start:
	#cp -rf /var/arcanist/* /var/phabricator/
	a2ensite phabricator.conf && a2enmod rewrite
	apache2ctl -DFOREGROUND -e debug