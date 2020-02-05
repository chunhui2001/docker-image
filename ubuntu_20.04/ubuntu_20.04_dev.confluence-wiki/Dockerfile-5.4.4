# chunhui2001/ubuntu_20.04_dev:confluence-wiki
# Version 0.0.1
FROM chunhui2001/ubuntu_20.04_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

COPY ./confluence_keygen.jar /root/
COPY ./Confluence-5.4.4-language-pack-zh_CN.jar /root/
COPY ./confluence5.1-crack.zip /root/
COPY ./mysql-connector-java-5.1.32-bin.jar /root/
COPY ./atlassian-confluence-5.4.4-x64.bin /root/
RUN chmod +x /root/atlassian-confluence-5.4.4-x64.bin
#RUN /root/atlassian-confluence-5.4.4-x64.bin
# 此时，安装已完成，不应该出现任何错误

### 破解 confluence
# 访问 http://192.168.1.203:8090，获取页面上的 Server ID
# 停止服务
# /etc/init.d/confluence stop
# 解压 51CTO下载-confluence5.1-crack.zip
# 将 /opt/atlassian/confluence/confluence/WEB-INF/lib 路径下的文件
# atlassian-extras-2.4.jar 覆盖 51CTO下载-confluence5.1-crack 下的同名文件 atlassian-extras-2.4.jar
# 执行 java -jar confluence_keygen.jar
# 将 Server ID 粘贴到弹出的对话框中
# 点击 patch! 后选择从 linux 上下载覆盖后的包儿: atlassian-extras-2.4.jar
# 打开后-点.gen!获取key值并复制
# 此时 51CTO下载-confluence5.1-crack 文件夹下会有两个文件 atlassian-extras-2.4.jar 和 atlassian-extras-2.4.bak
# 将 atlassian-extras-2.4.jar 覆盖到服务器/opt/atlassian/confluence/confluence/WEB-INF/lib/ 路径下并启动 wiki

### 登录mysql ,创建数据库及账号
# 5.4.4版本的confluence，貌似对mysql的存储引擎有要求，需要是InnoDB
# show variables like '%storage_engine%';//查看默认存储引擎
# 如果是MyISAM的话，在/etc/my.cnf文件[mysqld]下添加default-storage-engine=InnoDB，重启mysql
# 创建数据库
# create database wiki character set UTF8;
# grant all on wiki.* to wiki_user@"%" identified by "wiki_password";

### 配置
# 将 mysql 驱动包放到 confluence 里
# cd /opt/atlassian/confluence/confluence/WEB-INF/lib
# mv /root/wsprpm/mysql-connector-java-5.1.32-bin.jar ./
# 重启 wiki 服务
# 粘贴上述复制的key值并点击Production Installation
# 在向导中选择外部 mysql 然后选择 Direct JDBC
# Driver Class Name ：默认无需更改
# Database URL:修改对应IP，port，database,
# jdbc:mysql://127.0.0.1:3306/wiki?useUnicode=true&characterEncoding=UTF8&amp;sessionVariables=storage_engine%3DInnoDB
# 当出现错误后，不要试图点击后退，修改信息，再尝试点击“Next”。直接按本步所说的做相关卸载操作，并修正产生问题的地方，从第一步开始。
# 如果上一步成功，点击“Empty Site”

## 重要
# 修改文件内容, 编辑 hibernate.connection.url 连接符 &amp; 使用 utf8 编码
# vim /var/atlassian/application-data/confluence/confluence.cfg.xml
# 修改完后重启wiki

# 设置base url，job，创建空间，空间权限，用户等


# docker build -f Dockerfile-5.4.4 . -t 'chunhui2001/ubuntu_20.04_dev:confluence-wiki'
# docker run -dit --entrypoint="top" -p 8090:8090 --name ubuntu20.04-confluence-wiki chunhui2001/ubuntu_20.04_dev:confluence-wiki
# docker run -dit -p 8080:8080 --name ubuntu20.04-confluence-wiki chunhui2001/ubuntu_20.04_dev:confluence-wiki
# docker push chunhui2001/ubuntu_20.04_dev:confluence-wiki
# docker pull chunhui2001/ubuntu_20.04_dev:confluence-wiki

# Open ports
EXPOSE 8090
