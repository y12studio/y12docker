#!/bin/bash
# initial setup of sqlite
python -m Abe.abe --config /btc/abe.conf --commit-bytes 100000 --no-serve

# serve it up
python -m Abe.abe --config /btc/abe.conf
