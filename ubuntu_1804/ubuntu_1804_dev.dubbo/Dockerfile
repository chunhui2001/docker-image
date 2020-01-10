# chunhui2001/ubuntu_1804_dev:dubbo
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:tomcat8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV REFRESHED_AT 2019-11-10

ADD ./dubbo-dubbo-2.6.0.tar /usr/local/
RUN apt-get install -y unzip
WORKDIR /usr/local/dubbo-dubbo-2.6.0/dubbo-admin
RUN mvn clean package -Dmaven.test.skip=true

# /usr/local/dubbo-dubbo-2.6.0/dubbo-admin/target/dubbo-admin-2.6.0.war

ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]

# docker build . -t 'chunhui2001/ubuntu_1804_dev:dubbo'
# docker run -dit --entrypoint="top" --name dubbo chunhui2001/ubuntu_1804_dev:dubbo
# docker push chunhui2001/ubuntu_1804_dev:dubbo
# docker pull chunhui2001/ubuntu_1804_dev:dubbo
