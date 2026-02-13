# chunhui2001/ubuntu_25.10:golang_1.26
# Version 0.0.1
FROM chunhui2001/ubuntu_25.10:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV GOLANG_VERSION=1.26.1


RUN curl -L "https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz" > /usr/local/go${GOLANG_VERSION}.linux-amd64.tar.gz &&\
tar -xvf /usr/local/go${GOLANG_VERSION}.linux-amd64.tar.gz -C /usr/local/ &&\
mv /usr/local/go /usr/local/go${GOLANG_VERSION}.linux-amd64 &&\
ln -s /usr/local/go${GOLANG_VERSION}.linux-amd64 /usr/local/go &&\
rm -rf /usr/local/go${GOLANG_VERSION}.linux-amd64.tar.gz

ENV PATH="$PATH:/usr/local/go/bin"

# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/ubuntu_25.10:golang_1.26'
# docker run -dit --entrypoint="top" --name golang_1.26 ubuntu_25.10.golang-1.26
# docker push ubuntu_25.10.golang-1.26
# docker pull ubuntu_25.10.golang-1.26

# Open ports
EXPOSE 8080
