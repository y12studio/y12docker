// ------------------
// -- bitcoind rpc
// https://github.com/bitpay/bitcoind-rpc
var bitcore = require('bitcore');
var RpcClient = require('bitcoind-rpc');
var math = require('mathjs');
var request = require('request');
var format = require('string-format');
var Networks = bitcore.Networks;

// bitcoin/chainparams.cpp at master · bitcoin/bitcoin
// https://github.com/bitcoin/bitcoin/blob/master/src/chainparams.cpp
Networks.add({
    name: 'regnet',
    alias: 'regnet',
    pubkeyhash: 0x6f,
    privatekey: 0xef,
    scripthash: 0xc4,
    xpubkey: 0x043587cf,
    xprivkey: 0x04358394,
    networkMagic: 0xfabfb5da,
    port: 18333,
    dnsSeeds: [],
});

Networks.defaultNetwork = Networks.get('regnet');



var BRpc = function() {

    var config = {
        protocol: 'http',
        user: 'user',
        pass: 'pass',
        host: '127.0.0.1',
        port: 18332,
    };

    var rpc = new RpcClient(config);

    var lastblockcount = 0;

    var useraddrs = [];

    var userpks = [];

    this.buildUserAddressArray = function(){
        math.range(2009, 2016).forEach(function(e,i,arr){
            var passcode = 'Passcode Taichung Bitcoin UserGroup ' + e;
            var pk = getPasscodePrikey(passcode);
            userpks.push(pk);
            var addr = pk.toAddress().toString();
            useraddrs.push(addr);
            console.log("["+ passcode + "] address = " + addr);
        });
    }

    this.getUserAddressArray = function() {
        return useraddrs;
    }

    this.getVar = function() {
        return {
            lastblockcount: lastblockcount
        };
    }

    function getPasscodePrikey(passcode) {
        var Buffer = bitcore.deps.Buffer;
        value = new Buffer(passcode);
        hash = bitcore.crypto.Hash.sha256sha256(value);
        bn = bitcore.crypto.BN.fromBuffer(hash);
        pk = new bitcore.PrivateKey(bn);
        return pk;
    }

    this.generate = function(num) {
        // setgenerate true num
        rpc.generate(num, function(error, r) {
            console.log('generate: ' + JSON.stringify(r));
            rpc.getBlockCount(function(error, r) {
                if (r.result > lastblockcount) {
                    lastblockcount = r.result;
                }
            });
        });
    };

    this.getNewAddress = function() {
        rpc.getNewAddress(function(error, parsedBuf) {
            console.log('address=' + parsedBuf['result']);
        });
    };

    this.checkblock = function() {
        console.log('checkblock with lastblockcount=' + lastblockcount);
        rpc.getBlockCount(function(error, r) {
            if (r.result > lastblockcount) {
                console.log('getBlockCount=' + r.result);
                // Returns hash of block in best-block-chain at <index>; index 0 is the genesis block
                rpc.getBlockHash(r.result, function(error, br) {
                    console.log('getBlockHash:' + JSON.stringify(br));
                    lastblockcount = r.result;
                    rpc.getBlock(br.result, function(error, bh) {
                        console.log('getBlock:' + JSON.stringify(bh.result));
                        bh.result.tx.forEach(function(txid, index, array) {
                            console.log('getBlock tx:' + txid);
                            rpc.getRawTransaction(txid, function(error, tr) {
                                txhex = tr.result;
                                // console.log('txhex=' + txhex);
                                rpc.decodeRawTransaction(txhex, function(error, dt) {
                                    // console.log(JSON.stringify(dt.result));
                                    if (dt.result) {
                                        // push2influxdb(dt.result);
                                    }
                                });
                            });
                        });
                    });
                });
            }
        });
    };

    this.sendToLocalNewAddress = function(amount) {
        //  alice sendtoaddress $(alice getnewaddress) 199
        rpc.getNewAddress(function(error, parsedBuf) {
            var addr = parsedBuf['result'];
            console.log('address=' + parsedBuf['result']);
            rpc.sendToAddress(addr, amount, function(error, parsedBuf) {
                console.log(parsedBuf);
            });
        });
    };

    this.sendToAddress = function(addr, amount) {
        // setgenerate true num
        rpc.sendToAddress(addr, amount, function(error, parsedBuf) {
            console.log(parsedBuf);
        });
    };
};

var CronEmitter = require("cron-emitter").CronEmitter;

var emitter = new CronEmitter();
var now = new Date();
var brpc = new BRpc();

brpc.buildUserAddressArray();

setTimeout(function() {
    // first 99 blocks
    if (brpc.getVar().lastblockcount < 10) {
        brpc.generate(99);
    }
}, 8000);

emitter.add("*/7 * * * * *", "mocktx");

emitter.add("*/30 * * * * *", "generateblock");

emitter.add("*/10 * * * * *", "checkblock");

emitter.on("mocktx", function() {
    "use strict";
    console.log('mocktx blockcount=' + brpc.getVar().lastblockcount);
    if (brpc.getVar().lastblockcount > 101) {
        //brpc.sendToLocalNewAddress(math.pickRandom([1.2, 1.5, 0.3, 0.7, 2.5, 0.6]));
        var amount = math.pickRandom([0.1, 0.5, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0]);
        var addr = math.pickRandom(brpc.getUserAddressArray());
        brpc.sendToAddress(addr,amount);
    }
});

emitter.on("generateblock", function() {
    "use strict";
    brpc.generate(1);
});

emitter.on("checkblock", function() {
    "use strict";
    brpc.checkblock();
});
