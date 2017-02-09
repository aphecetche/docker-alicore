FROM centos:7.2.1511

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm && \
        yum update -y && \
        yum install -y git gettext-devel cmake3 \
        make wget which gcc gcc-c++ libtool automake autoconf zip \
        exinfo bison flex openssl-devel \
        libxml2-devel swig perl-ExtUtils-Embed \
        environment-modules \
        libX11-devel mesa-libGLU-devel libXpm-devel libXft-devel \
        gcc-gfortran bzip2 bzip2-devel python-pip tmux screen \
        ncurses-devel texinfo python-devel \
        xorg-x11-fonts-Type1 \
        cvmfs cvmfs-config-default \
        doxygen

RUN pip install alibuild==1.4.0

RUN yum install -y libpng-devel yaml-cpp-devel

RUN mkdir -p /cvmfs/alice.cern.ch /cvmfs/alice-ocdb.cern.ch

COPY bashrc /root/.bashrc
COPY etc-cvmfs-default-local /etc/cvmfs/default.local

COPY cvmfs-startup.sh /cvmfs-startup.sh

RUN chmod +x /cvmfs-startup.sh


