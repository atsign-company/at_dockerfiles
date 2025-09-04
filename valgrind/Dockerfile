FROM ubuntu:noble@sha256:9cbed754112939e914291337b5e554b07ad7c392491dba6daf25eef1332a22e8

RUN useradd -ms /bin/bash atsign; \
  apt-get update; \
  apt-get upgrade -y; \
  apt-get install -y git-core \
  build-essential \
  ninja-build \
  sudo \
  curl \
  clang \
  just \
  valgrind \
  gcc \
  cmake;

USER atsign
ENV HOME=/home/atsign
ENV USER=atsign
WORKDIR /mnt/workdir

CMD [ "tail", "-f", "/dev/null" ]
