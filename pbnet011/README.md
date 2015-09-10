y12docker/bitcoind 0.11.xx testlog
------

Thu Sep 10 16:00:48 CST 2015

```
$ source alias.sh
$ dcup
$ alice getnetworkinfo
{
    "version" : 110000,
    "subversion" : "/Satoshi:0.11.0/",
    "protocolversion" : 70002,
    "localservices" : "0000000000000001",
    "timeoffset" : 0,
    "connections" : 2,
    "networks" : [
        {
            "name" : "ipv4",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "ipv6",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        },
        {
            "name" : "onion",
            "limited" : false,
            "reachable" : false,
            "proxy" : "",
            "proxy_randomize_credentials" : false
        }
    ],
    "relayfee" : 0.00001000,
    "localaddresses" : [
    ]
}
$ alice getpeerinfo

[
    {
        "id" : 1,
        "addr" : "172.17.42.6:60028",
        "services" : "0000000000000001",
        "lastsend" : 1441872900,
        "lastrecv" : 1441872900,
        "bytessent" : 307,
        "bytesrecv" : 331,
        "conntime" : 1441872900,
        "timeoffset" : 0,
        "pingtime" : 0.08502200,
        "version" : 70002,
        "subver" : "/Satoshi:0.11.0/",
        "inbound" : true,
        "startingheight" : 0,
        "banscore" : 0,
        "synced_headers" : -1,
        "synced_blocks" : -1,
        "inflight" : [
        ],
        "whitelisted" : false
    },
    {
        "id" : 2,
        "addr" : "172.17.42.7:47765",
        "services" : "0000000000000001",
        "lastsend" : 1441872901,
        "lastrecv" : 1441872901,
        "bytessent" : 214,
        "bytesrecv" : 331,
        "conntime" : 1441872900,
        "timeoffset" : 0,
        "pingtime" : 0.08759500,
        "version" : 70002,
        "subver" : "/Satoshi:0.11.0/",
        "inbound" : true,
        "startingheight" : 0,
        "banscore" : 0,
        "synced_headers" : -1,
        "synced_blocks" : -1,
        "inflight" : [
        ],
        "whitelisted" : false
    }
]
$ alice generate 101
$ alice getinfo
{
    "version" : 110000,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 50.00000000,
    "blocks" : 101,
    "timeoffset" : 0,
    "connections" : 2,
    "proxy" : "",
    "difficulty" : 0.00000000,
    "testnet" : false,
    "keypoololdest" : 1441872899,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}
$ alice sendtoaddress $(bob getnewaddress) 12.34
56755b761a57c02cc35c6aa00ad2ae8c6c6b2c3f0e2c5246d18f08fb57229feb
$ alice generate 2
$ bob getinfo
{
    "version" : 110000,
    "protocolversion" : 70002,
    "walletversion" : 60000,
    "balance" : 12.34000000,
    "blocks" : 103,
    "timeoffset" : 0,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 0.00000000,
    "testnet" : false,
    "keypoololdest" : 1441872900,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00001000,
    "errors" : ""
}
```
