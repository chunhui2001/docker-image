

Docker 容器开启ssh登录
创建容器时指定映射的端口
docker run -it --name centos6.8 -p 2222:22 6bdbedefc4d1

在宿主机上也是可以看到对应的端口是否被docker容器监听了
netstat -tunlp
Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name
tcp        0      0 0.0.0.0:2222                0.0.0.0:*                   LISTEN      5277/docker-proxy   


登录容器中，修改root密码，安装openssh服务

docker exec -it centos6.8 /bin/bash
[root@c51dfb838b52 ~]# passwd    #修改容器中centos系统ROOT账户的密码
[root@c51dfb838b52 ~]# yum -y install openssh*    #安装openssh服务
[root@c51dfb838b52 ~]# service sshd start


宿主机添加端口放行
iptables -A INPUT -p tcp --dport 2222 -j ACCEPT
service iptables save

修改容器 /etc/ssh/sshd_config
vi /etc/ssh/sshd_config 
PermitRootLogin no  	# 允许root用户ssh登录, 需给 root 用户加密码
UsePAM no            ## 禁用PAM

service sshd restart

$ ssh-keygen -t rsa -P "" 
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys 
$ eval `ssh-agent`
$ ssh-add ~/.ssh/id_rsa

# 指定端口号登陆
$ ssh -p2222 localhost

