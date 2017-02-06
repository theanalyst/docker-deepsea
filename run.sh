#!/bin/bash
DOCKER_NETWORK=${DOCKER_NETWORK:-ceph}
BUILD=${1:$RANDOM}
MINION_COUNT=${MINION_COUNT:3}
docker network list | grep $DOCKER_NETWORK || docker network create $DOCKER_NETWORK --subnet 10.0.0.0/16 --gateway 10.0.0.1
docker run -d --tmpfs --tmpfs /run -v /sys/fs/cgroup/:/sys/fs/cgroup:ro --name $BUILD-deepsea-salt-master --hostname $BUILD-deepsea-salt-master deepsea/salt-master

for i in {1..$MINION_COUNT}; do
    docker run -d --tmpfs --tmpfs /run -v /sys/fs/cgroup/:/sys/fs/cgroup:ro --name $BUILD-deepsea-salt-minion-$i --hostname $BUILD-deepsea-salt-minion-$i deepsea/salt-minion
done
