var restify = require('restify');
var RpcClient = require('bitcoind-rpc');

// https://github.com/bitpay/bitcoind-rpc
var BRpc = function() {

    var config = {
        protocol: 'http',
        user: 'user',
        pass: 'pass',
        host: 'keeper',
        port: '18332',
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
};

var brpc = new BRpc();

function reqFaucet(req, res, next) {
    var amount = parseFloat(req.params.amount);
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

function hello(req, res, next) {
    res.send({
        hello: req.params.name
    });
    next();
}

var server = restify.createServer();

server.get('/faucet/:addr/:amount', reqFaucet);
server.get('/hello/:name', hello);

server.post('/hello', function create(req, res, next) {
    res.send(201, Math.random().toString(36).substr(3, 8));
    next();
});

server.listen(8581, function() {
    console.log('%s listening at %s', server.name, server.url);
});
