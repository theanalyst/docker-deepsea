FROM opensuse:leap

RUN cd /usr/lib/systemd/system/sysinit.target.wants/; \
/bin/bash -c 'for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done'; \
rm -f /usr/lib/systemd/system/multi-user.target.wants/*; \
rm -f /etc/systemd/system/*.wants/*; \
rm -f /usr/lib/systemd/system/local-fs.target.wants/*; \
rm -f /usr/lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /usr/lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /usr/lib/systemd/system/basic.target.wants/*;

VOLUME ["/sys/fs/cgroup"]

# systemd is running as a non init process
# this container is to be run as for. eg
# $ docker run -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro --tmpfs /tmp --tmpfs /run --name foo deepsea:systemd
CMD ["/usr/lib/systemd/systemd", "--system"]
