#!/bin/bash
exec /sbin/setuser redis /usr/local/bin/redis-server /etc/redis/redis.conf 2>&1
