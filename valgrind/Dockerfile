FROM ubuntu:noble@sha256:1e622c5f073b4f6bfad6632f2616c7f59ef256e96fe78bf6a595d1dc4376ac02

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
