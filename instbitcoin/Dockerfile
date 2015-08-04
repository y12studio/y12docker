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

# install abe
# git clone bitcoin-abe to be a local block explorer
RUN git clone https://github.com/bitcoin-abe/bitcoin-abe /btc/bitcoin-abe
# build bitcoin-abe, it requires a patch to be run within docker
RUN cd /btc/bitcoin-abe && python setup.py install

# nginx service
ENV NGINX_SRV /etc/service/nginx/run
ADD nginx.sh $NGINX_SRV
RUN chmod +x $NGINX_SRV
ADD nginx.conf /etc/nginx/nginx.conf

# bitcoind service
ENV BITCOIND_SRV /etc/service/bitcoin/run
ADD bitcoind.sh $BITCOIND_SRV
RUN chmod +x $BITCOIND_SRV
ADD bitcoin.conf /btc/bitcoin.conf
RUN mkdir /btc/data

# abe service
ENV ABE_SRV /etc/service/abe/run
ADD abe.sh $ABE_SRV
RUN chmod +x $ABE_SRV
ADD abe.conf /btc/abe.conf

# install node cron app
ADD bcron/package.json /btc/bcron/package.json
RUN cd /btc/bcron && npm install

ENV BCRON_SRV /etc/service/bcron/run
ADD bcron.sh $BCRON_SRV
RUN chmod +x $BCRON_SRV

# the codes update frequently.
ADD www /data/www
ADD bcron/app.js /btc/bcron/app.js

EXPOSE 8080

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
