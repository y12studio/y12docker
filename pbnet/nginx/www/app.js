var am = angular.module('MyApp', ['ngMaterial', 'ngMessages']);

am.service('dataSrv', function() {
    this.devitems = [{
        tx_hash: 'd1ed208ae840e9027f9699ed5480b4ef781e124bf307fbe76a51d6e9152e9001',
        block_number: 101,
        tx_output_n: 0,
        value: 1982300123
    }, {
        tx_hash: '4061c75ac4ddff2f3e16eefdf6466e38cbc32d295bf5b0e087ba143af9141e64',
        block_number: 103,
        tx_output_n: 1,
        value: 123452343
    }, {
        tx_hash: 'b0ede408d5e30975e88b9ed9da950f2468b77ce86986144a00eef286f9adc1bd',
        block_number: 107,
        tx_output_n: 0,
        value: 234560000
    }];
    this.sayHello = function(name) {
        return "Hello, World!" + name;
    };
});

am.service('bcSrv', function() {
    var bitcore = require('bitcore');
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
    var Buffer = bitcore.deps.Buffer;

    this.getPrikey = function(passcode) {
        value = new Buffer(passcode);
        hash = bitcore.crypto.Hash.sha256(value);
        bn = bitcore.crypto.BN.fromBuffer(hash);
        pk = new bitcore.PrivateKey(bn);
        return pk;
    }

    this.getAddress = function(passcode) {
        pk = this.getPrikey(passcode);
        return pk.toAddress();
    }

});

var LOCALTEST = false;

am.controller('AppCtrl', function($scope, $http, dataSrv, bcSrv) {

    $scope.project = {
        passcode: 'Red TaiChung MayDay',
        rate: 500
    };

    $scope.getRanPasscode = function() {
        var ranNum = Math.floor((Math.random() * 100000) + 1);
        // console.log(helloSrv.sayHello(ranNum));
        $scope.project.passcode = 'Green TaiChung ' + ranNum;
    }

    $scope.getAddress = function() {
        $scope.addr = bcSrv.getAddress($scope.project.passcode).toString();
    }

    if (LOCALTEST) {
        $scope.utxos = dataSrv.devitems;
    }

    $scope.selected = [];

    $scope.toggle = function(item, list) {
        var idx = list.indexOf(item);
        if (idx > -1) list.splice(idx, 1);
        else list.push(item);
    };

    $scope.exists = function(item, list) {
        return list.indexOf(item) > -1;
    };

    $scope.calc = function(list) {
        var total = 0;
        list.forEach(function(element, index, array) {
            total += element['value'];
        });
        r = {
            amount: total,
            utxos: list
        };
        return r;
    };


    $scope.getUnspent = function() {
        //var unspenturl = 'http://192.168.2.73/abe/unspent/' + $scope.addr + '?format=json';
        var unspenturl = '/abe/unspent/' + $scope.addr + '?format=json';
        $http.get(unspenturl).
        success(function(data, status, headers, config) {
            //console.log(data);
            $scope.utxos = data['unspent_outputs'];
        }).
        error(function(data, status, headers, config) {
            // log error
        });
    }

});
