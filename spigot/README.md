## Docker Image for Minecraft Spigot

* [Installation | SpigotMC - High Performance Minecraft](http://www.spigotmc.org/wiki/spigot-installation/)
* [Puharesource/TitleManager](https://github.com/Puharesource/TitleManager)

Sat Dec 27 18:46:06 CST 2014
Disable log4j2.xml/test plugins

```
$ docker build -t y12docker/spigot:1.8 .
$ CID=$(docker run -d -p=25565:25565 y12docker/spigot:1.8)
$ sudo docker-bash $CID
# cat logs/latest.log
[10:37:43 INFO]: Preparing spawn area: 71%
[10:37:44 INFO]: [TitleManager] Enabling TitleManager v1.3.3
[10:37:44 WARN]: [TitleManager] Vault is not enabled! Disabling permissions and economy based variables!
[10:37:44 INFO]: Done (26.676s)! For help, type "help" or "?"
```

Sat Dec 27 16:15:20 CST 2014

new spigot.sh with log4j2.xml (DEBUG only show minecraft join)

```
$ docker build -t y12docker/spigot:1.8 .
$ CID=$(docker run -d -p=25565:25565 y12docker/spigot:1.8)
$ sudo docker-bash $CID
# cat logs/latest.log
[08:17:08] [Server thread/INFO]: Starting minecraft server version 1.8
[08:17:08] [Server thread/INFO]: Loading properties
[08:17:08] [Server thread/INFO]: Default game type: SURVIVAL
[08:17:09] [Server thread/INFO]: This server is running CraftBukkit version git-
Spigot-6d85d97-b389396 (MC: 1.8) (Implementing API version 1.8-R0.1-SNAPSHOT)
[08:17:09] [Server thread/INFO]: Unable to find file banned-players.json, creati
ng it.
[08:17:09] [Server thread/INFO]: Unable to find file banned-ips.json, creating i
t.
[08:17:09] [Server thread/INFO]: Unable to find file ops.json, creating it.
[08:17:09] [Server thread/INFO]: Unable to find file whitelist.json, creating it
.
[08:17:09] [Server thread/INFO]: Server Ping Player Sample Count: 12
[08:17:09] [Server thread/INFO]: Using 4 threads for Netty based IO
[08:17:09] [Server thread/INFO]: Debug logging is disabled
[08:17:09] [Server thread/INFO]: Generating keypair
[08:17:10] [Server thread/INFO]: Starting Minecraft server on *:25565
[08:17:11] [Server thread/INFO]: **** Beginning UUID conversion, this may take A
LONG time ****
[08:17:11] [Server thread/INFO]: Preparing level "world"
[08:17:11] [Server thread/INFO]: -------- World Settings For [world] --------
[08:17:11] [Server thread/INFO]: Mob Spawn Range: 4
[08:17:11] [Server thread/INFO]: Anti X-Ray: true
.........
.........
[08:18:49] [Netty Server IO #2/DEBUG]: Set listener of net.minecraft.server.v1_8
_R1.NetworkManager@744207f2 to net.minecraft.server.v1_8_R1.LoginListener@7e511b
6e
[08:18:55] [User Authenticator #1/DEBUG]: Opening connection to https://sessions
erver.mojang.com/session/minecraft/hasJoined?serverId=xxxxxxxx&username=XXXX
[08:18:55] [User Authenticator #1/DEBUG]: Reading data from https://sessionserve
r.mojang.com/session/minecraft/hasJoined?serverId=xxxxxxx&username=XXXX
[08:18:57] [User Authenticator #1/DEBUG]: Successful read, server response was 2
00
[08:18:57] [User Authenticator #1/DEBUG]: Response: {"id":"9d943b0e586a485688324
c9efa2562b4","name":"XXXX","properties":[{"name":"textures","value":"xxxx","signature":"xx"}]}
[08:18:57] [User Authenticator #1/INFO]: UUID of player XXXX is 9d943b0e-586a-48
56-8832-4c9efa2562b4
[08:18:57] [Server thread/DEBUG]: Set listener of net.minecraft.server.v1_8_R1.N
etworkManager@744207f2 to net.minecraft.server.v1_8_R1.PlayerConnection@3bea673e
[08:18:57] [Server thread/DEBUG]: Disabled auto read

[08:18:57] [Netty Server IO #2/DEBUG]: Enabled auto read
[08:18:58] [Server thread/INFO]: XXXX[/192.168.2.2:2110] logged in with entity i
d 2557 at ([world] -256.5, 65.0, 254.5)
[08:19:08] [Server thread/INFO]: XXXX has just earned the achievement [Taking In
ventory]
[08:19:08] [Server thread/WARN]: XXXX moved too quickly! -10.85405790285995,1.0,
-10.294742441551648 (10.85405790285995, 1.0, 10.294742441551648)
[08:20:15] [Server thread/INFO]: XXXX has just earned the achievement [Getting W
ood]
[08:20:40] [Server thread/INFO]: XXXX has just earned the achievement [Benchmark
ing]
[08:21:15] [Server thread/INFO]: XXXX has just earned the achievement [Time to S
trike!]
[08:22:48] [Server thread/INFO]: XXXX has just earned the achievement [Cow Tippe
r]
[08:31:09] [Server thread/INFO]: XXXX was slain by Zombie
```

Sat Dec 27 15:45:27 CST 2014


```
$ CID=$(docker run -d -p=25565:25565 y12docker/spigot:1.8)
$ sudo docker-bash $CID
root@e246d9488719:/opt/spigot# tail logs/latest.log
[07:40:34] [Server thread/INFO]: Preparing spawn area: 38%
[07:40:35] [Server thread/INFO]: Preparing spawn area: 55%
[07:40:36] [Server thread/INFO]: Preparing spawn area: 78%
[07:40:37] [Server thread/INFO]: Done (54.258s)! For help, type "help" or "?"
[07:41:37] [User Authenticator #1/INFO]: UUID of player XXXX is xxxxxxxxxx-586a-4556-1232-xxxxxxxxxxxxxxx
[07:41:38] [Server thread/INFO]: XXXX[/192.168.2.2:1419] logged in with entity id 1788 at ([world] 56.5, 73.0, 251.5)
[07:41:55] [Server thread/INFO]: XXXX has just earned the achievement [Taking Inventory]
[07:42:48] [Server thread/INFO]: XXXX has just earned the achievement [Getting Wood]
[07:43:11] [Server thread/INFO]: XXXX has just earned the achievement [Benchmarking]
[07:43:37] [Server thread/INFO]: XXXX has just earned the achievement [Time to Strike!]
[07:58:27] [Server thread/INFO]: XXXX was shot by Skeleton
```


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
