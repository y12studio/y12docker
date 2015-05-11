#!/bin/bash
docker run -v $(pwd)/fastwp:/fastwp y12docker/fastwp:4.2.2 /start.sh
sudo chown -R "$USER" fastwp
echo "===== AFTER INSTALL ====="
echo "cd fastwp && source alias.sh"
echo "dcup"
echo "wpinstall hostname_or_ip wp/plug2.txt"
