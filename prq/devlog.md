## Build log

Tue Sep 30 19:20:20 CST 2014

* Move the django-rest-framework impl to the draft directory
* Reuse the flask-restful framework.
* Rewrite some test codes.

```
$ bash dev.sh -t
CONTAINER ID        IMAGE                   COMMAND             CREATED              STATUS              PORTS                    NAMES
e48ab66f947f        y12docker/prq:devtest   "/sbin/my_init"     About a minute ago   Up About a minute   0.0.0.0:8980->8080/tcp   backstabbing_mccarthy
stop a test image.
FOO=e48ab66f947f y12docker/prq:devtest "/sbin/my_init" About a minute ago Up About a minute 0.0.0.0:8980->8080/tcp backstabbing_mccarthy
e48ab66f947f
[AFTER] stop the container
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
build a test image.
Sending build context to Docker daemon 7.622 MB
Sending build context to Docker daemon
Step 0 : FROM y12docker/pbase
 ---> c529b411cebe
...
Step 23 : CMD ["/sbin/my_init"]
 ---> Running in 3735d743e21b
 ---> 4296ff1e18ef
Removing intermediate container 3735d743e21b
Successfully built 4296ff1e18ef
CONTAINER ID        IMAGE                   COMMAND             CREATED                  STATUS                  PORTS                    NAMES
c4befa89435f        y12docker/prq:devtest   "/sbin/my_init"     Less than a second ago   Up Less than a second   0.0.0.0:8980->8080/tcp   sick_engelbart
[SystemTest] Container  c4befa89435fb1e9ffe4823a487466874beaa22cb9f69278d0170b1df35a305b
[SystemTest] boot and wait ....
test_flask_api_hello (test_system.TestHttpFlask) ... ok
test_flask_http_port (test_system.TestHttpFlask) ... ok
test_flask_http_wrong_port (test_system.TestHttpFlask) ... ok
test_redis_connect (test_system.TestRedis) ... ok
test_redis_connect_error (test_system.TestRedis) ... ok
test_qjob_hello_words (test_system.TestRq) ... ok
test_qjob_unknow_words (test_system.TestRq) ... ok

----------------------------------------------------------------------
Ran 7 tests in 1.083s

OK

```


Tue Sep 30 17:46:56 CST 2014

```
$ cd prq
$ pip install django
$ pip install djangorestframework
$ django-admin.py startproject drf .
$ ls -al
total 52
drwxrwxr-x  6 lin lin 4096 Sep 30 16:10 .
drwxrwxr-x 12 lin lin 4096 Sep 29 08:37 ..
-rw-rw-r--  1 lin lin 2632 Sep 30 10:44 dev.sh
-rw-rw-r--  1 lin lin 1332 Sep 29 19:17 Dockerfile
drwxrwxr-x  3 lin lin 4096 Sep 30 15:58 draft
drwxrwxr-x  2 lin lin 4096 Sep 30 16:10 drf
-rwxr-xr-x  1 lin lin  246 Sep 30 16:10 manage.py
-rw-rw-r--  1 lin lin 7135 Sep 30 16:10 README.md
-rw-rw-r--  1 lin lin   99 Sep 30 16:03 requirements.txt
drwxrwxr-x  2 lin lin 4096 Sep 29 10:38 script
drwxrwxr-x  2 lin lin 4096 Sep 30 12:10 test
-rw-rw-r--  1 lin lin  112 Sep 29 09:29 wordcount.py

$ ./manage.py syncdb
Operations to perform:
  Apply all migrations: admin, contenttypes, auth, sessions
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying sessions.0001_initial... OK

You have installed Django's auth system, and don't have any superusers defined.
Would you like to create one now? (yes/no): yes
Username : y12docker
Paasword : y12docker

$ nano drf/urls.py
$ nano drf/settings.py

$ ./manage.py runserver 0.0.0.0:8080
Performing system checks...

System check identified no issues (0 silenced).
September 30, 2014 - 08:23:55
Django version 1.7, using settings 'drf.settings'
Starting development server at http://0.0.0.0:8080/

```

Tue Sep 30 12:08:53 CST 2014

```
~/git/y12docker/prq$ nano test/test_system.py
~/git/y12docker/prq$ bash dev.sh -t
CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS                    NAMES
b27184e2ae3b        y12docker/prq:devtest   "/sbin/my_init"     21 seconds ago      Up 20 seconds       0.0.0.0:8980->8080/tcp   insane_sammet
stop a test image.
FOO=b27184e2ae3b y12docker/prq:devtest "/sbin/my_init" 21 seconds ago Up 20 seconds 0.0.0.0:8980->8080/tcp insane_sammet
b27184e2ae3b
[AFTER] stop the container
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
build a test image.
Sending build context to Docker daemon 7.538 MB
Sending build context to Docker daemon
Step 0 : FROM y12docker/pbase
 ---> c529b411cebe
Step 1 : RUN groupadd -r redis && useradd -r -g redis redis
 ---> Using cache
 ---> 0996df44762c
Step 2 : ENV REDIS_VERSION 2.8.13
 ---> Using cache
 ---> 1e8b22542bb4
Step 3 : ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-2.8.13.tar.gz
 ---> Using cache
 ---> 2b62df61497a
Step 4 : ENV REDIS_DOWNLOAD_SHA1 a72925a35849eb2d38a1ea076a3db82072d4ee43
 ---> Using cache
 ---> 7868d9a890eb
Step 5 : ENV BUILD_DEP gcc libc6-dev make python-dev
 ---> Using cache
 ---> b1152157b939
Step 6 : RUN apt-get update && apt-get install -y $BUILD_DEP --no-install-recommends
 ---> Using cache
 ---> fff6ea126dce
Step 7 : RUN mkdir -p /usr/src/redis  && curl -sSL "$REDIS_DOWNLOAD_URL" -o redis.tar.gz  && echo "$REDIS_DOWNLOAD_SHA1 *redis.tar.gz" | sha1sum -c -  && tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1  && rm redis.tar.gz  && make -C /usr/src/redis  && make -C /usr/src/redis install  && rm -r /usr/src/redis
 ---> Using cache
 ---> b02b2bb48dbc
Step 8 : RUN mkdir /data && chown redis:redis /data
 ---> Using cache
 ---> efb0340cba25
Step 9 : VOLUME /data
 ---> Using cache
 ---> bb55d94509e5
Step 10 : ENV REDIS_SRV /etc/service/redis/run
 ---> Using cache
 ---> 526986329e6a
Step 11 : ADD script/redis.sh $REDIS_SRV
 ---> Using cache
 ---> 106f73c64924
Step 12 : RUN chmod +x $REDIS_SRV
 ---> Using cache
 ---> 0b6bf02b7d39
Step 13 : ADD script/redis.conf /etc/redis/redis.conf
 ---> Using cache
 ---> 497d1d0cee49
Step 14 : ENV PRQ_SRV /etc/service/prq/run
 ---> Using cache
 ---> 7e5cd6523a07
Step 15 : ADD script/prq.sh $PRQ_SRV
 ---> Using cache
 ---> 00e6b82ad0a5
Step 16 : RUN chmod +x $PRQ_SRV
 ---> Using cache
 ---> 36eb3f91d9b2
Step 17 : ADD requirements.txt /app/requirements.txt
 ---> Using cache
 ---> f4813ca7ddf4
Step 18 : RUN pip install -r /app/requirements.txt
 ---> Using cache
 ---> 253fa1159882
Step 19 : ADD . /app
 ---> cecebd66476f
Removing intermediate container f84a8f6960a0
Step 20 : WORKDIR /app
 ---> Running in c351f08224e4
 ---> c4a6f692405d
Removing intermediate container c351f08224e4
Step 21 : RUN chown redis:redis /app
 ---> Running in a45586e64b91
 ---> d8e2e90d1be6
Removing intermediate container a45586e64b91
Step 22 : EXPOSE 8080
 ---> Running in c4fabf953a90
 ---> 438c147e6cef
Removing intermediate container c4fabf953a90
Step 23 : CMD ["/sbin/my_init"]
 ---> Running in 41af921ab195
 ---> ac54ee81f31b
Removing intermediate container 41af921ab195
Successfully built ac54ee81f31b
CONTAINER ID        IMAGE                   COMMAND             CREATED                  STATUS                  PORTS                    NAMES
68d6d1574985        y12docker/prq:devtest   "/sbin/my_init"     Less than a second ago   Up Less than a second   0.0.0.0:8980->8080/tcp   hopeful_hoover
[SystemTest] Container  68d6d157498572b5a41f71626c7653337bacdfdc677fd924fe1b2a6e9e2318c4
[SystemTest] boot and wait ....
......
----------------------------------------------------------------------
Ran 6 tests in 2.088s

OK

```

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