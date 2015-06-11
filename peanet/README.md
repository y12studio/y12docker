log
------

Thu Jun 11 22:50:43 CST 2015

```
$ source alias.sh
$ dcup
$ dc ps
     Name                   Command               State   Ports
---------------------------------------------------------------
peanet_alice_1   alphad -regtest=1 -testnet ...   Up
peanet_bob_1     alphad -regtest=1 -testnet ...   Up
$ alice setgenerate true 10
[
    "4ffbeeca6c88471e8126d3ab092b6af962a3956bd20f8d6b135173fe2a2c761a",
    "e20aabc676bb7b40dddf70f799888a4e2a6300786ec5e1cf5fb3bbd9197095b7",
    "43a224fa36bfe562fc7c6f2025573eccd727a78515a28657e6b48ec599432436",
    "6b0dd2f77768d876407043fd799032e957744d657e8c936bb6e31a82739ee5ea",
    "c660f0553344c6f9104ef73a1d1512731a8aa75f947006d941c1f8f6e974cdf0",
    "af55237f0b6ce02215c1c7365a8febaae3dc8d104a966ff1ff821f564fad1928",
    "c994db69ae37034b009f56aebca9dbd282189fa7db925ef053646230d9a9d355",
    "2551167e528aaa6344013c5b4c77272066dc4de57e845326f9fa8663602cf257",
    "737988970ef5d537022f96ad306258f031b268726c9d2d889ca4c9e8c13d2edc",
    "d989a070b2118633025a7d81928f463bca097c97140adb6bf916c7198db7fa14"
]
$ bob getinfo
{
    "version" : 100200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 10500000.00000000,
    "blocks" : 10,
    "timeoffset" : 0,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1434035339,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : "This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"
}
$ alice getinfo
{
    "version" : 100200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 10500000.00000000,
    "blocks" : 11,
    "timeoffset" : 0,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1434035339,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : "This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"
}

$ bob getnewaddress
22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQLkBFCEBia5VQNeeZztpNMivnLmzR454tR
$ alice sendtoaddress 22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQLkBFCEBia5VQNeeZztpNMivnLmzR454tR 199

3fd264212f1d52be4e7c288a10974aab04ca1bdd39b865054e183d2ef2a4e2d4

$ alice setgenerate true 1
[
    "d3e385d19ca05b2fbc15c30fec1f881a2c2916bba3eb4da7bc1bc34de605314c"
]

$ bob listunspent
[
    {
        "txid" : "3fd264212f1d52be4e7c288a10974aab04ca1bdd39b865054e183d2ef2a4e2d4",
        "vout" : 0,
        "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQLkBFCEBia5VQNeeZztpNMivnLmzR454tR",
        "account" : "",
        "scriptPubKey" : "76a9145e172b5c00549964d79c277ca6d58abacea6d7dd88ac",
        "serValue" : "00e721a204000000",
        "amount" : 199.00000000,
        "blinder" : "8771513e8e7d68dd7c7db1d074d0d0090325a23a02decbb47f86b5e57f70ffbb",
        "confirmations" : 1,
        "spendable" : true
    }
]
$ bob gettransaction 3fd264212f1d52be4e7c288a10974aab04ca1bdd39b865054e183d2ef2a4e2d4
{
    "amount" : -10499801.00007077,
    "fee" : 0.00007077,
    "confirmations" : 1,
    "blockhash" : "d3e385d19ca05b2fbc15c30fec1f881a2c2916bba3eb4da7bc1bc34de605314c",
    "blockindex" : 1,
    "blocktime" : 1434036223,
    "txid" : "3fd264212f1d52be4e7c288a10974aab04ca1bdd39b865054e183d2ef2a4e2d4",
    "walletconflicts" : [
    ],
    "time" : 1434036193,
    "timereceived" : 1434036193,
    "details" : [
        {
            "account" : "",
            "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQLkBFCEBia5VQNeeZztpNMivnLmzR454tR",
            "category" : "send",
            "amount" : -199.00000000,
            "vout" : 0,
            "fee" : -0.00007077
        },
        {
            "account" : "",
            "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQJbdSDJaSHB9R8wuRVbW35B6QT9tJZeY5L",
            "category" : "send",
            "amount" : -10499800.99992923,
            "vout" : 1,
            "fee" : -0.00007077
        },
        {
            "account" : "",
            "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQLkBFCEBia5VQNeeZztpNMivnLmzR454tR",
            "category" : "receive",
            "amount" : 199.00000000,
            "vout" : 0
        }
    ],
    "hex" : "0100000001a6d1d3ca0c77cffdb0"
}
$ alice getbalance
10499800.99992923
$ bob getbalance
199.00000000

$ alice sendtoaddress 22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQLkBFCEBia5VQNeeZztpNMivnLmzR454tR 299
122d2240e331bc253f706d9d74066fa65c953d5efd931c95d9c105c5a7ab25c3

$ alice setgenerate true 1
[
    "8ffdd2b9d956eef6f97976a5e0c0b30f30f08e2c0d4d794986ae93182ba53436"
]
$ bob gettransaction 122d2240e331bc253f706d9d74066fa65c953d5efd931c95d9c105c5a7ab25c3
{
    "amount" : 299.00000000,
    "confirmations" : 1,
    "blockhash" : "8ffdd2b9d956eef6f97976a5e0c0b30f30f08e2c0d4d794986ae93182ba53436",
    "blockindex" : 1,
    "blocktime" : 1434036771,
    "txid" : "122d2240e331bc253f706d9d74066fa65c953d5efd931c95d9c105c5a7ab25c3",
    "walletconflicts" : [
    ],
    "time" : 1434036761,
    "timereceived" : 1434036761,
    "details" : [
        {
            "account" : "",
            "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQLkBFCEBia5VQNeeZztpNMivnLmzR454tR",
            "category" : "receive",
            "amount" : 299.00000000,
            "vout" : 1
        }
    ],
    "hex" : "0100000001d4e2a4f22e3d184e0565b839dd.................1bca"
}
$ bob listunspent
[
    {
        "txid" : "122d2240e331bc253f706d9d74066fa65c953d5efd931c95d9c105c5a7ab25c3",
        "vout" : 1,
        "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQLkBFCEBia5VQNeeZztpNMivnLmzR454tR",
        "account" : "",
        "scriptPubKey" : "76a9145e172b5c00549964d79c277ca6d58abacea6d7dd88ac",
        "serValue" : "00cb2df606000000",
        "amount" : 299.00000000,
        "blinder" : "e66ecb5d2964aacb53d3b62f9296e70dc13551b5962495d4c6dd3211e769c243",
        "confirmations" : 1,
        "spendable" : true
    },
    {
        "txid" : "3fd264212f1d52be4e7c288a10974aab04ca1bdd39b865054e183d2ef2a4e2d4",
        "vout" : 0,
        "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQLkBFCEBia5VQNeeZztpNMivnLmzR454tR",
        "account" : "",
        "scriptPubKey" : "76a9145e172b5c00549964d79c277ca6d58abacea6d7dd88ac",
        "serValue" : "00e721a204000000",
        "amount" : 199.00000000,
        "blinder" : "8771513e8e7d68dd7c7db1d074d0d0090325a23a02decbb47f86b5e57f70ffbb",
        "confirmations" : 2,
        "spendable" : true
    }
]

$ alice getbalance
10499501.99992823

$ bob getbalance
498.00000000

```
