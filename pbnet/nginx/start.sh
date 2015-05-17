#!/bin/bash

for name in $(compgen -v Y_); do
    eval value=\$$name
    sed -i "s|${name}|${value}|g" /etc/nginx/conf.d/default.conf
done

nginx -g 'daemon off;'
