var LOCALTEST = false;

var am = angular.module('MyApp', ['ngMaterial', 'ngMessages', 'ngResource']);
am.service('dataSrv', function() {
    // abe json output 'http://192.168.2.73/abe/unspent/addrxxxxxx?format=json'
    this.devitems = [{
        "block_number": 103,
        "script": "76a914e4bd42a5a5002fde3339b882ea3d0f0046ead08888ac",
        "tx_hash": "91778f793600d0d19539de069d573b2d95e8ea1fe1d4a752fa1ae4adbc58b1ab",
        "tx_output_n": 1,
        "value": 168000000,
        "value_hex": "a037a00"
    }, {
        "block_number": 103,
        "script": "76a914e4bd42a5a5002fde3339b882ea3d0f0046ead08888ac",
        "tx_hash": "120cdc3dc0f40db6b381c124d41e8cc859e6ee7b45ae19dce123b685d2a9b1d3",
        "tx_output_n": 1,
        "value": 104300300,
        "value_hex": "6377f0c"
    }, {
        "block_number": 104,
        "script": "76a914e4bd42a5a5002fde3339b882ea3d0f0046ead08888ac",
        "tx_hash": "e39c3eb6bfee83b3dca77eb55deac31b1ff9960578f9ba1b84120369f6133aa4",
        "tx_output_n": 0,
        "value": 184037100,
        "value_hex": "af82eec"
    }, {
        "block_number": 105,
        "script": "76a914e4bd42a5a5002fde3339b882ea3d0f0046ead08888ac",
        "tx_hash": "a5886bc64c6a28494e93c2efcae9ce2e5628b654136b7a72dceacf7e74e394e9",
        "tx_output_n": 1,
        "value": 195683400,
        "value_hex": "ba9e448"
    }];
    this.sayHello = function(name) {
        return "Hello, World!" + name;
    };
});

am.service('bcSrv', function() {
    var bitcore = require('bitcore');
    var Networks = bitcore.Networks;
    var Transaction = bitcore.Transaction;
    var UnspentOutput = bitcore.Transaction.UnspentOutput;
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
    var Buffer = bitcore.deps.Buffer;

    this.getPrikey = function(passcode) {
        value = new Buffer(passcode);
        hash = bitcore.crypto.Hash.sha256sha256(value);
        bn = bitcore.crypto.BN.fromBuffer(hash);
        pk = new bitcore.PrivateKey(bn);
        return pk;
    }

    this.getAddress = function(passcode) {
        pk = this.getPrikey(passcode);
        return pk.toAddress();
    }

    this.signTx = function(wif, utxosRaw, toAddress, amount, chAddress) {
        var pk = bitcore.PrivateKey.fromWIF(wif);
        var utxos = utxosRaw.map(function(obj) {
            return new UnspentOutput(obj);
        });

        var tx = new Transaction()
            .from(utxos) // Feed information about what unspent outputs one can use
            .to(toAddress, amount) // Add an output with the given amount of satoshis
            .change(chAddress) // Sets up a change address where the rest of the funds will go
            .sign(pk); // Signs all the inputs it can
        console.log(tx.toJSON());
        return tx.serialize();
    }

    this.utxoExample = new UnspentOutput({
        "txId": "a0a08e397203df68392ee95b3f08b0b3b3e2401410a38d46ae0874f74846f2e9",
        "outputIndex": 0,
        "address": "mgJT8iegL4f9NCgQFeFyfvnSw1Yj4M5Woi",
        "script": "76a914089acaba6af8b2b4fb4bed3b747ab1e4e60b496588ac",
        "satoshis": 70000
    });
});


am.controller('AppCtrl', function($scope, $resource, $http, dataSrv, bcSrv) {

    var bapiUsers = $resource('/bapi/users');
    bapiUsers.get(function(r) {
        console.log(r);
        $scope.users = r.result;
    });

    $scope.project = {
        passcode: 'Red TaiChung MayDay',
        rate: 500
    };

    $scope.ckPickUser = function(user){
        $scope.user = user;
    }

    $scope.getRanPasscode = function() {
        var ranNum = Math.floor((Math.random() * 100000) + 1);
        // console.log(helloSrv.sayHello(ranNum));
        $scope.project.passcode = 'Green TaiChung ' + ranNum;
        $scope.getAddress();
    }

    $scope.getAddress = function() {
        $scope.addr = bcSrv.getAddress($scope.project.passcode).toString();
    }

    $scope.sendto = {
        address: 'n2NR5q7Sffy8KdfPKkBxxjejMrSM8HFNVk',
        amount: 19680000,
    };

    $scope.getAddress();

    $scope.selected = [];

    $scope.toggle = function(item, list) {
        var idx = list.indexOf(item);
        if (idx > -1) list.splice(idx, 1);
        else list.push(item);
    };

    $scope.exists = function(item, list) {
        return list.indexOf(item) > -1;
    };

    $scope.txSign = function(wif) {
        toAddr = $scope.sendto.address;
        toAmount = $scope.sendto.amount;
        chAddr = $scope.addr;
        utxosRaw = $scope.calcResult.utxos;
        rawtx = bcSrv.signTx(wif, utxosRaw, toAddr, toAmount, chAddr);
        $scope.txSignResult = rawtx;
    }

    $scope.calcResult = {};

    $scope.calc = function(list) {
        var total = 0;
        list.forEach(function(element, index, array) {
            total += element['value'];
        });

        var bcutxos = list.map(function(obj) {
            return {
                txid: obj['tx_hash'],
                script: obj['script'],
                outputIndex: obj['tx_output_n'],
                satoshis: obj['value']
            };
        });
        r = {
            amount: total,
            btc: total / 100000000,
            utxos: bcutxos
        };
        $scope.calcResult = r;
        return r;
    };


    $scope.getUnspent = function(addr) {
        $scope.calcResult = {};
        if (LOCALTEST) {
            $scope.utxos = dataSrv.devitems;
            return;
        }
        //var unspenturl = '/abe/unspent/' + $scope.addr + '?format=json';
        var unspenturl = '/abe/unspent/' + addr + '?format=json';
        $http.get(unspenturl).
        success(function(data, status, headers, config) {
            console.log(data);
            $scope.utxos = data['unspent_outputs'];
        }).
        error(function(data, status, headers, config) {
            // log error
            console.log(data);
        });
    };


    $scope.broadcast = function() {
        hexstr = $scope.txSignResult;
        var turl = '/bapi/broadcast';
        $http.post(turl, {
            hex: hexstr
        }).
        success(function(data, status, headers, config) {
            console.log(data);
        }).
        error(function(data, status, headers, config) {
            // log error
            console.log(data);
        });
    }

});
