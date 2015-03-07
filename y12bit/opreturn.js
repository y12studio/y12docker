var bitcore = require('bitcore');
var explorers = require('bitcore-explorers');
var Transaction = bitcore.Transaction;
var insight = new explorers.Insight();
var privateKey = new bitcore.PrivateKey('L1uyy5qTuGrVXrmrsvHWHgVzW9kKdrp27wBC7Vs6nZDTF2BRUVwy');
var toAddress = new bitcore.PrivateKey().toAddress();
var cgAddress = new bitcore.PrivateKey().toAddress();
Transaction.FEE_PER_KB = 1000;

insight.getUnspentUtxos('1KV5jcfCWrFxRMnJW8cCVws9E2ZqVCvZ3h', function(err, utxos) {
    if (err) {
        // Handle errors...
        console.log(err);
    } else {
        console.log(utxos);
        var transaction = new Transaction()
            .from(utxos)
            .to(toAddress,50000)  // Add an output with the given amount of satoshis
            .change(cgAddress)
            .addData('bitcore rocks') // Add OP_RETURN data
            .sign(privateKey);

        console.log('Fee:'+transaction.getFee());
        console.log(transaction.verifySignature());
        console.log(transaction.verify());
        console.log(transaction.toJSON());

        insight.broadcast(transaction, function(err, returnedTxId) {
            if (err) {
                // Handle errors...
                console.log(err);
            } else {
                // Mark the transaction as broadcasted
                console.log(returnedTxId);
            }
        });

    }
});
