[wordpress Repository | Docker Hub Registry - Repositories of Docker Images](https://registry.hub.docker.com/_/wordpress/)

```
$ docker-compose up -d
$ docker-compose ps
Name             Command             State              Ports
-------------------------------------------------------------------------
wpphp5_db_1        /docker-           Up                 3306/tcp
             entrypoint.sh
             mysqld
wpphp5_gcmt_1      python -m          Up
             SimpleHTTPServer
wpphp5_wordpress   /entrypoint.sh     Up                 0.0.0.0:8080->80
_1                 apache2-for ...                       /tcp

$ docker-compose logs

Attaching to wpphp5_gcmt_1, wpphp5_wordpress_1, wpphp5_db_1
gcmt_1      | Serving HTTP on 0.0.0.0 port 8000 ...
wordpress_1 | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.79. Set the 'ServerName' directive globally to suppress this message
wordpress_1 | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.79. Set the 'ServerName' directive globally to suppress this message
wordpress_1 | [Thu Apr 16 15:03:26.486931 2015] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.10 (Debian) PHP/5.6.7 configured -- resuming normal operations
wordpress_1 | [Thu Apr 16 15:03:26.487084 2015] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
db_1        | 150416 15:03:25 [Note] InnoDB: Using mutexes to ref count buffer pool pages
db_1        | 150416 15:03:25 [Note] InnoDB: The InnoDB memory heap is disabled
db_1        | 150416 15:03:25 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
db_1        | 150416 15:03:25 [Note] InnoDB: Memory barrier is not used
db_1        | 150416 15:03:25 [Note] InnoDB: Compressed tables use zlib 1.2.7
db_1        | 150416 15:03:25 [Note] InnoDB: Using Linux native AIO
db_1        | 150416 15:03:25 [Note] InnoDB: Not using CPU crc32 instructions
db_1        | 150416 15:03:25 [Note] InnoDB: Initializing buffer pool, size = 256.0M
db_1        | 150416 15:03:25 [Note] InnoDB: Completed initialization of buffer pool
db_1        | 150416 15:03:25 [Note] InnoDB: Highest supported file format is Barracuda.
db_1        | 150416 15:03:25 [Note] InnoDB: 128 rollback segment(s) are active.
db_1        | 150416 15:03:25 [Note] InnoDB: Waiting for purge to start
db_1        | 150416 15:03:25 [Note] InnoDB:  Percona XtraDB (http://www.percona.com) 5.6.22-72.0 started; log sequence number 2874334
db_1        | 150416 15:03:25 [Note] Plugin 'FEEDBACK' is disabled.
db_1        | 150416 15:03:25 [Note] Server socket created on IP: '::'.
db_1        | 150416 15:03:25 [Note] Event Scheduler: Loaded 0 events
db_1        | 150416 15:03:25 [Note] Reading of all Master_info entries succeded
db_1        | 150416 15:03:25 [Note] Added new Master_info '' to hash table
db_1        | 150416 15:03:25 [Note] mysqld: ready for connections.
db_1        | Version: '10.0.17-MariaDB-1~wheezy-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  mariadb.org binary distribution
db_1        | 150416 15:03:26 [Warning] IP address '172.17.0.79' could not be resolved: Name or service not known

```
