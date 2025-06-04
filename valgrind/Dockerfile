FROM ubuntu:noble@sha256:b59d21599a2b151e23eea5f6602f4af4d7d31c4e236d22bf0b62b86d2e386b8f

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
