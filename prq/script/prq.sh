#!/bin/bash
#
# start app
# 
cd /app
exec /sbin/setuser redis python manage.py runserver 0.0.0.0:8080 &
sleep 3s
#
# start rqworker
#
exec /sbin/setuser redis rqworker 2>&1

