# chunhui2001/ubuntu_20.04_dev:rocksdb
# Version 0.0.1
FROM chunhui2001/ubuntu_20.04_dev:golang_1.15.7
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV ROCKSDB_VERSION v6.10.2

RUN apt-get update -y 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:george-edison55/cmake-3.x
RUN apt-get update -y && apt-get install -y fakeroot libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev libzstd-dev cmake git devscripts debhelper build-essential g++

# git clone https://github.com/facebook/rocksdb.git 
ADD ./rocksdb /tmp/rocksdb

# Install Rocksdb
WORKDIR /tmp/rocksdb

# Build as a shared library
RUN git checkout ${ROCKSDB_VERSION}

# Build as a shared library
RUN make shared_lib 

# The following command installs the shared library in /usr/lib/ and the header files in /usr/include/rocksdb/
RUN make install-shared INSTALL_PATH=/usr

# Make sure the newly built library is linked correctly
RUN ldconfig

# Once the installation has finished, you will be able to compile Demos using the following command:
### make install DB_BACKEND=rocksdb

WORKDIR /usr/local/go

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:rocksdb'
# docker run -dit --entrypoint="top" --name rocksdb chunhui2001/ubuntu_20.04_dev:rocksdb
# docker push chunhui2001/ubuntu_20.04_dev:rocksdb
# docker pull chunhui2001/ubuntu_20.04_dev:rocksdb

# Open ports
EXPOSE 8090
