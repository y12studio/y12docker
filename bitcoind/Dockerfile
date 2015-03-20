FROM y12docker/pbase:15.03

# disable sshd
RUN rm -rf /etc/service/sshd \
    && rm -f /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get install -yq python-software-properties
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -yq bitcoind
