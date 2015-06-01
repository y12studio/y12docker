// ------------------
// -- bitcoind rpc
// https://github.com/bitpay/bitcoind-rpc
var bitcore = require('bitcore');
var RpcClient = require('bitcoind-rpc');

var BRpc = function() {
    var config = {
        protocol: 'http',
        user: process.env.Y_KEEPER_USER,
        pass: process.env.Y_KEEPER_PASS,
        host: process.env.Y_KEEPER_HOST,
        port: process.env.Y_KEEPER_PORT,
    };

    var rpc = new RpcClient(config);

    var txids = [];

    this.generate = function(num) {
        rpc.setGenerate(true, num, function(error, parsedBuf) {
            console.log(parsedBuf);
        });
    };

    this.showNewTransactions = function() {
        rpc.getRawMemPool(function(err, ret) {
            if (err) {
                console.error(err);
                return setTimeout(showNewTransactions, 10000);
            }

            function batchCall() {
                ret.result.forEach(function(txid) {
                    if (txids.indexOf(txid) === -1) {
                        rpc.getRawTransaction(txid);
                    }
                });
            }

            rpc.batch(batchCall, function(err, rawtxs) {
                if (err) {
                    console.error(err);
                    return setTimeout(showNewTransactions, 10000);
                }

                rawtxs.map(function(rawtx) {
                    var tx = new bitcore.Transaction(rawtx.result);
                    console.log('\n\n\n' + tx.id + ':', tx.toObject());
                });

                txids = ret.result;
                setTimeout(showNewTransactions, 2500);
            });
        });
    }
};


setTimeout(function() {
    // first 99 blocks
    brpc.generate(99);
}, 8000);


var CronEmitter = require("cron-emitter").CronEmitter;

var emitter = new CronEmitter();
var now = new Date();
var brpc = new BRpc();

//emitter.add("*/3  * * * * *", "every_three_seconds");
emitter.add("*/10 * * * * *", "every_ten_seconds");
//emitter.add("0    * * * * *", "every_minute");
//emitter.add("* * * * * *", "every_second_stop", {
//    endDate: new Date(now.getTime() + 5500)
//});

emitter.on("every_three_seconds", function() {
    "use strict";
    console.log("EVENT: Got every three seconds event.");
});

var counter10s = 0;

emitter.on("every_ten_seconds", function() {
    "use strict";
    console.log("EVENT: Got ten seconds event. ", counter10s++);
    brpc.generate(1);
    //if (emitter.hasEvent("every_three_seconds")) {
    //    console.log("  Stopping every_three_seconds.");
    //    emitter.remove("every_three_seconds");
    //}
});

//var counter = 0;
//emitter.on("every_second_stop", function() {
//    "use strict";
//    counter++;
//    console.log("EVENT: got every second event: ", counter);
//});
