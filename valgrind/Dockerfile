FROM ubuntu:noble@sha256:3afff29dffbc200d202546dc6c4f614edc3b109691e7ab4aa23d02b42ba86790

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
