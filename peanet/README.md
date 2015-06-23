log
------

[tutumcloud/influxdb](https://github.com/tutumcloud/influxdb)



Mon Jun 22 22:09:09 CST 2015

```
$ dcup
$ alice getinfo
{
    "version" : 100200,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 10500000.00000000,
    "blocks" : 12,
    "timeoffset" : 0,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : false,
    "keypoololdest" : 1434982145,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : "This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"
}
$ bob getbalance
0.00000000
$ alice listunspent
[
    {
        "txid" : "7475d1130a23c200b69fb2bb69b4b4933e83e6822190995ada6372427bdae69e",
        "vout" : 0,
        "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQYbQn1hiJFRtnUAMHJmMyTw4hn51LLwJSH",
        "account" : "",
        "scriptPubKey" : "76a914e0103b03d5272c5f6b599b211b05646cf41df85588ac",
        "serValue" : "00c2eb0b00000000",
        "amount" : 2.00000000,
        "blinder" : "f34b06f174515ee3502040a30202f7292a462c40005788d7da1b3289e6781f4c",
        "confirmations" : 4,
        "spendable" : true
    },
    {
        "txid" : "7475d1130a23c200b69fb2bb69b4b4933e83e6822190995ada6372427bdae69e",
        "vout" : 1,
        "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQTn1YDifRcZKRd4pzx3ogErYKP3deGv9AJ",
        "scriptPubKey" : "76a914ab38c77c7ed93cbe0e359a22ea57f377f6eaef9e88ac",
        "serValue" : "5cc31721f8ba0300",
        "amount" : 10499997.99993180,
        "blinder" : "0cb4f90e8baea11cafdfbf5cfdfd08d59068b0a6aef11763e5b72c02e9be21f5",
        "confirmations" : 4,
        "spendable" : true
    },
    {
        "txid" : "f4c90ef95f1bcb6820297d4158f472114987881897e12de0872a4d2d54035ba4",
        "vout" : 0,
        "address" : "mqZSVT6qAcJsk4NaWFoYQXtJkR5qVkKVzh",
        "scriptPubKey" : "210383c54bac44d3e7cc20fdfda7bc9084a80ab30b1dccfd8875b8aae0431d317036ac",
        "serValue" : "a41a000000000000",
        "amount" : 0.00006820,
        "blinder" : "",
        "confirmations" : 4,
        "spendable" : true
    }
]

$ alice sendtoaddress $(bob getnewaddress) 3.0

$ alice listunspent
[
    {
        "txid" : "7475d1130a23c200b69fb2bb69b4b4933e83e6822190995ada6372427bdae69e",
        "vout" : 0,
        "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQYbQn1hiJFRtnUAMHJmMyTw4hn51LLwJSH",
        "account" : "",
        "scriptPubKey" : "76a914e0103b03d5272c5f6b599b211b05646cf41df85588ac",
        "serValue" : "00c2eb0b00000000",
        "amount" : 2.00000000,
        "blinder" : "f34b06f174515ee3502040a30202f7292a462c40005788d7da1b3289e6781f4c",
        "confirmations" : 16,
        "spendable" : true
    },
    {
        "txid" : "f1f42f19fe619d7ec93c9d0d4e91cd13078fccae2db3759d443006b86bc3c75d",
        "vout" : 0,
        "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQNDAAit7ZhdPQwLhTBBm73zoR2bJ93gwgc",
        "scriptPubKey" : "76a9146e29a083d1f56ec2e0c4b3b339ba731f764c7a6188ac",
        "serValue" : "5405360ff8ba0300",
        "amount" : 10499994.99986260,
        "blinder" : "e00d9c86f245c35bf8b35cd5d82dfb6f569e81d237bca0c1eb8a3d66e58636d7",
        "confirmations" : 1,
        "spendable" : true
    },
    {
        "txid" : "f4c90ef95f1bcb6820297d4158f472114987881897e12de0872a4d2d54035ba4",
        "vout" : 0,
        "address" : "mqZSVT6qAcJsk4NaWFoYQXtJkR5qVkKVzh",
        "scriptPubKey" : "210383c54bac44d3e7cc20fdfda7bc9084a80ab30b1dccfd8875b8aae0431d317036ac",
        "serValue" : "a41a000000000000",
        "amount" : 0.00006820,
        "blinder" : "",
        "confirmations" : 16,
        "spendable" : true
    }
]

$ bob listunspent
[
    {
        "txid" : "f1f42f19fe619d7ec93c9d0d4e91cd13078fccae2db3759d443006b86bc3c75d",
        "vout" : 1,
        "address" : "22E8QKHaTijFemPDwKvAk9qoTgagPfp8nBQiry87MMU1h2gQQa3G5HaDaCRiqinZ6RckJAqKMdBpUW2ox",
        "account" : "",
        "scriptPubKey" : "76a914880cd8f57ed5757c25b545193eea1e2264eef9eb88ac",
        "serValue" : "00a3e11100000000",
        "amount" : 3.00000000,
        "blinder" : "2ca75c879968ddc0b72c628725cf0d64f4790bbb267d16ddb9ff4d28d46e2c5f",
        "confirmations" : 5,
        "spendable" : true
    }
]

$ alice getblockcount
29
$ alice getblockhash 28
24c6bbb4cd40c34200161b630c0066c6320caf3e4eebe5fa05bf55b050cdd270

$ alice getblock $(alice getblockhash 7)
{
    "hash" : "d7c3d3746be41409b5d66d92ebb2f660b3b31fc35080679f34855758166a05d0",
    "confirmations" : 118,
    "size" : 209,
    "height" : 7,
    "version" : 3,
    "merkleroot" : "b8f727e6c2cebc85d9ec43016b6b24350574fa3c84805470c3bca4e609fe2c7f",
    "tx" : [
        "c2b608e6f5857905c217c9b0f67020d736eadf423418a06584e7d4baf18b08d2"
    ],
    "time" : 1434982210,
    "nonce" : 1,
    "bits" : "1",
    "difficulty" : 1.00000000,
    "chainwork" : "0000000000000000000000000000000000000000000000000000000000000008",
    "previousblockhash" : "f3961334f379db57fce88b72ab81aab7fad29d348f47a16191a0ecfbbb217354",
    "nextblockhash" : "7578546f8abda6d6bd8d26c27ab341f8ed05224cc86321ed8447b734620fd333"
}

$ alice getblock $(alice getblockhash 17)
{
    "hash" : "76ce45723dc9d5edf78292b575e03e5b7d52e49dd8f0c34b0743fc0dd3ce943a",
    "confirmations" : 116,
    "size" : 7130,
    "height" : 17,
    "version" : 3,
    "merkleroot" : "ad6a2c29b7499a52c6ee1918b7c846d742eb1714cdba78e1e0d4d07d6b6e2da0",
    "tx" : [
        "b82a2d595d406e7ed38f06f5e7ef9fc585d8dd9d09b08a05e4bacac910dc011c",
        "f1f42f19fe619d7ec93c9d0d4e91cd13078fccae2db3759d443006b86bc3c75d"
    ],
    "time" : 1434982310,
    "nonce" : 1,
    "bits" : "1",
    "difficulty" : 1.00000000,
    "chainwork" : "0000000000000000000000000000000000000000000000000000000000000012",
    "previousblockhash" : "52101a002ffa67808c94b8f20a5bf1ec243949d01a2e81ae14eefdc543697c78",
    "nextblockhash" : "c73f658f4a6733d50f6c71ce3c59ad8d96513d9ceafa41ea703ca847118d6227"
}


```

Mon Jun 22 16:23:47 CST 2015
```
$ source alias.sh
$ dcup
$ alice getbalance
10500000.00000000
$ bob getbalance
10500000.00000000
$ alice sendtoaddress $(bob getnewaddress) 199
d39f63bc3479ed82a9a7df11229c07e3c580f78fb72d85488288d5aafc8d6852
$ alice getbalance
10499800.99992923
$ bob getbalance
199.00000000
$ alice setgenerate true 1
[
    "fcb278e5808dee69d9cd1853a353d1f87c84fa7ee03a02227aba55b7460daf49"
]
```


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
