## Docker Image for Minecraft Glowstone server

Fri Dec 26 12:22:29 CST 2014

```
$ docker build -t y12docker/glowstone:14.12.109 .
$ docker run -i -t y12docker/glowstone:14.12.109 /bin/bash
# my_init
04:25:50 [INFO] This server is running Glowstone version 1.8-143-g978b3e7-b109 (Implementing API version 1.8-R1-SNAPSHOT)
04:25:50 [INFO] Created default config: config/glowstone.yml
04:25:51 [INFO] Recipes: 295 shaped, 63 shapeless, 24 furnace, 15 fuels.
04:25:51 [INFO] Downloading sqlite-jdbc 3.8.7...
04:25:59 [INFO] Downloading mysql-connector-java 5.1.34...
04:26:03 [INFO] Preparing spawn for world...
04:26:04 [INFO] Preparing spawn for world: 17%
04:26:05 [INFO] Preparing spawn for world: 54%
04:26:06 [INFO] Preparing spawn for world: 97%
04:26:06 [INFO] Preparing spawn for world: done
04:26:06 [INFO] Preparing spawn for world_nether...
04:26:07 [INFO] Preparing spawn for world_nether: 46%
04:26:08 [INFO] Preparing spawn for world_nether: done
04:26:08 [INFO] Preparing spawn for world_the_end...
04:26:09 [INFO] Preparing spawn for world_the_end: done
04:26:09 [INFO] Created default config: config/commands.yml
04:26:09 [INFO] Created default config: config/permissions.yml
04:26:09 [INFO] Binding to address: 0.0.0.0/0.0.0.0:25565...
04:26:09 [INFO] Successfully bound to: /0:0:0:0:0:0:0:0:25565
04:26:09 [INFO] Ready for connections.

exit

$ CID=$(docker run -d  -p=25565:25565 y12docker/glowstone:14.12.109)
$ docker ps
CONTAINER ID        IMAGE                           COMMAND             CREATED             STATUS              PORTS                      NAMES
88fb4467e585        y12docker/glowstone:14.12.109   "/sbin/my_init"     15 seconds ago      Up 14 seconds       0.0.0.0:25565->25565/tcp   modest_brattain
$ sudo docker-bash $CID
root@88fb4467e585:/# ls -al /opt/gs
total 7820
drwxr-xr-x 7 root root    4096 12月 26 04:29 .
drwxr-xr-x 4 root root    4096 12月 26 04:29 ..
drwxr-xr-x 2 root root    4096 12月 26 04:29 config
-rw-r--r-- 1 root root 7976688 12月 26 04:23 glowstone.jar
drwxr-xr-x 2 root root    4096 12月 26 04:29 lib
drwxr-xr-x 2 root root    4096 12月 26 04:29 logs
drwxr-xr-x 2 root root    4096 12月 26 04:29 plugins
drwxr-xr-x 5 root root    4096 12月 26 04:29 worlds

root@88fb4467e585:/# ls -al /opt/gs/config
total 36
drwxr-xr-x 2 root root 4096 12月 26 04:29 .
drwxr-xr-x 7 root root 4096 12月 26 04:29 ..
-rw-r--r-- 1 root root    2 12月 26 04:29 banned-ips.json
-rw-r--r-- 1 root root    2 12月 26 04:29 banned-players.json
-rw-r--r-- 1 root root  413 12月 26 04:29 commands.yml
-rw-r--r-- 1 root root  627 12月 26 04:29 glowstone.yml
-rw-r--r-- 1 root root    2 12月 26 04:29 ops.json
-rw-r--r-- 1 root root  384 12月 26 04:29 permissions.yml
-rw-r--r-- 1 root root    2 12月 26 04:29 whitelist.json

Window 7 x64 Minecraft Modern 1.8.1 / Crafting Issue
```
