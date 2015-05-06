Devlog
------

```
$ cat /etc/default/docker | grep bip
DOCKER_OPTS="--bip=172.17.42.1/24 --dns 172.17.42.1 --dns 8.8.8.8 --dns 8.8.4.4"

$ sudo service docker restart
docker stop/waiting
docker start/running, process 5503

$ source alias.sh
$ dcup

r$ dc ps
      Name             Command             State              Ports
-------------------------------------------------------------------------
registrator_regi   /bin/registrator   Up
strator_1          -internal ...
registrator_test   nosetests -v /ap   Exit 0
_1                 p/test_http.py
registrator_web1   python -m          Up                 0.0.0.0:8000->80
_1                 SimpleHTTPServer                      00/tcp
registrator_web2   python -m          Up                 0.0.0.0:8001->80
_1                 SimpleHTTPServer                      00/tcp
registrator_xcon   /bin/start         Up                 0.0.0.0:8600->53
sul_1              -bootstrap-expe                       /udp, 8300/tcp,
                   ...                                   8301/tcp,
                                                         8301/udp,
                                                         8302/tcp,
                                                         8302/udp, 0.0.0.
                                                         0:8400->8400/tcp
                                                         , 0.0.0.0:8500->
                                                         8500/tcp

```
consul api test
---------------
```
$ curl -s http://localhost:8500/v1/catalog/service/web1 | python -m json.tool
[
    {
        "Address": "172.17.0.69",
        "Node": "consul",
        "ServiceAddress": "172.17.0.68",
        "ServiceID": "a8fb8e3d6d03:registrator_web1_1:8000",
        "ServiceName": "web1",
        "ServicePort": 8000,
        "ServiceTags": [
            "web",
            "test"
        ]
    }
]

$ curl -s http://localhost:8500/v1/catalog/service/web2 | python -m json.tool
[
    {
        "Address": "172.17.0.69",
        "Node": "consul",
        "ServiceAddress": "172.17.0.66",
        "ServiceID": "a8fb8e3d6d03:registrator_web2_1:8000",
        "ServiceName": "web2",
        "ServicePort": 8000,
        "ServiceTags": [
            "web",
            "test"
        ]
    }
]

$ curl -s http://localhost:8500/v1/catalog/service/consul | python -m json.tool
[
    {
        "Address": "172.17.0.69",
        "Node": "consul",
        "ServiceAddress": "",
        "ServiceID": "consul",
        "ServiceName": "consul",
        "ServicePort": 8300,
        "ServiceTags": []
    }
]

$ curl -s http://localhost:8500/v1/catalog/services | python -m json.tool
{
    "consul": [],
    "consul-53": [
        "udp"
    ],
    "consul-8300": [],
    "consul-8301": [
        "udp"
    ],
    "consul-8302": [
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

$ web2sh

bash-4.3# ping web1.service.consul
PING web1.service.consul (172.17.0.68): 56 data bytes
64 bytes from 172.17.0.68: seq=0 ttl=64 time=0.185 ms

bash-4.3# ping web2.service.consul
PING web2.service.consul (172.17.0.66): 56 data bytes
64 bytes from 172.17.0.66: seq=0 ttl=64 time=0.068 ms

bash-4.3# ping consul.service.consul
PING consul.service.consul (172.17.0.69): 56 data bytes
64 bytes from 172.17.0.69: seq=0 ttl=64 time=0.116 ms

$ dc stop web1
Stopping registrator_web1_1...

$ curl -s http://localhost:8500/v1/catalog/services | python -m json.tool
{
    "consul": [],
    "consul-53": [
        "udp"
    ],
    "consul-8300": [],
    "consul-8301": [
        "udp"
    ],
    "consul-8302": [
        "udp"
    ],
    "consul-8400": [],
    "consul-8500": [],
    "web2": [
        "web",
        "test"
    ]
}

$ dc start web1
Starting registrator_web1_1...

$ curl -s http://localhost:8500/v1/catalog/service/web1 | python -m json.tool
[
    {
        "Address": "172.17.0.69",
        "Node": "consul",
        "ServiceAddress": "172.17.0.72",
        "ServiceID": "a8fb8e3d6d03:registrator_web1_1:8000",
        "ServiceName": "web1",
        "ServicePort": 8000,
        "ServiceTags": [
            "web",
            "test"
        ]
    }
]

$ web2sh
bash-4.3# drill web1.service.consul @172.17.42.1
;; ->>HEADER<<- opcode: QUERY, rcode: NOERROR, id: 22969
;; flags: qr aa rd ra ; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
;; QUESTION SECTION:
;; web1.service.consul. IN      A

;; ANSWER SECTION:
web1.service.consul.    0       IN      A       172.17.0.72

;; AUTHORITY SECTION:

;; ADDITIONAL SECTION:

;; Query time: 1 msec
;; SERVER: 172.17.42.1
;; WHEN: Wed May  6 05:31:20 2015
;; MSG SIZE  rcvd: 72


```
