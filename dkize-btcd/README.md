build bitcoin core/xt/bu
======
docker image y12docker/bitcoind:0.12.0.cl1

```
$ wget -qO- https://github.com/bitcoinclassic/bitcoinclassic/archive/v0.12.0cl1.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep cl1
y12docker/bitcoind              0.12.0.cl1          c5d9cdcffa45        47 seconds ago      17.91 MB
y12docker/bitcoind              0.11.2.cl1          4a1e68829a61        2 weeks ago         17.87 MB
y12docker/bitcoind              0.11.1.cl1          03a4886d9660        2 weeks ago         17.87 MB
$ docker run y12docker/bitcoind:0.12.0.cl1 bitcoind --version
Bitcoin Classic Daemon version v0.12.0.0-g6cebccd
...
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.12.0.cl1 bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS              PORTS                              NAMES
c1677d927012        y12docker/bitcoind:0.12.0.cl1   "bitcoind -conf=/btc/"   14 seconds ago      Up 13 seconds       0.0.0.0:8332-8333->8332-8333/tcp   lonely_goldberg
$ alias bc='docker exec c1677d927012 bitcoin-cli -conf=/btc/bitcoin.conf'
$ bc getinfo
{
  "version": 120000,
  "protocolversion": 70012,
  "walletversion": 60000,
  "balance": 0.00000000,
  "blocks": 139281,
  "timeoffset": 0,
  "connections": 8,
  "proxy": "",
  "difficulty": 1888786.705353048,
  "testnet": false,
  "keypoololdest": 1457397092,
  "keypoolsize": 101,
  "paytxfee": 0.00000000,
  "relayfee": 0.00001000,
  "errors": ""
}
$ bc getblockchaininfo
{
  "chain": "main",
  "blocks": 140920,
  "headers": 401623,
  "bestblockhash": "000000000000017fab19329089a1ab54e1f4ab110b1ef0c5d4f9990c2815d624",
  "difficulty": 1888786.705353048,
  "mediantime": 1313319251,
  "verificationprogress": 0.005214505862843848,
  "chainwork": "0000000000000000000000000000000000000000000000045aedf12f07d5ea89",
  "pruned": false,
  "softforks": [
    {
      "id": "bip34",
      "version": 2,
      "enforce": {
        "status": false,
        "found": 0,
        "required": 750,
        "window": 1000
      },
      "reject": {
        "status": false,
        "found": 0,
        "required": 950,
        "window": 1000
      }
    },
    {
      "id": "bip66",
      "version": 3,
      "enforce": {
        "status": false,
        "found": 0,
        "required": 750,
        "window": 1000
      },
      "reject": {
        "status": false,
        "found": 0,
        "required": 950,
        "window": 1000
      }
    },
    {
      "id": "bip65",
      "version": 4,
      "enforce": {
        "status": false,
        "found": 0,
        "required": 750,
        "window": 1000
      },
      "reject": {
        "status": false,
        "found": 0,
        "required": 950,
        "window": 1000
      }
    }
  ],
  "hardforks": [
    {
      "id": "bip109",
      "version": 16777216,
      "status": {
        "triggeredatblock": null,
        "earliestforktime": null,
        "found": 0,
        "required": 750,
        "window": 1000
      }
    }
  ]
}
$ docker push y12docker/bitcoind:0.12.0.cl1
```

docker image y12docker/bitcoind:0.12.0.core

```
$ wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.12.0.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep core
y12docker/bitcoind              0.12.0.core         59752f001cce        56 seconds ago      17.88 MB
y12docker/bitcoind              0.12.0rc5.core      e3921b4c4f02        38 hours ago        17.87 MB
y12docker/bitcoind              0.12.0rc2.core      5703c45b2b76        2 weeks ago         17.87 MB
y12docker/bitcoind              0.11.2.core         461063d8f0c9        3 months ago        17.85 MB
y12docker/bitcoind              0.11.1.core         b78e45d78a88        4 months ago        17.83 MB
$ docker run y12docker/bitcoind:0.12.0.core bitcoind --version
Bitcoin Core Daemon version v0.12.0.0-g188ca9c

$ mkdir -p btc/data
$ echo -e "rpcuser=user\\nrpcpassword=pass\\nprune=2048\\n" > btc/bitcoin.conf
$ cat btc/bitcoin.conf
rpcuser=user
rpcpassword=pass
prune=2048
$ docker run -d -p 8333:8333 -p 8332:8332 -v $PWD/btc:/btc y12docker/bitcoind:0.12.0.core bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                            COMMAND                  CREATED             STATUS              PORTS                              NAMES
7dd5513e9ea5        y12docker/bitcoind:0.12.0.core   "bitcoind -conf=/btc/"   9 seconds ago       Up 8 seconds        0.0.0.0:8332-8333->8332-8333/tcp   modest_raman
$ alias bc='docker exec 7dd5513e9ea5 bitcoin-cli -conf=/btc/bitcoin.conf'
$ bc getinfo && bc getblockchaininfo && sudo du -h btc/data && date
{
  "version": 120000,
  "protocolversion": 70012,
  "walletversion": 60000,
  "balance": 0.00000000,
  "blocks": 68368,
  "timeoffset": 0,
  "connections": 8,
  "proxy": "",
  "difficulty": 45.38582234101263,
  "testnet": false,
  "keypoololdest": 1455847122,
  "keypoolsize": 101,
  "paytxfee": 0.00000000,
  "relayfee": 0.00001000,
  "errors": ""
}
{
  "chain": "main",
  "blocks": 68368,
  "headers": 399103,
  "bestblockhash": "00000000025b49a09c5799d27445a7f1287ab10f4de3ee086171e32a090f3a97",
  "difficulty": 45.38582234101263,
  "mediantime": 1279273433,
  "verificationprogress": 0.0003572843855920218,
  "chainwork": "000000000000000000000000000000000000000000000000000652214c96b583",
  "pruned": true,
  ...
  "pruneheight": 0
}
208K    btc/data/database
20K     btc/data/blocks/index
37M     btc/data/blocks
20K     btc/data/chainstate
51M     btc/data
Fri Feb 19 10:04:40 CST 2016

$ bc getinfo && bc getblockchaininfo && sudo du -h btc/data && date
{
  "version": 120000,
  "protocolversion": 70012,
  "walletversion": 60000,
  "balance": 0.00000000,
  "blocks": 132638,
  "timeoffset": 0,
  "connections": 8,
  "proxy": "",
  "difficulty": 876954.4935135372,
  "testnet": false,
  "keypoololdest": 1455847122,
  "keypoolsize": 101,
  "paytxfee": 0.00000000,
  "relayfee": 0.00001000,
  "errors": ""
}
{
  "chain": "main",
  "blocks": 132769,
  "headers": 399103,
  "bestblockhash": "000000000000047281d5b0f2e3eec7e8d0b6b4e7741c020b101bd52bc24b030f",
  "difficulty": 876954.4935135372,
  "mediantime": 1308816435,
  "verificationprogress": 0.003456508995790744,
  "chainwork": "00000000000000000000000000000000000000000000000152ae3a625a7bfd4a",
  "pruned": true,
  ..
  "pruneheight": 0
}
212K    btc/data/database
49M     btc/data/blocks/index
392M    btc/data/blocks
18M     btc/data/chainstate
438M    btc/data
Fri Feb 19 10:09:04 CST 2016

$ bc getinfo && bc getblockchaininfo && sudo du -h btc/data && date
{
  "version": 120000,
  "protocolversion": 70012,
  "walletversion": 60000,
  "balance": 0.00000000,
  "blocks": 186618,
  "timeoffset": 0,
  "connections": 8,
  "proxy": "",
  "difficulty": 1726566.55919348,
  "testnet": false,
  "keypoololdest": 1455847122,
  "keypoolsize": 101,
  "paytxfee": 0.00000000,
  "relayfee": 0.00001000,
  "errors": ""
}
{
  "chain": "main",
  "blocks": 186636,
  "headers": 399105,
  "bestblockhash": "00000000000005d34221a0d9e66509f8335ce009a8a5e1091fd0589dcad0de7d",
  "difficulty": 1726566.55919348,
  "mediantime": 1340896318,
  "verificationprogress": 0.01891650050936363,
  "chainwork": "00000000000000000000000000000000000000000000001409ef191c542a9804",
  "pruned": true,
 ..
  "pruneheight": 120108
}
244K    btc/data/database
99M     btc/data/blocks/index
2.1G    btc/data/blocks
85M     btc/data/chainstate
2.2G    btc/data
Fri Feb 19 10:25:45 CST 2016

$ bc getinfo && bc getblockchaininfo && sudo du -h btc/data && date
{
  "version": 120000,
  "protocolversion": 70012,
  "walletversion": 60000,
  "balance": 0.00000000,
  "blocks": 303185,
  "timeoffset": 0,
  "connections": 8,
  "proxy": "",
  "difficulty": 10455720138.48484,
  "testnet": false,
  "keypoololdest": 1455847122,
  "keypoolsize": 101,
  "paytxfee": 0.00000000,
  "relayfee": 0.00001000,
  "errors": ""
}
{
  "chain": "main",
  "blocks": 303189,
  "headers": 399119,
  "bestblockhash": "0000000000000000503ee25b3141c5da9c78c2d2049e6aad6bc72a335a4149b8",
  "difficulty": 10455720138.48484,
  "mediantime": 1401378494,
  "verificationprogress": 0.2171192932464616,
  "chainwork": "000000000000000000000000000000000000000000007503ab929243a5026a00",
  "pruned": true,
  ...
  "pruneheight": 295281
}
256K    btc/data/database
63M     btc/data/blocks/index
2.1G    btc/data/blocks
677M    btc/data/chainstate
2.8G    btc/data
Fri Feb 19 13:21:34 CST 2016

$ docker push y12docker/bitcoind:0.12.0.core
```

docker image y12docker/bitcoind:0.11.2.cl1

```
$ wget -qO- https://github.com/bitcoinclassic/bitcoinclassic/archive/v0.11.2.cl1.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep cl
y12docker/bitcoind              0.11.2.cl1          03a4886d9660        19 seconds ago      17.87 MB
$ docker run y12docker/bitcoind:0.11.2.cl1 bitcoind --version
Bitcoin Classic Daemon version v0.11.2.0-g27057bb
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.11.2.cl1 bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS              PORTS                              NAMES
aa057cd65a49        y12docker/bitcoind:0.11.2.cl1   "bitcoind -conf=/btc/"   22 seconds ago      Up 21 seconds       0.0.0.0:8332-8333->8332-8333/tcp   stoic_brown
$ alias bc='docker exec aa057cd65a49 bitcoin-cli -conf=/btc/bitcoin.conf'
$ bc getinfo
{
    "version" : 110200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 57845,
    "timeoffset" : 0,
    "connections" : 8,
    "proxy" : "",
    "difficulty" : 11.84622815,
    "testnet" : false,
    "keypoololdest" : 1455713286,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00005000,
    "errors" : ""
}
$ bc getnetworkinfo
{
    "version" : 110200,
    "subversion" : "/Classic:0.11.2/",
    "protocolversion" : 70002,
    "localservices" : "0000000000000001",
    "timeoffset" : 0,
    "connections" : 8,
    "networks" : [
        {
            "name" : "ipv4",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "ipv6",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "onion",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        }
    ],
    "relayfee" : 0.00005000,
    "localaddresses" : [
    ]
}
$ docker push y12docker/bitcoind:0.11.2.cl1

```

docker image y12docker/bitcoind:0.12.0rc5.core

```
$ wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.12.0rc5.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep core
y12docker/bitcoind              0.12.0rc5.core      e3921b4c4f02        19 minutes ago      17.87 MB
y12docker/bitcoind              0.12.0rc2.core      5703c45b2b76        2 weeks ago         17.87 MB
y12docker/bitcoind              0.11.2.core         461063d8f0c9        3 months ago        17.85 MB
y12docker/bitcoind              0.11.1.core         b78e45d78a88        4 months ago        17.83 MB
$ docker push y12docker/bitcoind:0.12.0rc5.core
```

docker image y12docker/bitcoind:0.12.0rc2.core
```
$ wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.12.0rc2.tar.gz | tar xvz -C ~/tmp
$ docker images | grep core
y12docker/bitcoind              0.12.0rc2.core      52629644a2f2        38 seconds ago      17.87 MB
$ docker run y12docker/bitcoind:0.12.0rc2.core bitcoind --version
Bitcoin Core Daemon version v0.12.0.0-g1bc1d79
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.12.0rc2.core bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                               COMMAND                  CREATED             STATUS              PORTS                              NAMES
038a1d8a89ae        y12docker/bitcoind:0.12.0rc2.core   "bitcoind -conf=/btc/"   4 seconds ago       Up 3 seconds        0.0.0.0:8332-8333->8332-8333/tcp   furious_ardinghelli
$ alias bc='docker exec 038a1d8a89ae bitcoin-cli -conf=/btc/bitcoin.conf'
$ bc getinfo
{
  "version": 120000,
  "protocolversion": 70012,
  "walletversion": 60000,
  "balance": 0.00000000,
  "blocks": 2480,
  "timeoffset": -1,
  "connections": 6,
  "proxy": "",
  "difficulty": 1,
  "testnet": false,
  "keypoololdest": 1454140868,
  "keypoolsize": 101,
  "paytxfee": 0.00000000,
  "relayfee": 0.00001000,
  "errors": ""
}
$ docker push y12docker/bitcoind:0.12.0rc2.core
```

docker image y12docker/bitcoind:0.11.2.bu

[gandrewstone/BitcoinUnlimited](https://github.com/gandrewstone/BitcoinUnlimited/tree/0.11cfg_stats)

```
$ git clone --depth 1 --branch 0.11cfg_stats --single-branch https://github.com/gandrewstone/BitcoinUnlimited ~/tmp/bitcoinbu-0.11.2
$ ./build.sh
$ docker images | grep 0.11.2.bu         
y12docker/bitcoind              0.11.2.bu           2f32a0373437        6 minutes ago       17.93 MB
$ docker run y12docker/bitcoind:0.11.2.bu bitcoind --version
Bitcoin Core Daemon version v0.11.2.0-b440a4f
Copyright (C) 2009-2015 The Bitcoin Unlimited Developers
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.11.2.bu bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                          COMMAND                  CREATED             STATUS              PORTS                              NAMES
8eaf306e0014        y12docker/bitcoind:0.11.2.bu   "bitcoind -conf=/btc/"   5 seconds ago       Up 5 seconds        0.0.0.0:8332-8333->8332-8333/tcp   reverent_meninsky
$ alias bc='docker exec 8eaf306e0014 bitcoin-cli -conf=/btc/bitcoin.conf'
$ bc getinfo
{
    "version" : 110200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 32,
    "timeoffset" : 0,
    "connections" : 2,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1450949722,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00005000,
    "errors" : ""
}
$ bc getblockchaininfo
{
    "chain" : "main",
    "blocks" : 160,
    "headers" : 22000,
    "bestblockhash" : "000000002819c10868c6cf2347766dbd0c6e6502dec7346edf57458cc058c026",
    "difficulty" : 1.00000000,
    "verificationprogress" : 0.00000072,
    "chainwork" : "000000000000000000000000000000000000000000000000000000a100a100a1",
    "pruned" : false,
    "softforks" : [
        {
            "id" : "bip34",
            "version" : 2,
            "enforce" : {
                "status" : false,
                "found" : 0,
                "required" : 750,
                "window" : 1000
            },
            "reject" : {
                "status" : false,
                "found" : 0,
                "required" : 950,
                "window" : 1000
            }
        },
        {
            "id" : "bip66",
            "version" : 3,
            "enforce" : {
                "status" : false,
                "found" : 0,
                "required" : 750,
                "window" : 1000
            },
            "reject" : {
                "status" : false,
                "found" : 0,
                "required" : 950,
                "window" : 1000
            }
        },
        {
            "id" : "bip65",
            "version" : 4,
            "enforce" : {
                "status" : false,
                "found" : 0,
                "required" : 750,
                "window" : 1000
            },
            "reject" : {
                "status" : false,
                "found" : 0,
                "required" : 950,
                "window" : 1000
            }
        }
    ]
}
$ bc getnetworkinfo
{
    "version" : 110200,
    "subversion" : "/BitcoinUnlimited:0.11.2/",
    "protocolversion" : 70002,
    "localservices" : "0000000000000001",
    "timeoffset" : 0,
    "connections" : 6,
    "networks" : [
        {
            "name" : "ipv4",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "ipv6",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "onion",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        }
    ],
    "relayfee" : 0.00005000,
    "localaddresses" : [
    ]
}

$ docker push y12docker/bitcoind:0.11.2.bu

```

docker image y12docker/bitcoind:0.11d.xt

[Release 0.11D · bitcoinxt/bitcoinxt](https://github.com/bitcoinxt/bitcoinxt/releases/tag/v0.11D)

```
$ docker version
Client:
 Version:      1.9.1
 API version:  1.21
 Go version:   go1.4.2
 Git commit:   a34a1d5
 Built:        Fri Nov 20 13:12:04 UTC 2015
 OS/Arch:      linux/amd64

Server:
 Version:      1.9.1
 API version:  1.21
 Go version:   go1.4.2
 Git commit:   a34a1d5
 Built:        Fri Nov 20 13:12:04 UTC 2015
 OS/Arch:      linux/amd64
$ git clone --depth 1 --branch 0.11D --single-branch https://github.com/bitcoinxt/bitcoinxt ~/tmp/bitcoinxt-0.11D
$ ./build.sh
$ docker images | grep 0.11d.xt
y12docker/bitcoind              0.11d.xt            48089e2232ab        14 minutes ago      25.64 MB
$ docker run y12docker/bitcoind:0.11d.xt bitcoind --version
Bitcoin XT Daemon version v0.11D
Copyright (C) 2009-2015 The Bitcoin XT Developers
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.11d.xt bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS              PORTS                              NAMES
ca5c6c87e7dc        y12docker/bitcoind:0.11d.xt   "bitcoind -conf=/btc/"   5 seconds ago       Up 5 seconds        0.0.0.0:8332-8333->8332-8333/tcp   determined_yalow
$ alias bc='docker exec ca5c6c87e7dc bitcoin-cli -conf=/btc/bitcoin.conf'
$ bc getinfo
{
    "version" : 110000,
    "protocolversion" : 70010,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 12264,
    "timeoffset" : 0,
    "connections" : 8,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1449800569,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}
$ bc getblockchaininfo
{
    "chain" : "main",
    "blocks" : 23861,
    "headers" : 387794,
    "bestblockhash" : "000000003528c490578d1527c635c0d234e7329f67d837d9a2379a8f9764ac9e",
    "difficulty" : 1.00000000,
    "verificationprogress" : 0.00010936,
    "chainwork" : "00000000000000000000000000000000000000000000000000005d365d365d36",
    "pruned" : false,
    "softforks" : [
        {
            "id" : "bip34",
            "version" : 2,
            "enforce" : {
                "status" : false,
                "found" : 0,
                "required" : 750,
                "window" : 1000
            },
            "reject" : {
                "status" : false,
                "found" : 0,
                "required" : 950,
                "window" : 1000
            }
        },
        {
            "id" : "bip66",
            "version" : 3,
            "enforce" : {
                "status" : false,
                "found" : 0,
                "required" : 750,
                "window" : 1000
            },
            "reject" : {
                "status" : false,
                "found" : 0,
                "required" : 950,
                "window" : 1000
            }
        },
        {
            "id" : "bip65",
            "version" : 4,
            "enforce" : {
                "status" : false,
                "found" : 0,
                "required" : 750,
                "window" : 1000
            },
            "reject" : {
                "status" : false,
                "found" : 0,
                "required" : 950,
                "window" : 1000
            }
        }
    ]
}

$ bc getnetworkinfo
{
    "version" : 110000,
    "subversion" : "/Bitcoin XT:0.11.0/",
    "protocolversion" : 70010,
    "localservices" : "0000000000000003",
    "timeoffset" : 0,
    "connections" : 8,
    "networks" : [
        {
            "name" : "ipv4",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "ipv6",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "onion",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        }
    ],
    "relayfee" : 0.00001000,
    "localaddresses" : [
    ]
}
$ docker push y12docker/bitcoind:0.11d.xt
```

docker image y12docker/bitcoind:0.11.2.core

```
$ wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.11.2.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep core
y12docker/bitcoind              0.11.2.core         0b7409c09d10        About a minute ago   17.85 MB
y12docker/bitcoind              0.11.1.core         c4de30f5f8f1        4 weeks ago          17.83 MB
$ docker run y12docker/bitcoind:0.11.2.core bitcoind --version
Bitcoin Core Daemon version v0.11.2.0-g7e27892
Copyright (C) 2009-2015 The Bitcoin Core Developers
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.11.2.core bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                            COMMAND                  CREATED             STATUS              PORTS                              NAMES
a7f5c47cbd3c        y12docker/bitcoind:0.11.2.core   "bitcoind -conf=/btc/"   8 seconds ago       Up 7 seconds        0.0.0.0:8332-8333->8332-8333/tcp   gigantic_lalande
$ alias bc='docker exec a7f5c47cbd3c bitcoin-cli -conf=/btc/bitcoin.conf'
$ bc getinfo
{
    "version" : 110200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 39410,
    "timeoffset" : 0,
    "connections" : 8,
    "proxy" : "",
    "difficulty" : 1.81864854,
    "testnet" : false,
    "keypoololdest" : 1447636777,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00005000,
    "errors" : ""
}
$ bc getnetworkinfo
{
    "version" : 110200,
    "subversion" : "/Satoshi:0.11.2/",
    "protocolversion" : 70002,
    "localservices" : "0000000000000001",
    "timeoffset" : 0,
    "connections" : 8,
    "networks" : [
        {
            "name" : "ipv4",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "ipv6",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "onion",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        }
    ],
    "relayfee" : 0.00005000,
    "localaddresses" : [
    ]
}

$ bc getblockchaininfo
{
    "chain" : "main",
    "blocks" : 28303,
    "headers" : 383765,
    "bestblockhash" : "0000000049ba2f4cac935fec2e8159682a42b4858e16c925cdcfabe1ad993847",
    "difficulty" : 1.00000000,
    "verificationprogress" : 0.00013432,
    "chainwork" : "00000000000000000000000000000000000000000000000000006e906e906e90",
    "pruned" : false,
    "softforks" : [
        {
            "id" : "bip34",
            "version" : 2,
            "enforce" : {
                "status" : false,
                "found" : 0,
                "required" : 750,
                "window" : 1000
            },
            "reject" : {
                "status" : false,
                "found" : 0,
                "required" : 950,
                "window" : 1000
            }
        },
        {
            "id" : "bip66",
            "version" : 3,
            "enforce" : {
                "status" : false,
                "found" : 0,
                "required" : 750,
                "window" : 1000
            },
            "reject" : {
                "status" : false,
                "found" : 0,
                "required" : 950,
                "window" : 1000
            }
        },
        {
            "id" : "bip65",
            "version" : 4,
            "enforce" : {
                "status" : false,
                "found" : 0,
                "required" : 750,
                "window" : 1000
            },
            "reject" : {
                "status" : false,
                "found" : 0,
                "required" : 950,
                "window" : 1000
            }
        }
    ]
}

$ docker push y12docker/bitcoind:0.11.2.core

```

docker image y12docker/bitcoind:0.11.1.core

```
$ wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.11.1.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep core
y12docker/bitcoind              0.11.1.core         c4de30f5f8f1        23 seconds ago      17.83 MB
$ docker run y12docker/bitcoind:0.11.1.core bitcoind --version
Bitcoin Core Daemon version v0.11.1.0-gcf33f19
Copyright (C) 2009-2015 The Bitcoin Core Developers
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.11.1.core bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
bbc67af64a7e        y12docker/bitcoind:0.11.1.core   "bitcoind -conf=/btc/"   5 seconds ago       Up 4 seconds        0.0.0.0:8332-8333->8332-8333/tcp   thirsty_stallman
$ alias bc='docker exec bbc67af64a7e bitcoin-cli -conf=/btc/bitcoin.conf'
$ bc getnetworkinfo
{
    "version" : 110100,
    "subversion" : "/Satoshi:0.11.1/",
    "protocolversion" : 70002,
    "localservices" : "0000000000000001",
    "timeoffset" : 0,
    "connections" : 5,
    "networks" : [
        {
            "name" : "ipv4",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "ipv6",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "onion",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        }
    ],
    "relayfee" : 0.00005000,
    "localaddresses" : [
    ]
}
$ bc getinfo
{
    "version" : 110100,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 256,
    "timeoffset" : 0,
    "connections" : 7,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1444917821,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00005000,
    "errors" : ""
}
$ docker stop bbc67af64a7e
$ docker push y12docker/bitcoind:0.11.1.core
```

docker image y12docker/bitcoind:0.11c.xt

[Release 0.11C · bitcoinxt/bitcoinxt](https://github.com/bitcoinxt/bitcoinxt/releases/tag/v0.11C)

```
$ git clone --depth 1 --branch 0.11C --single-branch https://github.com/bitcoinxt/bitcoinxt ~/tmp/bitcoinxt-0.11C
$ ./build.sh
$ docker images | grep xt
y12docker/bitcoind              0.11c.xt            441a32d10432        25 seconds ago      25.59 MB
$ docker version
Client:
 Version:      1.8.3
 API version:  1.20
 Go version:   go1.4.2
 Git commit:   f4bf5c7
 Built:        Mon Oct 12 05:37:18 UTC 2015
 OS/Arch:      linux/amd64

Server:
 Version:      1.8.3
 API version:  1.20
 Go version:   go1.4.2
 Git commit:   f4bf5c7
 Built:        Mon Oct 12 05:37:18 UTC 2015
 OS/Arch:      linux/amd64
$ docker run y12docker/bitcoind:0.11c.xt bitcoind --version
Bitcoin XT Daemon version v0.11.0C-f725006
Copyright (C) 2009-2015 The Bitcoin XT Developers
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.11c.xt bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS              PORTS                              NAMES
119c024f1707        y12docker/bitcoind:0.11c.xt   "bitcoind -conf=/btc/"   7 seconds ago       Up 6 seconds        0.0.0.0:8332-8333->8332-8333/tcp   dreamy_ritchie
$ alias xtc='docker exec 119c024f1707 bitcoin-cli -conf=/btc/bitcoin.conf'
$ xtc getnetworkinfo
{
    "version" : 110000,
    "subversion" : "/Bitcoin XT:0.11.0/",
    "protocolversion" : 70010,
    "localservices" : "0000000000000003",
    "timeoffset" : 0,
    "connections" : 8,
    "networks" : [
        {
            "name" : "ipv4",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "ipv6",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "onion",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        }
    ],
    "relayfee" : 0.00001000,
    "localaddresses" : [
    ]
}
$ xtc getinfo
{
    "version" : 110000,
    "protocolversion" : 70010,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 1472,
    "timeoffset" : 0,
    "connections" : 8,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1444699701,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}
$ docker push y12docker/bitcoind:0.11c.xt
```

Wed Sep  9 15:22:12 CST 2015

docker image y12docker/bitcoind:0.11.0b.xt

```
$ git clone --depth 1 --branch 0.11B --single-branch https://github.com/bitcoinxt/bitcoinxt ~/tmp/bitcoinxt-0.11B
$ ./build.sh
$ docker images | grep xt
y12docker/bitcoind              0.11.0b.xt          0be7d91a0d97        About a minute ago   25.59 MB
$ docker run y12docker/bitcoind:0.11.0b.xt bitcoind --version
Bitcoin XT Daemon version v0.11.0B-61c295e
Copyright (C) 2009-2015 The Bitcoin XT Developers
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.11.0b.xt bitcoind -stealth-mode -conf=/btc/bitcoin.conf -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS              PORTS                              NAMES
d0453631cfd7        y12docker/bitcoind:0.11.0b.xt   "bitcoind -stealth-mo"   7 seconds ago       Up 6 seconds        0.0.0.0:8332-8333->8332-8333/tcp   sharp_torvalds
$ alias xtc='docker exec d0453631cfd7 bitcoin-cli -conf=/btc/bitcoin.conf'
$ xtc getnetworkinfo
{
    "version" : 110000,
    "subversion" : "/Bitcoin XT:0.11.0/",
    "protocolversion" : 70010,
    "localservices" : "0000000000000003",
    "timeoffset" : -1,
    "connections" : 8,
    "networks" : [
        {
            "name" : "ipv4",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "ipv6",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "onion",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        }
    ],
    "relayfee" : 0.00001000,
    "localaddresses" : [
    ]
}

```

Mon Jul 13 08:42:43 CST 2015

```
$ wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.11.0.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep bitcoind
y12docker/bitcoind              0.11.0              8cd350257803        34 seconds ago      17.82 MB
y12docker/bitcoind              0.10.2              7c42c250bb4a        5 weeks ago         17.57 MB
y12docker/bitcoind              0.10.1              42b87f71220f        10 weeks ago        17.56 MB
$ docker run y12docker/bitcoind:0.11.0 bitcoind --version
Bitcoin Core Daemon version v0.11.0.0-gd26f951
Copyright (C) 2009-2015 The Bitcoin Core Developers

$ docker run y12docker/bitcoind:0.11.0 bitcoin-cli --version
Bitcoin Core RPC client version v0.11.0.0-gd26f951

$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.11.0 bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
aa3c13d995bff24ea0bf298a92102520d84a5687532d33bb5710ea4dc21531a9
$ docker ps
CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                              NAMES
aa3c13d995bf        y12docker/bitcoind:0.11.0   "bitcoind -conf=/btc   19 seconds ago      Up 18 seconds       0.0.0.0:8332-8333->8332-8333/tcp   evil_lalande  
$ docker exec aa3c13d995bf bitcoin-cli -conf=/btc/bitcoin.conf getinfo
{
    "version" : 110000,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 176,
    "timeoffset" : 0,
    "connections" : 3,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1436748592,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}
```


build bitcoin core 0.10.2
=======

Tue Jun  2 12:07:29 CST 2015

```
$ wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.10.2.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep bitcoind
y12docker/bitcoind       0.10.2              7c42c250bb4a        41 seconds ago      17.57 MB
y12docker/bitcoind       0.10.1              42b87f71220f        5 weeks ago         17.56 MB
$ docker run y12docker/bitcoind:0.10.2 bitcoind --version
Bitcoin Core Daemon version v0.10.2.0-g16f4560

$ docker run y12docker/bitcoind:0.10.2 bitcoin-cli --version
Bitcoin Core RPC client version v0.10.2.0-g16f4560

$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.10.2 bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
53d6837b0d552c846289c04e2cf43ae2fa459764c2f5466664fda302eb9fd508
$ docker ps
CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                                            NAMES
53d6837b0d55        y12docker/bitcoind:0.10.2   "bitcoind -conf=/btc   18 seconds ago      Up 17 seconds       0.0.0.0:8332->8332/tcp, 0.0.0.0:8333->8333/tcp   cranky_colden

$ docker exec 53d683 bitcoin-cli -conf=/btc/bitcoin.conf getinfo

{
    "version" : 100200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 816,
    "timeoffset" : -1,
    "connections" : 8,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1433218448,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}

$ docker push y12docker/bitcoind:0.10.2  
The push refers to a repository [y12docker/bitcoind] (len: 1)
Sending image list
Pushing repository y12docker/bitcoind (1 tags)
bc02dbdd50e8: Image successfully pushed
7c42c250bb4a: Image successfully pushed
Pushing tag for rev [7c42c250bb4a] on {https://cdn-registry-1.docker.io/v1/repositories/y12docker/bitcoind/tags/0.10.2}

```


build bitcoind 0.10.1
======================

Mon Apr 27 17:11:23 CST 2015

```
$ wget -qO- https://github.com/bitcoin/bitcoin/archive/v0.10.1.tar.gz | tar xvz -C ~/tmp
$ ./build.sh
$ docker images | grep bitcoind
y12docker/bitcoind       0.10.1              42b87f71220f        22 seconds ago      17.56 MB
y12docker/bitcoind       0.10.0              d67c46333a2a        2 weeks ago         17.56 MB
$ docker run y12docker/bitcoind:0.10.1 bitcoind --version
Bitcoin Core Daemon version v0.10.1.0-gd8ac901
$ docker run y12docker/bitcoind:0.10.1 bitcoin-cli --version
Bitcoin Core RPC client version v0.10.1.0-gd8ac901
$ docker run -d -p 8333:8333 -p 8332:8332 y12docker/bitcoind:0.10.1 bitcoind -conf=/btc/bitcoin.conf -datadir=/btc/data
59cc8380e7413a1aa678561f9674653fe4ea1f786400b9475eb4a1a88c54c387

$ docker ps
CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                                            NAMES
59cc8380e741        y12docker/bitcoind:0.10.1   "bitcoind -conf=/btc   13 seconds ago      Up 12 seconds       0.0.0.0:8332->8332/tcp, 0.0.0.0:8333->8333/tcp   stupefied_hopper

$ docker exec 59cc83 bitcoin-cli -conf=/btc/bitcoin.conf getinfo
{
    "version" : 100100,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 304,
    "timeoffset" : 0,
    "connections" : 2,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1430126444,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}

```

build bitcoind 0.10.0
=====================

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
