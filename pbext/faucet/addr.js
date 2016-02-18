var bitcore = require('bitcore');

function printkey(key){
    var r = {};
    r['privkey'] = JSON.parse(key.toJSON());
    r['wif'] = key.toWIF();
    var publicKey = privateKey.toPublicKey();
    var addr = publicKey.toAddress();
    r['pubkey'] = JSON.parse(publicKey.toJSON());
    r['addr'] = addr.toString();
    r['address'] = JSON.parse(addr.toJSON());
    console.log(r);
}

var privateKey = new bitcore.PrivateKey();
printkey(privateKey);
console.log('-----------');
var wif = '5K98JYBD5HcnijxmCV1VLkbTme7NUP1h8nFw7T8TTkm7bN4w9DA';
var key = new bitcore.PrivateKey(wif);
console.log(key.toJSON());
console.log(key.toAddress());
// https://github.com/bitpay/bitcore/blob/master/lib/privatekey.js#L325
