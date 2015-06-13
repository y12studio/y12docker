#!/bin/bash

set -e
set -x

SCRIPTPATH=$( cd "$(dirname "$0")" ; pwd -P )
VERSION=v150613
DIRBUILD=~/tmp/elements
#
# git clone --depth 1 https://github.com/ElementsProject/elements && cd elements && git checkout alpha
#
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
dockerize -t y12docker/elements-alpha:${VERSION} -a bin/alphad /usr/bin/alphad \
    -a bin/alpha-cli /usr/bin/alpha-cli \
    -a bin/alpha-tx /usr/bin/alpha-tx \
    -a bitcoin.conf /btc/bitcoin.conf \
    -a README.md /btc/data/README.md \
    -a /bin/bash /bin/bash \
    -a /bin/echo /bin/echo \
    -c /bin/bash --filetools
