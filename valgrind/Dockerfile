FROM ubuntu:noble@sha256:59a458b76b4e8896031cd559576eac7d6cb53a69b38ba819fb26518536368d86

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
