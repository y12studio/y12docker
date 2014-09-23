#!/bin/bash
TARGET_IP=$REDIS_1_PORT_6379_TCP_ADDR
if [ -z "$TARGET_IP" ]; then
    TARGET_IP=localhost
fi
sed -i "s/localhost/$HOSTNAME/;s/10.0.0.1/$TARGET_IP/" $CTDCONF
collectd -C $CTDCONF -f