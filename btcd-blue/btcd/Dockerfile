FROM y12docker/pbase:15.03

# Install Go
RUN mkdir -p /goroot && \
  curl https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1

WORKDIR /btcd
# Set environment variables.
ENV GOROOT /goroot
ENV GOPATH /btcd
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

RUN go get github.com/btcsuite/btcd/...
RUN go get -u -v github.com/btcsuite/btcwallet/...

ADD btcd.conf /root/btcd/

RUN mkdir -p /root/btcd/data \
    && echo "alias rt='btcctl -u user -P pass --notls -s 127.0.0.1:12332'" >> ~/.bashrc

ADD btcd.sh /etc/service/btcd/run
RUN chmod +x /etc/service/btcd/run

# disable sshd
RUN rm -rf /etc/service/sshd
RUN rm -f /etc/my_init.d/00_regen_ssh_host_keys.sh

EXPOSE 12333 12332
CMD ["/sbin/my_init"]
