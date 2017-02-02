FROM deepsea/base

RUN zypper ref && \
    zypper -n install salt-minion && \
    echo "master: 10.0.0.10" > /etc/salt/minion.d/minion.conf && \
    systemctl enable salt-minion

CMD ["/sbin/init"]
