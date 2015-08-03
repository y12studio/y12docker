#!/bin/bash
exec /usr/bin/bitcoind -regtest -txindex -port=18333 -conf=/btc/bitcoin.conf -datadir=/btc/data -rpcport=18332
