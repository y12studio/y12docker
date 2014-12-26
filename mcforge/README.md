## Docker Image for Minecraft Forge

Fri Dec 26 14:09:32 CST 2014

rebuild 1.8 version

```
$ docker build -t y12docker/mcforge:1.8 .
$ CID=$(docker run -d -p=25565:25565 y12docker/mcforge:1.8)
$ sudo docker-bash $CID

```


downgrade ver to 1.7.10-Recommended	10.13.2.1230	1.7.10

Fri Dec 26 13:01:31 CST 2014

```
$ docker build -t y12docker/mcforge:1.7.10 .
$ CID=$(docker run -d -p=25565:25565 y12docker/mcforge:1.7.10)
$ sudo docker-bash $CID


```


Thu, 25 Dec 2014 07:10:09 +0000
```
$ CID=$(docker run -d -p=25565:25565 y12docker/mcforge:1.8.1412)
$ docker ps
CONTAINER ID        IMAGE                        COMMAND             CREATED             STATUS              PORTS                      NAMES
f6839d790831        y12docker/mcforge:1.8.1412   "/sbin/my_init"     5 seconds ago       Up 5 seconds        0.0.0.0:25565->25565/tcp   sad_bartik
$ sudo docker-bash $CID
root@de4b80359f5f:/opt/mcf# ls -al
total 13028
drwxr-xr-x 7 root root     4096 12月 25 08:56 .
drwxr-xr-x 7 root root     4096 12月 25 08:50 ..
-rw-r--r-- 1 root root        2 12月 25 08:50 banned-ips.json
-rw-r--r-- 1 root root        2 12月 25 08:50 banned-players.json
drwxr-xr-x 2 root root     4096 12月 25 08:50 config
-rw-r--r-- 1 root root       10 12月 25 07:00 eula.txt
drwxr-xr-x 6 root root     4096 12月 25 06:48 libraries
drwxr-xr-x 2 root root     4096 12月 25 08:50 logs
-rw-r--r-- 1 root root  2897121 12月 25 06:48 mcf_server.jar
-rw-r--r-- 1 root root 10375504 12月 25 06:47 minecraft_server.1.8.jar
drwxr-xr-x 2 root root     4096 12月 25 08:50 mods
-rw-r--r-- 1 root root        2 12月 25 08:50 ops.json
-rw-rw-r-- 1 root root      758 12月 25 08:56 server.properties
-rw-r--r-- 1 root root        2 12月 25 08:50 usercache.json
-rw-r--r-- 1 root root       52 12月 25 08:56 usernamecache.json
-rw-r--r-- 1 root root        2 12月 25 08:50 whitelist.json
drwxr-xr-x 8 root root     4096 12月 25 09:13 world
root@de4b80359f5f:/opt/mcf# exit
$ docker stop $CID
```

Thu Dec 25 13:09:34 CST 2014

```
$ docker build -t y12docker/mcforge:1.8.1412 .
$ CID=$(docker run -d y12docker/mcforge:1.8.1412)
$ docker ps
CONTAINER ID        IMAGE                        COMMAND             CREATED             STATUS              PORTS               NAMES
d1c65f217fc9        y12docker/mcforge:1.8.1412   "/sbin/my_init"     4 seconds ago       Up 3 seconds                            pensive_wilson

$ sudo docker-bash $CID

root@4af611bd4f31:/# cd /opt/mcf
root@4af611bd4f31:/opt/mcf# java -jar mcf_server.jar nogui
[07:04:01] [Server thread/INFO] [FML]: Config directory created successfully
[07:04:01] [Server thread/INFO] [FML]: Searching /opt/mcf/mods for mods
[07:04:02] [Server thread/INFO] [FML]: Forge Mod Loader has identified 3 mods to load
[07:04:03] [Server thread/INFO] [FML]: Attempting connection with missing mods [mcp, FML, Forge] at CLIENT
[07:04:03] [Server thread/INFO] [FML]: Attempting connection with missing mods [mcp, FML, Forge] at SERVER
[07:04:03] [Server thread/INFO] [FML]: Processing ObjectHolder annotations
[07:04:03] [Server thread/INFO] [FML]: Found 384 ObjectHolder annotations
[07:04:03] [Server thread/INFO] [FML]: Configured a dormant chunk cache size of 0
[07:04:03] [Server thread/INFO] [FML]: Applying holder lookups
[07:04:03] [Server thread/INFO] [FML]: Holder lookups applied
[07:04:03] [Server thread/INFO]: Loading properties
[07:04:03] [Server thread/WARN]: server.properties does not exist
[07:04:03] [Server thread/INFO]: Generating new properties file
[07:04:03] [Server thread/INFO]: Default game type: SURVIVAL
[07:04:03] [Server thread/INFO]: Generating keypair
[07:04:04] [Server thread/INFO]: Starting Minecraft server on *:25565
[07:04:05] [Server thread/INFO] [FML]: Forge Mod Loader has successfully loaded 3 mods

```
