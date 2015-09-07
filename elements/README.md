Build [ElementsProject/elements](https://github.com/ElementsProject/elements)
=====
Mon Sep  7 18:40:45 CST 2015

build y12docker/elements-alpha:v150907

```
$ rm -rf ~/tmp/elements
$ git clone --depth 1 --branch alpha --single-branch https://github.com/ElementsProject/elements ~/tmp/elements
$ ./build.sh
$ docker images | grep elements
y12docker/elements-alpha        v150907             ef5f4174fc6c        5 minutes ago       18.42 MB
$ docker run y12docker/elements-alpha:v150907 alphad --version
Elements Alpha Daemon version v0.10.2.0-538c0f6
Copyright (C) 2009-2015 The Bitcoin Core Developers
$ docker push y12docker/elements-alpha:v150907

```

Mon Aug 24 15:10:18 CST 2015

rebuild alpha-0.10-multi-asset

```
$ git clone --depth 1 --branch alpha-0.10-multi-asset --single-branch https://github.com/ElementsProject/elements ~/tmp/elements
$ ./build-asset.sh
$ docker images | grep elements
y12docker/elements-alpha        v150824asset        7f4c252b59cb        7 minutes ago       15.67 MB
$ docker run -d y12docker/elements-alpha:v150817 alphad -regtest -testnet=0 \
  -rpcconnect=127.0.0.1 -rpcconnectport=18332 -tracksidechain=all -txindex -blindtrust=true \
  -conf=/btc/bitcoin.conf  -datadir=/btc/data
$ docker ps
CONTAINER ID        IMAGE                              COMMAND
  8e5c2308284f        y12docker/elements-alpha:v150817   "alphad -regtest -tes"
$ alias ela='docker exec 8e5c2308284f alpha-cli -conf=/btc/bitcoin.conf'
$ ela --version
Elements Alpha RPC client version v0.10.2.0-601116f
$ ela getinfo
{
    "version" : 100200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 0,
    "timeoffset" : 0,
    "connections" : 0,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1440401196,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : "This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"
}

$ ela setgenerate true 10
$ ela getinfo
{
    "version" : 100200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 10500000.00000000,
    "blocks" : 11,
    "timeoffset" : 0,
    "connections" : 0,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1440401196,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : "This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"
}
$ ela getnewaddress
22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQJZEsThqA3oM1ff2SeK7Fh6mfupynBeGfr
$ ela sendtoaddress 22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQJZEsThqA3oM1ff2SeK7Fh6mfupynBeGfr 10.05
e067ec45676e6092f913e2f08dd0dba6a8d5956b2857e7454b67accc5f8b7452
$ ela getrawtransaction e067ec45676e6092f913e2f08dd0dba6a8d5956b2857e7454b67accc5f8b7452 1 > e067ec.json
```

Mon Aug 17 15:13:51 CST 2015

build multi-asset-0.11

```
$ git clone --depth 1 --branch multi-asset-0.11 --single-branch https://github.com/ElementsProject/elements ~/tmp/elements
$ ./build-asset.sh
$ ls bin
bitcoin-cli  bitcoind  bitcoin-tx
```

build alpha

```
$ docker version
Client:
 Version:      1.8.1
 API version:  1.20
 Go version:   go1.4.2
 Git commit:   d12ea79
 Built:        Thu Aug 13 02:35:49 UTC 2015
 OS/Arch:      linux/amd64

Server:
 Version:      1.8.1
 API version:  1.20
 Go version:   go1.4.2
 Git commit:   d12ea79
 Built:        Thu Aug 13 02:35:49 UTC 2015
 OS/Arch:      linux/amd64

$ git clone --depth 1 --branch alpha --single-branch https://github.com/ElementsProject/elements ~/tmp/elements
$ ./build.sh
$ docker images | grep elements
y12docker/elements-alpha        v150817             16d1fa34e73a        45 seconds ago      18.41 MB
y12docker/elements-alpha        v150815asset        a101b12efaed        20 hours ago        18.3 MB
y12docker/elements-alpha        v150613             edc4693aa1bd        9 weeks ago         18.28 MB
$ docker run y12docker/elements-alpha:v150817 alphad --version
Elements Alpha Daemon version v0.10.2.0-601116f
$ docker run -d y12docker/elements-alpha:v150817 alphad -regtest \
  -testnet=0 -rpcconnect=127.0.0.1 -rpcconnectport=18332 -tracksidechain=all -txindex -blindtrust=true \
  -conf=/btc/bitcoin.conf  -datadir=/btc/data
$ docker ps
  CONTAINER ID        IMAGE                              COMMAND                  CREATED             STATUS              PORTS               NAMES
  67bd3cbc4d27        y12docker/elements-alpha:v150817   "alphad -testnet -rpc"   5 seconds ago       Up 4 seconds                            stupefied_swartz

$ alias ela='docker exec 67bd3cbc4d27 alpha-cli -conf=/btc/bitcoin.conf'
$ ela getinfo
{
    "version" : 100200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 0,
    "timeoffset" : 0,
    "connections" : 0,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1439797102,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : "This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"
}

$ ela setgenerate true 10
[
    "966cc50175ba2401fe5bfdf5ce5a00fc8622e011a5242e2e9fb39dc86ce9b1e1",
    "58f70ccf526e918adac5ae7ebfd8612be693d0fb370da6923aab7c827a35f4b7",
    "1c0b36bee1ae9cadf76e6a8a676fd0b89f9ef8a1db8554677bcdb634aef112a8",
    "494f251e3f92ff568b1b111a85efbd7004b2d515f8c9cedd03067faf44e2bfd8",
    "070c068f061defafb9a653a412c1eb3d490dd59d07f6126af42ddcb1abb8d990",
    "e15871547fba98a06d67c368bd82e00255b04ce2b8f90252e653cd029aafb96e",
    "79e88e7f75e2d8ba2a18a01607c80b6a54c5ed91f474451c141d998381d5fcee",
    "5038a05f81dfb70fbc2b022dba90a6aadc12c85e56e6b699b4325bd2b315f775",
    "6bccc70fa43e1ebc535f06a5c2958ca9a82dfbd9ba802fbf8e48784017432618",
    "e6ef8553981ad8577e35d3e3cd15d1f81a55989220c5583775fa51d3a52f6f19"
]
$ ela getinfo
{
    "version" : 100200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 10500000.00000000,
    "blocks" : 10,
    "timeoffset" : 0,
    "connections" : 0,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1439797102,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : "This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"
}

$ ela getnewaddress
22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQZtkrJNqvfZsoEDqEesAQ6aTVbYtngk4qP
$ ela sendtoaddress 22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQZtkrJNqvfZsoEDqEesAQ6aTVbYtngk4qP 1.5
cc1f6e2653aff16d28b32cd84fd4fafbb84548aea477db917f0ca7f7d80de9d2
$ ela setgenerate true 1
[
    "7f8b98f656d8ffa592baba7decbdce3fb31e522d00e8673f72837c45d56d4d29"
]
$ ela getrawtransaction cc1f6e2653aff16d28b32cd84fd4fafbb84548aea477db917f0ca7f7d80de9d2 1 > cc1f6e.json
$ ela getwalletinfo
{
    "walletversion" : 60000,
    "balance" : 10499999.99993180,
    "txcount" : 13,
    "keypoololdest" : 1439797102,
    "keypoolsize" : 101
}
```

Sun Aug 16 18:24:03 CST 2015

build alpha-0.10-multi-asset

```
$ git clone --depth 1 --branch alpha-0.10-multi-asset --single-branch https://github.com/ElementsProject/elements ~/tmp/elements
$ ./build-asset.sh
$ docker images | grep elements
y12docker/elements-alpha        v150815asset        b9dad57ce023        57 seconds ago      18.3 MB
$ docker run y12docker/elements-alpha:v150815asset alphad --version
Elements Alpha Daemon version v0.10.2.0-d3b5516

$ bin/alphad -testnet -rpcconnect=127.0.0.1 -rpcconnectport=18332 -tracksidechain=all -txindex -blindtrust=true -conf=bitcoin.conf  -datadir=.
Segmentation fault (core dumped)

$ cat alphatestnet3/debug.log
2015-08-17 08:08:13 init message: Verifying blocks...
2015-08-17 08:08:13  block index              26ms
2015-08-17 08:08:13 No wallet compiled in!
2015-08-17 08:08:13 ERROR: CheckTransaction: vTxFees bigger than vout
2015-08-17 08:08:13 ERROR: CheckBlock() : CheckTransaction failed
2015-08-17 08:08:13 InvalidChainFound: invalid block=ad5cb13bc360f0cbc4ba3dca881e6a771d05052469edb73e54956b5225918846  height=0  log2_work=0  date=2011-02-02 23:16:42
```


Sat Jun 13 09:19:58 CST 2015

```
$ cd ~/tmp/elements && git pull
$ ./build.sh
$ docker run y12docker/elements-alpha:v150613 alphad --version

Elements Alpha Daemon version v0.10.2.0-8865ad9
Copyright (C) 2009-2015 The Bitcoin Core Developers

```

Wed Jun 10 11:58:14 CST 2015

```
$ cd ~/tmp
$ git clone --depth 1 https://github.com/ElementsProject/elements && cd elements && git checkout alpha
$ ./build.sh


$  docker images | grep elements
y12docker/elements-alpha   v150610             52edf9c07b30        About a minute ago   18.27 MB

$ docker run y12docker/elements-alpha:v150610 alphad --version
$ alias elements='docker run y12docker/elements-alpha:v150610'
$ elements alphad --version
Elements Alpha Daemon version v0.10.2.0-60c582a
Copyright (C) 2009-2015 The Bitcoin Core Developers


$ elements alpha-cli --version
Elements Alpha RPC client version v0.10.2.0-60c582a

$ docker run -d -p 18333:18333 -p 18332:18332 y12docker/elements-alpha:v150610 alphad \
  -testnet -rpcconnect=127.0.0.1 -rpcconnectport=18332 -tracksidechain=all -txindex -blindtrust=true \
  -conf=/btc/bitcoin.conf  -datadir=/btc/data

b3ac417dc213349ea720d09155622ce453834b5adbdb207e5760c143e951f5a7

$ docker ps
CONTAINER ID        IMAGE                              COMMAND                CREATED             STATUS              PORTS                                                NAMES
b3ac417dc213        y12docker/elements-alpha:v150610   "alphad -testnet -rp   3 seconds ago       Up 1 seconds        0.0.0.0:18332->18332/tcp, 0.0.0.0:18333->18333/tcp   evil_fermi

$ docker exec b3ac417 alpha-cli -conf=/btc/bitcoin.conf getnewaddress
22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQYAq6bkF3Ht4nQnetv5gT4Q71dpE8xTaJV

$ docker exec b3ac417 alpha-cli -conf=/btc/bitcoin.conf getinfo
{
    "version" : 100200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 0,
    "timeoffset" : 0,
    "connections" : 0,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : true,
    "keypoololdest" : 1433910770,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : "This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"
}

$ docker exec b3ac417 alpha-cli -conf=/btc/bitcoin.conf help
== Blockchain ==
getbestblockhash
getblock "hash" ( verbose )
getblockchaininfo
getblockcount
getblockhash index
getchaintips
getdifficulty
getmempoolinfo
getrawmempool ( verbose )
gettxout "txid" n ( includemempool )
gettxoutproof ["txid",...] ( blockhash )
gettxoutsetinfo
verifychain ( checklevel numblocks )
verifytxoutproof "proof"

== Control ==
getinfo
help ( "command" )
stop

== Generating ==
combineblocksigs "blockhex" ["signature",...]
getgenerate
getnewblockhex
setgenerate generate ( genproclimit )
signblock "blockhex"

== Mining ==
getblocktemplate ( "jsonrequestobject" )
getmininginfo
getnetworkhashps ( blocks height )
prioritisetransaction <txid> <priority delta> <fee delta>
submitblock "hexdata" ( "jsonparametersobject" )

== Network ==
addnode "node" "add|remove|onetry"
getaddednodeinfo dns ( "node" )
getconnectioncount
getnettotals
getnetworkinfo
getpeerinfo
ping

== Rawtransactions ==
blindrawtransaction "hexstring" ["totalblinder"]
createrawtransaction [{"txid":"id","vout":n},...] {"address":amount,...}
decoderawtransaction "hexstring"
decodescript "hex"
fundrawtransaction "hexstring"
getrawtransaction "txid" ( verbose )
rawblindrawtransaction "hexstring" ["inputblinder",...] ["totalblinder"]
sendrawtransaction "hexstring" ( allowhighfees )
signrawtransaction "hexstring" ( [{"txid":"id","vout":n,"scriptPubKey":"hex","redeemScript":"hex"},...] ["privatekey1",...] sighashtype )

== Util ==
createmultisig nrequired ["key",...]
estimatefee nblocks
estimatepriority nblocks
validateaddress "bitcoinaddress"
verifymessage "bitcoinaddress" "signature" "message"

== Wallet ==
addmultisigaddress nrequired ["key",...] ( "account" )
backupwallet "destination"
dumpprivkey "bitcoinaddress"
dumpwallet "filename"
encryptwallet "passphrase"
getaccount "bitcoinaddress"
getaccountaddress "account"
getaddressesbyaccount "account"
getbalance ( "account" minconf includeWatchonly )
getnewaddress ( "account" )
getrawchangeaddress
getreceivedbyaccount "account" ( minconf )
getreceivedbyaddress "bitcoinaddress" ( minconf )
gettransaction "txid" ( includeWatchonly )
getunconfirmedbalance
getwalletinfo
importaddress "address" ( "label" rescan )
importprivkey "bitcoinprivkey" ( "label" rescan )
importwallet "filename"
keypoolrefill ( newsize )
listaccounts ( minconf includeWatchonly)
listaddressgroupings
listlockunspent
listreceivedbyaccount ( minconf includeempty includeWatchonly)
listreceivedbyaddress ( minconf includeempty includeWatchonly)
listsinceblock ( "blockhash" target-confirmations includeWatchonly)
listtransactions ( "account" count from includeWatchonly)
listunspent ( minconf maxconf  ["address",...] )
lockunspent unlock [{"txid":"txid","vout":n},...]
move "fromaccount" "toaccount" amount ( minconf "comment" )
sendfrom "fromaccount" "tobitcoinaddress" amount ( minconf "comment" "comment-to" )
sendmany "fromaccount" {"address":amount,...} ( minconf "comment" )
sendtoaddress "bitcoinaddress" amount ( "comment" "comment-to" )
setaccount "bitcoinaddress" "account"
settxfee amount
signmessage "bitcoinaddress" "message"

$ docker push y12docker/elements-alpha:v150610
```
