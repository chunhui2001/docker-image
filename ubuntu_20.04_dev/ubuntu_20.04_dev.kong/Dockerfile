

# ubuntu部署kong以及安装Kong Dashboard
# https://blog.csdn.net/tangsl388/article/details/82851505

# Kong配置参考
# https://www.cnblogs.com/duanxz/p/10371088.html

# cp /etc/kong/kong.conf.default /etc/kong/kong.conf
# kong start --conf /etc/kong/kong.conf
# 使用check命令验证设置的完整性
# kong check /etc/kong/kong.conf

# 在调试模式下使用CLI，以了解有关KONG在启动时加载了哪些配置的更多信息
# kong start -c <kong.conf> --vv

# 环境变量
# log_level = debug # in kong.conf
# KONG_LOG_LEVEL=error

# 自定义 Nginx 配置 & 嵌入式的KONG配置
# Kong可以使用--nginx-conf参数执行启动、重新加载、重新启动的操作，该参数必须指定Nginx配置模板。
# 此模板使用Penlight引擎，它使用指定的Kong配置进行编译，并在启动Nginx之前，将其转储到您的Kong前缀目录中。

# 默认的模板文件为：https://github.com/Mashape/kong/tree/master/kong/templates。它分为两个Nginx配置文件：nginx.lua和nginx_kong.lua。nginx_kong.lua包含了KONG启动时的所有配置，nginx.lua则包含了nginx_kong.lua在内的所有配置。在启动Nginx之前，请将这两个文件复制到kong的根目录下，类似与这样：

/usr/local/kong
├── nginx-kong.conf
├── nginx.conf

# 您可以使用以下命令来启动Kong：
$ kong start -c kong.conf --nginx-conf custom_nginx.template

# 在OpenResty中嵌入Kong

### Kong主要有三个组件：
Kong Server ：基于nginx的服务器，用来接收API请求。
Cassandra/PostgreSQL ：用来存储操作数据。
Kong dashboard：官方推荐UI管理工具，当然，也可以使用 restfull 方式 管理admin api

> create database "kong_db"; GRANT ALL PRIVILEGES ON DATABASE "kong_db" to kong_user;

# 初始化数据表
$ docker run --rm \
     --network=br0 \
     -e "KONG_DATABASE=postgres" \
     -e "KONG_PG_HOST=postgres_9.6" \
     -e "KONG_PG_PASSWORD=kong" \
     kong:2.0.4-centos kong migrations bootstrap

# 测试是否工作正常
# curl http://127.0.0.1:8001

# 创建一个service
$ curl -i -X POST --url http://localhost:8001/services/ --data 'name=testApi' --data 'url=http://localhost:5055'

# 查看所有 service
# http://127.0.0.1:8001/services



