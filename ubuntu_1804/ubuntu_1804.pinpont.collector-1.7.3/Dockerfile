# chunhui2001/ubuntu_1804:pinpont.collector-1.7.3
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:tomcat8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD ./pinpoint-collector-1.7.3-customer.tar /usr/local/tomcat/webapps/
RUN apt-get update -y && apt-get install rsync -y

# --delete 参数要放在源目录和目标目录前，并且两个目录结构一定要一致！不能使用 ./*
RUN rsync -azP --delete /usr/local/tomcat/webapps/pinpoint-collector-1.7.3/ /usr/local/tomcat/webapps/ROOT/
RUN chown -R root:root /usr/local/tomcat/webapps/ROOT/

# docker build . -t 'chunhui2001/ubuntu_1804:pinpont.collector-1.7.3'
# docker run -dit -P --entrypoint="top" --name pinpont.collector chunhui2001/ubuntu_1804:pinpont.collector-1.7.3
# docker push chunhui2001/ubuntu_1804:pinpont.collector-1.7.3
# docker pull chunhui2001/ubuntu_1804:pinpont.collector-1.7.3

#EXPOSE 9100