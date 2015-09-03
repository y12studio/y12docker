scaleway docker image test log

```
# uname -a
Linux scw-xxx 4.1.6-250 #1 SMP Mon Aug 31 14:48:51 UTC 2015 armv7l armv7l armv7l GNU/Linux
# apt-get --version
apt 1.0.9.7ubuntu4 for armhf compiled on Apr  7 2015 14:47:38
# docker version
Client:
 Version:      1.8.1
 API version:  1.20
 Go version:   go1.4.2
 Git commit:   d12ea79-dirty
 Built:        Thu Aug 13 07:53:24 UTC 2015
 OS/Arch:      linux/arm

Server:
 Version:      1.8.1
 API version:  1.20
 Go version:   go1.4.2
 Git commit:   d12ea79-dirty
 Built:        Thu Aug 13 07:53:24 UTC 2015
 OS/Arch:      linux/arm
# fig version
docker-compose version: 1.4.0
docker-py version: 1.3.1
CPython version: 2.7.9
OpenSSL version: OpenSSL 1.0.1f 6 Jan 2014

# docker run y12docker/bitcoind:0.11.0 bitcoind --version      
exec format error
Error response from daemon: Cannot start container 940229c20fdceb45152b75bce83c3262c5bd9b57084a6d77e83560955357a974: 
[8] System error: exec format error
# apt-get install software-properties-common python-software-properties
# apt-add-repository ppa:bitcoin/bitcoin
# agt-get update
# apt-get install bitcoin
E: Unable to locate package bitcoind
```

Tutorials & Technicalities: Compile Bitcoin Core on Raspberry Pi (Raspbian) 
 http://blog.pryds.eu/2014/06/compile-bitcoin-core-on-raspberry-pi.html

```
# apt-get install build-essential autoconf libtool pkg-config libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev
# mkdir ~/bin
# cd ~/bin
# wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
# tar -xzvf db-4.8.30.NC.tar.gz
# cd db-4.8.30.NC/build_unix/
#../dist/configure --enable-cxx
# make -j4
# make install
# wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.11.0.tar.gz | tar xvz -C ~/bin
# cd ~/bin/bitcoin-0.11.0/
# ./autogen.sh
# ./configure --without-gui CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib"
# make -j4
virtual memory exhausted: Cannot allocate memory
virtual memory exhausted: Cannot allocate memory
Makefile:3612: recipe for target 'libbitcoin_server_a-net.o' failed
make[2]: *** [libbitcoin_server_a-net.o] Error 1
make[2]: *** Waiting for unfinished jobs....
Makefile:3570: recipe for target 'libbitcoin_server_a-main.o' failed
make[2]: *** [libbitcoin_server_a-main.o] Error 1
# free -h
             total       used       free     shared    buffers     cached
Mem:          2.0G        86M       1.9G        12M       2.7M        44M
-/+ buffers/cache:        39M       1.9G
Swap:           0B         0B         0B
# swapon -s
# df -h
Filesystem      Size  Used Avail Use% Mounted on
none           1010M     0 1010M   0% /dev
tmpfs           203M   13M  190M   7% /run
/dev/nbd0        46G  1.3G   43G   3% /
tmpfs          1012M     0 1012M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs          1012M     0 1012M   0% /sys/fs/cgroup
cgmfs           100K     0  100K   0% /run/cgmanager/fs
tmpfs           203M     0  203M   0% /run/user/0
# fallocate -l 4G /swapfile
# ls -lh /swapfile
-rw-r--r-- 1 root root 4.0G Sep  3 05:30 /swapfile
# chmod 600 /swapfile
# mkswap /swapfile
Setting up swapspace version 1, size = 4194300 KiB
no label, UUID=c233fe11-465e-4555-b957-5ef6d8f4afa9
# swapon /swapfile
# swapon -s
Filename                                Type            Size    Used    Priority
/swapfile                               file            4194300 0       -1
# free -h
             total       used       free     shared    buffers     cached
Mem:          2.0G        92M       1.9G        12M       3.5M        46M
-/+ buffers/cache:        42M       1.9G
Swap:         4.0G         0B       4.0G
# ./configure --without-gui --disable-tests CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib"
# make -j4
# make install-strip
# which bitcoind
/usr/local/bin/bitcoind
# bitcoind --version
Bitcoin Core Daemon version v0.11.0.0-gd26f951
Copyright (C) 2009-2015 The Bitcoin Core Developers
```

install larsks/dockerize 
 https://github.com/larsks/dockerize

```
# git clone https://github.com/larsks/dockerize ~/bin/dockerizeCloning into '/root/bin/dockerize'...
# cd ~/bin/dockerize/
# apt-get install python-dev
# python setup.py install
# dockerize --version
dockerize version 0.2
# cd ~/bin/bitcoin-0.11.0/
# cat bitcoin.conf
rpcuser=user
rpcpassword=pass
# dockerize -t y12docker/bitcoind:0.11.0.arm -a /usr/local/bin/bitcoind /usr/bin/bitcoind \
    -a /usr/local/bin/bitcoin-cli /usr/bin/bitcoin-cli \
    -a /usr/local/bin/bitcoin-tx /usr/bin/bitcoin-tx \
    -a bitcoin.conf /btc/bitcoin.conf \
    -a README.md /btc/data/README.md \
    -a /bin/bash /bin/bash \
    -a /bin/echo /bin/echo \
    -c /bin/bash --filetools
# docker images | grep bitcoind
y12docker/bitcoind   0.11.0.arm          5e35fbc0adfd        15 seconds ago      12.04 MB
# docker run y12docker/bitcoind:0.11.0.arm bitcoind --version
Bitcoin Core Daemon version v0.11.0.0-gd26f951
Copyright (C) 2009-2015 The Bitcoin Core Developers

```
