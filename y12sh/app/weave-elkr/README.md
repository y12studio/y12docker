## How to run

service list

* kibana http://host:9280/
* elasticsearch http://host:9200/
* plugin head http://host:9200/_plugin/head/
* plugin HQ http://host:9200/_plugin/HQ/
* reids host:6379

build-run-stop

```
$ bash elkr.sh -b
$ bash elkr.sh -r
$ bash elkr.sh -s
```

## Dev Log

Install weave

```
$ sudo apt-get install ethtool conntrack

$ sudo wget -O /usr/local/bin/weave \
  https://raw.githubusercontent.com/zettio/weave/master/weaver/weave

$ sudo chmod a+x /usr/local/bin/weave

$ sudo weave launch 10.0.0.1/16

$ sudo docker ps
CONTAINER ID        IMAGE                 COMMAND                CREATED             STATUS              PORTS                                            NAMES
2b6693b23f98        zettio/weave:latest   "/home/weave/weaver    10 seconds ago      Up 10 seconds       0.0.0.0:6783->6783/udp, 0.0.0.0:6783->6783/tcp   weave
```

test the y12docker/elasticsearch
 
```
$ E=$(sudo weave run 10.0.1.1/24 -d y12docker/elasticsearch)

$ echo $E
8b472fba5f8830ed015762ac9c59ef795b44c3c06943b5df75672ebe59b8df28

$ sudo docker ps
CONTAINER ID        IMAGE                            COMMAND                CREATED             STATUS              PORTS                                            NAMES
8b472fba5f88        y12docker/elasticsearch:latest   "/sbin/my_init"        16 seconds ago      Up 15 seconds                                                        high_lalande
2b6693b23f98        zettio/weave:latest              "/home/weave/weaver    5 minutes ago       Up 5 minutes        0.0.0.0:6783->6783/tcp, 0.0.0.0:6783->6783/udp   weave

$ sudo docker-ssh $E ifconfig
eth0      Link encap:Ethernet  HWaddr ca:f0:cf:53:7c:27
          inet addr:172.17.0.3  Bcast:0.0.0.0  Mask:255.255.0.0
          inet6 addr: fe80::c8f0:cfff:fe53:7c27/64 Scope:Link
          UP BROADCAST RUNNING  MTU:1500  Metric:1
          RX packets:184 errors:0 dropped:0 overruns:0 frame:0
          TX packets:161 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:26602 (26.6 KB)  TX bytes:28664 (28.6 KB)

ethwe     Link encap:Ethernet  HWaddr 1a:ae:70:cb:ac:2b
          inet addr:10.0.1.1  Bcast:0.0.0.0  Mask:255.255.255.0
          inet6 addr: fe80::18ae:70ff:fecb:ac2b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:65535  Metric:1
          RX packets:8 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:648 (648.0 B)  TX bytes:648 (648.0 B)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:978 errors:0 dropped:0 overruns:0 frame:0
          TX packets:978 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:113411 (113.4 KB)  TX bytes:113411 (113.4 KB)

$ sudo docker-ssh $E route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         172.17.42.1     0.0.0.0         UG    0      0        0 eth0
10.0.1.0        *               255.255.255.0   U     0      0        0 ethwe
172.17.0.0      *               255.255.0.0     U     0      0        0 eth0

$ sudo docker-ssh $E netstat -at
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 *:http-alt              *:*                     LISTEN
tcp        0      0 *:ssh                   *:*                     LISTEN
tcp        0     72 8b472fba5f88:ssh        172.17.42.1:39186       ESTABLISHED
tcp6       0      0 [::]:9200               [::]:*                  LISTEN
tcp6       0      0 [::]:9300               [::]:*                  LISTEN
tcp6       0      0 [::]:9301               [::]:*                  LISTEN
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN
tcp6       0      0 8b472fba5f88:54751      8b472fba5f88:9300       ESTABLISHED
tcp6       0      0 8b472fba5f88:9301       8b472fba5f88:34986      ESTABLISHED
tcp6       0      0 8b472fba5f88:34992      8b472fba5f88:9301       ESTABLISHED
tcp6       0      0 8b472fba5f88:9301       8b472fba5f88:34991      ESTABLISHED
tcp6       0      0 8b472fba5f88:9300       8b472fba5f88:54728      ESTABLISHED
tcp6       0      0 8b472fba5f88:34994      8b472fba5f88:9301       ESTABLISHED
tcp6       0      0 8b472fba5f88:9300       8b472fba5f88:54731      ESTABLISHED
tcp6       0      0 8b472fba5f88:54730      8b472fba5f88:9300       ESTABLISHED
```

Test the y12docker/redis

```
$ R=$(sudo weave run 10.0.1.2/24 -d y12docker/redis)
$ sudo docker-ssh $R ping 10.0.1.1
PING 10.0.1.1 (10.0.1.1) 56(84) bytes of data.
64 bytes from 10.0.1.1: icmp_seq=1 ttl=64 time=0.061 ms
64 bytes from 10.0.1.1: icmp_seq=2 ttl=64 time=0.043 ms
64 bytes from 10.0.1.1: icmp_seq=3 ttl=64 time=0.047 ms
```