### 域名解析
--------------------
首先，需要在你的域名提供商处增加两条A记录解析到你的服务器，
比如我的是 ngrok.lylinux.net 和 *.ngrok.lylinux.net。这样你可以使用 subdomain 的方式，来实现穿透. 

### Dockerfile
--------------------
FROM golang:1.7.1-alpine
ADD build.sh /
RUN apk add --no-cache git make openssl
RUN git clone https://github.com/inconshreveable/ngrok.git --depth=1 /ngrok
RUN sh /build.sh
EXPOSE 8081
VOLUME [ "/ngrok" ]
CMD [ "/ngrok/bin/ngrokd"]

### build.sh
--------------------
export NGROK_DOMAIN="ngrok.snnmo.com"
cd /ngrok/
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -subj "/CN=$NGROK_DOMAIN" -days 5000 -out rootCA.pem
openssl genrsa -out device.key 2048
openssl req -new -key device.key -subj "/CN=$NGROK_DOMAIN" -out device.csr
openssl x509 -req -in device.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out device.crt -days 5000
cp rootCA.pem assets/client/tls/ngrokroot.crt
cp device.crt assets/server/tls/snakeoil.crt
cp device.key assets/server/tls/snakeoil.key

make release-server
GOOS=linux GOARCH=386 make release-client
GOOS=linux GOARCH=amd64 make release-client
GOOS=windows GOARCH=386 make release-client
GOOS=windows GOARCH=amd64 make release-client
GOOS=darwin GOARCH=386 make release-client
GOOS=darwin GOARCH=amd64 make release-client
GOOS=linux GOARCH=arm make release-client

### 构建镜像
--------------------
$ docker build -t ngrok . 

### 运行容器
--------------------
docker run -it  -p 80:80 -p 4443:4443 -v /root/docker/ngrok/bin:/root/ngrok/bin/ \
		        -d ngrok /ngrok/bin/ngrokd -domain="ngrok.snnmo.com" -httpAddr=":80"
-- 这里的 80 指的是服务器启用 80 端口，就是说内网穿透后的域名为 xxx.ngrok.snnmo.com:80
-- 如果在 80 端口未作他用的情况下，也可将 80 端口改为 80，这样更方便些。
-- 而如果我们 VPS 的 80 端口被占用了，但是我们还想用 80 端口作为服务端口，
-- 那么可以使用 nginx 做一个 xxx.tunnel.snnmo.com 的反向代理。
-- 当 --httpAddr 没有指定 :80 时, 需用 ngrok.snnmo.net:80 访问





### 客户端部分
--------------------
$ docker inspect 容器 ID here
-- 在 Mounts 节点可以看到挂载信息
-- 在 Source 目录中的bin目录中可以找到编译出来的二进制客户端文件，找到我们需要执行的客户端对应平台就可以在客户端连接了。

### 客户端部分 config.yml
--------------------
server_addr: "ngrok.snnmo.net:4443"
trust_host_root_certs: false
tunnels:
  webapp:
    proto:
      http: 80        # 本地端口
    subdomain: test

### 客户端部分 运行
--------------------
./ngrok  -config=config.yml start-all

### 客户端部分 nginx 配置
--------------------
- 需要配置下 nginx，使用 nginx 反向代理，这样我们就可以使用80端口了
server {
    server_name     ~^(?<subdomain>\w+)\.ngrok\.snnmo\.com$;
    listen 80;                      # 本地端口
    keepalive_timeout 70;
    proxy_set_header "Host" $host:8081;
    location / {
            proxy_pass_header Server;
            proxy_redirect off;
            proxy_pass http://127.0.0.1:8081;
    }
    access_log off;
    log_not_found off;
}


### 第二种配置 ngrok.cfg
--------------------
#配置文件 ngrok.cfg 的内容
#
server_addr: "ngrok.snnmo.com:4443"
trust_host_root_certs: false

### 启动 ngrok 客户端
--------------------
# 启动 ngrok 客户端
$ ngrok -config=ngrok.cfg -subdomain=test 80
# 注意：如果不加参数 -subdomain=test，将会随机自动分配子域名。


### 客户端 ngrok 正常执行显示的内容
--------------------
ngrok                                                  (Ctrl+C to quit)

Tunnel Status     online
Version           1.7/1.7
Forwarding        http://ngrok.snnmo.com:8080 -> 127.0.0.1:80
Forwarding        https://ngrok.snnmo.com:8080 -> 127.0.0.1:80
Web Interface     127.0.0.1:4040
# Conn            0
Avg Conn Time     0.00ms


### 映射TCP
--------------------
# 这里以SSH连接Linux时的22端口为例
$ ./ngrok -proto=tcp 22

### 映射成功的话，会显示如下内容：
--------------------
# 客户端ngrok正常执行显示的内容
ngrok                                                  (Ctrl+C to quit)
 
Tunnel Status     online
Version           1.7/1.7
Forwarding        tcp://ngrok.dingdayu.com:49805 -> 127.0.0.1:22
Web Interface     127.0.0.1:4040
# Conn            0
Avg Conn Time     0.00ms

-- 发现端口是号 49805，是随机分配的一个端口号，而不是默认的 22 端口了。
-- 同理，如果要做 MySQL 的远程连接，只需映射 3306 端口即可。FTP 可映射 21 端口。


固定多个端口和 tcp 和 http 穿透
--------------------
server_addr: "a.test.com:4443"      # 配置服务器地址，端口需要和服务器上面的 4443 端口一致，否则无法连接
trust_host_root_certs: false
tunnels:
 ssh:							 	      # 配置 ssh 端口 
  remote_port: 22
  proto:
   tcp: 22
 sssh:                    # 配置 windows 3389 远程端口
  remote_port: 3389           
  proto:
   tcp: 3389
 ftp:
  remote_port: 21
  proto:
   tcp: 21
 http:								    # 配置网站端口
  subdomain: www					# 这是配置网站的域名，配置了 www，那么通过 www.a.test.com 就可以访问本地的服务
  proto:							    # www 也可以改成其他的。
   http: 80							  # 局域网本地的的web服务端口
   https: 443

### 启动 ngrok 客户端
--------------------
$ ngrok.exe  -config ngrok.cfg  start-all





