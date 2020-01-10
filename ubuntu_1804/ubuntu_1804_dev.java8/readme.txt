#### 单个JVM下支撑100w线程数vm.max_map_count
I、环境要求：
1.64bit Linux
2.64bit JDK
3.Memory够大，512GB
4.cpu:64 processors

II、测试工具：【DieLikeADog.java】
java -server -Xmx6G -Xms6G -Xmn600M -Xss228K -XX:PermSize=50M -XX:MaxPermSize=50M -XX:+DisableExplicitGC DieLikeADog

III、检查配置：
1.ps -Lf <pid> |wc -l ==>查看某个进程中的线程数量
2.ulimit -a==>
>>>主要查看-n,-u的值
3.cat /proc/sys/vm/max_map_count
永久修改：将vm.max_map_count=2048000配置到/etc/sysctl.conf中,然后执行sysctl -p生效，重启os后也会持久。
也可以：【sysctl -w vm.max_map_count=2048000】
注意：在其他资源可用的前提下，单个JVM能开启的最大线程数是/proc/sys/vm/max_map_count的设置数的一半。
小结：如果要达到单个JVM开启100w以上的线程数，需要配置vm.max_map_count=2048000或者以上。
因为默认vm.max_map_count=65530，因此缺省配置下，单个jvm能开启的最大线程数为其一半，即3w左右，大概32k的量
实际中，可以通过命令【cat /proc/<pid>/maps |wc -l】来监控，当前进程使用到的vm映射数量。

#### macOS with Docker for Macedit
## The vm.max_map_count setting must be set within the xhyve virtual machine:
## From the command line, run:
$ screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
-- Press enter and use sysctl to configure vm.max_map_count:
>> sysctl -w vm.max_map_count=2048000
-- To exit the screen session, type Ctrl a d.

### Windows and macOS with Docker Desktopedit
## The vm.max_map_count setting must be set via docker-machine:
$ docker-machine ssh
$ sudo sysctl -w vm.max_map_count=262144

### Windows with Docker Desktop WSL 2 backendedit
## The vm.max_map_count setting must be set in the docker-desktop container:
$ wsl -d docker-desktop
> sysctl -w vm.max_map_count=262144


4.最大用户进程数：需要在两个配置文件/etc/security/limits.conf和/etc/security/limits.d/90-nproc.conf同时修改
实际上，仅对nproc参数修改90-nproc.conf即可。
//////////begin////////
max user processes              (-u) 1024
/etc/security/limits.conf
/etc/security/limits.d/90-nproc.conf
*       soft    nproc           10240
*       hard    nproc           10240
//////////end//////////
5.文件描述符：通过【ulimit -a】查看
//////////begin////// 
在/etc/security/limits.conf中添加如下配置：
*    soft nofile 1048576
*    hard nofile 1048576
//////////end////////
当soft和hard相同时，也可以用一条指令，如下：
////////begin/////
*  - nofile 1048576
////////end///////
6.调整网络参数：可以通过【grep ipv4 /etc/sysctl.conf】查看
在/etc/sysctl.conf中添加如下配置：
//////////begin/////////
fs.file-max = 1048576
net.ipv4.ip_local_port_range = 1024 65535
net.ipv4.tcp_mem = 786432 2097152 3145728
net.ipv4.tcp_rmem = 4096 4096 16777216
net.ipv4.tcp_wmem = 4096 4096 16777216
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1
//////////end////////

IV、【总结】如果只考虑单个jvm在本机能开的最大线程数，考虑1234步即可，如果考虑JVM能支撑的最大tcp连接数，如MQ中，
则也考虑thread，fd和tcp等，所以需要涉及123456步。

V、Tip:
>>>检查命令
# cat /proc/<pid>/limits
Limit                     Soft Limit           Hard Limit           Units    
Max cpu time              unlimited            unlimited            seconds  
Max file size             unlimited            unlimited            bytes    
Max data size             unlimited            unlimited            bytes    
Max stack size            209715200            209715200            bytes    
Max core file size        0                    unlimited            bytes    
Max resident set          unlimited            unlimited            bytes    
Max processes             204800               204800               processes
Max open files            1048576              1048576              files    
Max locked memory         10485760             10485760             bytes    
Max address space         unlimited            unlimited            bytes    
Max file locks            unlimited            unlimited            locks    
Max pending signals       4133863              4133863              signals  
Max msgqueue size         819200               819200               bytes    
Max nice priority         0                    0                   
Max realtime priority     0                    0                   
Max realtime timeout      unlimited            unlimited            us
>>>注意：Linux下每个进程的运行时限制结果都可以在目录/proc/<pid>下查看。
>>>参考：http://www.redhat.com/magazine/001nov04/features/vm/

VI、【归纳】
影响Java线程数量的因素===>
Java虚拟机本身：-Xms，-Xmx，-Xss；
系统限制：
/proc/sys/kernel/pid_max， ==>81920==>对应到/etc/sysctl.conf为==>kernel.pid_max=81920
/proc/sys/kernel/thread-max，==>对应到/etc/sysctl.conf为==>kernel.thread-max=8192000
max_user_process（ulimit -u）
/proc/sys/vm/max_map_count ==>对应到/etc/sysctl.conf为vm.max_map_mount=2048000
需要在/etc/sysctl.conf添加
==>kernel.pid_max=819200   
进行永久修改。
