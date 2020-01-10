
### 当前 Makefile 文件物理路径
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

### 仅在第一次安装完成后首次启动前执行
upgrade:
	/var/phabricator/bin/config set mysql.host mysql_8.0
	/var/phabricator/bin/config set mysql.user keesh
	/var/phabricator/bin/config set mysql.pass Cc
	/var/phabricator/bin/storage upgrade --user keesh --password Cc --force
	/var/phabricator/bin/config set phabricator.base-uri 'http://phabricator.mycompany.com'
	### set auth provider and then
	/var/phabricator/bin/auth lock
	### 启动phd进程池，对一些后台任务进行处理，如发送邮件，更新代码仓库
	/var/phabricator/bin/phd start --force
	### 配置代码库HTTP访问
	/var/phabricator/bin/config set diffusion.allow-http-auth true

### 启动服务(在容器内执行)
start: upgrade
	#cp -rf /var/arcanist/* /var/phabricator/
	a2ensite phabricator.conf
	apache2ctl -DFOREGROUND -e debug

### 找回账户
recover:
	/var/phabricator/bin/auth recover $(u)

### 启动容器
up:
	docker-compose -f docker-compose.yml up -d
	docker logs -f phabricator

log:
	docker exec -it phabricator tail -f /var/phabricator/webroot/$(level).log
	#docker exec -it phabricator tail -f /var/phabricator/webroot/access.log
	#docker exec -it phabricator tail -f /var/phabricator/webroot/error.log
