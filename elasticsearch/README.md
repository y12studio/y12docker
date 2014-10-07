## install service

* kibana http://docker_host:8080/
* [plugin] elastic HQ http://docker_host:9200/_plugin/HQ/
* [plugin] elastic Head http://docker_host:9200/_plugin/head/


## build log 


Tue Oct  7 17:48:02 CST 2014

tag y12docker/elasticsearch:0.0.1

```
$ sudo docker build -t y12docker/elasticsearch:0.0.1 .
$ sudo docker images | grep elastic
y12docker/elasticsearch     latest              dcec94cfc282        45 seconds ago      1.005 GB
y12docker/elasticsearch     0.0.1               dcec94cfc282        45 seconds ago      1.005 GB
$ sudo docker run -p 9200:9200 -d y12docker/elasticsearch:0.0.1
$ curl -XGET 'http://localhost:9200/_nodes?pretty'

{
  "cluster_name" : "elasticsearch",
  "nodes" : {
    "PJzUo-2ySgawXEspih4Sgw" : {
      "name" : "Jaren",
      "transport_address" : "inet[/172.17.0.10:9300]",
      "host" : "e3de1761e410",
      "ip" : "172.17.0.10",
      "version" : "1.3.4",
      "build" : "a70f3cc",
      "http_address" : "inet[/172.17.0.10:9200]",
      "settings" : {
        "name" : "Jaren",
        "path" : {
          "logs" : "/opt/elasticsearch/logs",
          "home" : "/opt/elasticsearch"
        },
        "cluster" : {
          "name" : "elasticsearch"
        },
        "foreground" : "yes"
      },
      "os" : {
        "refresh_interval_in_millis" : 1000,
        "available_processors" : 1,
        "cpu" : {
          "vendor" : "Intel",
          "model" : "Core(TM) i7-3770 CPU @ 3.40GHz",
          "mhz" : 3260,
          "total_cores" : 1,
          "total_sockets" : 1,
          "cores_per_socket" : 1,
          "cache_size_in_bytes" : 6144
        },
        "mem" : {
          "total_in_bytes" : 4145586176
        },
        "swap" : {
          "total_in_bytes" : 4292866048
        }
      },
      "process" : {
        "refresh_interval_in_millis" : 1000,
        "id" : 109,
        "max_file_descriptors" : 1048576,
        "mlockall" : false
      },
      "jvm" : {
        "pid" : 109,
        "version" : "1.8.0_20",
        "vm_name" : "Java HotSpot(TM) 64-Bit Server VM",
        "vm_version" : "25.20-b23",
        "vm_vendor" : "Oracle Corporation",
        "start_time_in_millis" : 1412675526556,
        "mem" : {
          "heap_init_in_bytes" : 268435456,
          "heap_max_in_bytes" : 1065025536,
          "non_heap_init_in_bytes" : 2555904,
          "non_heap_max_in_bytes" : 0,
          "direct_max_in_bytes" : 1065025536
        },
        "gc_collectors" : [ "ParNew", "ConcurrentMarkSweep" ],
        "memory_pools" : [ "Code Cache", "Metaspace", "Compressed Class Space", "Par Eden Space", "Par Survivor Space", "CMS Old Gen" ]
      },
      "thread_pool" : {
        "percolate" : {
          "type" : "fixed",
          "min" : 1,
          "max" : 1,
          "queue_size" : "1k"
        },
        "snapshot_data" : {
          "type" : "scaling",
          "min" : 1,
          "max" : 5,
          "keep_alive" : "5m",
          "queue_size" : -1
        },
        "bench" : {
          "type" : "scaling",
          "min" : 1,
          "max" : 1,
          "keep_alive" : "5m",
          "queue_size" : -1
        },
        "index" : {
          "type" : "fixed",
          "min" : 1,
          "max" : 1,
          "queue_size" : "200"
        },
        "refresh" : {
          "type" : "scaling",
          "min" : 1,
          "max" : 1,
          "keep_alive" : "5m",
          "queue_size" : -1
        },
        "suggest" : {
          "type" : "fixed",
          "min" : 1,
          "max" : 1,
          "queue_size" : "1k"
        },
        "generic" : {
          "type" : "cached",
          "keep_alive" : "30s",
          "queue_size" : -1
        },
        "warmer" : {
          "type" : "scaling",
          "min" : 1,
          "max" : 1,
          "keep_alive" : "5m",
          "queue_size" : -1
        },
        "search" : {
          "type" : "fixed",
          "min" : 3,
          "max" : 3,
          "queue_size" : "1k"
        },
        "flush" : {
          "type" : "scaling",
          "min" : 1,
          "max" : 1,
          "keep_alive" : "5m",
          "queue_size" : -1
        },
        "optimize" : {
          "type" : "fixed",
          "min" : 1,
          "max" : 1,
          "queue_size" : -1
        },
        "management" : {
          "type" : "scaling",
          "min" : 1,
          "max" : 5,
          "keep_alive" : "5m",
          "queue_size" : -1
        },
        "get" : {
          "type" : "fixed",
          "min" : 1,
          "max" : 1,
          "queue_size" : "1k"
        },
        "merge" : {
          "type" : "scaling",
          "min" : 1,
          "max" : 1,
          "keep_alive" : "5m",
          "queue_size" : -1
        },
        "bulk" : {
          "type" : "fixed",
          "min" : 1,
          "max" : 1,
          "queue_size" : "50"
        },
        "snapshot" : {
          "type" : "scaling",
          "min" : 1,
          "max" : 1,
          "keep_alive" : "5m",
          "queue_size" : -1
        }
      },
      "network" : {
        "refresh_interval_in_millis" : 5000,
        "primary_interface" : {
          "address" : "172.17.0.10",
          "name" : "eth0",
          "mac_address" : "1E:5C:F9:87:B5:59"
        }
      },
      "transport" : {
        "bound_address" : "inet[/0:0:0:0:0:0:0:0:9300]",
        "publish_address" : "inet[/172.17.0.10:9300]"
      },
      "http" : {
        "bound_address" : "inet[/0:0:0:0:0:0:0:0:9200]",
        "publish_address" : "inet[/172.17.0.10:9200]",
        "max_content_length_in_bytes" : 104857600
      },
      "plugins" : [ {
        "name" : "head",
        "version" : "NA",
        "description" : "No description found.",
        "url" : "/_plugin/head/",
        "jvm" : false,
        "site" : true
      }, {
        "name" : "HQ",
        "version" : "NA",
        "description" : "No description found.",
        "url" : "/_plugin/HQ/",
        "jvm" : false,
        "site" : true
      } ]
    }
  }
}


```


Sat Oct  4 21:00:21 CST 2014

base on java8 

```
$ sudo docker images | grep elastic
y12docker/elasticsearch     latest              3947a21578be        3 hours ago         1.185 GB
$ sudo docker build -t y12docker/elasticsearch .
$ sudo docker images | grep elastic
y12docker/elasticsearch     latest              82ca4a1e44c0        5 seconds ago       954.3 MB
```


Sat Oct  4 17:27:05 CST 2014

```
$ sudo docker build -t y12docker/elasticsearch .
```

elasticsearch-1.3.4 / Fri Oct  3 21:59:44 CST 2014

```
$ sudo docker build -t y12docker/elasticsearch .
$ sudo docker run -p 8080:8080 -p 9200:9200 y12docker/elasticsearch

```

v140926

```
$ date
Fri Sep 26 11:53:08 CST 2014
$ sudo docker build --no-cache -t y12docker/elasticsearch .
$ sudo docker run -d -p 8080:8080 -p 9200:9200 y12docker/elasticsearch
b78c1f2c4d3634f6ef055ab007bba84c82ea7c0bf37db5e783eec63e34eea660

$ curl -v http://192.168.99.2:9200
* Rebuilt URL to: http://192.168.99.2:9200/
* Hostname was NOT found in DNS cache
*   Trying 192.168.99.2...
* Connected to 192.168.99.2 (192.168.99.2) port 9200 (#0)
> GET / HTTP/1.1
> User-Agent: curl/7.35.0
> Host: 192.168.99.2:9200
> Accept: */*
>
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=UTF-8
< Content-Length: 294
<
{
  "status" : 200,
  "name" : "Rebel",
  "version" : {
    "number" : "1.3.2",
    "build_hash" : "dee175dbe2f254f3f26992f5d7591939aaefd12f",
    "build_timestamp" : "2014-08-13T14:29:30Z",
    "build_snapshot" : false,
    "lucene_version" : "4.9"
  },
  "tagline" : "You Know, for Search"
}
* Connection #0 to host 192.168.99.2 left intact

```

## Build log v140925

* support [royrusso/elasticsearch-HQ](https://github.com/royrusso/elasticsearch-HQ)
* support [mobz/elasticsearch-head](https://github.com/mobz/elasticsearch-head)

```
$ sudo docker build -t y12docker/elasticsearch .
$ sudo docker run -d -p 8080:8080 -p 9200:9200 y12docker/elasticsearch
```

## Build log v140924

```
$ sudo docker build -t y12docker/elasticsearch .
$ sudo docker run -d -p 8080:8080 -p 9200:9200 y12docker/elasticsearch
```
test kibana http://docker_host:8080/

```
$ curl -v http://192.168.99.38:8080/
* Hostname was NOT found in DNS cache
*   Trying 192.168.99.38...
* Connected to 192.168.99.38 (192.168.99.38) port 8080 (#0)
> GET / HTTP/1.1
> User-Agent: curl/7.35.0
> Host: 192.168.99.38:8080
> Accept: */*
>
< HTTP/1.1 200 OK
* Server nginx/1.4.6 (Ubuntu) is not blacklisted
< Server: nginx/1.4.6 (Ubuntu)
< Date: Tue, 23 Sep 2014 07:59:44 GMT
< Content-Type: text/html
< Content-Length: 2073
< Last-Modified: Thu, 15 May 2014 15:47:01 GMT
< Connection: keep-alive
< ETag: "5374e175-819"
< Accept-Ranges: bytes
<
<!DOCTYPE html><!--[if lt IE 7]><html class="no-js lt-ie9 
...
```

test elasticserach 

```
$ curl -v http://192.168.99.38:9200/
* Hostname was NOT found in DNS cache
*   Trying 192.168.99.38...
* Connected to 192.168.99.38 (192.168.99.38) port 9200 (#0)
> GET / HTTP/1.1
> User-Agent: curl/7.35.0
> Host: 192.168.99.38:9200
> Accept: */*
>
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=UTF-8
< Content-Length: 299
<
{
  "status" : 200,
  "name" : "Fontanelle",
  "version" : {
    "number" : "1.3.2",
    "build_hash" : "dee175dbe2f254f3f26992f5d7591939aaefd12f",
    "build_timestamp" : "2014-08-13T14:29:30Z",
    "build_snapshot" : false,
    "lucene_version" : "4.9"
  },
  "tagline" : "You Know, for Search"
}
* Connection #0 to host 192.168.99.38 left intact

$ curl -v http://192.168.99.38:9200/_count?q=collectd_type:load
* Hostname was NOT found in DNS cache
*   Trying 192.168.99.38...
* Connected to 192.168.99.38 (192.168.99.38) port 9200 (#0)
> GET /_count?q=collectd_type:load HTTP/1.1
> User-Agent: curl/7.35.0
> Host: 192.168.99.38:9200
> Accept: */*
>
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=UTF-8
< Content-Length: 60
<
* Connection #0 to host 192.168.99.38 left intact
{"count":38,"_shards":{"total":5,"successful":5,"failed":0}}
```

push image

```
$ sudo docker push y12docker/elasticsearch
```