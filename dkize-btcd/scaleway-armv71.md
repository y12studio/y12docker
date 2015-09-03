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

```
