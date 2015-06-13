Build [ElementsProject/elements](https://github.com/ElementsProject/elements)
======

Sat Jun 13 09:19:58 CST 2015

```
$ cd ~/tmp/elements && git pull
$ ./build.sh
$ docker run y12docker/elements-alpha:v150613 alphad --version

Elements Alpha Daemon version v0.10.2.0-8865ad9
Copyright (C) 2009-2015 The Bitcoin Core Developers

This is experimental software.

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

/alphad -rpcuser=$RPC_USER -rpcpassword=$RPC_PASS -testnet -rpcconnect=127.0.0.1 -rpcconnectport=18332 -tracksidechain=all -txindex -blindtrust=true -daemon

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
