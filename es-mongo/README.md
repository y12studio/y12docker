docker-compose
--------------

```
$ docker-compose up -d
$ docker-compose ps
      Name             Command             State              Ports
-------------------------------------------------------------------------
esmongo_es_1       /docker-           Up                 0.0.0.0:9200->92
                   entrypoint.sh                         00/tcp, 9300/tcp
                   elas ...
esmongo_kibana4_   /bin/sh -c         Up                 0.0.0.0:9280->56
1                  /run.sh                               01/tcp
esmongo_mongo1_1   /entrypoint.sh     Up                 27017/tcp
                   mongod --re ...
esmongo_mongo2_1   /entrypoint.sh     Up                 27017/tcp
                   mongod --re ...
esmongo_mongo_1    /entrypoint.sh     Up                 27017/tcp
                   mongod --re ...
```
mongo setup
-----------

[Deploy a Replica Set — MongoDB Manual 3.0.1](http://docs.mongodb.org/manual/tutorial/deploy-replica-set/)

```
$ docker exec -i -t esmongo_mongo_1 bash
root@ba8fed7b59b9:/# mongo

> rs.initiate()
{
        "info2" : "no configuration explicitly specified -- making one",
        "me" : "mongo:27017",
        "ok" : 1
}
rstest:OTHER> rs.add('mongo1')
{ "ok" : 1 }
rstest:PRIMARY> rs.add('mongo2')
{ "ok" : 1 }
rstest:PRIMARY> rs.status()
{
        "set" : "rstest",
        "date" : ISODate("2015-04-02T13:56:31.558Z"),
        "myState" : 1,
        "members" : [
                {
                        "_id" : 0,
                        "name" : "mongo:27017",
                        "health" : 1,
                        "state" : 1,
                        "stateStr" : "PRIMARY",
                        "uptime" : 38,
                        "optime" : Timestamp(1427982985, 1),
                        "optimeDate" : ISODate("2015-04-02T13:56:25Z"),
                        "electionTime" : Timestamp(1427982970, 2),
                        "electionDate" : ISODate("2015-04-02T13:56:10Z"),
                        "configVersion" : 3,
                        "self" : true
                },
                {
                        "_id" : 1,
                        "name" : "mongo1:27017",
                        "health" : 1,
                        "state" : 0,
                        "stateStr" : "STARTUP",
                        "uptime" : 8,
                        "optime" : Timestamp(0, 0),
                        "optimeDate" : ISODate("1970-01-01T00:00:00Z"),
                        "lastHeartbeat" : ISODate("2015-04-02T13:56:31.391Z"),
                        "lastHeartbeatRecv" : ISODate("1970-01-01T00:00:00Z"),
                        "pingMs" : 0,
                        "configVersion" : -2
                },
                {
                        "_id" : 2,
                        "name" : "mongo2:27017",
                        "health" : 1,
                        "state" : 0,
                        "stateStr" : "STARTUP",
                        "uptime" : 6,
                        "optime" : Timestamp(0, 0),
                        "optimeDate" : ISODate("1970-01-01T00:00:00Z"),
                        "lastHeartbeat" : ISODate("2015-04-02T13:56:31.391Z"),
                        "lastHeartbeatRecv" : ISODate("1970-01-01T00:00:00Z"),
                        "pingMs" : 0,
                        "configVersion" : -2
                }
        ],
        "ok" : 1
}

```

elasticsearch setup
-------------------

```

$ curl -XPUT 'http://localhost:9200/_river/mongodb/_meta' -d '{
    "type": "mongodb",
    "mongodb": {
        "servers": [
          { "host": "mongo", "port": 27017 }
        ],
      "db": "testmongo",
      "collection": "person"
    },
    "index": {
      "name": "mongoindex",
      "type": "person"
    }
  }'

{"_index":"_river","_type":"mongodb","_id":"_meta","_version":1,"created":true}

$ curl http://localhost:9200/_search?pretty{
  "took" : 2,
  "timed_out" : false,
  "_shards" : {
    "total" : 7,
    "successful" : 7,
    "failed" : 0
  },
  "hits" : {
    "total" : 4,
    "max_score" : 1.0,
    "hits" : [ {
      "_index" : "_river",
      "_type" : "mongodb",
      "_id" : "_meta",
      "_score" : 1.0,
      "_source":{
    "type": "mongodb",
    "mongodb": {
        "servers": [
          { "host": "mongo", "port": 27017 }
        ],
      "db": "testmongo",
      "collection": "person"
    },
    "index": {
      "name": "mongoindex",
      "type": "person"
    }
  }
    }, {
      "_index" : "_river",
      "_type" : "mongodb",
      "_id" : "_status",
      "_score" : 1.0,
      "_source":{"node":{"id":"O52tldi2Q4e7PpW-OHHIWg","name":"Gargouille","transport_address":"inet[/172.17.0.28:9300]"}}
    }, {
      "_index" : "_river",
      "_type" : "mongodb",
      "_id" : "_riverstatus",
      "_score" : 1.0,
      "_source":{"mongodb":{"status":"RUNNING"}}
    }, {
      "_index" : "kibana-int",
      "_type" : "config",
      "_id" : "4.0.1",
      "_score" : 1.0,
      "_source":{"buildNum":5930}
    } ]
  }
}
```
Save doc to mongo
-----------------
```
$ docker exec -i -t esmongo_mongo_1 bash
root@baff67966fa0:/# mongo
MongoDB shell version: 3.0.1
connecting to: test
Welcome to the MongoDB shell.
> db
test
> use testmongo
switched to db testmongo
>  var p = {firstName: "John", lastName: "Doe"}
> db.person.save(p)
WriteResult({ "nInserted" : 1 })
> db.person.find()
{ "_id" : ObjectId("551d3b009fbd8fabd8e6db88"), "firstName" : "John", "lastName" : "Doe" }

```
query mongoindex
----------------
```
$ curl http://localhost:9200/mongoindex/_search?pretty

{
  "took" : 1,
  "timed_out" : false,
  "_shards" : {
    "total" : 5,
    "successful" : 5,
    "failed" : 0
  },
  "hits" : {
    "total" : 1,
    "max_score" : 1.0,
    "hits" : [ {
      "_index" : "mongoindex",
      "_type" : "person",
      "_id" : "551d4b491afecb3ffcdc0309",
      "_score" : 1.0,
      "_source":{"lastName":"Doe","_id":"551d4b491afecb3ffcdc0309","firstName":"John"}
    } ]
  }
}

```
