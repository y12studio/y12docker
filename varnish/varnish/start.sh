#!/bin/bash

for name in $(compgen -v Y_); do
    eval value=\$$name
    sed -i "s|${name}|${value}|g" /etc/varnish/default.vcl
done

echo "3============"
head -n 20 /etc/varnish/default.vcl
# Start varnish and log
varnishd -F -f /etc/varnish/default.vcl -a 0.0.0.0:${VARNISH_PORT}
#varnishd -F -b 'wordpress:80' -a :80
#varnishlog
