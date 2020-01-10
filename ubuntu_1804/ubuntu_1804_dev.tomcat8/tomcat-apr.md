APR的整体模式还是非阻塞IO，实现的线程模型也是按照NIO的标准模型实现的，从官方文档
http://apr.apache.org/docs/apr/1.6/modules.html
可以看到APR根据不同操作系统，分别用c重写了大部分IO和系统线程操作模块，这就是为什么APR在不改动代码的情况下能够提升，具体原理可以参考下我写的Tomcat NIO线程模式这篇文章。

面这些就是APR重写的模块:
>>> Memory allocation and memory pool functionality
>>> Atomic operations
>>> Dynamic library handling
>>> File I/O
>>> Command-argument parsing
>>> Locking
>>> Hash tables and arrays
>>> Mmap functionality
>>> Network sockets and protocols
>>> Thread, process and mutex functionality
>>> Shared memory functionality
>>> Time routines
>>> User and group ID services

### Springboot 如何开启 APR 模式
在 Springboot 中内嵌的 Tomcat 默认启动开启的是 NIO 模式，这里如果我们要在 linux 内核的系统上使用 APR 模式，那么需要安装一些 lib 库,可以通过 rpm -q | grep apr 来查看是否安装了 apr， 如果安装了则不再需要安装，如果未安装则需要安装下列库:
>>> openssl，需要版本大于1.0.2,如果不使用https openssl也可以不安装，就是在启动的时候会报openssl的错误，直接忽视就可以了；
>>> apr，可以去官网下载 1.6.2 最新版进行下载 http://apr.apache.org/download.cgi
>>> apr-util，在同一个页面进行下载，最新版本为1.6.0版本
>>> apr-iconv，在同一个页面进行下载，最新版本为1.2.1版本
>>> tomcat-native，在 tomcat 中自带了安装包，可以在 tomcat 的 bin 目录下找到 tomcat-native.tar；

### 安装 apr
下载 apr 安装包 apr-1.6.2.tar.gz
tar -xvf apr-1.6.2.tar.gz
cd apr-1.6.2
./configure 检查是否符合安装条件并配置安装参数，检查是否缺失类库，一般来说如果安装的不是精简版系统都是能顺利通过的
make & make install
如果不设置安装路径，那么系统默认的安装路径为/usr/local/apr/lib

### 安装 apr-util
下载apr-util安装包apr-util-1.6.0.tar.gz
tar -xvf apr-util-1.6.0.tar.gz
cd apr-util-1.6.0
./configure --with-apr=/usr/local/apr/lib --with-java-home=/usr/lib/jvm/jdk-8u144-linux-x64/jdk1.8.0_144 安装apr-util需要配置apr路径和jvm路径，否则会报错找不到apr
make & make install

### 安装apr-iconv
下载 apr-iconv.tar.gz
tar -xvf apr-iconv.tar.gz
cd apr-iconv
./configure --with-apr=/usr/local/apr/lib --with-java-home=/usr/lib/jvm/jdk-8u144-linux-x64/jdk1.8.0_144
make & make install

### 安装 omcat－native
cd tomcat/bin
tar -xvf tomcat-native
cd tomcat-native
./configure --with-apr=/usr/local/apr/lib --with-java-home=/usr/lib/jvm/jdk-8u144-linux-x64/jdk1.8.0_144
make & make install

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/apr-1.6.2/lib


### 新增 APRConfig 类
网上大部分讲解配置 tomcat apr 的文章，都只是讲了如何在独立 tomcat 服务上如何配置 apr，只需要修改 server.xml 中的 connnector 的 protocol 就可以了，对于 springboot 会稍微复杂些，需要增加一个 apr 配置类在启动的时候修改 Embed 的 tomcat connector 网络接入协议。

### APRConfig.java
>>>> import org.apache.catalina.LifecycleListener;
>>>> import org.apache.catalina.core.AprLifecycleListener;
>>>> import org.springframework.beans.factory.annotation.Value;
>>>> import org.springframework.boot.context.embedded.EmbeddedServletContainerFactory;
>>>> import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
>>>> import org.springframework.context.annotation.Bean;
>>>> import org.springframework.context.annotation.Configuration;
>>>> 
>>>> /**
>>>>  * @Author: feiweiwei
>>>>  * @Description: APR配置
>>>>  * @Created Date: 09:23 17/9/7.
>>>>  * @Modify by:
>>>>  */
>>>> @Configuration
>>>> public class APRConfig {
>>>>     @Value("${tomcat.apr:false}")
>>>>     private boolean enabled;
>>>> 
>>>>     @Bean
>>>>     public EmbeddedServletContainerFactory servletContainer() {
>>>>         TomcatEmbeddedServletContainerFactory container = new TomcatEmbeddedServletContainerFactory();
>>>>         if (enabled) {
>>>>             LifecycleListener arpLifecycle = new AprLifecycleListener();
>>>>             container.setProtocol("org.apache.coyote.http11.Http11AprProtocol");
>>>>             container.addContextLifecycleListeners(arpLifecycle);
>>>>         }
>>>> 
>>>>         return container;
>>>>     }
>>>> }

### 启动 springboot
本以为这样做完后可以直接启动 springboot 打开 apr 模式了，可是启动会发现报错，而且这个错误会让你很费解，看错误提示报的应该是服务启动端口被占用，但是实际查下来这个只是表面现象不是根本原因。

### 在启动参数中加上apr的路径，重新启动。
java -Djava.library.path=/usr/local/apr/lib -jar xxxx-0.0.1-SNAPSHOT.jar 

### 日志确认
启动成功后看到日志中打出了以下内容，则表示apr模式启动成功，开始享受APR带来的飞速感受吧。
2017-10-12 15:31:19,032 - Initializing ProtocolHandler ["http-apr-8081"]
2017-10-12 15:31:19,051 - Starting ProtocolHandler ["http-apr-8081"]
2017-10-12 15:31:19,080 - Tomcat started on port(s): 8081 (http)

