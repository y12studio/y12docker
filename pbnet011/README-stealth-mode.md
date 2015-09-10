y12docker/bitcoind 0.11.xx testlog
------

Thu Sep 10 16:00:48 CST 2015

xt 0.11B stealth-mode test

```
$ source alias.sh
$ cp docker-compose-stealthmode.yml docker-compose.yml
$ dcup
$ alice generate 1
[
    "051df71b5492296c1e84df041c9cae76399a61d718c565d752e4da39d4132643"
]
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
        "addr" : "172.17.42.3:39069",
        "services" : "0000000000000001",
        "lastsend" : 1441872513,
        "lastrecv" : 1441872513,
        "bytessent" : 307,
        "bytesrecv" : 331,
        "conntime" : 1441872513,
        "timeoffset" : 0,
        "pingtime" : 0.08427700,
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
        "addr" : "172.17.42.4:37528",
        "services" : "0000000000000003",
        "lastsend" : 1441872513,
        "lastrecv" : 1441872513,
        "bytessent" : 214,
        "bytesrecv" : 335,
        "conntime" : 1441872513,
        "timeoffset" : 0,
        "pingtime" : 0.08535900,
        "version" : 70010,
        "subver" : "/Bitcoin XT:0.11.0B/",
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

```
