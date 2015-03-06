FROM phusion/baseimage:0.9.16
# https://github.com/phusion/baseimage-docker
MAINTAINER Y12STUDIO <y12studio@gmail.com>

RUN apt-get -yq update
RUN apt-get -yq upgrade
RUN apt-get install -yq curl wget git python unzip

#
# install pip
#
RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo python2.7

#
# Installing Node.js via package manager · joyent/node Wiki
# https://github.com/joyent/node/wiki/installing-node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN sudo apt-get install -yq nodejs

CMD ["/sbin/my_init"]
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN rm -rf /tmp/* /var/tmp/*
