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

    this.setGenerate = function(num) {
        // setgenerate true num
        rpc.setGenerate(true, num, function(error, parsedBuf) {
            console.log(parsedBuf);
        });
    };

    this.getNewAddress = function() {
        rpc.getNewAddress(function(error, parsedBuf) {
            console.log('address='+parsedBuf['result']);
        });
    };

    this.sendToLocalNewAddress = function(amount) {
        //  alice sendtoaddress $(alice getnewaddress) 199
        rpc.getNewAddress(function(error, parsedBuf) {
            var addr = parsedBuf['result'];
            console.log('address='+parsedBuf['result']);
            rpc.sendToAddress(addr, amount, function(error, parsedBuf) {
                console.log(parsedBuf);
            });
        });
    };

    this.sendToAddress = function(addr,amount) {
        // setgenerate true num
        rpc.sendtoAddress(addr, amount, function(error, parsedBuf) {
            console.log(parsedBuf);
        });
    };

};


setTimeout(function() {
    // first 99 blocks
    brpc.sendToLocalNewAddress(2.0);
}, 6000);

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
    brpc.setGenerate(1);
});
