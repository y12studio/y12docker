#!/bin/bash

set -e
set -x

SCRIPTPATH=$( cd "$(dirname "$0")" ; pwd -P )
VERSION=bitcoinxt-0.11B
DKTAG=0.11.0b.xt
DIRBUILD=~/tmp/bitcoin
#
# wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.10.1.tar.gz | tar xvz -C ~/tmp
# git clone --depth 1 --branch 0.11B --single-branch https://github.com/bitcoinxt/bitcoinxt ~/tmp/bitcoinxt-0.11B
#
rm -rf ${DIRBUILD}
cp -r ~/tmp/${VERSION} ${DIRBUILD}
cd ${DIRBUILD}
./autogen.sh
CONFIGFLAGS="-disable-tests --without-gui --enable-upnp-default --disable-ccache --disable-maintainer-mode --disable-dependency-tracking"
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
