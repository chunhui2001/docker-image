Flannel 是 CoreOS 团队针对 Kubernetes 设计的一个网络规划服务, 简单来说, 它的功能是让集群中的不同节点主机创建的 Docker 容器都具有全集群唯一的虚拟IP地址。但在默认的 Docker 配置中, 
每个节点上的 Docker 服务会分别负责所在节点容器的IP分配。这样导致的一个问题是, 不同节点上容器可能获得相同的内外IP地址。并使这些容器之间能够之间通过IP地址相互找到, 也就是相互ping通。
 
Flannel 的设计目的就是为集群中的所有节点重新规划 IP 地址的使用规则，从而使得不同节点上的容器能够获得"同属一个内网"且"不重复的"IP地址，并让属于不同节点上的容器能够直接通过内网IP通信。
 
Flannel 实质上是一种"覆盖网络(overlay network)", 即表示运行在一个网上的网（应用层网络）, 并不依靠ip地址来传递消息, 而是采用一种映射机制, 把ip地址和identifiers做映射来资源定位。也就
是将TCP数据包装在另一种网络包里面进行路由转发和通信, 目前已经支持UDP、VxLAN、AWS VPC和GCE路由等数据转发方式。
 
原理是每个主机配置一个ip段和子网个数。例如，可以配置一个覆盖网络使用 10.100.0.0/16段，每个主机/24个子网。
因此主机a可以接受10.100.5.0/24，主机B可以接受10.100.18.0/24的包。flannel使用etcd来维护分配的子网到实际的ip地址之间的映射。
对于数据路径，flannel 使用udp来封装ip数据报，转发到远程主机。
选择UDP作为转发协议是因为他能穿透防火墙。
例如，AWS Classic无法转发IPoIP or GRE 网络包，是因为它的安全组仅仅支持TCP/UDP/ICMP。
 
flannel 使用etcd存储配置数据和子网分配信息。flannel 启动之后，后台进程首先检索配置和正在使用的子网列表，然后选择一个可用的子网，然后尝试去注册它。
etcd也存储这个每个主机对应的ip。flannel 使用etcd的watch机制监视/coreos.com/network/subnets下面所有元素的变化信息，并且根据他来维护一个路由表。为了提高性能，flannel优化了Universal TAP/TUN设备，对TUN和UDP之间的ip分片做了代理。

https://s1.51cto.com/images/20180206/1517896829896388.png
1）数据从源容器中发出后，经由所在主机的docker0虚拟网卡转发到flannel0虚拟网卡，这是个P2P的虚拟网卡，flanneld服务监听在网卡的另外一端。
2）Flannel通过Etcd服务维护了一张节点间的路由表，在稍后的配置部分我们会介绍其中的内容。
3）源主机的flanneld服务将原本的数据内容UDP封装后根据自己的路由表投递给目的节点的flanneld服务，数据到达以后被解包，然后直接进入目的节点的flannel0虚拟网卡，
然后被转发到目的主机的docker0虚拟网卡，最后就像本机容器通信一下的有docker0路由到达目标容器。
 
这样整个数据包的传递就完成了，这里需要解释三个问题：
1）UDP封装是怎么回事？
在UDP的数据内容部分其实是另一个ICMP（也就是ping命令）的数据包。原始数据是在起始节点的Flannel服务上进行UDP封装的，投递到目的节点后就被另一端的Flannel服务
还原成了原始的数据包，两边的Docker服务都感觉不到这个过程的存在。
 
2）为什么每个节点上的Docker会使用不同的IP地址段？
这个事情看起来很诡异，但真相十分简单。其实只是单纯的因为Flannel通过Etcd分配了每个节点可用的IP地址段后，偷偷的修改了Docker的启动参数。
在运行了Flannel服务的节点上可以查看到Docker服务进程运行参数（ps aux|grep docker|grep "bip"），例如“--bip=182.48.25.1/24”这个参数，它限制了所在节
点容器获得的IP范围。这个IP范围是由Flannel自动分配的，由Flannel通过保存在Etcd服务中的记录确保它们不会重复。
 
3）为什么在发送节点上的数据会从docker0路由到flannel0虚拟网卡，在目的节点会从flannel0路由到docker0虚拟网卡？
例如现在有一个数据包要从IP为172.17.18.2的容器发到IP为172.17.46.2的容器。根据数据发送节点的路由表，它只与172.17.0.0/16匹配这条记录匹配，因此数据从docker0
出来以后就被投递到了flannel0。同理在目标节点，由于投递的地址是一个容器，因此目的地址一定会落在docker0对于的172.17.46.0/24这个记录上，自然的被投递到了docker0网卡。




### Flannel 环境部署记录
----------------------------
10.10.172.201     部署 etcd，flannel，docker      	主机名：node1   主控端（通过etcd）
10.10.172.202     部署 flannel，docker            	主机名：node2   被控端

### host 
----------------------------
10.10.172.201    node1
10.10.172.201    etcd.server
10.10.172.202    node2
关闭防火墙，如果开启防火墙，则最好打开 2379 和 4001 端口

### 安装 etcd, k8s 运行依赖 etcd，需要先部署 etcd
----------------------------
$ apt-get install -y etcd

### 编辑配置文件 /etc/etcd/etcd.conf
----------------------------
#[member]
ETCD_NAME=master                                            # 节点名称
ETCD_DATA_DIR="/var/lib/etcd/default.etcd"                  # 数据存放位置
#ETCD_WAL_DIR=""
#ETCD_SNAPSHOT_COUNT="10000"
#ETCD_HEARTBEAT_INTERVAL="100"
#ETCD_ELECTION_TIMEOUT="1000"
#ETCD_LISTEN_PEER_URLS="http://0.0.0.0:2380"
ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379,http://0.0.0.0:4001"             # 监听客户端地址
#ETCD_MAX_SNAPSHOTS="5"
#ETCD_MAX_WALS="5"
#ETCD_CORS=""
#
#[cluster]
#ETCD_INITIAL_ADVERTISE_PEER_URLS="http://localhost:2380"
# if you use different ETCD_NAME (e.g. test), set ETCD_INITIAL_CLUSTER value for this name, i.e. "test=http://..."
#ETCD_INITIAL_CLUSTER="default=http://localhost:2380"
#ETCD_INITIAL_CLUSTER_STATE="new"
#ETCD_INITIAL_CLUSTER_TOKEN="etcd-cluster"
ETCD_ADVERTISE_CLIENT_URLS="http://etcd.server:2379,http://etcd.server:4001"           # 通知客户端地址
#ETCD_DISCOVERY=""
#ETCD_DISCOVERY_SRV=""
#ETCD_DISCOVERY_FALLBACK="proxy"
#ETCD_DISCOVERY_PROXY=""

### 启动 etcd 并验证状态
----------------------------
$ systemctl start etcd
$ systemctl enable etcd
$ ps -ef|grep etcd
$ lsof -i:2379
$ etcdctl set testdir/testkey0 0
$ etcdctl get testdir/testkey0
$ etcdctl -C http://etcd.server:4001 cluster-health
$ etcdctl -C http://etcd.server:2379 cluster-health

### 安装覆盖网络 Flannel
----------------------------
$ apt-get install flannel -y

### 配置 Flannel, /etc/sysconfig/flanneld
----------------------------
>>>>>> # Flanneld configuration options
>>>>>>    
>>>>>> # etcd url location.  Point this to the server where etcd runs
>>>>>> FLANNEL_ETCD_ENDPOINTS="http://etcd:2379"
>>>>>>    
>>>>>> # etcd config key.  This is the configuration key that flannel queries
>>>>>> # For address range assignment
>>>>>> FLANNEL_ETCD_PREFIX="/atomic.io/network"
>>>>>>    
>>>>>> # Any additional options that you want to pass
>>>>>> #FLANNEL_OPTIONS=""
>>>>>>   
>>>>>> 配置 etcd 中关于 flannel 的 key（这个只在安装了 etcd 的机器上操作）
>>>>>> Flannel 使用 Etcd 进行配置，来保证多个 Flannel 实例之间的配置一致性，所以需要在 etcd 上进行如下配置
$ cat <<EOF | sudo tee /run/flannel/flannel-network-config.json
{
    "Network": "10.0.0.0/8",
    "SubnetLen": 20,
    "SubnetMin": "10.10.0.0",
    "SubnetMax": "10.99.0.0",
    "Backend": {
        "Type": "vxlan",
        "VNI": 100,
        "Port": 8472
    }
}
EOF
>>>>>> 类型属性 "Type": "vxlan" 要求宿主操作系统内核支持 VXLAN, 执行下面的命令查看当前系统是否支持 VXLAN:
       $ cat /boot/config-`uname -r` | grep CONFIG_VXLAN
       > CONFIG_VXLAN=m
### 写入 etcd ('/atomic.io/network/config' 这个 key 与上文 /etc/sysconfig/flannel 中的配置项 FLANNEL_ETCD_PREFIX 是相对应的)
$ etcdctl set /atomic.io/network/config < /run/flannel/flannel-network-config.json
### 查看写入后的内容
$ curl -XGET http://127.0.0.1:2379/v2/keys/atomic.io/network/config
>>>>>> -- 温馨提示：上面 flannel 设置的 ip 网段可以任意设定，随便设定一个网段都可以。
       -- 容器的 ip 就是根据这个网段进行自动分配的，ip 分配后，容器一般是可以对外联网的（网桥模式，只要宿主机能上网就可以）.
>>>>>> confirm the vxlan tunnel
       $ sudo tcpdump -i enp0s8 -n not port 2380

### 使用 restapi 写入etcd
>>>>>> $ curl -XPUT http://127.0.0.1:2379/v2/keys/atomic.io/network/config -d value="{\"Network\": \"10.10.0.0/16\"}"


### 配置 Flannel, /etc/sysconfig/flanneld
----------------------------
# Flanneld configuration options
   
# etcd url location.  Point this to the server where etcd runs
FLANNEL_ETCD_ENDPOINTS="http://etcd:2379"
   
# etcd config key.  This is the configuration key that flannel queries
# For address range assignment
FLANNEL_ETCD_PREFIX="/atomic.io/network"
   
# Any additional options that you want to pass
FLANNEL_OPTIONS="--iface=eth1"

### 启动 Flannel
----------------------------
$ systemctl enable flanneld.service
$ systemctl start flanneld.service
$ ps -ef|grep flannel
-- 启动 Flannel 后，一定要记得重启 docker，这样 Flannel 配置分配的 ip 才能生效，即 docker0 虚拟网卡的 ip 会变成上面 flannel 设定的 ip 段

$ systemctl restart docker
$ systemctl enable docker

/usr/bin/flanneld \
        -etcd-endpoints=http://etcd1.server.com:2379,http://etcd2.server.com:2379,http://etcd3.server.com:2379 \
        -etcd-prefix=/atomic.io/network \
        --iface=eth1

### node2（10.10.172.202）机器操作
----------------------------
$ apt-get install docker -y
$ apt-get install flannel -y

### 
### flannel启动成功后会生成一个环境变量文件
$ cat /run/flannel/subnet.env

### 查看 flanneld 子网 
$ etcdctl ls /atomic.io/network/subnets
> /atomic.io/network/subnets/10.10.35.0-24
> /atomic.io/network/subnets/10.10.82.0-24

### 查看子网当前分配的ip
$ etcdctl get /atomic.io/network/subnets/10.10.82.0-24
> {"PublicIP":"10.0.2.15","BackendType":"vxlan","BackendData":{"VtepMAC":"8a:8e:4a:b0:2b:9b"}}

### 同时在 /run/flannel/docker 文件中会生成docker启动参数
$ cat /run/flannel/docker
> DOCKER_OPT_BIP="--bip=10.10.81.1/24"
> DOCKER_OPT_IPMASQ="--ip-masq=true"
> DOCKER_OPT_MTU="--mtu=1472"
> DOCKER_NETWORK_OPTIONS=" --bip=10.10.81.1/24 --ip-masq=true --mtu=1472"

### 将 DOCKER_NETWORK_OPTIONS 定义为环境变量
$ sudo vi /lib/systemd/system/docker.service
> [Unit]
> Description=Docker Application Container Engine
> Documentation=http://docs.docker.com
> After=network.target
> Wants=docker-storage-setup.service
> Requires=docker-cleanup.timer
> 
> [Service]
> Type=notify
> NotifyAccess=main
> EnvironmentFile=-/run/containers/registries.conf
> EnvironmentFile=-/etc/sysconfig/docker
> EnvironmentFile=-/etc/sysconfig/docker-storage
> EnvironmentFile=-/etc/sysconfig/docker-network
> EnvironmentFile=-/run/flannel/docker ###
> Environment=GOTRACEBACK=crash
> Environment=DOCKER_HTTP_HOST_COMPAT=1
> Environment=PATH=/usr/libexec/docker:/usr/bin:/usr/sbin
> ExecStart=/usr/bin/dockerd-current \
>           --add-runtime docker-runc=/usr/libexec/docker/docker-runc-current \
>           --default-runtime=docker-runc \
>           --exec-opt native.cgroupdriver=systemd \
>           --userland-proxy-path=/usr/libexec/docker/docker-proxy-current \
>           --init-path=/usr/libexec/docker/docker-init-current \
>           --seccomp-profile=/etc/docker/seccomp.json \
>           $OPTIONS \
>           $DOCKER_STORAGE_OPTIONS \
>           $DOCKER_NETWORK_OPTIONS \
>           $ADD_REGISTRY \
>           $BLOCK_REGISTRY \
>           $INSECURE_REGISTRY \
>           $REGISTRIES
> ExecReload=/bin/kill -s HUP $MAINPID
> LimitNOFILE=1048576
> LimitNPROC=1048576
> LimitCORE=infinity
> TimeoutStartSec=0
> Restart=on-abnormal
> KillMode=process
> 
> [Install]
> WantedBy=multi-user.target


### 创建容器，验证跨主机容器之间的网络联通性
----------------------------
$ docker run -ti -d --name=node1.test docker.io/nginx /bin/bash
$ docker exec -ti node1.test /bin/bash
  # ip addr
  # ip route
  -- 登陆容器发现已经按照上面 flannel 配置的分配了一个 ip 段（每个宿主机都会分配一个 10.10.92.2/24 的网段）
 
$ docker run -ti -d --name=node2.test docker.io/nginx /bin/bash
$ docker exec -ti node2.test /bin/bash
  # ip addr
  # ip route
  -- 登陆容器发现已经按照上面 flannel 配置的分配了一个ip段（每个宿主机都会分配一个 182.48.0.0/16 的网段）
  -- 在两个宿主机的容器内，互相 ping 对方容器的 ip，是可以 ping 通的！也可以直接连接外网（桥接模式）

### docker compose 使用 Flannel 
----------------------------
在 docker-compose.ytml 中指定 network_mode: bridge

### 查看宿主机 docker0 网卡
----------------------------
$ ifconfig
docker0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1472
        inet 10.10.92.1  netmask 255.255.255.0  broadcast 0.0.0.0
        inet6 fe80::42:ebff:fe16:438d  prefixlen 64  scopeid 0x20<link>
        ether 02:42:eb:16:43:8d  txqueuelen 0  (Ethernet)
        RX packets 5944  bytes 337155 (329.2 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 6854  bytes 12310552 (11.7 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eno16777984: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.10.172.201  netmask 255.255.255.0  broadcast 10.10.172.255
        inet6 fe80::250:56ff:fe86:2135  prefixlen 64  scopeid 0x20<link>
        ether 00:50:56:86:21:35  txqueuelen 1000  (Ethernet)
        RX packets 98110  bytes 134147911 (127.9 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 60177  bytes 5038428 (4.8 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

flannel0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1472
        inet 10.10.92.0  netmask 255.255.0.0  destination 10.10.92.0
        unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 500  (UNSPEC)
        RX packets 2  bytes 168 (168.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2  bytes 168 (168.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

-- 查看两台宿主机的网卡信息，发现docker0虚拟网卡的ip（相当于容器的网关）也已经变成了flannel配置的ip段，并且多了flannel0的虚拟网卡信息

### 查看到本机的容器的ip所在的范围
----------------------------
$ ps aux|grep docker|grep "bip"
  > root     16589  0.3  1.3 734912 27840 ?        Ssl  13:23   0:04 /usr/bin/dockerd-current --add-runtime docker-runc=/usr/libexec/docker/docker-runc-current --default-runtime=docker-runc --exec-opt native.cgroupdriver=systemd --userland-proxy-path=/usr/libexec/docker/docker-proxy-current --selinux-enabled --log-driver=journald --signature-verification=false --bip=10.10.92.1/24 --ip-masq=true --mtu=1472
-- 这里面的“--bip=10.10.92.1/24”这个参数，它限制了所在节点容器获得的IP范围。
-- 这个 IP 范围是由 Flannel 自动分配的，由 Flannel 通过保存在 Etcd 服务中的记录确保它们不会重复。


### 查看本机默认网关
$ route -n

### 删除一个网关
$ route del default gw 192.168.1.45

### 添加默认网关
$ route add default gw 10.0.2.2

### Making the changes permanent
/etc/sysconfig/network
GATEWAY=192.168.1.45 # change value to new Gateway

