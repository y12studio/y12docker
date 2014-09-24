## install service

* kibana http://docker_host:8080/
* [plugin] elastic HQ http://docker_host:9200/_plugin/HQ/
* [plugin] elastic Head http://docker_host:9200/_plugin/head/




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