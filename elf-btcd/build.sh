#!/bin/bash

set -e
set -x

SCRIPTPATH=$( cd "$(dirname "$0")" ; pwd -P )
DIRBUILD=~/tmp/bitcoin

# wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.10.0.tar.gz | tar xvz -C ~/tmp
rm -rf ${DIRBUILD}
cp -r ~/tmp/bitcoin-0.10.0 ${DIRBUILD}
cd ${DIRBUILD}
./autogen.sh
CONFIGFLAGS="-disable-tests --without-gui --enable-upnp-default --disable-ccache --disable-maintainer-mode --disable-dependency-tracking"
./configure --prefix=${SCRIPTPATH} --with-incompatible-bdb ${CONFIGFLAGS}
make -j4
make install-strip
#
# William-Yeh/extract-elf-so
# https://github.com/William-Yeh/extract-elf-so
#
