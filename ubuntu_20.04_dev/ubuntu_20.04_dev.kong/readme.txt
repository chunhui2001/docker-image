

# ubuntu部署kong以及安装Kong Dashboard
# https://blog.csdn.net/tangsl388/article/details/82851505

### Kong配置参考
# https://www.cnblogs.com/duanxz/p/10371088.html

# cp /etc/kong/kong.conf.default /etc/kong/kong.conf
# kong start --conf /etc/kong/kong.conf
# 使用check命令验证设置的完整性
# kong check /etc/kong/kong.conf

# 在调试模式下使用CLI，以了解有关KONG在启动时加载了哪些配置的更多信息
# kong start -c <kong.conf> --vv

### 环境变量
# log_level = debug # in kong.conf
# KONG_LOG_LEVEL=error

# 自定义 Nginx 配置 & 嵌入式的KONG配置
# Kong 可以使用 --nginx-conf 参数执行启动、重新加载、重新启动的操作，该参数必须指定Nginx配置模板。
# 此模板使用 Penlight 引擎，它使用指定的 Kong 配置进行编译，并在启动 Nginx 之前，将其转储到您的 Kong 前缀目录中。

# 默认的模板文件为：https://github.com/Mashape/kong/tree/master/kong/templates。它分为两个Nginx配置文件：nginx.lua和nginx_kong.lua。nginx_kong.lua包含了KONG启动时的所有配置，nginx.lua则包含了nginx_kong.lua在内的所有配置。在启动Nginx之前，请将这两个文件复制到kong的根目录下，类似与这样：

/usr/local/kong
├── nginx-kong.conf
├── nginx.conf

### 您可以使用以下命令来启动Kong：
$ kong start -c kong.conf --nginx-conf custom_nginx.template

# 在OpenResty中嵌入Kong

### Kong主要有三个组件：
Kong Server ：基于nginx的服务器，用来接收API请求。
Cassandra/PostgreSQL ：用来存储操作数据。
Kong dashboard：官方推荐UI管理工具，当然，也可以使用 restfull 方式 管理admin api

> create database "kong_db"; GRANT ALL PRIVILEGES ON DATABASE "kong_db" to kong_user;

### 初始化数据表
$ docker run --rm \
     --network=br0 \
     -e "KONG_DATABASE=postgres" \
     -e "KONG_PG_HOST=postgres_9.6" \
     -e "KONG_PG_PASSWORD=kong" \
     kong:2.0.4-centos kong migrations bootstrap


### 创建一个service
属性							描述
name（必填）					服务名称.
tags（可选）					可选地向服务添加标记
url（可选）					将协议、主机、端口和路径立即设置成简短的属性。这个属性是只写的（管理API从来不“返回”url）				
protocol（必填）				该协议用于与upstream通信。它可以是http（默认）				或https。
host（必填）					upstream服务器的主机。
port（必填）					upstream服务器端口。默认为80
path（可选）					在向upstream服务器请求中使用的路径。默认为空。
retries（可选）				在代理失败的情况下执行的重试次数。默认值是5。
connect_timeout（可选）		建立到upstream服务器的连接的超时时间。默认为60000。
write_timeout（可选）			将请求发送到upstream服务器的两个连续写操作之间的超时时间。默认为60000。
read_timeout（可选）			将请求发送到upstream服务器的两个连续读取操作之间的超时时间。默认为60000。


### 创建一个route
属性							描述
name(可选)					定义名称
tags(可选)					向路由添加标记
protocols(可选)				这条路线应该允许的协议列表。默认情况下，它是“http”、“https”，这意味着路由接受这两种方式。当设置为“HTTPS”时，
							HTTP请求会被请求升级到HTTPS。通过表单编码，符号是协议=http&协议=https。使用JSON，使用数组。
methods(半可选)				** 与此路由相匹配的HTTP方法列表。例如: ["GET", "POST"].至少有一个主机、路径或方法必须被设置。用表单编码参数是methods[]=GET&methods[]=OPTIONS。使用JSON，使用数组。
hosts(半可选)					** 与此路径匹配的域名列表。例如:example.com. 至少有一个主机、路径或方法必须被设置。用表单编码参数是 hosts[]=foo.com&hosts[]=bar.com。使用JSON，使用数组。
paths(半可选)					** 与此路径相匹配的路径列表。例如: /my-path.至少有一个主机、路径或方法必须被设置。用表单编码参数是 paths[]=/foo&paths[]=/bar. 使用JSON，使用数组。
Regex priority(可选)			当多个路由同时使用正则表达式匹配某个给定请求时，用来选择哪个路由解析该请求的数字。当两个路由匹配路径并且具有相同的regex_优先级时，将使用较旧的路由（最低创建位置）。
							注意，非regex路由的优先级不同（较长的非regex路由在较短的路由之前匹配）。默认为0。
strip_path(可选)				当通过其中一条路径匹配路由时，从上游upstream请求URL中去掉匹配前缀。默认值为true。
preserve_host(可选)			当通过一个主机域名匹配一条路由时，在upstream请求头中使用请求主机头。默认设置为false，upstream主机头将是服务主机的主机头。

### 验证API 代理
# Kong API 需要通过 Routes 规则中配置的 hosts or path 对请求进行API调度控制。
# 由于我们Routes规则中配置的hosts是虚拟域名，因此，我们需要在本地及服务器hosts列表中添加dns解析，这样在浏览器才可以携带host请求信息去正常访问Kong API。
>> 10.122.45.97 test.example.com
>>> http://test.example.com:8000/request


######
1. Add Service (创建service)
$ curl -i -X POST --url http://localhost:8001/services/ \
				--data 'name=sampleapi' \
				--data 'url=http://sample.com/v1/accounts'

2. Add Route (创建router)
$ curl -i -X POST --url http://localhost:8001/services/sampleapi/routes \
				--data 'hosts[]=sample.com' \
				--data 'methods[]=POST' \
				--data 'name=my-route'

3. Forward request through Kong (验证)
$ curl -i -X POST --url http://localhost:8000/sampleapi/v1/accounts 
$ curl -i -X POST --url http://localhost:8000/v1/accounts
>>>> { "message": "no Route matched with those values" }


$ curl -i -X POST --url http://localhost:8001/services/ \
				--data 'name=mynginx' \
				--data 'url=http://mynginx.com'

$ curl -i -X POST --url http://localhost:8001/services/sampleapi/routes \
				--data 'hosts[]=172.16.197.61' \
				--data 'methods[]=GET' \ \
				--data 'path=GET'
				--data 'name=mynginx'


