## Build log

Tue Oct  7 18:02:14 CST 2014

rebuild estw:0.0.1 without testdata

```
$ sudo docker build -t y12docker/estw:0.0.1 .
$ sudo docker images | grep estw
y12docker/estw              test                a3edd4175e59        About a minute ago   1.127 GB
y12docker/estw              0.0.1               e54621f6d08d        6 minutes ago        1.127 GB
y12docker/estw              latest              1603e6e8a98e        23 hours ago         1.079 GB
$ sudo docker push y12docker/estw:0.0.1
```


Mon Oct  6 18:28:35 CST 2014

```
$ bash gc2mt.sh -t

Successfully built 8f0b8654c6ef
CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS                  PORTS                                            NAMES
6ccf9b8a69fe        y12docker/estw:test   "/sbin/my_init"     1 seconds ago       Up Less than a second   0.0.0.0:8080->8080/tcp, 0.0.0.0:9200->9200/tcp   ecstatic_feynman
[SystemTest] Container  6ccf9b8a69fe9896ae6b2cf05e9c5254fb0446a88dcab8c0317f4eca6b6f2eb9
[SystemTest] boot and wait ....
No handlers could be found for logger "elasticsearch.trace"
test_ansj_sc (test_es_ansj.TestElasticSearch) ...
Result : 三峡,河龙埔,里,河堤,外,工程施工,导致,河流,改道,，,造成,对岸,(,介寿,里,),土地,流失,工程,施工
ok
test_ansj_tc (test_es_ansj.TestElasticSearch) ...
Result : 三峽,河龍埔里,河堤,外,工程施工,導致,河流,改道,，,造成,對岸,(,介壽里,),土地,流失,工程,施工
ok
test_es_http_conn (test_es_ansj.TestElasticSearch) ... ok
test_fooindex_import (test_es_ansj.TestElasticSearch) ... ok
test_kibana_http_conn (test_es_ansj.TestElasticSearch) ... ok
test_search_fooindex_tc (test_es_ansj.TestElasticSearch) ... {
    "hits": {
        "hits": [
            {
                "_score": 0.53699243,
                "_type": "fulltext",
                "_id": "s7kl25IrT1yzyp7uuM3k4A",
                "_source": {
                    "content": "三峽河龍埔里河堤外工程施工導致河流改道，造成對岸(介壽里)土地流失"
                },
                "_index": "fooindex"
            }
        ],
        "total": 1,
        "max_score": 0.53699243
    },
    "_shards": {
        "successful": 5,
        "failed": 0,
        "total": 5
    },
    "took": 5,
    "timed_out": false
}
ok

----------------------------------------------------------------------
Ran 6 tests in 9.177s

OK

$ bash gc2mt.sh -u y12docker/estw:0.0.1
[Docker Container Commit] image name  y12docker/estw:0.0.1
[Docker Container Commit]  6ccf9b8a69fe
Warning: '--run' is deprecated, it will be removed soon. See usage.
955dac897dc2c350ecae932c467ada45d087d443a3c763f36d2bbb35d370ec70
[{
    "Architecture": "amd64",
    "Author": "",
    "Comment": "",
    "Config": {
        "AttachStderr": false,
        "AttachStdin": false,
        "AttachStdout": false,
        "Cmd": [
            "/sbin/my_init"
        ],
        "CpuShares": 0,
        "Cpuset": "",
        "Domainname": "",
        "Entrypoint": null,
        "Env": [
            "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "HOME=/root",
            "LANG=zh_TW.UTF-8",
            "LANGUAGE=zh_TW.UTF-8",
            "LC_ALL=zh_TW.UTF-8",
            "DEBIAN_FRONTEND=noninteractive",
            "JAVA_HOME=/usr/lib/jvm/java-8-oracle/",
            "ES_SRV=/etc/service/elasticsearch/run",
            "NGINX_SRV=/etc/service/nginx/run"
        ],
        "ExposedPorts": {
            "8080/tcp": {},
            "9200/tcp": {}
        },
        "Hostname": "",
        "Image": "",
        "Memory": 0,
        "MemorySwap": 0,
        "NetworkDisabled": false,
        "OnBuild": null,
        "OpenStdin": false,
        "PortSpecs": null,
        "StdinOnce": false,
        "Tty": false,
        "User": "",
        "Volumes": null,
        "WorkingDir": ""
    },
    "Container": "6ccf9b8a69fe9896ae6b2cf05e9c5254fb0446a88dcab8c0317f4eca6b6f2eb9",
    "ContainerConfig": {
        "AttachStderr": false,
        "AttachStdin": false,
        "AttachStdout": false,
        "Cmd": [
            "/sbin/my_init"
        ],
        "CpuShares": 0,
        "Cpuset": "",
        "Domainname": "",
        "Entrypoint": null,
        "Env": [
            "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "HOME=/root",
            "LANG=zh_TW.UTF-8",
            "LANGUAGE=zh_TW.UTF-8",
            "LC_ALL=zh_TW.UTF-8",
            "DEBIAN_FRONTEND=noninteractive",
            "JAVA_HOME=/usr/lib/jvm/java-8-oracle/",
            "ES_SRV=/etc/service/elasticsearch/run",
            "NGINX_SRV=/etc/service/nginx/run"
        ],
        "ExposedPorts": {
            "8080/tcp": {},
            "9200/tcp": {}
        },
        "Hostname": "6ccf9b8a69fe",
        "Image": "y12docker/estw:test",
        "Memory": 0,
        "MemorySwap": 0,
        "NetworkDisabled": false,
        "OnBuild": null,
        "OpenStdin": false,
        "PortSpecs": null,
        "StdinOnce": false,
        "Tty": false,
        "User": "",
        "Volumes": null,
        "WorkingDir": ""
    },
    "Created": "2014-10-06T10:30:40.884174343Z",
    "DockerVersion": "1.2.0",
    "Id": "955dac897dc2c350ecae932c467ada45d087d443a3c763f36d2bbb35d370ec70",
    "Os": "linux",
    "Parent": "8f0b8654c6ef4dea30dace902b70cef2c7c42e2b1c35c926fc4f2e800d630444",
    "Size": 3098542
}

$ sudo docker images | grep estw
y12docker/estw              0.0.1               955dac897dc2        54 seconds ago      1.079 GB
y12docker/estw              test                8f0b8654c6ef        2 minutes ago       1.076 GB
y12docker/estw              latest              0c26c9a53813        20 hours ago        1.059 GB

```

Mon Oct  6 17:22:25 CST 2014

```
$ bash gc2mt.sh -t

Successfully built 7308618bf8bb
CONTAINER ID        IMAGE                 COMMAND             CREATED                  STATUS                  PORTS                                            NAMES
08d61022311f        y12docker/estw:test   "/sbin/my_init"     Less than a second ago   Up Less than a second   0.0.0.0:8080->8080/tcp, 0.0.0.0:9200->9200/tcp   sharp_turing
[SystemTest] Container  08d61022311f0be8ed6dceb9890198d39215cb28c45a676959405c5e2db00645
[SystemTest] boot and wait ....
No handlers could be found for logger "elasticsearch.trace"
test_es_http_conn (test_es_ansj.TestElasticSearch) ... ok
test_fooindex_import (test_es_ansj.TestElasticSearch) ... ok
test_kibana_http_conn (test_es_ansj.TestElasticSearch) ... ok
test_sc (test_es_ansj.TestElasticSearch) ...
Result : 三峡,河龙埔,里,河堤,外,工程施工,导致,河流,改道,，,造成,对岸,(,介寿,里,),土地,流失,工程,施工
ok
test_tc (test_es_ansj.TestElasticSearch) ...
Result : 三峽,河龍埔里,河堤,外,工程施工,導致,河流,改道,，,造成,對岸,(,介壽里,),土地,流失,工程,施工
ok

----------------------------------------------------------------------
Ran 5 tests in 8.709s

OK

```


Mon Oct  6 13:58:43 CST 2014

```
$ bash gc2mt.sh -t

Successfully built 3c12ae229ffc
CONTAINER ID        IMAGE                 COMMAND             CREATED                  STATUS                  PORTS                                            NAMES
727d4a668d96        y12docker/estw:test   "/sbin/my_init"     Less than a second ago   Up Less than a second   0.0.0.0:8080->8080/tcp, 0.0.0.0:9200->9200/tcp   mad_babbage
[SystemTest] Container  727d4a668d966d2601d235c8b1abafca4d84d4d31100d376190a5ed0dbd8f9e0
[SystemTest] boot and wait ....
No handlers could be found for logger "elasticsearch.trace"
test_es_http_conn (test_es_ansj.TestElasticSearch) ... ok
test_fooindex_import (test_es_ansj.TestElasticSearch) ... ok
test_kibana_http_conn (test_es_ansj.TestElasticSearch) ... ok
test_sc (test_es_ansj.TestElasticSearch) ...
Result : 三峡,河龙埔,里,河堤,外,工程,施工,导致,河流,改,道,，,造成,对岸,(,介寿,里,),土地,流失
ok
test_tc (test_es_ansj.TestElasticSearch) ...
Result : 三,峽,河,龍,埔,里,河堤,外,工程,施工,導,致,河流,改,道,，,造成,對,岸,(,介壽,里,),土地,流失
FAIL

======================================================================
FAIL: test_tc (test_es_ansj.TestElasticSearch)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/opt/estw/utils/test/test_es_ansj.py", line 76, in test_tc
    self.assertTrue(x in mlist_tc)
AssertionError: False is not true
-------------------- >> begin captured logging << --------------------
requests.packages.urllib3.connectionpool: INFO: Starting new HTTP connection (1): localhost
requests.packages.urllib3.connectionpool: DEBUG: "POST /fooindex/_analyze?analyzer=ansj_index HTTP/1.1" 200 1956
--------------------- >> end captured logging << ---------------------

----------------------------------------------------------------------
Ran 5 tests in 7.329s

FAILED (failures=1)

```


Sun Oct  5 21:38:08 CST 2014

```
$ sudo docker build -t  y12docker/estw .
$ sudo docker run -i -t  y12docker/estw /bin/bash
# /opt/elasticsearch/bin/elasticsearch -d
# curl -s 'http://localhost:9200/_nodes?plugin=true&pretty' | grep -B 2 -A 2 ansj
          "analysis" : {
            "analyzer" : {
              "index_ansj" : {
                "type" : "ansj_index"
              },
              "query_ansj" : {
                "type" : "ansj_query"
              },
              "default" : {
                "type" : "ansj_index"
              }
            }
--
      },
      "plugins" : [ {
        "name" : "analysis-ansj",
        "version" : "NA",
        "description" : "ansj analysis",
        "jvm" : true,
        "site" : false

# curl -XPUT http://localhost:9200/fooindex
# curl -XPOST http://localhost:9200/fooindex/fulltext/_mapping -d'
{
    "fulltext": {
             "_all": {
            "indexAnalyzer": "index_ansj",
            "searchAnalyzer": "query_ansj",
            "term_vector": "no",
            "store": "false"
        },
        "properties": {
            "content": {
                "type": "string",
                "store": "no",
                "term_vector": "with_positions_offsets",
                "indexAnalyzer": "index_ansj",
                "searchAnalyzer": "query_ansj",
                "include_in_all": "true",
                "boost": 8
            }
        }
    }
}'

# curl -XPOST http://localhost:9200/fooindex/fulltext/1 -d'{content:"哈哈"}'

# curl -XGET 'http://localhost:9200/fooindex/_analyze?pretty=true&analyzer=ansj_index' -d '三峡河龙埔里河堤外工程施工导致河流改道，造成对岸(介寿里)土地流失'

# curl -XGET 'http://localhost:9200/fooindex/_analyze?pretty=true&analyzer=ansj_index' -d '三峽河龍埔里河堤外工程施工導致河流改道，造成對岸(介壽里)土地流失'
```


Sun Oct  5 16:49:02 CST 2014

```
$ sudo docker build -t y12docker/estw .
$ sudo docker run y12docker/estw ls -al /opt/elasticsearch/plugins/ansj
total 16
drwxr-xr-x 4 root root 4096 10月  5 08:51 .
drwxr-xr-x 5 root root 4096 10月  5 08:51 ..
drwxr-xr-x 3 root root 4096 10月  5 08:51 dic
drwxr-xr-x 2 root root 4096 10月  5 08:51 lib

# bin/elasticsearch -v
Version: 1.3.4, Build: a70f3cc/2014-09-30T09:07:17Z, JVM: 1.8.0_20

$ sudo docker run y12docker/estw cat /opt/elasticsearch/config/elasticsearch.yml

####################### ANSJ PLUG CONFIG ###########################
index:
  analysis:
    analyzer:
      index_ansj:
        type: ansj_index
      query_ansj:
        type: ansj_query

index.analysis.analyzer.default.type: ansj_index

$ /opt/elasticsearch/bin/elasticsearch -d -Des.logger.level=DEBUG
# cat logs/elasticsearch.log | grep plug
[2014-10-05 09:47:26,181][DEBUG][node                     ] [Kymaera] using home [/opt/elasticsearch], config [/opt/elasticsearch/config], data [[/opt/elasticsearch/data]], logs [/opt/elasticsearch/logs], work [/opt/elasticsearch/work], plugins [/opt/elasticsearch/plugins]
[2014-10-05 09:47:26,198][DEBUG][plugins                  ] [Kymaera] lucene property is not set in plugin es-plugin.properties file. Skipping test.
[2014-10-05 09:47:26,201][DEBUG][plugins                  ] [Kymaera] [/opt/elasticsearch/plugins/analysis-ansj/_site] directory does not exist.
[2014-10-05 09:47:26,214][DEBUG][plugins                  ] [Kymaera] skipping [jar:file:/opt/elasticsearch/plugins/ansj/elasticsearch-analysis-ansj-1.x.1.jar!/es-plugin.properties]
[2014-10-05 09:47:26,258][DEBUG][plugins                  ] [Kymaera] starting analysis plugin for Lucene [LUCENE_4_9].
[2014-10-05 09:47:26,259][DEBUG][plugins                  ] [Kymaera] [/opt/elasticsearch/plugins/analysis-smartcn/_site] directory does not exist.
[2014-10-05 09:47:26,262][DEBUG][plugins                  ] [Kymaera] [/opt/elasticsearch/plugins/ansj/_site] directory does not exist.
[2014-10-05 09:47:26,263][DEBUG][plugins                  ] [Kymaera] [/opt/elasticsearch/plugins/analysis-smartcn/_site] directory does not exist.
[2014-10-05 09:47:26,264][INFO ][plugins                  ] [Kymaera] loaded [analysis-ansj, analysis-smartcn], sites [head, HQ]

$ curl 'http://localhost:9200/_nodes?plugin=true&pretty'

      "version" : "1.3.4",
      "build" : "a70f3cc",
      "http_address" : "inet[/172.17.0.30:9200]",
      "settings" : {
        "name" : "Spoilsport",
        "path" : {
          "logs" : "/opt/elasticsearch/logs",
          "home" : "/opt/elasticsearch"
        },
        "index" : {
          "analysis" : {
            "analyzer" : {
              "index_ansj" : {
                "type" : "ansj_index"
              },
              "query_ansj" : {
                "type" : "ansj_query"
              },
              "default" : {
                "type" : "ansj_index"
              }
            }
          }
        },
  ....
      "plugins" : [ {
        "name" : "analysis-ansj",
        "version" : "NA",
        "description" : "ansj analysis",
        "jvm" : true,
        "site" : false
      }, {
   ....
```

## Create fooindex and mapping for analyzer test

```
$ curl -XPUT http://localhost:9200/fooindex
$ curl -XPOST http://localhost:9200/fooindex/fulltext/_mapping -d'
{
    "fulltext": {
             "_all": {
            "indexAnalyzer": "index_ansj",
            "searchAnalyzer": "query_ansj",
            "term_vector": "no",
            "store": "false"
        },
        "properties": {
            "content": {
                "type": "string",
                "store": "no",
                "term_vector": "with_positions_offsets",
                "indexAnalyzer": "index_ansj",
                "searchAnalyzer": "query_ansj",
                "include_in_all": "true",
                "boost": 8
            }
        }
    }
}'

$ curl -XPOST http://localhost:9200/fooindex/fulltext/1 -d'
{content:"哈哈"}
'
```

Test SC

```
$ curl -XGET 'http://localhost:9200/fooindex/_analyze?pretty=true&analyzer=ansj_index' -d '三峡河龙埔里河堤外工程施工导致河流改道，造成对岸(介寿里)土地流失'
{
  "tokens" : [ {
    "token" : "三峡",
    "start_offset" : 0,
    "end_offset" : 2,
    "type" : "word",
    "position" : 1
  }, {
    "token" : "河龙埔",
    "start_offset" : 2,
    "end_offset" : 5,
    "type" : "word",
    "position" : 2
  }, {
    "token" : "里",
    "start_offset" : 5,
    "end_offset" : 6,
    "type" : "word",
    "position" : 3
  }, {
    "token" : "河堤",
    "start_offset" : 6,
    "end_offset" : 8,
    "type" : "word",
    "position" : 4
  }, {
    "token" : "外",
    "start_offset" : 8,
    "end_offset" : 9,
    "type" : "word",
    "position" : 5
  }, {
    "token" : "工程",
    "start_offset" : 9,
    "end_offset" : 11,
    "type" : "word",
    "position" : 6
  }, {
    "token" : "施工",
    "start_offset" : 11,
    "end_offset" : 13,
    "type" : "word",
    "position" : 7
  }, {
    "token" : "导致",
    "start_offset" : 13,
    "end_offset" : 15,
    "type" : "word",
    "position" : 8
  }, {
    "token" : "河流",
    "start_offset" : 15,
    "end_offset" : 17,
    "type" : "word",
    "position" : 9
  }, {
    "token" : "改",
    "start_offset" : 17,
    "end_offset" : 18,
    "type" : "word",
    "position" : 10
  }, {
    "token" : "道",
    "start_offset" : 18,
    "end_offset" : 19,
    "type" : "word",
    "position" : 11
  }, {
    "token" : "，",
    "start_offset" : 19,
    "end_offset" : 20,
    "type" : "word",
    "position" : 12
  }, {
    "token" : "造成",
    "start_offset" : 20,
    "end_offset" : 22,
    "type" : "word",
    "position" : 13
  }, {
    "token" : "对岸",
    "start_offset" : 22,
    "end_offset" : 24,
    "type" : "word",
    "position" : 14
  }, {
    "token" : "(",
    "start_offset" : 24,
    "end_offset" : 25,
    "type" : "word",
    "position" : 15
  }, {
    "token" : "介寿",
    "start_offset" : 25,
    "end_offset" : 27,
    "type" : "word",
    "position" : 16
  }, {
    "token" : "里",
    "start_offset" : 27,
    "end_offset" : 28,
    "type" : "word",
    "position" : 17
  }, {
    "token" : ")",
    "start_offset" : 28,
    "end_offset" : 29,
    "type" : "word",
    "position" : 18
  }, {
    "token" : "土地",
    "start_offset" : 29,
    "end_offset" : 31,
    "type" : "word",
    "position" : 19
  }, {
    "token" : "流失",
    "start_offset" : 31,
    "end_offset" : 33,
    "type" : "word",
    "position" : 20
  } ]
}
```

Test TC
```
$ curl -XGET 'http://localhost:9200/fooindex/_analyze?pretty=true&analyzer=ansj_index' -d '三峽河龍埔里河堤外工程施工導致河流改道，造成對岸(介壽里)土地流失'
{
  "tokens" : [ {
    "token" : "三",
    "start_offset" : 0,
    "end_offset" : 1,
    "type" : "word",
    "position" : 1
  }, {
    "token" : "峽",
    "start_offset" : 1,
    "end_offset" : 2,
    "type" : "word",
    "position" : 2
  }, {
    "token" : "河",
    "start_offset" : 2,
    "end_offset" : 3,
    "type" : "word",
    "position" : 3
  }, {
    "token" : "龍",
    "start_offset" : 3,
    "end_offset" : 4,
    "type" : "word",
    "position" : 4
  }, {
    "token" : "埔",
    "start_offset" : 4,
    "end_offset" : 5,
    "type" : "word",
    "position" : 5
  }, {
    "token" : "里",
    "start_offset" : 5,
    "end_offset" : 6,
    "type" : "word",
    "position" : 6
  }, {
    "token" : "河堤",
    "start_offset" : 6,
    "end_offset" : 8,
    "type" : "word",
    "position" : 7
  }, {
    "token" : "外",
    "start_offset" : 8,
    "end_offset" : 9,
    "type" : "word",
    "position" : 8
  }, {
    "token" : "工程",
    "start_offset" : 9,
    "end_offset" : 11,
    "type" : "word",
    "position" : 9
  }, {
    "token" : "施工",
    "start_offset" : 11,
    "end_offset" : 13,
    "type" : "word",
    "position" : 10
  }, {
    "token" : "導",
    "start_offset" : 13,
    "end_offset" : 14,
    "type" : "word",
    "position" : 11
  }, {
    "token" : "致",
    "start_offset" : 14,
    "end_offset" : 15,
    "type" : "word",
    "position" : 12
  }, {
    "token" : "河流",
    "start_offset" : 15,
    "end_offset" : 17,
    "type" : "word",
    "position" : 13
  }, {
    "token" : "改",
    "start_offset" : 17,
    "end_offset" : 18,
    "type" : "word",
    "position" : 14
  }, {
    "token" : "道",
    "start_offset" : 18,
    "end_offset" : 19,
    "type" : "word",
    "position" : 15
  }, {
    "token" : "，",
    "start_offset" : 19,
    "end_offset" : 20,
    "type" : "word",
    "position" : 16
  }, {
    "token" : "造成",
    "start_offset" : 20,
    "end_offset" : 22,
    "type" : "word",
    "position" : 17
  }, {
    "token" : "對",
    "start_offset" : 22,
    "end_offset" : 23,
    "type" : "word",
    "position" : 18
  }, {
    "token" : "岸",
    "start_offset" : 23,
    "end_offset" : 24,
    "type" : "word",
    "position" : 19
  }, {
    "token" : "(",
    "start_offset" : 24,
    "end_offset" : 25,
    "type" : "word",
    "position" : 20
  }, {
    "token" : "介壽",
    "start_offset" : 25,
    "end_offset" : 27,
    "type" : "word",
    "position" : 21
  }, {
    "token" : "里",
    "start_offset" : 27,
    "end_offset" : 28,
    "type" : "word",
    "position" : 22
  }, {
    "token" : ")",
    "start_offset" : 28,
    "end_offset" : 29,
    "type" : "word",
    "position" : 23
  }, {
    "token" : "土地",
    "start_offset" : 29,
    "end_offset" : 31,
    "type" : "word",
    "position" : 24
  }, {
    "token" : "流失",
    "start_offset" : 31,
    "end_offset" : 33,
    "type" : "word",
    "position" : 25
  } ]
}
```


## issue failed to find analyzer [ansj_index]

$ curl -XGET 'http://localhost:9200/_analyze?pretty=true&analyzer=ansj_index' \
  -d '三峽河龍埔里河堤外工程施工導致河流改道，造成對岸(介壽里)土地流失'

{
  "error" : "ElasticsearchIllegalArgumentException[failed to find analyzer [ansj_index]]",
  "status" : 400
}


[2014-10-05 09:56:56,357][DEBUG][action.admin.indices.analyze] [Spoilsport] failed to execute [org.elasticsearch.action.admin.indices.analyze.AnalyzeRequest@3f616dbe]
org.elasticsearch.ElasticsearchIllegalArgumentException: failed to find analyzer [ansj_index]
        at org.elasticsearch.action.admin.indices.analyze.TransportAnalyzeAction.shardOperation(TransportAnalyzeAction.java:143)
        at org.elasticsearch.action.admin.indices.analyze.TransportAnalyzeAction.shardOperation(TransportAnalyzeAction.java:54)
        at org.elasticsearch.action.support.single.custom.TransportSingleCustomOperationAction$AsyncSingleAction$1.run(TransportSingleCustomOperationAction.java:137)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
        at java.lang.Thread.run(Thread.java:745)

```

ref 
* [Failed to find analyzer [polish] · Issue #8 · elasticsearch/elasticsearch-analysis-stempel](https://github.com/elasticsearch/elasticsearch-analysis-stempel/issues/8)
