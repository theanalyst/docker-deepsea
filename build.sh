pushd systemd
docker build -t deepsea/base .
popd
pushd salt-master
docker build -t deepsea/salt-master .
popd
pushd salt-minion
docker build -t deepsea/salt-minion .
popd
