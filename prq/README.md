## ref

* [RQ: Simple job queues for Python](http://python-rq.org/)
* [nvie/rq-dashboard](https://github.com/nvie/rq-dashboard)

## Build log


Mon Sep 29 20:52:54 CST 2014

```
$ bash dev.sh -t
$ curl -X PUT -d '{"url":"http://y12.tw"}' \
  -H "Content-Type: application/json" \
  http://192.168.59.103:8980/qjob/count_words_at_url

{
    "fid": "count_words_at_url",
    "id": "da023e85-227e-4386-ad9c-5b4e9eb3f460",
    "raw": {
        "created_at": "2014-09-29T12:57:27Z",
        "data": "(Vwordcount.count_words_at_url\np1\nN(Vhttp://y12.tw\np2\ntp3\n(dp4\ntp5\n.",
        "description": "wordcount.count_words_at_url(u'http://y12.tw')",
        "enqueued_at": "2014-09-29T12:57:27Z",
        "origin": "default",
        "status": "queued",
        "timeout": 180
    },
    "rjob": "/rjob/da023e85-227e-4386-ad9c-5b4e9eb3f460",
    "url": "http://y12.tw"
}

$ curl -v http://192.168.59.103:8980/rjob/da023e85-227e-4386-ad9c-5b4e9eb3f460

{
    "id": "da023e85-227e-4386-ad9c-5b4e9eb3f460",
    "raw": {
        "created_at": "2014-09-29T12:57:27Z",
        "data": "(Vwordcount.count_words_at_url\np1\nN(Vhttp://y12.tw\np2\ntp3\n(dp4\ntp5\n.",
        "description": "wordcount.count_words_at_url(u'http://y12.tw')",
        "ended_at": "2014-09-29T12:57:28Z",
        "enqueued_at": "2014-09-29T12:57:27Z",
        "origin": "default",
        "result": "I211\n.",
        "status": "finished",
        "timeout": 180
    },
    "result": 211
}

```


Mon Sep 29 08:48:11 CST 2014

```
$ sudo docker build -t y12docker/prq .
$ sudo docker run -d -p 8980:8980 y12docker/prq
$ curl -v http://192.168.59.103:8980/qjob/count_words_at_url
{
    "fid": "count_words_at_url", 
    "id": "932bcdb6-f35e-4ef9-a1f2-5b48efc3d4cc", 
    "raw": {
        "created_at": "2014-09-29T05:31:59Z", 
        "data": "(Vwordcount.count_words_at_url\np1\nN(S'http://nvie.com'\np2\ntp3\n(dp4\ntp5\n.", 
        "description": "wordcount.count_words_at_url('http://nvie.com')", 
        "enqueued_at": "2014-09-29T05:31:59Z", 
        "origin": "default", 
        "status": "queued", 
        "timeout": 180
    }, 
    "rjob": "/rjob/932bcdb6-f35e-4ef9-a1f2-5b48efc3d4cc", 
    "url": "http://nvie.com"
}
$ curl -v http://192.168.59.103:8980/rjob/d2ef5bb3-95f5-4d1e-9866-11d255f4091b
{
    "id": "d2ef5bb3-95f5-4d1e-9866-11d255f4091b",
    "raw": {
        "created_at": "2014-09-29T05:16:09Z",
        "data": "(Vwordcount.count_words_at_url\np1\nN(S'http://nvie.com'\np2\ntp3\n(dp4\ntp5\n.",
        "description": "wordcount.count_words_at_url('http://nvie.com')",
        "ended_at": "2014-09-29T05:16:09Z",
        "enqueued_at": "2014-09-29T05:16:09Z",
        "origin": "default",
        "result": "I347\n.",
        "status": "finished",
        "timeout": 180
    },
    "result": 347
}

$ curl http://docker:8980/rq/
$ curl http://docker:8980/rq/queues.json
$ curl http://docker:8980/rq/worker.json
```