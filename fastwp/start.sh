#!/bin/bash
if [ ! -d "/fastwp" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo "/fastwp not found"
  echo "docker run -v \$(pwd)/fastwp:/fastwp y12docker/fastwp /dcbuild"
  exit 1
fi
# Copy files to /fastwp directory
cp -r /dcfiles/* /fastwp
DB_PASS=$(openssl rand -base64 15 | tr -d '+=/')
sed -i "s|Y_DB_PASS|${DB_PASS}|g" /fastwp/docker-compose.yml
