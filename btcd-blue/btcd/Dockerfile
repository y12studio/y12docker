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

RUN mkdir -p /root/btcd/data \
    && echo "[Application Options]\nrpcuser=user\nrpcpass=pass\nlisten=0.0.0.0:12333\nrpclisten=127.0.0.1:12332\nnodnsseed=1\n" > /root/btcd/btcd.conf \
    && echo "[Application Options]\nrpcuser=user\nrpcpass=pass\n" > /root/btcd/btcctl.conf \
    && echo "alias rt='btcctl -C=/root/btcd/btcctl.conf --notls -s 127.0.0.1:12332'" >> ~/.bashrc

RUN mkdir /etc/service/btcd \
    && echo "#!/bin/bash\necho -e \$BTCD_CONF >> /root/btcd/btcd.conf\n/btcd/bin/btcd -C=/root/btcd/btcd.conf -b=/root/btcd/data \$BTCD_PARAM\n" > /etc/service/btcd/run \
    && chmod +x /etc/service/btcd/run

# disable sshd
RUN rm -rf /etc/service/sshd

EXPOSE 12333 12332
CMD ["/sbin/my_init"]
