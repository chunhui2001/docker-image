
# 804 NodeManager
# 710 ResourceManager
# 518 SecondaryNameNode
# 327 DataNode
# 859 JobHistoryServer
# 188 NameNode


# tcp        0      0 0.0.0.0:8031                0.0.0.0:*                   LISTEN      710/java            
# tcp        0      0 0.0.0.0:8032                0.0.0.0:*                   LISTEN      710/java            
# tcp        0      0 0.0.0.0:44417               0.0.0.0:*                   LISTEN      804/java            
# tcp        0      0 0.0.0.0:8033                0.0.0.0:*                   LISTEN      710/java            
# tcp        0      0 0.0.0.0:10020               0.0.0.0:*                   LISTEN      859/java            
# tcp        0      0 0.0.0.0:50020               0.0.0.0:*                   LISTEN      327/java            
# tcp        0      0 0.0.0.0:8040                0.0.0.0:*                   LISTEN      804/java            
# tcp        0      0 127.0.0.1:9000              0.0.0.0:*                   LISTEN      188/java            
# tcp        0      0 0.0.0.0:8042                0.0.0.0:*                   LISTEN      804/java            
# tcp        0      0 0.0.0.0:50090               0.0.0.0:*                   LISTEN      518/java            
# tcp        0      0 0.0.0.0:19888               0.0.0.0:*                   LISTEN      859/java            
# tcp        0      0 0.0.0.0:10033               0.0.0.0:*                   LISTEN      859/java            
# tcp        0      0 0.0.0.0:50070               0.0.0.0:*                   LISTEN      188/java              
# tcp        0      0 0.0.0.0:8088                0.0.0.0:*                   LISTEN      710/java            
# tcp        0      0 0.0.0.0:13562               0.0.0.0:*                   LISTEN      804/java            
# tcp        0      0 0.0.0.0:50010               0.0.0.0:*                   LISTEN      327/java            
# tcp        0      0 0.0.0.0:50075               0.0.0.0:*                   LISTEN      327/java            
# tcp        0      0 0.0.0.0:8030                0.0.0.0:*                   LISTEN      710/java  


# Lets start all hadoop daemons from HadoopNameNode 
$ start-all.sh This will start 

[hadoop-user@hadoop_namenode]$ jps 
30879 JobTracker 					# # Hadoop2.X不存在这个进程
30717 NameNode 
30965 Jps 

[hadoop-user@hadoop_namenode_snn]$ jps 
2099 Jps 1679 SecondaryNameNode 

[hadoop-user@hadoop_slave1] jps 
7101 TaskTracker  					# Hadoop2.X不存在这个进程
7617 Jps 
6988 DataNode 

[hadoop-user@hadoop_slave2] jps 
7101 TaskTracker 					# Hadoop2.X不存在这个进程
7617 Jps 
6988 DataNode 

[hadoop-user@hadoop_slave3] jps 
7101 TaskTracker  					# Hadoop2.X不存在这个进程
7617 Jps 
6988 DataNode 


### 更新 masters 和 slaves 文件用以指定其它守护进程的位置：
cat master 
backup
cat salves 
hadoop1
hadoop2
hadoop3


# http://localhost:50070
# http://localhost:8088