# chunhui2001/ubuntu_1804_dev:solc
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# reset dir
WORKDIR /root

ENV CMAKE_VERSION=3.22
ENV CMAKE_BUILD=2
RUN apt-get update -y && apt-get install curl git -y 
RUN wget https://cmake.org/files/v$CMAKE_VERSION/cmake-$CMAKE_VERSION.$CMAKE_BUILD.tar.gz
RUN tar -xzf cmake-$CMAKE_VERSION.$CMAKE_BUILD.tar.gz && cd cmake-$CMAKE_VERSION.$CMAKE_BUILD/ && \
    ./bootstrap && make -j$(nproc) && make install

### Test your new cmake version.
# cmake --version

#RUN curl -L get.web3j.io | sh && source ~/.web3j/source.sh
RUN curl -L get.web3j.io | sh
RUN git clone --depth 1 --recursive -b  v0.8.13 https://github.com/ethereum/solidity && \
	cd /solidity && cmake -DCMAKE_BUILD_TYPE=Release -DTESTS=0 -DSTATIC_LINKING=1


# docker build . -t "chunhui2001/ubuntu_1804_dev:solc"
# docker run -dit --entrypoint="top" chunhui2001/ubuntu_1804_dev:solc 



