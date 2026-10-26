FROM ubuntu:noble@sha256:68ee22004a9109b44973313b02ff7b1de250f1de0f5ecb628d73f579aaff33ac

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
