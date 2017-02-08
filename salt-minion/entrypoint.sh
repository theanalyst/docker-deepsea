#!/bin/bash

/usr/lib/systemd/systemd --system &> systemd.log &
systemctl daemon-reload

systemctl start salt-minion
