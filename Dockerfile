FROM centos:7.2.1511

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
        && yum update -y \
        && yum install -y \
        python2-pip \
        git \
        which \
        cmake \
        gcc-g++ \
        gcc-c++ \
        gcc-gfortran \
        environment-modules \
        ncurses-devel \
        libX11-devel \
        cmake3 \
        bzip2-devel \
        libxml2-devel \
        mesa-libGLU-devel \
        openssl-devel \
        bison \
        flex \
        libtool automake autoconf \
        libXft-devel \
        libXpm-devel \
        perl-ExtUtils-Embed \
        gettext-devel \
        libpng-devel \
        yaml-cpp-devel \
        boost-devel \
        zeromq-devel \
        texinfo \
        swig \
        python-devel
        xorg-x11-fonts-Type1 \
        doxygen \
        && yum remove -y pyparsing

RUN pip install --upgrade pip \
        && pip install matplotlib \
        certifi \
        ipython \
        pyparsing==2.1.10 \
        ipywidgets \
        ipykernel \
        metakernel \
        alibuild==1.4.0

RUN  yum install -y https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm && \
        yum update -y && \
        cvmfs cvmfs-config-default \

RUN mkdir -p /cvmfs/alice.cern.ch /cvmfs/alice-ocdb.cern.ch

COPY bashrc /root/.bashrc

COPY etc-cvmfs-default-local /etc/cvmfs/default.local

COPY cvmfs-startup.sh /cvmfs-startup.sh

RUN chmod +x /cvmfs-startup.sh


