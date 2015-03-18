[btcsuite/btcd](https://github.com/btcsuite/btcd)

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
