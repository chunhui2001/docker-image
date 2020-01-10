


server.xml	Mycat的配置文件，设置账号、参数等
schema.xml	Mycat对应的物理数据库和数据库表的配置
rule.xml	Mycat分片（分库分表）规则

### Mycat安装与使用
https://github.com/MyCATApache/Mycat-Server

### 学会数据库读写分离、分表分库——用Mycat，这一篇就够了！
https://www.cnblogs.com/fyy-hhzzj/p/9044775.html

### 最全的mycat配置教程
https://blog.csdn.net/qq_45563131/article/details/124058007

### MyCat分库分表之逻辑库、逻辑表及分片规则
https://blog.51cto.com/u_15848894/5800434

## 启动
$ mycat start

## 前台启动
$ mycat console

## 停止
$ mycat stop

## 重启
$ mycat restart

如果在启动时发现异常，在 logs 目录中查看日志。
wrapper.log 为程序启动的日志，启动时的问题看这个
mycat.log 为脚本执行时的日志，SQL脚本执行报错后的具体错误内容,查看这个文件。mycat.log 是最新的错误日志，历史日志会根据时间生成目录保存。
mycat 启动后，执行命令不成功，可能实际上配置有错误，导致后面的命令没有很好的执行。

### Mycat 带来的最大好处就是使用是完全不用修改原有代码的，在mycat通过命令启动后，你只需要将数据库连接切换到Mycat的地址就可以了。如下面就可以进行连接了：
$ mysql -h192.168.0.1 -P8806 -uroot -p123456
连接成功后可以执行 sql 脚本了。所以，可以直接通过sql管理工具（如：navicat、datagrip）连接，执行脚本。我一直用datagrip来进行日常简单的管理，这个很方便。

### Mycat 还有一个管理的连接，端口号是9906.
$ mysql -h192.168.0.1 -P9906 -uroot -p123456
连接后可以根据管理命令查看 Mycat 的运行情况，当然，喜欢UI管理方式的人，可以安装一个 Mycat-Web 来进行管理，有兴趣自行搜索。

简而言之，开发中使用 Mycat 和直接使用 Mysql 几乎没有差别。


bin	mycat命令，启动、重启、停止等
catlet	catlet为Mycat的一个扩展功能
conf	Mycat 配置信息,重点关注
lib	Mycat引用的jar包，Mycat是java开发的
logs	日志文件，包括Mycat启动的日志和运行的日志。

server.xml	Mycat的配置文件，设置账号、参数等
schema.xml	Mycat对应的物理数据库和数据库表的配置
rule.xml	Mycat分片（分库分表）规则

Mycat	192.168.0.2	mycat服务器，连接数据库时，连接此服务器
database1	192.168.0.3	物理数据库1，真正存储数据的数据库
database2	192.168.0.4	物理数据库2，真正存储数据的数据库

3.4.启动mycat
①进入mycat/bin目录
②两种启动方式: 前台启动./mycat console 后台启动 ./mycat start
③输入语句启动连接 mycat:mysql -umycat -p -P 8066 -h 127.0.0.1 , 密码为你 server.xml 配置的密码
④验证是否正常启动
show database;就能看到创建的配置文件创建的这个TESTDB库

