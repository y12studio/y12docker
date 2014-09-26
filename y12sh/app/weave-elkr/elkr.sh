#!/bin/bash
# ------------------------------------------------------------------
# ELK log utility image build script
# ------------------------------------------------------------------

set -e

SUBJECT=logelk-build-image-id
VERSION=0.1.0
USAGE="Usage: build.sh -vh args"
DOCKER='sudo docker'
WEAVE='sudo weave'
IP_ELK=10.0.1.1
IP_REDIS=10.0.1.2
NAME_ELK=local/elkr-elk
NAME_REDIS=local/elkr-redis

#  
#  sudo weave launch 10.0.0.1/16
#

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    echo "$USAGE"
    exit 1;
fi

function cleandocker {
  $DOCKER rm $($DOCKER ps -a -q)
  $DOCKER rmi $($DOCKER images | grep "^<none>" | awk "{print $3}")
}

while getopts ":vhxbrs" optname; do
  case "$optname" in
    "v")
      echo "Version $VERSION"
      exit 0;
      ;;
    "x")
      echo "clean all stopped containers and all untagged images"
      cleandocker
      exit 0;
      ;;
    "b")
      sed "s/IP_REDIS_TO_ALTER/$IP_REDIS/" elk/logstash.conf.tpl > elk/logstash.conf
      sed "s/IP_COLLECTD_UDP_TO_ALTER/$IP_REDIS/" elk/collectd.conf.tpl > elk/collectd.conf
      $DOCKER build -t "$NAME_ELK" --rm=true elk
      rm elk/logstash.conf
      rm elk/collectd.conf
      $DOCKER build -t "$NAME_REDIS" --rm=true redis
      exit 0;
      ;;
    "r")
      $WEAVE run "$IP_REDIS"/24 -d -p 6379:6379 "$NAME_REDIS"
      $WEAVE run "$IP_ELK"/24 -d -p 9280:8080 -p 9200:9200 "$NAME_ELK"
      echo [AFTER] weave run the container
      $DOCKER ps
      exit 0;
      ;;
    "s")
      echo [BEFORE] stop the container
      $DOCKER ps
      # stop all containers with image's name local/elkr*
      $DOCKER ps -a | grep 'local/elkr' | awk '{print $1}' | xargs $DOCKER stop
      echo [AFTER] stop the container
      $DOCKER ps
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
