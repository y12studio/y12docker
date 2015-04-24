install nginx
-------------
```
$ sudo apt-get update
$ sudo apt-get install nginx
$ curl http://localhost/
$ sudo cp app.localhost /etc/nginx/sites-available/
$ sudo ln -s /etc/nginx/sites-available/app.localhost /etc/nginx/sites-enabled/
$ sudo rm /etc/nginx/sites-enabled/default
$ sudo nano /etc/nginx/nginx.conf
# uncomment
server_names_hash_bucket_size 64;
$ sudo service nginx restart
```
test reverse proxy with a modified version of the /etc/hosts
----
```
$ cat /etc/hosts | grep localhost
127.0.0.1       localhost
127.0.0.1       node.localhost
127.0.0.1       py.localhost
127.0.0.1       php.localhost

$ docker-compose build
$ docker-compose up -d
Recreating nginxrp_phpsrv_1...
Recreating nginxrp_nodesrv_1...
Recreating nginxrp_pysrv_1...
$ docker-compose ps
      Name               Command         State          Ports
---------------------------------------------------------------------
nginxrp_nodesrv_1   npm start            Up      0.0.0.0:8180->80/tcp
nginxrp_phpsrv_1    apache2-foreground   Up      0.0.0.0:8280->80/tcp
nginxrp_pysrv_1     python ./app.py      Up      0.0.0.0:8080->80/tcp

$ curl http://localhost
<h1>Hello pysrv</h1>

$ curl http://php.localhost
<h1>Hello phpsrv</h1>

$ curl http://node.localhost
"<h1>hello nodesrv</h1>"

$ curl http://py.localhost
<h1>Hello pysrv</h1>

$ docker-compose logs
Attaching to nginxrp_pysrv_1, nginxrp_nodesrv_1, nginxrp_phpsrv_1
pysrv_1   |  * Running on http://0.0.0.0:80/ (Press CTRL+C to quit)
pysrv_1   | 172.17.42.1 - - [24/Apr/2015 09:41:51] "GET / HTTP/1.0" 200 -
pysrv_1   | 172.17.42.1 - - [24/Apr/2015 09:42:27] "GET / HTTP/1.0" 200 -
pysrv_1   | 172.17.42.1 - - [24/Apr/2015 09:48:36] "GET / HTTP/1.0" 200 -
nodesrv_1 |
nodesrv_1 | > nginx-rp-app@0.0.1 start /usr/src/app
nodesrv_1 | > node app.js
nodesrv_1 |
nodesrv_1 | myapp listening at http://[::]:80
phpsrv_1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.83. Set the 'ServerName' directive globally to suppress this message
phpsrv_1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.83. Set the 'ServerName' directive globally to suppress this message
phpsrv_1  | [Fri Apr 24 09:41:45.798150 2015] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.10 (Debian) PHP/5.6.8 configured -- resuming normal operations
phpsrv_1  | [Fri Apr 24 09:41:45.798324 2015] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
phpsrv_1  | 172.17.42.1 - - [24/Apr/2015:09:41:57 +0000] "GET / HTTP/1.0" 200 225 "-" "curl/7.35.0"


```

ref
---
[How To Install Nginx on Ubuntu 14.04 LTS | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-14-04-lts)

[How To Set Up Nginx Server Blocks (Virtual Hosts) on Ubuntu 14.04 LTS | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-14-04-lts)
