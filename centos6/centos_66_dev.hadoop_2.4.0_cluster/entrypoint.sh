#!/bin/bash

# start-all.sh

# $ sbin/hadoop-daemon.sh start namenode 
# $ sbin/hadoop-daemon.sh start datanode 
# $ sbin/yarn-daemon.sh start resourcemanager 
# $ sbin/yarn-daemon.sh start nodemanager 
# $ sbin/mr-jobhistory-daemon.sh start historyserver 

#if [ ! -d "/usr/local/hadoop/data" ]; then
#  /usr/local/hadoop/bin/hadoop namenode -format
#fi

chmod 400 /root/.ssh/id_rsa

# 启动 sshd
service sshd start

# 启动 Hadoop
/usr/local/hadoop/sbin/start-dfs.sh 
/usr/local/hadoop/sbin/start-yarn.sh 
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver 

# 启动 HBase
/usr/local/hbase/bin/start-hbase.sh 

# /usr/local/hadoop-2.4.0/logs/hadoop-root-namenode-081b983551df.log
# /usr/local/hadoop-2.4.0/logs/hadoop-root-datanode-081b983551df.log
# /usr/local/hadoop-2.4.0/logs/hadoop-root-secondarynamenode-081b983551df.log
# /usr/local/hadoop-2.4.0/logs/yarn--resourcemanager-081b983551df.log
# /usr/local/hadoop-2.4.0/logs/yarn-root-nodemanager-081b983551df.log
# /usr/local/hadoop/logs/mapred--historyserver-081b983551df.log


while true; do 
	echo 1 >/dev/null 2>/dev/null; 
	sleep 1; 
done




