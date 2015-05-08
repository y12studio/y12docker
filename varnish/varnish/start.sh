#!/bin/bash

for name in $(compgen -v Y_VARNISH); do
    eval value=\$$name
    sed -i "s|${name}|${value}|g" /etc/varnish/default.vcl
done

head -n 20 /etc/varnish/default.vcl
# Start varnish and log
varnishd -F -f /etc/varnish/default.vcl -a :${VARNISH_PORT}
