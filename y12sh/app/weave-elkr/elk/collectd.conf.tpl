Hostname  "elk"
LoadPlugin load
LoadPlugin memory
LoadPlugin network
<Plugin network>
    <Server "IP_COLLECTD_UDP_TO_ALTER" "25826">
    </Server>
</Plugin>
