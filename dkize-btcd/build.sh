#!/bin/bash

set -e
set -x

SCRIPTPATH=$( cd "$(dirname "$0")" ; pwd -P )
#VERSION=bitcoinbu-0.11.2
#VERSION=bitcoinxt-0.11D
VERSION=bitcoin-0.12.1
# VERSION=bitcoinclassic-0.12.0cl1
# DKTAG=0.11.2.bu
# DKTAG=0.11d.xt
DKTAG=0.12.1.core
# DKTAG=0.12.0.cl1
DIRBUILD=~/tmp/bitcoin
#
# wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.11.1.tar.gz | tar xvz -C ~/tmp
# wget -qO- https://github.com/bitcoinclassic/bitcoinclassic/archive/v0.11.2.cl1.tar.gz | tar xvz -C ~/tmp
# git clone --depth 1 --branch 0.11B --single-branch https://github.com/bitcoinxt/bitcoinxt ~/tmp/bitcoinxt-0.11B
# git clone --depth 1 --branch 0.11cfg_stats --single-branch https://github.com/gandrewstone/BitcoinUnlimited ~/tmp/bitcoinbu-0.11.2
rm -rf ${DIRBUILD}
cp -r ~/tmp/${VERSION} ${DIRBUILD}
cd ${DIRBUILD}
./autogen.sh
CONFIGFLAGS="-disable-tests --without-gui --disable-ccache --disable-maintainer-mode --disable-dependency-tracking"
./configure --prefix=${SCRIPTPATH} --with-incompatible-bdb ${CONFIGFLAGS}
make -j4
make install-strip
#
# larsks/dockerize https://github.com/larsks/dockerize
#
cd ${SCRIPTPATH}
dockerize -t y12docker/bitcoind:${DKTAG} -a bin/bitcoind /usr/bin/bitcoind \
    -a bin/bitcoin-cli /usr/bin/bitcoin-cli \
    -a bin/bitcoin-tx /usr/bin/bitcoin-tx \
    -a bitcoin.conf /btc/bitcoin.conf \
    -a README.md /btc/data/README.md \
    -a /bin/bash /bin/bash \
    -a /bin/echo /bin/echo \
    -c /bin/bash --filetools
