
### HBase 下载地址
http://archive.apache.org/dist/hbase/


$ start-hbase.sh OR stop-hbase.sh
$ hbase shell
 1). > list
 2). > create 'testtable1', 'cf1', 'cf2'
 3). > put 'testtable1', 'row1', 'cf1:a', 'some value here'
 4). > put 'testtable1', 'row1', 'cf1:b', 'other value here'
 5). > scan 'testtable1'
 6). > put 'testtable1', 'row1', 'cf1:a', 'the value updated'
 7). > scan 'testtable1'
 8). > scan 'testtable1', { VERSIONS ＝>3 }
10). > disable 'table_name_here' && drop 'table_name_here'
11). > create_namespace 'zh_oto_store'
12). > list_namespace 'zh_o2o_store'
13). > drop_namespace 'zh_o2o_store'
 9). > exit


### Cluster
>>> Hbase 的集群安装是建立在 Hadoop 集群环境之上的，因此需要先安装 Hadoop 集群环境
>>> 1、HBase 依赖于 HDFS 做底层的数据存储
>>> 2、HBase 依赖于 MapReduce 做数据计算
>>> 3、HBase 依赖于 ZooKeeper 做服务协调
>>> 4、HBase 源码是 java 编写的，安装需要依赖 JDK
>>> 此处我们的 hadoop 版本用的的是 2.7.5，HBase选择的版本是 1.2.6

### 集群规划
其中 Hadoop1、Hadoop2 服务器为 Master，另外 Hadoop3、Hadoop4、Hadoop5、Hadoop6 服务器为 slave。
======================================================================================================
主机名 		IP 					安装软件 							类型 		运行进程
------------------------------------------------------------------------------------------------------
Hadoop1 	192.168.197.121 	Jdk、Hadoop、Hbase 				Master 		NameNode、
																			DFSZKFailoverController、
																			HMaster
------------------------------------------------------------------------------------------------------
Hadoop2 	192.168.197.122 	Jdk、Hadoop、Hbase 				Master 		NameNode、
																			DFSZKFailoverController、
																			HMaster
------------------------------------------------------------------------------------------------------
Hadoop3 	192.168.197.123 	Jdk、Hadoop、Hbase 				slave 		HRegionServer
------------------------------------------------------------------------------------------------------
Hadoop4 	192.168.197.124 	Jdk、Hadoop、Zookeeper、Hbase 	slave 		DataNode、
																			JournalNode、QuorumPeerMain、
																			HRegionServer
------------------------------------------------------------------------------------------------------
Hadoop5 	192.168.197.125 	Jdk、Hadoop、Zookeeper、Hbase 	slave 		DataNode、
																			JournalNode、QuorumPeerMain、
																			HRegionServer
------------------------------------------------------------------------------------------------------
Hadoop6 	192.168.197.126 	Jdk、Hadoop、Zookeeper、Hbase 	slave 		DataNode、
																			JournalNode、QuorumPeerMain、
																			HRegionServer
------------------------------------------------------------------------------------------------------


### 修改 regionservers 配置文件, 指定 Hbase 数据 slave 服务器
$ vim $HBASE_HOME/conf/regionservers
Hadoop3
Hadoop4
Hadoop5
Hadoop6


### 最重要一步，要把 hadoop 的 hdfs-site.xml 和 core-site.xml 放到 hbase-1.2.6/conf 下, 用于告知 Hbase 数据库 HDFS 的相关信息
$ cd ~/apps/hadoop-2.7.5/etc/hadoop/
$ cp core-site.xml hdfs-site.xml ~/apps/hbase-1.2.6/conf/

在 master，执行 start-hbase.sh 即可全部启动
自带的管理 web ui：http://master:16010/master-status


### 同步时间
HBase 集群对于时间的同步要求的比 HDFS 严格，所以，集群启动之前千万记住要进行 时间同步，要求相差不要超过 30s
安装 ntpdate 命令，与 ntpdate us.pool.ntp.org 服务器时间进行同步，
分别在 Hadoop1、Hadoop2、Hadoop3、Hadoop4、Hadoop5、Hadoop6 执行命令：
$ rm -rf /etc/localtime
$ ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
$ ntpdate -u us.pool.ntp.org


### 启动 HBase 集群, 严格按照启动顺序进行
$ zkServer.sh start
$ start-dfs.sh 		# 由于 Hbase 不需要提交作业，因此只需要启动DFS服务即可
					  如果需要运行 MapReduce 程序则额外启动 yarn 集群

### 启动完成之后检查以下 namenode 的状态
$ hdfs haadmin -getServiceState nn1
$ hdfs haadmin -getServiceState nn2

### 启动 hbase 之前必需检查 hadoop 是否已经启动
$ $HADOOP_HOME/bin/hadoop dfsadmin -report

### 启动 HBase
$ start-hbase.sh
$  tail -f $HBASE_HOME/logs/hbase--master-71780f173a98.log 

>>> 观看启动日志可以看到：
>>> 1. 首先在命令执行节点启动 master
>>> 2. 然后分别在 hadoop02,hadoop03,hadoop04,hadoop05 启动 regionserver
>>> 3. 然后在 backup-masters 文件中配置的备节点上再启动一个 master 主进程

### 单独 Hadoop2 务器上启动 Hbase，备份 Master:
$ $HBASE_HOME/bin/hbase-daemon.sh start master



### 验证启动是否正常
>>> 1. 主节点和备用节点都启动 hmaster 进程
>>> 2. 各从节点都启动 hregionserver 进程
$ jps
4960 	HMaster
5098 	HRegionServer
$ jps
25165 	HRegionServer
$ jps
3256 	HMaster
3149 	HRegionServer

### 通过访问浏览器页面 http://node1:16010/master-status

### 验证高可用
1. 干掉 node1 上的 hbase 进程，观察备用节点是否启用, 
2. 当主节点干掉后, 备用节点将变成主节点 http://node1:16010/master-status 可以看到变化


### 常用 hbase 命令
$ $HBASE_HOME/bin/hbase shell
> status
> version

### 3、验证存储数据：
$ $HBASE_HOME/bin/hbase shell 					# 启动 hbase shell
> create 'mobile', 'sysParam', 'extendParam' 	# 创建 mobile 表，包含 sysParam、extendParam 两个列族
> put 'mobile', 'rowkey0001', 'sysParam:name', 'extendParam:张' 	# 插入数据
> put 'mobile', 'rowkey0002', 'sysParam:name', 'extendParam:陈' 	# 插入数据
> get 'mobile', 'rowkey0001' 	# 查询
> list 							# 列出所有表
> describe 'mobile' 			# 查看表结构

### 通过web页面查看详细信息：
http://node1:16010/master-status




