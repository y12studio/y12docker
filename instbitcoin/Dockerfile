# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.17

ENV DEBIAN_FRONTEND noninteractive

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-add-repository ppa:bitcoin/bitcoin
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN apt-get update
RUN apt-get install -y nginx bitcoind nodejs git sqlite wget python-dev python-flup python-crypto
RUN apt-get clean

ENV NGINX_SRV /etc/service/nginx/run
ADD nginx.sh $NGINX_SRV
RUN chmod +x $NGINX_SRV
ADD nginx.conf /etc/nginx/nginx.conf

ADD www /data/www

ENV BITCOIND_SRV /etc/service/bitcoin/run
ADD bitcoind.sh $BITCOIND_SRV
RUN chmod +x $BITCOIND_SRV
ADD bitcoin.conf /btc/bitcoin.conf
RUN mkdir /btc/data

# install abe
# git clone bitcoin-abe to be a local block explorer
RUN git clone https://github.com/bitcoin-abe/bitcoin-abe /btc/bitcoin-abe
# build bitcoin-abe, it requires a patch to be run within docker
RUN cd /btc/bitcoin-abe && python setup.py install

ENV ABE_SRV /etc/service/abe/run
ADD abe.sh $ABE_SRV
RUN chmod +x $ABE_SRV

ADD abe.conf /btc/abe.conf

EXPOSE 8080

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
