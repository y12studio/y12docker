#!/bin/bash
#
# start app
# 
cd /app
exec /sbin/setuser redis python main.py &
sleep 3s
#
# start rqworker
#
exec /sbin/setuser redis rqworker 2>&1

