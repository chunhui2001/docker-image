server.xml	Mycat的配置文件，设置账号、参数等
schema.xml	Mycat对应的物理数据库和数据库表的配置
rule.xml	Mycat分片（分库分表）规则


学会数据库读写分离、分表分库——用Mycat，这一篇就够了！
https://www.cnblogs.com/fyy-hhzzj/p/9044775.html



##启动
mycat start

##停止
mycat stop

##重启
mycat restart



如果在启动时发现异常，在logs目录中查看日志。

wrapper.log 为程序启动的日志，启动时的问题看这个
mycat.log 为脚本执行时的日志，SQL脚本执行报错后的具体错误内容,查看这个文件。mycat.log是最新的错误日志，历史日志会根据时间生成目录保存。
mycat启动后，执行命令不成功，可能实际上配置有错误，导致后面的命令没有很好的执行。

Mycat带来的最大好处就是使用是完全不用修改原有代码的，在mycat通过命令启动后，你只需要将数据库连接切换到Mycat的地址就可以了。如下面就可以进行连接了：

 mysql -h192.168.0.1 -P8806 -uroot -p123456
连接成功后可以执行sql脚本了。
所以，可以直接通过sql管理工具（如：navicat、datagrip）连接，执行脚本。我一直用datagrip来进行日常简单的管理，这个很方便。

Mycat还有一个管理的连接，端口号是9906.

 mysql -h192.168.0.1 -P9906 -uroot -p123456
连接后可以根据管理命令查看Mycat的运行情况，当然，喜欢UI管理方式的人，可以安装一个Mycat-Web来进行管理，有兴趣自行搜索。

简而言之，开发中使用Mycat和直接使用Mysql机会没有差别。

