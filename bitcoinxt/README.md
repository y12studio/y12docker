Build 0.10.2A
======
Fri Jun  5 10:43:04 CST 2015

```
$ wget -qO- https://github.com/bitcoinxt/bitcoinxt/archive/v0.10.2A.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$  docker images | grep bitcoinxt
y12docker/bitcoinxt      0.10.2A             fba298834097        18 minutes ago      17.58 MB
y12docker/bitcoinxt      0.10.1              f63a85137ab4        3 days ago          17.59 MB
$ docker run y12docker/bitcoinxt:0.10.2A bitcoind --version
Bitcoin XT Daemon version v0.10.2.0-gf5e7b23
Copyright (C) 2009-2015 The Bitcoin XT Developers
$ docker run y12docker/bitcoinxt:0.10.2A bitcoin-cli --version
Bitcoin XT RPC client version v0.10.2.0-gf5e7b23
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoinxt:0.10.2A bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
5f6937852018d430d9bc0c718c7cd2f55f730b5464353edfdf1df5f7ade02f2d
$ docker ps
CONTAINER ID        IMAGE                         COMMAND                CREATED             STATUS              PORTS                                            NAMES
5f6937852018        y12docker/bitcoinxt:0.10.2A   "bitcoind -conf=/btc   27 seconds ago      Up 26 seconds       0.0.0.0:8332->8332/tcp, 0.0.0.0:8333->8333/tcp   thirsty_jang
$ docker exec 5f693 bitcoin-cli -conf=/btc/bitcoin.conf getinfo
{
    "version" : 100200,
    "protocolversion" : 70003,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 17741,
    "timeoffset" : 0,
    "connections" : 8,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1433472406,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}

```

Build Bitcoin XT 0.10.1
=========

Tue Jun  2 09:24:47 CST 2015

```
$ wget -qO- https://github.com/bitcoinxt/bitcoinxt/archive/0.10.1.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep bitcoinxt
y12docker/bitcoinxt      0.10.1              f63a85137ab4        41 seconds ago      17.59 MB

$docker run y12docker/bitcoinxt:0.10.1 bitcoind --version
Bitcoin Core Daemon version v0.10.0.0-geda35ad

$ docker run y12docker/bitcoinxt:0.10.1 bitcoin-cli --version
Bitcoin Core RPC client version v0.10.0.0-geda35ad

$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoinxt:0.10.1 bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
33367d2c3bc76992cda73a950cddb5dac9e19d6610acab99205087193a1dd1d8

$  docker ps
CONTAINER ID        IMAGE                        COMMAND                CREATED             STATUS              PORTS                                            NAMES
33367d2c3bc7        y12docker/bitcoinxt:0.10.1   "bitcoind -conf=/btc   21 seconds ago      Up 20 seconds       0.0.0.0:8332->8332/tcp, 0.0.0.0:8333->8333/tcp   determined_nobel

$ docker exec 33367d2 bitcoin-cli -conf=/btc/bitcoin.conf getinfo
{
    "version" : 100000,
    "protocolversion" : 70003,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 96,
    "timeoffset" : 0,
    "connections" : 8,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1433212650,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}
```
