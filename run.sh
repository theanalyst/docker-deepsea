#!/bin/bash
DOCKER_NETWORK=${DOCKER_NETWORK:-ceph}
BUILD=${1:-$RANDOM}
MINION_COUNT=${MINION_COUNT:-3}
OSD_SIZE=${OSD_SIZE:-1000}
echo "this is build:$BUILD"
docker network list | grep $DOCKER_NETWORK || docker network create $DOCKER_NETWORK --subnet 10.0.0.0/16 --gateway 10.0.0.1
docker run -d --tmpfs /tmp --tmpfs /run -v /sys/fs/cgroup/:/sys/fs/cgroup:ro --name $BUILD-deepsea-salt-master --hostname $BUILD-deepsea-salt-master --network $DOCKER_NETWORK --ip 10.0.0.10 deepsea/salt-master
sudo losetup -D
for i in {1..3}; do
    dd if=/dev/zero of=test-$BUILD-$i.img bs=1M count=$OSD_SIZE
    sleep 10
    sudo losetup /dev/loop$i test-$BUILD-$i.img
    docker run -d --tmpfs /tmp --tmpfs /run -v /sys/fs/cgroup/:/sys/fs/cgroup:ro --device /dev/loop$i --name $BUILD-deepsea-salt-minion-$i --hostname $BUILD-deepsea-salt-minion-$i --network $DOCKER_NETWORK deepsea/salt-minion
done
