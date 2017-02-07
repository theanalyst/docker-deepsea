#!/bin/bash

systemd --system &> systemd.log &
systemctl daemon-reload

echo "master_minion: `hostname`" > /srv/pillar/ceph/master_minion.sls
systemctl start salt-master
systemctl start salt-minion
echo "sending mine functions"
salt "*" mine.send cephdisks.list
