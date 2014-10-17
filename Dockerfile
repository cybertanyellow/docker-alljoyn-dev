# sshd
#
# VERSION               0.0.1

FROM     dockerbase/android
MAINTAINER Yellow Cybertan "yellow.cybertan@gmail.com"

USER    root
# for OpenWRT build
RUN apt-get update
RUN apt-get install -y build-essential libgtk2.0-dev libssl-dev xsltproc libxml2-dev

# for Alljoyn
RUN apt-get install -y gcc-multilib g++-multilib libc6-i386 libc6-dev-i386 libssl-dev:i386 libxml2-dev:i386
RUN apt-get install -y python2.7 scons curl doxygen graphviz

RUN mkdir /src
RUN mkdir /src/bin
RUN curl https://commondatastorage.googleapis.com/git-repo-downloads/repo > /src/bin/repo
RUN chmod a+x /src/bin/repo

COPY uncrustify.sh /src/uncrustify.sh
RUN cat /src/uncrustify.sh
RUN /src/uncrustify.sh /src

RUN apt-get install -y subversion
RUN svn checkout http://googletest.googlecode.com/svn/trunk /src/gtest

ENV PATH $PATH:/src/bin

# checkout alljoyn
RUN mkdir /src/alljoyn.repo
RUN cd /src/alljoyn.repo && repo init -u https://git.allseenalliance.org/cgit/devtools/manifest.git -b master -m default.xml
RUN cd /src/alljoyn.repo && repo sync

RUN apt-get install -y openssh-server
RUN [ -d /var/run/sshd ] || mkdir /var/run/sshd
RUN grep screencast /etc/passwd || echo 'root:screencast' | chpasswd
RUN grep 'PermitRootLogin yes' /etc/ssh/sshd_config || sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
