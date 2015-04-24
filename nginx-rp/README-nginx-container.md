Fri Apr 24 14:43:34 CST 2015
----------------------------

```
$ cat /etc/hosts | grep localhost
127.0.0.1       localhost
127.0.0.1       node.localhost
127.0.0.1       py.localhost
127.0.0.1       php.localhost
::1     localhost ip6-localhost ip6-loopback
$ docker-compose up -d
Recreating nginxrp_phpsrv_1...
Recreating nginxrp_nodesrv_1...
Recreating nginxrp_pysrv_1...
Recreating nginxrp_nginx_1...

$ docker-compose logs
Attaching to nginxrp_nginx_1, nginxrp_pysrv_1, nginxrp_nodesrv_1, nginxrp_phpsrv_1
pysrv_1   |  * Running on http://0.0.0.0:80/ (Press CTRL+C to quit)
nodesrv_1 |
nodesrv_1 | > nginx-rp-app@0.0.1 start /usr/src/app
nodesrv_1 | > node app.js
nodesrv_1 |
nodesrv_1 | myapp listening at http://[::]:80
phpsrv_1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.61. Set the 'ServerName' directive globally to suppress this message
phpsrv_1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.61. Set the 'ServerName' directive globally to suppress this message
phpsrv_1  | [Fri Apr 24 07:47:03.904954 2015] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.10 (Debian) PHP/5.6.8 configured -- resuming normal operations
phpsrv_1  | [Fri Apr 24 07:47:03.905024 2015] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'

$ docker-compose ps
      Name             Command             State              Ports
-------------------------------------------------------------------------
nginxrp_nginx_1    nginx -g daemon    Up                 443/tcp, 0.0.0.0
                   off;                                  :80->80/tcp
nginxrp_nodesrv_   npm start          Up                 0.0.0.0:8180->80
1                                                        /tcp
nginxrp_phpsrv_1   apache2-foregrou   Up                 0.0.0.0:8280->80
                   nd                                    /tcp
nginxrp_pysrv_1    python ./app.py    Up                 0.0.0.0:8080->80
                                                         /tcp
$ curl http://node.localhost
# RESULT ERROR

log
nginx_1   | 172.17.42.1 - - [24/Apr/2015:07:53:07 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.35.0" "-"

```
