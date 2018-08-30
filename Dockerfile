# ref base: https://github.com/openthos/openthos/wiki/docker-ubuntu-14.04-for-aosp-5x

FROM ubuntu:14.04

ADD sources.list /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive

# ref: https://brickyang.github.io/2017/03/16/Docker%20%E4%B8%AD%E5%A6%82%E4%BD%95%E8%AE%BE%E7%BD%AE%20container%20%E7%9A%84%E6%97%B6%E5%8C%BA/
RUN echo "Asia/Taipei" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update

# CX install
RUN apt-get install -y gcc libc6-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc dpkg-dev lzop keychain
RUN apt-get install -y uuid uuid-dev liblz-dev liblzo2-2 liblzo2-dev lzop git-core curl u-boot-tools mtd-utils android-tools-fsutils

# For imx6 build need ref: https://blog.csdn.net/wulantian/article/details/11976511
RUN apt-get install -y bc

# Google advice
RUN apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip

# For x64 support ref: https://blog.csdn.net/tigerleap/article/details/8020091
RUN apt install -y lib32z1 lib32ncurses5 lib32bz2-1.0

RUN apt-get install -y git

# JDK ref: https://askubuntu.com/questions/464755/how-to-install-openjdk-8-on-14-04-lts
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk

# Env ref: https://blog.csdn.net/RonnyJiang/article/details/55812305
ENV USER=root
ENV LANG=C
ENV LC_ALL=C
ENV LC_COLLATE=C

WORKDIR /var/aosp
