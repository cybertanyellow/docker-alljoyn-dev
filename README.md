docker-alljoyn-dev
==================

docker file for Allseen Alljoyn project develop, which base on dockerbase/android and add openwrt-buildroot packages

## Install docker
https://docs.docker.com/installation/ubuntulinux/ for ubuntu

https://docs.docker.com/installation/windows/ for windwos

## download and run pre-build docker images
docker run -t -i cybertanyellow/alljoyn-dev:0.1 /bin/bash

cd /src/alljoyn.repo/core/alljoyn

scons BINDINGS="cpp,java"...

## or do yourself
git clone https://github.com/cybertanyellow/docker-alljoyn-dev.git

cd docker-alljoyn-dev

make all run



References:
https://docs.docker.com/examples/running_ssh_service/

https://docs.docker.com/installation/ubuntulinux/

https://allseenalliance.org/docs-and-downloads/documentation/configuring-build-environment-linux-platform#unique_30
 
