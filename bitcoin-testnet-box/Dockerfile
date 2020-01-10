# chunhui2001/bitcoin-testnet-box
# Version 0.0.1
FROM ubuntu
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# install make
RUN apt-get update && \
  apt-get install --yes make vim build-essential lsb-release net-tools iputils-ping apt-utils supervisor curl wget

# create a non-root user
RUN adduser --disabled-login --gecos "" tester

# run following commands from user's home directory
WORKDIR /home/tester

ENV BITCOIN_CORE_VERSION "0.21.0"

# download and install bitcoin binaries
RUN mkdir tmp \
  && cd tmp \
  && wget "https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_CORE_VERSION}/bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz" \
  && tar xzf "bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz" \
  && cd "bitcoin-${BITCOIN_CORE_VERSION}/bin" \
  && install --mode 755 --target-directory /usr/local/bin *

# clean up
RUN rm -r tmp

# copy the testnet-box files into the image
ADD ./.bashrc /home/tester/.bashrc

# make tester user own the tester
RUN chown -R tester:tester /home/tester

# color PS1
RUN cat /home/tester/.bashrc >> /etc/bash.bashrc && cat /home/tester/.bashrc >> /root/.bashrc

# use the tester user when running the image
# USER tester

# run commands from inside the testnet-box directory
WORKDIR /home/tester

# expose two rpc ports for the nodes to allow outside container access
EXPOSE 19001 19011
CMD ["/bin/bash", "-c", "while true; do echo 1 >/dev/null 2>/dev/null; sleep 1; done"]

# docker build . -t 'chunhui2001/bitcoin-testnet-box'
# docker push chunhui2001/bitcoin-testnet-box
# docker pull chunhui2001/bitcoin-testnet-box

