
Wed Apr  8 10:51:11 CST 2015
```
$ ./build.sh
$ docker images | grep bitcoind
y12docker/bitcoind       0.10.0              db60bf9ba3b1        11 seconds ago      17.56 M
$ docker run y12docker/bitcoind:0.10.0 bitcoind --version
Bitcoin Core Daemon version v0.10.0.0-g047a898
Copyright (C) 2009-2015 The Bitcoin Core Developers
$ docker run y12docker/bitcoind:0.10.0 bitcoin-cli --version
Bitcoin Core RPC client version v0.10.0.0-g047a898
$ docker run -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.10.0 bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ mkdir -p btc/data
$ echo -e "rpcuser=user\\nrpcpassword=pass\\n" > btc/bitcoin.conf
$ docker run -d -p 8333:8333 -p 8332:8332 -v $PWD/btc:/btc y12docker/bitcoind:0.10.0 bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                                            NAMES
cb4f47c0ddb7        y12docker/bitcoind:0.10.0   "bitcoind -conf=/btc   7 seconds ago       Up 6 seconds        0.0.0.0:8332->8332/tcp, 0.0.0.0:8333->8333/tcp   elated_cori

$ docker exec cb4f47 bitcoin-cli -conf=/btc/bitcoin.conf getinfo
{
    "version" : 100000,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 48,
    "timeoffset" : 0,
    "connections" : 4,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1428462659,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}

$ docker push y12docker/bitcoind:0.10.0
The push refers to a repository [y12docker/bitcoind] (len: 1)
Sending image list
Pushing repository y12docker/bitcoind (1 tags)
79e3deaa4d7e: Image successfully pushed
bf0a51e0ef26: Image successfully pushed
Pushing tag for rev [bf0a51e0ef26] on {https://cdn-registry-1.docker.io/v1/repositories/y12docker/bitcoind/tags/0.10.0}

```


Tue Mar 31 10:33:01 CST 2015

[Creating minimal Docker images from dynamically linked ELF binaries](http://blog.oddbit.com/2015/02/05/creating-minimal-docker-images/)

```
$ git clone https://github.com/larsks/dockerize.git
$ cd dockerize && python setup.py

$ dockerize -h
usage: dockerize [-h] [--tag TAG] [--cmd CMD] [--entrypoint ENTRYPOINT]
                 [--no-build] [--output-dir OUTPUT_DIR] [--add-file SRC DST]
                 [--symlinks SYMLINKS] [--user USER] [--group GROUP]
                 [--filetools] [--verbose] [--debug] [--version]
                 ...
$ dockerize --version
dockerize version 0.2

# download bitcoin src v0.10.0
$ wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.10.0.tar.gz | tar xvz -C ~/tmp
$ rm -rf ~/tmp/bitcoin
$ cp -r ~/tmp/bitcoin-* ~/tmp/bitcoin
$ ls ~/tmp/bitcoin/
autogen.sh  configure.ac  COPYING  doc      Makefile.am  qa         share
build-aux   contrib       depends  INSTALL  pkg.m4       README.md  src
$ cd ~/tmp/bitcoin && ./autogen.sh
$ ./configure --with-incompatible-bdb -disable-tests --without-gui
$ make -j4
$ ldd src/bitcoind
        linux-vdso.so.1 =>  (0x00007fff743fe000)
        libboost_system.so.1.54.0 => /usr/lib/x86_64-linux-gnu/libboost_system.so.1.54.0 (0x00007f8dfe733000)
        libboost_filesystem.so.1.54.0 => /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.54.0 (0x00007f8dfe51d000)
        libboost_program_options.so.1.54.0 => /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.54.0 (0x00007f8dfe2ae000)
        libboost_thread.so.1.54.0 => /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.54.0 (0x00007f8dfe098000)
        libdb_cxx-5.1.so => /usr/lib/x86_64-linux-gnu/libdb_cxx-5.1.so (0x00007f8dfdd06000)
        libssl.so.1.0.0 => /lib/x86_64-linux-gnu/libssl.so.1.0.0 (0x00007f8dfdaa7000)
        libcrypto.so.1.0.0 => /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 (0x00007f8dfd6cd000)
        libanl.so.1 => /lib/x86_64-linux-gnu/libanl.so.1 (0x00007f8dfd4c9000)
        libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f8dfd1c4000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f8dfcebe000)
        libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f8dfcca8000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f8dfca89000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f8dfc6c4000)
        librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f8dfc4bc000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f8dfc2b7000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f8dfefa7000)

$ cd src
$ dockerize -t foo -a bitcoind /usr/bin/bitcoind -a bitcoin-cli /usr/bin/bitcoin-cli \
    -a bitcoin-tx /usr/bin/bitcoin-tx \
    -a /bin/dash /bin/sh \
	-c /bin/sh --filetools

Sending build context to Docker daemon 114.1 MB

$ docker run foo bitcoind --version
Bitcoin Core Daemon version v0.10.0.0-g047a898
Copyright (C) 2009-2015 The Bitcoin Core Developers
$ docker run foo bitcoin-cli --version
Bitcoin Core RPC client version v0.10.0.0-g047a898
$ mkdir btc/data
$ echo -e "rpcuser=user\\nrpcpassword=pass\\n" > btc/bitcoin.conf
$ docker run -d -p 8333:8333 -p 8332:8332 -v $PWD/btc:/btc foo bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                                            NAMES
9d8a638ffb40        foo:latest          "bitcoind -conf=/btc   3 seconds ago       Up 2 seconds        0.0.0.0:8332->8332/tcp, 0.0.0.0:8333->8333/tcp   stupefied_wright

$ docker exec 9d8a63 bitcoin-cli -conf=/btc/bitcoin.conf getinfo
{
    "version" : 100000,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 26375,
    "timeoffset" : -3,
    "connections" : 8,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1427772964,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}
```
