Build log

Sat Oct  4 16:55:40 CST 2014

```
$ sudo docker build -t y12docker/logstash .

```

Fri Oct  3 21:41:42 CST 2014

```
$ sudo docker build -t y12docker/logstash .
```


Fri Sep 26 11:27:40 CST 2014

```
$ sudo docker run y12docker/logstash /opt/logstash/bin/logstash --version
logstash 1.4.2

```


```
$ sudo docker build -t y12docker/logstash .
$ sudo docker run y12docker/logstash /opt/logstash/bin/logstash --version
logstash 1.4.2
$ sudo docker run y12docker/logstash collectd -h
collectd 5.4.0.git, http://collectd.org/
$ sudo docker run -t y12docker/logstash
....
{
               "host" => "localhost",
         "@timestamp" => "2014-09-23T07:20:22.967Z",
             "plugin" => "interface",
    "plugin_instance" => "eth0",
      "collectd_type" => "if_errors",
                 "rx" => 0,
                 "tx" => 0,
           "@version" => "1",
               "type" => "collectd"
....
$ sudo docker push y12docker/logstash
...
a7ad137e5d73: Image successfully pushed
Pushing tag for rev [a7ad137e5d73] on {https://cdn-registry-1.docker.io/v1/repitories/y12docker/logstash/tags/latest}

```