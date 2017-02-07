FROM deepsea/base

EXPOSE 4505 4506

#TODO: 1. change to make install some day
# 2. make ip configurable
RUN zypper ar -G http://download.opensuse.org/repositories/home:/abhishekl:/branches:/home:/swiftgist/openSUSE_Leap_42.2/home:abhishekl:branches:home:swiftgist.repo &&\
    zypper ref && \
    zypper -n in salt-master salt-minion deepsea ceph hwinfo && \
    zypper clean -a && \
    systemctl enable salt-master && \
    systemctl enable salt-minion && \
    echo "autosign_file: /etc/salt/autosign_hosts.conf" > /etc/salt/master.d/autosign.conf && \
    echo "*" > /etc/salt/autosign_hosts.conf && \
    echo "master: 10.0.0.10" > /etc/salt/minion.d/minion.conf

ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [/entrypoint.sh]
