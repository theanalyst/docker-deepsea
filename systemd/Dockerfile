FROM opensuse:leap

RUN zypper ref && zypper in -y systemd-sysvinit

VOLUME ["/sys/fs/cgroup"]

CMD ["/sbin/init"]
