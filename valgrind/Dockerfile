FROM ubuntu:noble@sha256:72297848456d5d37d1262630108ab308d3e9ec7ed1c3286a32fe09856619a782

RUN apt-get update; \
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
  cmake

WORKDIR /mnt/workdir

CMD [ "tail", "-f", "/dev/null" ]
