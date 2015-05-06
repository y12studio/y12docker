testlog
-----

Wed May  6 08:46:44 UTC 2015

```
$ cat /etc/default/docker | grep bip
DOCKER_OPTS="--bip=172.17.42.1/24 --dns 172.17.42.1 --dns 8.8.8.8 --dns 8.8.4.4"
$ sudo service docker restart
$ source alias.sh
$ dc build
$ dcup
$ dc ps
      Name             Command             State              Ports
-------------------------------------------------------------------------
nvwm_alice_1       python -m          Up                 0.0.0.0:8001->80
                   SimpleHTTPServer                      00/tcp
nvwm_mariadb_1     /docker-           Up                 3306/tcp
                   entrypoint.sh
                   mysqld
nvwm_nginx_1       nginx -g daemon    Up                 443/tcp, 0.0.0.0
                   off;                                  :8080->80/tcp
nvwm_registrator   /bin/registrator   Up
_1                 -internal ...
nvwm_varnish_1     /start.sh          Up                 0.0.0.0:8180->80
                                                         /tcp
nvwm_wordpress_1   /entrypoint.sh     Up                 0.0.0.0:8280->80
                   apache2-for ...                       /tcp
nvwm_xconsul_1     /bin/start         Up                 0.0.0.0:8600->53
                   -bootstrap-expe                       /udp, 8300/tcp,
                   ...                                   8301/tcp,
                                                         8301/udp,
                                                         8302/tcp,
                                                         8302/udp, 0.0.0.
                                                         0:8400->8400/tcp
                                                         , 0.0.0.0:8500->
                                                         8500/tcp

$ curl -s http://localhost:8500/v1/catalog/services | python -m json.tool
{
    "alice": [
        "web",
        "test"
    ],
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
    "mariadb": [],
    "nginx": [],
    "varnish": [],
    "wp": []
}

$ curl -s http://localhost:8500/v1/catalog/service/varnish | python -m json.tool
[
    {
        "Address": "172.17.42.17",
        "Node": "consul",
        "ServiceAddress": "172.17.42.15",
        "ServiceID": "496365332bcb:nvwm_varnish_1:80",
        "ServiceName": "varnish",
        "ServicePort": 80,
        "ServiceTags": null
    }
]

$ alice2sh
bash-4.3# ping wp.service.consul
PING wp.service.consul (172.17.42.28): 56 data bytes

bash-4.3# ping nginx.service.consul
PING nginx.service.consul (172.17.42.30): 56 data bytes

bash-4.3# ping varnish.service.consul
PING varnish.service.consul (172.17.42.29): 56 data bytes

$ wp2sh
# ping varnish.service.consul
PING varnish.service.consul (172.17.42.29): 56 data bytes
64 bytes from 172.17.42.29: icmp_seq=0 ttl=64 time=0.113 ms

```
