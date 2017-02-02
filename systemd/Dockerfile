FROM opensuse:leap

RUN zypper ref && zypper in -y systemd-sysvinint

VOLUME ["/sys/fs/cgroup"]

CMD ["/sbin/init"]
