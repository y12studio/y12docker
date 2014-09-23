#!/bin/bash
TARGET_IP=$REDIS_1_PORT_6379_TCP_ADDR
if [ -z "$TARGET_IP" ]; then
    TARGET_IP=localhost
fi
sed -i "s/TARGET_IP_ADDR/$TARGET_IP/" $LS_CONF
/opt/logstash/bin/logstash agent -f $LS_CONF

