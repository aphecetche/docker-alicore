FROM centos:7 

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm && \
    yum install -y centos-release-scl && \
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
        doxygen \
        devtoolset-6 rh-git29 \
        libpng-devel yaml-cpp-devel \
        python-requests python-pip python-devel curl-devel \
        vim

RUN cd /tmp && \
curl -O https://cmake.org/files/v3.8/cmake-3.8.2.tar.gz && \
tar -zvxf cmake-3.8.2.tar.gz && \
cd cmake-3.8.2 && \
./configure && \
make && make install && \
pip install --upgrade pip && pip install matplotlib numpy certifi ipython ipywidgets ipykernel notebook metakernel pyyaml alibuild

RUN mkdir -p /cvmfs/alice.cern.ch /cvmfs/alice-ocdb.cern.ch

COPY bashrc /root/.bashrc
COPY etc-cvmfs-default-local /etc/cvmfs/default.local

COPY cvmfs-startup.sh /cvmfs-startup.sh

RUN chmod +x /cvmfs-startup.sh


