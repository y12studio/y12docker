Sun Apr  5 15:33:29 CST 2015

can't run under fig · Issue #35 · progrium/docker-consul
 https://github.com/progrium/docker-consul/issues/35

```
$ source alias.sh
$ dcup


Creating registrator_web2_1...
Creating registrator_consul_1...
Creating registrator_web1_1...
Creating registrator_test_1...
Creating registrator_registrator_1...
Attaching to registrator_registrator_1, registrator_test_1, registrator_web1_1, registrator_consul_1, registrator_web2_1
registrator_1 | 2015/04/05 09:50:05 registrator: Using consul registry backend at consul://consul:8500
registrator_1 | 2015/04/05 09:50:05 registrator: ignored: 7d41c5752dd3 no published ports
registrator_1 | 2015/04/05 09:50:05 registrator: ignored: c7876a108538 no published ports
registrator_1 | 2015/04/05 09:50:05 registrator: added: 24abde2f8f3b 7d41c5752dd3:registrator_web1_1:8000
registrator_1 | 2015/04/05 09:50:05 registrator: ignored d8748d59ad91 port 8301 not published on host
registrator_1 | 2015/04/05 09:50:05 registrator: ignored d8748d59ad91 port 8302 not published on host
registrator_1 | 2015/04/05 09:50:05 registrator: ignored d8748d59ad91 port 8302 not published on host
registrator_1 | 2015/04/05 09:50:05 registrator: added: d8748d59ad91 7d41c5752dd3:registrator_consul_1:8400
registrator_1 | 2015/04/05 09:50:05 registrator: added: d8748d59ad91 7d41c5752dd3:registrator_consul_1:8500
registrator_1 | 2015/04/05 09:50:05 registrator: added: d8748d59ad91 7d41c5752dd3:registrator_consul_1:53:udp
registrator_1 | 2015/04/05 09:50:05 registrator: ignored d8748d59ad91 port 8300 not published on host
registrator_1 | 2015/04/05 09:50:05 registrator: ignored d8748d59ad91 port 8301 not published on host
registrator_1 | 2015/04/05 09:50:05 registrator: added: 1f81ea64b829 7d41c5752dd3:registrator_web2_1:8000
registrator_1 | 2015/04/05 09:50:05 registrator: Listening for Docker events...
web1_1        | Serving HTTP on 0.0.0.0 port 8000 ...
consul_1      | ==> WARNING: Bootstrap mode enabled! Do not enable unless necessary
consul_1      | ==> WARNING: It is highly recommended to set GOMAXPROCS higher than 1
consul_1      | ==> Starting Consul agent...
consul_1      | ==> Starting Consul agent RPC...
consul_1      | ==> Consul agent running!
consul_1      |          Node name: 'consul'
consul_1      |         Datacenter: 'dc1'
consul_1      |             Server: true (bootstrap: true)
consul_1      |        Client Addr: 0.0.0.0 (HTTP: 8500, HTTPS: -1, DNS: 53, RPC: 8400)
consul_1      |       Cluster Addr: 172.17.0.160 (LAN: 8301, WAN: 8302)
consul_1      |     Gossip encrypt: false, RPC-TLS: false, TLS-Incoming: false
consul_1      |              Atlas: <disabled>
consul_1      |
consul_1      | ==> Log data will now stream in as it occurs:
consul_1      |
consul_1      |     2015/04/05 09:50:04 [INFO] serf: EventMemberJoin: consul 172.17.0.160
consul_1      |     2015/04/05 09:50:04 [INFO] serf: EventMemberJoin: consul.dc1 172.17.0.160
consul_1      |     2015/04/05 09:50:04 [INFO] raft: Node at 172.17.0.160:8300 [Follower] entering Follower state
consul_1      |     2015/04/05 09:50:04 [INFO] consul: adding server consul (Addr: 172.17.0.160:8300) (DC: dc1)
web2_1        | Serving HTTP on 0.0.0.0 port 8000 ...
consul_1      |     2015/04/05 09:50:04 [INFO] consul: adding server consul.dc1 (Addr: 172.17.0.160:8300) (DC: dc1)
consul_1      |     2015/04/05 09:50:04 [ERR] agent: failed to sync remote state: No cluster leader
consul_1      |     2015/04/05 09:50:05 [WARN] raft: Heartbeat timeout reached, starting election
consul_1      |     2015/04/05 09:50:05 [INFO] raft: Node at 172.17.0.160:8300 [Candidate] entering Candidate state
consul_1      |     2015/04/05 09:50:05 [INFO] raft: Election won. Tally: 1
consul_1      |     2015/04/05 09:50:05 [INFO] raft: Node at 172.17.0.160:8300 [Leader] entering Leader state
consul_1      |     2015/04/05 09:50:05 [INFO] consul: cluster leadership acquired
consul_1      |     2015/04/05 09:50:05 [INFO] consul: New leader elected: consul
consul_1      |     2015/04/05 09:50:05 [INFO] raft: Disabling EnableSingleNode (bootstrap)
consul_1      |     2015/04/05 09:50:05 [INFO] consul: member 'consul' joined, marking health alive
consul_1      |     2015/04/05 09:50:08 [INFO] agent: Synced service '7d41c5752dd3:registrator_consul_1:8400'
consul_1      |     2015/04/05 09:50:08 [INFO] agent: Synced service '7d41c5752dd3:registrator_consul_1:8500'
consul_1      |     2015/04/05 09:50:08 [INFO] agent: Synced service '7d41c5752dd3:registrator_consul_1:53:udp'
consul_1      |     2015/04/05 09:50:08 [INFO] agent: Synced service '7d41c5752dd3:registrator_web2_1:8000'
consul_1      |     2015/04/05 09:50:08 [INFO] agent: Synced service 'consul'
consul_1      |     2015/04/05 09:50:08 [INFO] agent: Synced service '7d41c5752dd3:registrator_web1_1:8000'
test_1        | test_http.TestWebRequest.test_consul_catalog ... ok
web1_1        | 172.17.0.162 - - [05/Apr/2015 09:50:10] "GET / HTTP/1.1" 200 -
test_1        | test_http.TestWebRequest.test_web1 ... ok
web2_1        | 172.17.0.162 - - [05/Apr/2015 09:50:10] "GET / HTTP/1.1" 200 -
test_1        | test_http.TestWebRequest.test_web2 ... ok
test_1        |
test_1        | ----------------------------------------------------------------------
test_1        | Ran 3 tests in 5.024s
test_1        |
test_1        | OK
registrator_test_1 exited with code 0

$ dc ps
      Name             Command             State              Ports
-------------------------------------------------------------------------
registrator_cons   /bin/start         Up                 0.0.0.0:8600->53
ul_1               -server -bootst                       /udp, 8300/tcp,
                   ...                                   8301/tcp,
                                                         8301/udp,
                                                         8302/tcp,
                                                         8302/udp, 0.0.0.
                                                         0:8400->8400/tcp
                                                         , 0.0.0.0:8500->
                                                         8500/tcp
registrator_regi   /bin/registrator   Up
strator_1          consul:// ...
registrator_test   nosetests -v /ap   Exit 0
_1                 p/test_http.py
registrator_web1   python -m          Up                 0.0.0.0:8000->80
_1                 SimpleHTTPServer                      00/tcp
registrator_web2   python -m          Up                 0.0.0.0:8001->80
_1                 SimpleHTTPServer                      00/tcp
```
consul api test
---------------
```
$ curl -s http://localhost:8500/v1/catalog/nodes  | python -m json.tool
[
    {
        "Address": "172.17.0.160",
        "Node": "consul"
    }
]

$ curl -s http://localhost:8500/v1/catalog/services  | python -m json.tool
{
    "consul": [],
    "consul-53": [
        "udp"
    ],
    "consul-8400": [],
    "consul-8500": [],
    "web1": [
        "web",
        "test"
    ],
    "web2": [
        "web",
        "test"
    ]
}

$ dc stop web2
$ curl -s http://localhost:8500/v1/catalog/services  | python -m json.tool
{
    "consul": [],
    "consul-53": [
        "udp"
    ],
    "consul-8400": [],
    "consul-8500": [],
    "web1": [
        "web",
        "test"
    ]
}

$ dc start web2
Starting registrator_web2_1...

$ curl -s http://localhost:8500/v1/catalog/services  | python -m json.tool
{
    "consul": [],
    "consul-53": [
        "udp"
    ],
    "consul-8400": [],
    "consul-8500": [],
    "web1": [
        "web",
        "test"
    ],
    "web2": [
        "web",
        "test"
    ]
}

```
