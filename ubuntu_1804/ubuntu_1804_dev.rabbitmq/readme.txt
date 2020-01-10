四种交换器:
-----------------------------------
direct, fanout, topic, headers 每一种都实现了不同的路由算法
direct: 如果路由键匹配的话消息就会被投递到对应的队列。
fanout: 广播消息到多个队列, 即将消息投递到所有附加在此交换器上的所有队列。
topic: 将多个不同源头的消息投递到同一个队列。


交换器、路由键、绑定和队列:
-----------------------------------
队列通过路由键绑定到交换器, 将消息发送给交换器时, 根据每种交换器的路由规则(这里的规则就是路由键), RabbitMQ将会决定将该消息投递到哪个队列。


多租户模式 vhost:
-----------------------------------
$ rabbitmqctl add_vhost [v_hostname_here]
$ rabbitmqctl list_vhosts

消息持久化:
-----------------------------------



## 权限控制
$ $sudo rabbitmqctl  set_permissions -p /vhost1  user_admin '.*' '.*' '.*'
# 该命令使用户user_admin具有/vhost1这个virtual host中所有资源的配置、写、读权限以便管理其中的资源

$ set_permissions [-p <vhostpath>] <user> <conf> <write> <read>
其中，<conf> <write> <read>的位置分别用正则表达式来匹配特定的资源，如'^(amq\.gen.*|amq\.default)$'可以匹配 server 生成的和默认的 exchange，'^$' 不匹配任何资源
需要注意的是RabbitMQ会缓存每个connection或channel的权限验证结果、因此权限发生变化后需要重连才能生效。

查看权限：
$ rabbitmqctl list_user_permissions user_admin


需求						configure	write		read
创建或删除交换机或队列		是	 	 
交换机绑定或解绑	 		目标交换机	源交换机
队列与交换机绑定或解绑	 	队列			交换机
发送消息到交换机	 		交换机	 
获取或清除消息	 	 		队列



#### 用户权限管理
--------------------------------
2.1、新建用户
可以使用命令行形式创建新的用户，也可以通过RabbitMQ的web界面创建用户。
rabbitmqctl add_user wyt wyt

2.2、配置权限
set_permissions [-p <vhostpath>] <user> <conf> <write> <read>
可以使用正则匹配。如’^$’表达式，不匹配任何资源。

exchange 和 queue 的 declare 与 delete 分别需要 exchange 和 queue 上的配置权限
exchange 的 bind 与 unbind 需要 exchange 的读写权限
queue 的 bind 与 unbind 需要 queue 写权限 exchange 的读权限 发消息 (publish) 需 exchange 的写权限
获取或清除 (get、consume、purge) 消息需 queue 的读权限
示例：我们赋予 superrd 在 “/” 下面的全部资源的配置和读写权限。
rabbitmqctl set_permissions -p / superrd ".*" ".*" ".*"
注意: ”/” 代表是 virtual host 的名称，和其他 virtual host 是平级对等关系；与 linux 系统中的根目录不同。

三、配置角色
rabbitmqctl set_user_tags [user] [role]
RabbitMQ中的角色分为如下五类：none、management、policymaker、monitoring、administrator

1、none
不能访问 management plugin

2、management
用户可以通过AMQP做的任何事外加：
列出自己可以通过AMQP登入的virtual hosts
查看自己的virtual hosts中的queues, exchanges 和 bindings
查看和关闭自己的channels 和 connections
查看有关自己的virtual hosts的“全局”的统计信息，包含其他用户在这些virtual hosts中的活动。

3、policymaker
management可以做的任何事外加：
查看、创建和删除自己的virtual hosts所属的policies和parameters

4、 monitoring
management可以做的任何事外加：
列出所有virtual hosts，包括他们不能登录的virtual hosts
查看其他用户的connections和channels
查看节点级别的数据如clustering和memory使用情况
查看真正的关于所有virtual hosts的全局的统计信息

5、administrator
policymaker和monitoring可以做的任何事外加:
创建和删除virtual hosts
查看、创建和删除users
查看创建和删除permissions
关闭其他用户的connections

如下示例将wyt设置成administrator角色。
rabbitmqctl set_user_tags wyt administrator