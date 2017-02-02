FROM deepsea/base

EXPOSE 4505 4506

#TODO: 1. change to make install some day
# 2. make ip configurable
RUN zypper ar -G -f http://download.opensuse.org/repositories/home:swiftgist/openSUSE_Leap_42.1/home:swiftgist.repo &&\
    zypper ref && \
    zypper -n in salt-master salt-minion deepsea && \
    systemctl enable salt-master && \
    systemctl enable salt-minion && \
    echo "autosign_file: /etc/salt/autosign.conf" > /etc/salt/master.d/autosign.conf && \
    echo "*" > /etc/salt/autosign_hosts.conf && \
    echo "master: 10.0.0.10" > /etc/salt/minion.d/minion.conf

CMD ["/sbin/init"]
