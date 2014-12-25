#!/bin/bash
cd /opt/mcf
java -Xmx1G -Xms1G -jar mcf_server.jar nogui 2>&1
