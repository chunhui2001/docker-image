### Pinpoint 是什么？
	Pinpoint 是一款全链路分析工具，提供了无侵入式的调用链监控、方法执行详情查看、应用状态信息监控等功能。
   基于 GoogleDapper 论文进行的实现，与另一款开源的全链路分析工具 Zipkin 类似，但相比 Zipkin 提供了无侵入式、代码维度的监控等更多的特性。 
	它是用 Java 编写的，用于大规模分布式系统监控。它对性能的影响最小（只增加约3％资源利用率），安装 agent 是无侵入式的，
	只需要在被测试的 Tomcat 中加上3句话，打下探针，就可以监控整套程序了. 

### Pinpoint 支持的功能比较丰富，可以支持如下几种功能：
---------------------------------------------------
-- 服务拓扑图：
   对整个系统中应用的调用关系进行了可视化的展示，单击某个服务节点，可以显示该节点的详细信息，比如当前节点状态、请求数量等
-- 实时活跃线程图：
   监控应用内活跃线程的执行情况，对应用的线程执行性能可以有比较直观的了解
-- 请求响应散点图：
   以时间维度进行请求计数和响应时间的展示，拖过拖动图表可以选择对应的请求查看执行的详细情况
-- 请求调用栈查看：
   对分布式环境中每个请求提供了代码维度的可见性，可以在页面中查看请求针对到代码维度的执行详情，帮助查找请求的瓶颈和故障原因。
-- 应用状态、机器状态检查：
   通过这个功能可以查看相关应用程序的其他的一些详细信息，比如CPU使用情况，内存状态、垃圾收集状态，TPS和JVM信息等参数。

### 依赖环境
JDK：1.8
Pinpoint：1.7.3
Tomcat：7.0.59

### 架构组成
	Pinpoint 主要由 3 个组件外加 Hbase 数据库组成，三个组件分别为: Agent、Collector 和 Web UI。
---------------------------------------------------
-- Agent 组件：
   是和应用一起启动的和应用共享 JVM, 定时发送数据给 Collector
   用于收集应用端监控数据, 无侵入式. 只需要在启动命令中加入部分参数即可
-- Collector 组件：
   数据收集模块, 接收 Agent 发送过来的监控数据, 并存储到 HBase
-- WebUI：
   监控展示模块, 从hbase中读取数据并展示给用户, 展示系统调用关系、调用详情、应用状态等, 并支持报警等功能

### 搭建环境
机器										      安装							   功能
192.168.1.180(8080，9994，9995，9996)		pinpoint+hbase 				pinpointweb 面板、控制器以及 hbase 数据库
192.168.1.190 							      pinpoint-agent+分布式项目		采集分布式项目数据，发送给 collector

### 工具说明   
Pinpoint-Web 						   # 将收集到的数据显示成WEB网页形式 
Pinpoint-Collector 					# 收集各种性能数据 
Pinpoint-Agent 						# 和自己运行的应用关联起来的探针 
HBase Storage 						   # 收集到的数据存到 HBase 中 
hbase_scripts 						   # Pinpoint 初始化数据库 
jdk-1.8 							      # Java 运行环境 
apache-tomcat-8.0 					# Tomcat 运行容器



### 安装 pinpoint-collector
上传 -- $ pinpoint-collector-1.7.3.war 到 tomcat/webapps 目录
解压 -- $ unzip pinpoint-collector-1.7.3.war -d pinpoint-collector

### 配置 pinpoint-collector
1. Pinpoint Collector 有 2 个配置文件: pinpoint-collector.properties 和 hbase.properties
   这些配置文件在 war 文件下的 WEB-INF/classes 目录
2. pinpoint-collector.properties： 包含 colletor 的配置，在配置 pinpoint agent 时需要与之对应: 
>> collector.receiver.base.port        = 9994         （agent 中是 profiler.collector.tcp.port - 默认: 9994）
>> collector.receiver.stat.udp.port    = 9995         （agent 中是 profiler.collector.stat.port - 默认: 9995）
>> collector.receiver.span.udp.port    = 9996         （agent 中是 profiler.collector.span.port - 默认: 9996）
>> pinpoint collector 1.5.x 版本和较新的 1.7.x 版本的 pinpoint-collector.properties 配置文件有差异
>> cluster.zookeeper.address           = zk1,zk2,zk3  （默认: localhost，修改为 hbase 相关的 zookeeper 的 IP 地址）
3. hbase.properties: 包含连接到 HBase 的配置
>> hbase.client.host （默认: localhost，修改为 hbase 相关的 zookeeper 的 IP 地址）
>> hbase.client.port （默认: 2181）



### 安装 Pinpoint Web
上传 -- $ pinpoint-web-1.7.3.war 到 tomcat/webapps 目录 (pinpoint-web 应用需要部署为 tomcat 的 ROOT 应用)
安装 -- $ cd tomcat/webapps && rm -fr ROOT && unzip pinpoint-web-1.7.3.war -d ROOT

### 配置 Pinpoint Web
1. Pinpoint web 相关的配置文件：pinpoint-web.properties 和 hbase.properties
   这些文件在 WEB-INF/classes 目录下
2. pinpoint-web.properties:
>> cluster.zookeeper.address (默认: localhost，修改为 hbase 相关的 zookeeper 的 IP 地址)
3. hbase.properties: 包含连接到HBase的配置
>> hbase.client.host (默认: localhost，修改为 hbase 相关的 zookeeper 的IP地址)
>> hbase.client.port (默认: 2181)

### 删除 Application
>> applicaiton/admin/removeApplicationName.pinpoint?applicationName=XXXXXXXXX&password=admin

### 安装 Pinpoint Agent
上传 -- $ pinpoint-agent-1.7.3.tar.gz 到安装目录，如 /home/my_java_app.jar
解压 -- $ mkdir pinpoint-agent && tar zxvf pinpoint-agent-1.7.3.tar.gz -C pinpoint-agent

### Pinpoint Agent 目录层次结构
>>>>> |-- boot
>>>>> | |-- pinpoint-bootstrap-core-$VERSION.jar
>>>>> |-- lib
>>>>> | |-- pinpoint-profiler-$VERSION.jar
>>>>> | |-- pinpoint-profiler-optional-$VERSION.jar
>>>>> | |-- pinpoint-rpc-$VERSION.jar
>>>>> | |-- pinpoint-thrift-$VERSION.jar
>>>>> | |-- ...
>>>>> |-- pinpoint-bootstrap-$VERSION.jar
>>>>> |-- pinpoint.config（Agent配置文件）

### 配置 pinpoint.config
在 pinpoint.config 中有很多 Pinpoint Agent 的配置选项, 
而最重要的必须检查的配置选项是 collector ip address 和 TCP/UDP 端口, Agent 需要这些值来创建到 collector 的连接并正确工作
在 pinpoint.config 中相应的设置这些值: 
>>>>> profiler.collector.ip         （pinpoint collector ip，默认: 127.0.0.1）
>>>>> profiler.collector.tcp.port   （collector中是 collector.receiver.base.port - 默认: 9994）
>>>>> profiler.collector.stat.port  （collector中是 collector.receiver.stat.udp.port - 默认: 9995）
>>>>> profiler.collector.span.port  （collector中是 collector.receiver.span.udp.port - 默认: 9996）
>>>>> profiler.sampling.rate=1      (采样设置 20:5%, 1:100%, 10:10%, 50: %20)

### Pinpoint Agent -javaagent JVM 参数
为了让 agent 生效，在运行应用时需要设置 -javaagent JVM 参数为 $AGENT_PATH/pinpointbootstrap-$VERSION.jar
例如: 
-javaagent:$AGENT_PATH/pinpoint-bootstrap-$VERSION.jar

### Pinpoint Agent 命令行参数
Pinpoint Agent 需要两个命令行参数来在分布式系统中标记自身
>>>>> -Dpinpoint.agentId=$AGENT_ID                    # 唯一标记 agent 运行所在的应用 (最多24个字符)（如，loan-33）
>>>>> -Dpinpoint.applicationName=$APPLICATION_NAME    # 该名称必须小写(最多24个字符), 将许多的同样的应用实例分组为单一服务（如，loan）

### Tomcat 集成 Pinpoint Agent 示例
>>>>> JAVA_OPTS="$JAVA_OPTS -javaagent:/home/jyapp/pinpoint-agent/pinpoint-bootstrap-1.7.3.jar"
>>>>> JAVA_OPTS="$JAVA_OPTS -Dpinpoint.agentId=$AGENT_ID"
>>>>> JAVA_OPTS="$JAVA_OPTS -Dpinpoint.applicationName=$APPLICATION_NAME"
>>>>> 注意：
>>>>> $AGENT_ID - 需改为应用的唯一标记，如 loan-33，代表 loan 33 服务器
>>>>> $APPLICATION_NAME - 需改为应用名，如 loan，代表贷款应用





### HBase 脚本介绍
https://github.com/naver/pinpoint.git
https://github.com/naver/pinpoint/blob/master/hbase/scripts/hbase-create.hbase
https://github.com/naver/pinpoint/blob/master/hbase/scripts/hbase-drop.hbase

>>>>> hbase-create.hbase 					   # 创建 pinpoint 必须的表。
>>>>> hbase-create-snappy.hbase           # create tables necessary for Pinpoint using snappy compression (requires snappy)
>>>>> hbase-drop.hbase 					      # 删除 pinpoint 必须的所有表
>>>>> hbase-flush-table.hbase 			   # 刷新所有表
>>>>> hbase-major-compact-htable.hbase	   # 压缩主要的所有表

### 初始化 Hbase 的 pinpoint 库：
./hbase shell your_pinpoint_hbase_script_here/hbase_scripts/hbase-create.hbase
          
>>>>> AgentEvent    
>>>>> AgentInfo 
>>>>> AgentLifeCycle 
>>>>> AgentStatV2 
>>>>> ApiMetaData   
>>>>> ApplicationIndex  
>>>>> ApplicationMapStatisticsCallee_Ver2 
>>>>> ApplicationMapStatisticsCaller_Ver2  
>>>>> ApplicationMapStatisticsSelf_Ver2    
>>>>> ApplicationStatAggre    
>>>>> ApplicationTraceIndex 
>>>>> HostApplicationMap_Ver2    
>>>>> SqlMetaData_Ver2  
>>>>> StringMetaData        
>>>>> TraceV2               

### 提示 HBase 表已经存在, 但是在 HBase shell 中 list 为空
>>> 1、通过     /hbase zkcli 命令进入 zookeeper client 模式
>>> 2、输入 ls  /hbase/table 命令看到 zombie table
>>> 3、使用 rmr /hbase/table/TABLE_NAME 命令删除 zombie table
>>> 4、重启 Hbase






