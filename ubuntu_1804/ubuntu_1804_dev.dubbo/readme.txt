https://www.jianshu.com/p/9159672e45ee

Dubbo 需要四大基本组件：Registry、Monitor、Provider、Consumer。

# Registry
1. 安装注册中心（Registry），用 ZooKeeper，安装好 ZooKeeper 之后注册中心就有了，先放着，等会用。

# Monitor
装简单监控中心：simple-monitor。网上找 dubbo-monitor-simple-2.8.4-assembly.tar.gz。
   -- 解压，找到 conf 文件夹下的 dubbo.properties 文件，下面简单介绍各个配置参数的意义：
      -- dubbo.container 			= log4j,spring,registry,jetty	# 日志系统是log4j
      -- dubbo.application.name		= simple-monitor				# Dubbo服务名称
      -- dubbo.application.owner	= coselding  					# 服务负责任
      -- dubbo.registry.address		= multicast://224.5.6.7:1234
	  -- dubbo.registry.address		= zookeeper://{ip}:{port}
	  -- dubbo.registry.address		= redis://127.0.0.1:6379
	  -- dubbo.registry.address		= dubbo://127.0.0.1:9090
	  -- dubbo.protocol.port 		= 7070 							# dubbo协议端口号，保持默认即可
	  -- dubbo.jetty.port 			= 8082 							# jetty工作端口号
	  -- dubbo.jetty.directory 		= ${user.home}/monitor 			# 这个目录会保存一些监控中心的数据，比如调用曲线图等，这里指定一个存在的空目录即可
	  -- dubbo.charts.directory 	= ${dubbo.jetty.directory}/charts 	# 监控中心报表存放的目录，同上，一般默认即可
	  -- dubbo.statistics.directory = ${user.home}/monitor/statistics 	# 监控中心数据资料目录，同上，一般默认即可
	  -- dubbo.log4j.file 			= logs/dubbo-monitor-simple.log 	# 监控中心日志文件路径
	  -- dubbo.log4j.level 			= WARN 								# 监控中心日志记录级别

将修改完配置的 dubbo-admin 的整个目录复制到 tomcat 的 webapps 目录下，重启 tomcat，说白了 dubbo-admin 就是 tomcat 的一个 webapp 的形式存在。



# dubbo admin
# https://www.cnblogs.com/J-Cooper/p/8810793.html
# https://github.com/apache/incubator-dubbo/tree/dubbo-2.6.0
$ cd dubbo-admin && mvn package -Dmaven.skip.test=true

-- 把这个 dubbo-admin-2.5.4-SNAPSHOT.war 拷贝到 tomcat 下的 webapps 目录下
-- 修改 dubbo-admin-2.5.4-SNAPSHOT/WEB-INF/dubbo.properties 里的 zookeeper 地址和管理员密码
-- 把这个dubbo-admin-2.5.4-SNAPSHOT.war拷贝到 tomcat下的webapps目录下