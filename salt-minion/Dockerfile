FROM deepsea/base

RUN zypper ref && \
    zypper -n install salt-minion ceph hwinfo && \
    echo "master: 10.0.0.10" > /etc/salt/minion.d/minion.conf && \
    systemctl enable salt-minion && \
    zypper clean -a

CMD ["/sbin/init"]
