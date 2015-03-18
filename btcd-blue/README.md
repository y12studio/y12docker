[btcsuite/btcd](https://github.com/btcsuite/btcd)

Wed Mar 18 16:13:37 CST 2015

[btcsuite/btcwallet](https://github.com/btcsuite/btcwallet)

```
root@alice:/btcd# btcwallet -u user -P pass --create
Enter the private passphrase for your new wallet:
Confirm passphrase:
Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:
Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:
Your wallet generation seed is:
5addf9413448ebe582a3e7cab3339cdc040320f3d180b716cdfc9eb6369b099f
IMPORTANT: Keep the seed in a safe place as you
will NOT be able to restore your wallet without it.
Please keep in mind that anyone who has access
to the seed can also restore your wallet thereby
giving them access to all your funds, so it is
imperative that you keep it in a secure location.
Once you have stored the seed in a safe and secure location, enter "OK" to continue: OK
Creating the wallet...
The wallet has been created successfully.

root@alice:/btcd# btcwallet -u user -P pass
09:06:38 2015-03-18 [INF] BTCW: Opened wallet files
09:06:38 2015-03-18 [INF] BTCW: Generating TLS certificates...
09:06:38 2015-03-18 [INF] BTCW: Done generating TLS certificates
09:06:38 2015-03-18 [INF] BTCW: RPCS: RPC server listening on 127.0.0.1:18332
09:06:38 2015-03-18 [INF] BTCW: RPCS: RPC server listening on [::1]:18332
09:06:38 2015-03-18 [WRN] BTCW: Cannot open CA file: open /root/.btcwallet/btcd.cert: no such file or directory

```

setgenerate true 101 issue

[Developer Reference - Bitcoin](https://bitcoin.org/en/developer-reference#setgenerate)

Parameter 2 (regular)—the number of processors to use

Parameter 2 (regtest)—the number of blocks to generate

```

$ alicesh

# rt setgenerate true 1

alice_1 | 08:38:55 2015-03-18 [INF] MINR: Block submitted via CPU miner accepted (hash 0000c9a8fc9c4ca8fd5dfedf4dea5b90c42eb4754bd4d0a1fd4a5a8b34b41d52, amount 0 BTC)
alice_1 | 08:38:55 2015-03-18 [INF] MINR: Block submitted via CPU miner accepted (hash 0000bc4ed986038882a7163214fe7a9e30bfb3b352481255df870f859cd988b5, amount 0 BTC)
alice_1 | 08:38:55 2015-03-18 [INF] MINR: Block submitted via CPU miner accepted (hash 00062d95b25ec4e6f5fdd0fe268cae2c692e34abbca53ad4d731d4fd416390ea, amount 0 BTC)
alice_1 | 08:38:55 2015-03-18 [INF] MINR: Block submitted via CPU miner accepted (hash 0003b048168b230aa027af7cc081616e9e63871f56b5db76493d58ee1e984f92, amount 0 BTC)
alice_1 | 08:38:55 2015-03-18 [INF] MINR: Block submitted via CPU miner accepted (hash 0004a95f71d4ea8c9f6b864bc02ee3fcaa844207b6775c6e85fe7f297342c9c0, amount 0 BTC)
alice_1 | 08:38:55 2015-03-18 [INF] MINR: Block submitted via CPU miner accepted (hash 0001ae14719f8454c6512e058c0209424090ca626a67bee321bc1829d82393e4, amount 0 BTC)


root@alice:/btcd# rt getinfo
{
  "version": 100000,
  "protocolversion": 70002,
  "blocks": 20279,
  "timeoffset": 0,
  "connections": 1,
  "proxy": "",
  "difficulty": 262145.97,
  "testnet": false,
  "relayfee": 1e-05
}

```

rewrite docker-compose.yml

```
$ dc logs
Attaching to btcdblue_btcd_1, btcdblue_alice_1, btcdblue_seeda_1
alice_1 | *** Running /etc/rc.local...
alice_1 | *** Booting runit daemon...
alice_1 | *** Runit started as PID 8
alice_1 | 08:11:09 2015-03-18 [INF] BTCD: Version 0.10.0-beta
alice_1 | 08:11:09 2015-03-18 [INF] BTCD: Loading block database from '/root/btcd/data/regtest/blocks_leveldb'
alice_1 | 08:11:09 2015-03-18 [INF] BTCD: Inserted genesis block 0f9188f13cb7b2c71f2a335e3a4fc328bf5beb436012afca590b1a11466e2206
alice_1 | 08:11:09 2015-03-18 [INF] BTCD: Block database loaded with block height 0
alice_1 | 08:11:09 2015-03-18 [INF] BMGR: Generating initial block node index.  This may take a while...
alice_1 | 08:11:09 2015-03-18 [INF] BMGR: Block index generation complete
alice_1 | 08:11:09 2015-03-18 [INF] SRVR: Server listening on 0.0.0.0:12333
alice_1 | 08:11:09 2015-03-18 [INF] SRVR: Server listening on [::]:12333
alice_1 | 08:11:09 2015-03-18 [INF] AMGR: Loaded 0 addresses from file '/root/btcd/data/regtest/peers.json'
alice_1 | Mar 18 08:11:09 alice syslog-ng[14]: syslog-ng starting up; version='3.5.3'
alice_1 | 08:11:09 2015-03-18 [INF] RPCS: RPC server listening on 127.0.0.1:12332
alice_1 | 08:11:09 2015-03-18 [INF] BMGR: New valid peer seeda:12333 (outbound) (/btcwire:0.2.0/btcd:0.10.0/)
seeda_1 | *** Running /etc/rc.local...
seeda_1 | *** Booting runit daemon...
seeda_1 | *** Runit started as PID 9
seeda_1 | 08:11:09 2015-03-18 [INF] BTCD: Version 0.10.0-beta
seeda_1 | 08:11:09 2015-03-18 [INF] BTCD: Loading block database from '/root/btcd/data/regtest/blocks_leveldb'
seeda_1 | 08:11:09 2015-03-18 [INF] BTCD: Inserted genesis block 0f9188f13cb7b2c71f2a335e3a4fc328bf5beb436012afca590b1a11466e2206
seeda_1 | 08:11:09 2015-03-18 [INF] BTCD: Block database loaded with block height 0
seeda_1 | 08:11:09 2015-03-18 [INF] BMGR: Generating initial block node index.  This may take a while...
seeda_1 | 08:11:09 2015-03-18 [INF] BMGR: Block index generation complete
seeda_1 | 08:11:09 2015-03-18 [INF] SRVR: Server listening on 0.0.0.0:12333
seeda_1 | 08:11:09 2015-03-18 [INF] SRVR: Server listening on [::]:12333
seeda_1 | 08:11:09 2015-03-18 [INF] AMGR: Loaded 0 addresses from file '/root/btcd/data/regtest/peers.json'
seeda_1 | Mar 18 08:11:09 9f334283369f syslog-ng[16]: syslog-ng starting up; version='3.5.3'
seeda_1 | 08:11:09 2015-03-18 [INF] RPCS: RPC server listening on 127.0.0.1:12332
seeda_1 | 08:11:09 2015-03-18 [INF] BMGR: New valid peer 172.17.0.39:40947 (inbound) (/btcwire:0.2.0/btcd:0.10.0/)

root@alice:/btcd# rt getpeerinfo
[
  {
    "id": 1,
    "addr": "seeda:12333",
    "services": "00000001",
    "lastsend": 1426666269,
    "lastrecv": 1426666269,
    "bytessent": 185,
    "bytesrecv": 161,
    "conntime": 1426666269,
    "timeoffset": 0,
    "pingtime": 0,
    "version": 70002,
    "subver": "/btcwire:0.2.0/btcd:0.10.0/",
    "inbound": false,
    "startingheight": 0,
    "banscore": 0,
    "syncnode": false
  }
]
root@alice:/btcd# rt getinfo
{
  "version": 100000,
  "protocolversion": 70002,
  "blocks": 0,
  "timeoffset": 0,
  "connections": 1,
  "proxy": "",
  "difficulty": 1,
  "testnet": false,
  "relayfee": 1e-05
}

```

Wed Mar 18 09:00:58 CST 2015

```
$ source alias.sh
$ dc build
$ dc up -d
$ dc ps
      Name            Command      State           Ports
----------------------------------------------------------------
btcdblue_alice_1   /sbin/my_init   Up       12332/tcp, 12333/tcp
btcdblue_bob_1     /sbin/my_init   Up       12332/tcp, 12333/tcp
btcdblue_btcd_1    /bin/true       Exit 0
btcdblue_seeda_1   /sbin/my_init   Up       12332/tcp, 12333/tcp

$ dc logs
Attaching to btcdblue_btcd_1, btcdblue_alice_1, btcdblue_seeda_1
alice_1 | *** Running /etc/my_init.d/00_regen_ssh_host_keys.sh...
alice_1 | No SSH host key available. Generating one...
alice_1 | Creating SSH2 RSA key; this may take some time ...
alice_1 | Creating SSH2 DSA key; this may take some time ...
alice_1 | Creating SSH2 ECDSA key; this may take some time ...
alice_1 | Creating SSH2 ED25519 key; this may take some time ...
alice_1 | invoke-rc.d: policy-rc.d denied execution of restart.
alice_1 | *** Running /etc/rc.local...
alice_1 | *** Booting runit daemon...
alice_1 | *** Runit started as PID 93
alice_1 | 02:10:41 2015-03-18 [INF] BTCD: Version 0.10.0-beta
alice_1 | 02:10:41 2015-03-18 [INF] BTCD: Loading block database from '/root/btcd/data/regtest/blocks_leveldb'
alice_1 | 02:10:41 2015-03-18 [INF] BTCD: Inserted genesis block 0f9188f13cb7b2c71f2a335e3a4fc328bf5beb436012afca590b1a11466e2206
alice_1 | 02:10:41 2015-03-18 [INF] BTCD: Block database loaded with block height 0
alice_1 | 02:10:41 2015-03-18 [WRN] AMGR: Skipping bound address: address 0.0.0.0 is not routable
alice_1 | 02:10:41 2015-03-18 [INF] BMGR: Generating initial block node index.  This may take a while...
alice_1 | 02:10:41 2015-03-18 [INF] BMGR: Block index generation complete
alice_1 | 02:10:41 2015-03-18 [INF] SRVR: Server listening on 0.0.0.0:12333
alice_1 | 02:10:41 2015-03-18 [INF] AMGR: Loaded 0 addresses from file '/root/btcd/data/regtest/peers.json'
alice_1 | 02:10:41 2015-03-18 [INF] RPCS: RPC server listening on 127.0.0.1:12332
alice_1 | Mar 18 02:10:41 alice syslog-ng[100]: syslog-ng starting up; version='3.5.3'


$ alicesh

root@alice:/btcd# ls bin
addblock  btcctl  btcd  dbtest  dropafter  findcheckpoint  gencerts

root@alice:/btcd# ls /root/btcd/data/regtest/
blocks_leveldb  blocks_leveldb.ver  peers.json

root@alice:/btcd# rt getinfo
{
  "version": 100000,
  "protocolversion": 70002,
  "blocks": 0,
  "timeoffset": 0,
  "connections": 0,
  "proxy": "",
  "difficulty": 1,
  "testnet": false,
  "relayfee": 1e-05
}

root@alice:/btcd# rt getpeerinfo
[]

// addpeer=seeda:12333 ? hostname problem ?
```
