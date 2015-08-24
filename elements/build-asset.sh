#!/bin/bash

set -e
set -x

DOCKERIMG=y12docker/elements-alpha
VERSION=v150824asset

SCRIPTPATH=$( cd "$(dirname "$0")" ; pwd -P )
DIRBUILD=~/tmp/elements
cd ${DIRBUILD}
./autogen.sh
CONFIGFLAGS="--disable-wallet --without-gui --disable-tests"
./configure --prefix=${SCRIPTPATH} --with-incompatible-bdb ${CONFIGFLAGS}
make -j4
make install-strip
#
# larsks/dockerize https://github.com/larsks/dockerize
#
cd ${SCRIPTPATH}
dockerize -t ${DOCKERIMG}:${VERSION} -a bin/alphad /usr/bin/alphad \
    -a bin/alpha-cli /usr/bin/alpha-cli \
    -a bin/alpha-tx /usr/bin/alpha-tx \
    -a bitcoin.conf /btc/bitcoin.conf \
    -a README.md /btc/data/README.md \
    -a /bin/bash /bin/bash \
    -a /bin/echo /bin/echo \
    -c /bin/bash --filetools
