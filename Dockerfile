FROM centos:7 

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y centos-release-scl && \
    yum update -y && \
    yum install -y \
    git mysql-devel curl curl-devel \
    python python-devel python-pip \
    bzip2 bzip2-devel autoconf automake texinfo gettext gettext-devel \
    libtool freetype freetype-devel libpng libpng-devel sqlite sqlite-devel \
    ncurses-devel mesa-libGLU-devel libX11-devel libXpm-devel libXext-devel \
    libXft-devel libxml2 libxml2-devel motif motif-devel kernel-devel \
    pciutils-devel kmod-devel bison flex perl-ExtUtils-Embed environment-modules && \
    yum install -y \
    doxygen vim devtoolset-6 rh-git29 mariadb-devel perf gmp-devel && \
    curl -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python /tmp/get-pip.py && \
    pip install matplotlib==2.0.2 numpy certifi ipython==5.1.0 ipywidgets \
    ipykernel notebook metakernel pyyaml alibuild && \
    rm -f /etc/profile.d/modules* && \
    ln -si /usr/share/Modules/init/sh /etc/profile.d/modules.sh

RUN curl -OL https://www.haskell.org/platform/download/8.4.2/haskell-platform-8.4.2-unknown-posix--core-x86_64.tar.gz && \
    tar -zvxf haskell-platform-8.4.2-unknown-posix--core-x86_64.tar.gz && \
    . ./install-haskell-platform.sh && \
    rm -rf *.tar.gz install-has*


COPY bashrc /root/.bashrc



