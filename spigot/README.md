## Docker Image for Minecraft Spigot

[Installation | SpigotMC - High Performance Minecraft](http://www.spigotmc.org/wiki/spigot-installation/)

Fri Dec 26 14:37:25 CST 2014

```
$ docker build -t y12docker/spigot:1.8 .

....
Success! Everything compiled successfully. Copying final .jar files now.
Copying craftbukkit-1.8-R0.1-SNAPSHOT.jar to /opt/spigot/.
- Saved as craftbukkit-1.8.jar
Copying spigot-1.8-R0.1-SNAPSHOT.jar to /opt/spigot/.
- Saved as spigot-1.8.jar
....

$ CID=$(docker run -d -p=25565:25565 y12docker/spigot:1.8)
$ sudo docker-bash $CID

root@870e77a2fb90:/# ls -al /opt/spigot
total 41164
drwxr-xr-x 7 root root     4096 12月 26 07:01 .
drwxr-xr-x 6 root root     4096 12月 26 07:00 ..
-rw-r--r-- 1 root root        2 12月 26 07:01 banned-ips.json
-rw-r--r-- 1 root root        2 12月 26 07:01 banned-players.json
-rw-r--r-- 1 root root  3024443 12月 23 22:31 BuildTools.jar
-rw-r--r-- 1 root root     1291 12月 26 07:01 bukkit.yml
-rw-r--r-- 1 root root      610 12月 26 07:01 commands.yml
-rw-r--r-- 1 root root 19422540 12月 26 06:56 craftbukkit-1.8.jar
-rw-r--r-- 1 root root       10 12月 26 06:56 eula.txt
-rw-r--r-- 1 root root     2576 12月 26 07:01 help.yml
drwxr-xr-x 2 root root     4096 12月 26 07:00 logs
-rw-r--r-- 1 root root        2 12月 26 07:01 ops.json
drwxr-xr-x 3 root root     4096 12月 26 07:01 plugins
-rw-rw-r-- 1 root root      737 12月 26 07:01 server.properties
-rw-r--r-- 1 root root 19624885 12月 26 06:56 spigot-1.8.jar
-rw-r--r-- 1 root root     3228 12月 26 07:01 spigot.yml
-rw-r--r-- 1 root root        2 12月 26 07:01 usercache.json
-rw-r--r-- 1 root root        2 12月 26 07:01 whitelist.json
drwxr-xr-x 5 root root     4096 12月 26 07:01 world
drwxr-xr-x 5 root root     4096 12月 26 07:01 world_nether
drwxr-xr-x 5 root root     4096 12月 26 07:01 world_the_end

```
