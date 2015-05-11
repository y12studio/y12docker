#!/bin/bash
INSTALL_DIR=fastwp
DOCKER_IMG=y12docker/fastwp:4.2.2
docker run -v $(pwd)/${INSTALL_DIR}:/${INSTALL_DIR} ${DOCKER_IMG} /start.sh
sudo chown -R "$USER" ${INSTALL_DIR}
echo "===== AFTER INSTALL ====="
echo "cd fastwp && source alias.sh"
echo "dcup"
echo "wpinstall hostname_or_ip wp/plug2.txt"
