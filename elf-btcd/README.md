
Tue Apr 21 19:46:46 CST 2015
=============================

[William-Yeh/extract-elf-so](https://github.com/William-Yeh/extract-elf-so)

[Quest for minimal Docker images](http://william-yeh.github.io/docker-mini/#1)

install extract-elf-so
======================

```
$ git clone https://github.com/William-Yeh/extract-elf-so
$ cd extract-elf-so/
$ ./build.sh
$ ls
build.sh  Dockerfile-compile  LICENSE    Vagrantfile
dist      extract-elf-so.go   README.md
$ dist/extract-elf-so_linux-amd64 --version
0.5
```

build bitcoind
==============

```
$ cd ~/git/y12docker/elf-btcd/
$ ./build.sh
$ ~/git/extract-elf-so/dist/extract-elf-so_linux-amd64 --nss-net -z bin/bitcoind bin/bitcoin-cli bin/bitcoin-tx
$ docker build -t foo .
$ docker run -i -t foo bitcoin-cli --version
Bitcoin Core RPC client version v0.10.0.0-g047a898
$ docker run -d -p 8333:8333 -p 8332:8332 foo bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                                            NAMES
23525bd0a814        foo:latest          "bitcoind -conf=/btc   22 seconds ago      Up 22 seconds       0.0.0.0:8332->8332/tcp, 0.0.0.0:8333->8333/tcp   hungry_hoover
lin@ubuntu73:~/git/y12docker/elf-btcd$ docker exec 23525 bitcoin-cli -conf=/btc/bitcoin.conf getinfo
{
    "version" : 100000,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 928,
    "timeoffset" : -1,
    "connections" : 8,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1429620307,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}

```
