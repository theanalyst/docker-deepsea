#!/bin/bash
DOCKER_NETWORK=${DOCKER_NETWORK:-ceph}
BUILD=${1:-$RANDOM}
MINION_COUNT=${MINION_COUNT:-3}
OSD_SIZE=${OSD_SIZE:-1000}
echo "this is build:$BUILD"
docker network list | grep $DOCKER_NETWORK || docker network create $DOCKER_NETWORK --subnet 10.0.0.0/16 --gateway 10.0.0.1
docker run -d --tmpfs --tmpfs /run -v /sys/fs/cgroup/:/sys/fs/cgroup:ro --name $BUILD-deepsea-salt-master --hostname $BUILD-deepsea-salt-master deepsea/salt-master
for i in {1..$MINION_COUNT}; do
    dd if=/dev/zero of=test-$build-$i.img bs=1M count=$OSD_SIZE
    sudo losetup /dev/disk-$build-$i $build-$i.img
    docker run -d --tmpfs --tmpfs /run -v /sys/fs/cgroup/:/sys/fs/cgroup:ro --device /dev/disk-$build-$i --name $BUILD-deepsea-salt-minion-$i --hostname $BUILD-deepsea-salt-minion-$i deepsea/salt-minion
done
