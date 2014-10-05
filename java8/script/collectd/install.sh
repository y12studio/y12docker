#!/bin/bash
# ------------------------------------------------------------------
# ELK log utility image build script
# ------------------------------------------------------------------

set -e

SUBJECT=y12docker-java8-logstash-install-id
VERSION=0.1.0
USAGE="Usage: install.sh -vh args"
DOCKER='sudo docker'

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    echo "$USAGE"
    exit 1;
fi

while getopts ":vhi" optname; do
  case "$optname" in
    "v")
      echo "Version $VERSION"
      exit 0;
      ;;
    "i")
      echo install logstash
      mkdir -p /opt/conf
      cp collectd.conf /opt/conf/
      mkdir -p /etc/service/collectd
      cp collectd.sh /etc/service/collectd/run
      chmod +x /etc/service/collectd/run
      sudo apt-get install -y collectd
      rm -rf /tmp/* /var/tmp/*
      exit 0;
      ;;
    "h")
      echo "$USAGE"
      exit 0;
      ;;
    "?")
      echo "Unknown option $OPTARG"
      exit 0;
      ;;
    ":")
      echo "No argument value for option $OPTARG"
      exit 0;
      ;;
    *)
      echo "Unknown error while processing options"
      exit 0;
      ;;
  esac
done

shift "$($OPTIND - 1)"

# -----------------------------------------------------------------

LOCK_FILE=/tmp/${SUBJECT}.lock

if [ -f "$LOCK_FILE" ]; then
echo "Script is already running"
exit
fi

# -----------------------------------------------------------------
trap 'rm -f $LOCK_FILE' EXIT
touch $LOCK_FILE
