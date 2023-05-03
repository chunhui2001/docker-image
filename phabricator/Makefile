
### 当前 Makefile 文件物理路径
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

upgrade:
	/var/phabricator/bin/config set mysql.host mysql_8.0
	/var/phabricator/bin/config set mysql.user keesh
	/var/phabricator/bin/config set mysql.pass Cc
	/var/phabricator/bin/storage upgrade --user keesh --password Cc --force

start:
	#cp -rf /var/arcanist/* /var/phabricator/
	a2ensite phabricator.conf && a2enmod rewrite
	apache2ctl -DFOREGROUND -e debug

set-config:
