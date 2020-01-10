
# 建立 topic
$ sh /usr/local/rocketmq/bin/mqadmin updateTopic -n localhost:9876 -b localhost:10911 -t topic_gofun_iov

# 删除 topic
$ sh /usr/local/rocketmq/bin/mqadmin deleteTopic –n localhost:9876 –c DefaultCluster –t topic_gofun_iov

# 查看所有消费组 group:
$ sh /usr/local/rocketmq/bin/mqadmin  consumerProgress -n localhost:9876

# 查看指定消费组下的所有 topic 数据堆积情况：
$ sh /usr/local/rocketmq/bin/mqadmin consumerProgress -n localhost:9876 -g warning-group

# 查看所有 topic :
$ sh /usr/local/rocketmq/bin/mqadmin topicList -n localhost:9876

# 查看 topic 信息列表详情统计
$ sh /usr/local/rocketmq/bin/mqadmin topicstatus -n localhost:9876 -t topic_gofun_iov

# 查询集群消息
$ sh /usr/local/rocketmq/bin/mqadmin clusterList -n localhost:9876

# 查看具体命令的使用
$ sh /usr/local/rocketmq/bin/mqadmin help 命令名称

# 发送消息


