var restify = require('restify');
var RpcClient = require('bitcoind-rpc');

// https://github.com/bitpay/bitcoind-rpc
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

    this.generate = function() {
        rpc.setGenerate(true, 1, function(error, parsedBuf) {
            console.log(parsedBuf);
        });
    };
    // sendToAddress: 'str float str str'
    // <bitcoinaddress> <amount> [comment] [comment-to]

    this.sendToAddress = function(addr, amount, callback) {
        rpc.sendToAddress(addr, amount, callback);
    };


    // sendRawTransaction
    this.sendRawTransaction = function(hexStr, callback){
        console.log('rpc.sendRawTransaction:'+hexStr);
        rpc.sendRawTransaction(hexStr, callback);
    }
};

var brpc = new BRpc();

function reqFaucet(req, res, next) {
    var amount = parseFloat(req.params.amount);
    if(amount > 2 || amount < 0.0001){
        amount = +(1+Math.random()).toFixed(6);
    }
    brpc.sendToAddress(req.params.addr, amount, function(error, parsedBuf) {
        next.ifError(error);
        console.log(parsedBuf);
        res.send({
            amount: amount,
            addr: req.params.addr,
            error: false,
            txid: parsedBuf.result,
            msg: 'OK'
        });
        next();
    });

}

function reqBroadcast(req, res, next) {
    console.log('[BROADCAST] ' + req.params.hex);
    brpc.sendRawTransaction(req.params.hex, function(error, parseBuf){
        next.ifError(error);
        console.log(parseBuf);
        res.send({
            txid: parseBuf.result,
            error: false,
            msg: 'OK'
        });
        next();
    });
}

function hello(req, res, next) {
    res.send({
        hello: req.params.name
    });
    next();
}

var server = restify.createServer();
server.use(restify.bodyParser());
server.post('/broadcast', reqBroadcast);
server.get('/faucet/:addr/:amount', reqFaucet);
server.get('/hello/:name', hello);

server.listen(8581, function() {
    console.log('%s listening at %s', server.name, server.url);
});
