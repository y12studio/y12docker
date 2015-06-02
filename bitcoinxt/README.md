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
