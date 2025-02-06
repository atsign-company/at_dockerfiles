# at_dockerfiles was deprecated

This repo was deprecated for a while as it was no longer needed when Arm
support found its way into the
[official Dart Docker image](https://github.com/dart-lang/dart-docker)

It's back in order to support the RISC-V instruction set architecture,
and as Debian doesn't yet support RISC-V in its stable release it
could be some time before there's RISC-V in the official Dart image.

## at-buildimage

Our own version of [dart](https://hub.docker.com/_/dart) that
can run on multiple architectures (x86_64, armv7, arm64, riscv64).

Takes a build time ARG - DART_VERSION (defaults to 3.5.2)

Manual build:

```bash
DART_VERSION="3.5.2"
ARCH="arm"
sudo docker build -t atsigncompany/buildimage:"$DART_VERSION"-"$ARCH" \
--build-arg DART_VERSION="$DART_VERSION" -f at-buildimage/Dockerfile .
```

or for RISC-V:

```bash
DART_VERSION="3.5.2"
ARCH="riscv"
RISCV64_SHA="db992347d0bab44ec6df1faac25ca73c5e12840e9f3a638cbd6a87d741655f50"
sudo docker build -t atsigncompany/buildimage:"$DART_VERSION"-"$ARCH" \
--build-arg DART_VERSION="$DART_VERSION" \
--build-arg RISCV64_SHA="$RISCV64_SHA" -f at-buildimage/Dockerfile.RV64 .
```

Available on Dockerhub as
[atsigncompany/buildimage](https://hub.docker.com/r/atsigncompany/buildimage)

NB the regular Dockerfile is just a wrapper around the library Dart official
image, used as a stepping stone to constructing the multi platform image with
RISC-V. Dockerfile.RV64 mimics the Dockerfile from the library image, with
added conditional logic for the riscv64 architecture. For now it is using
`ubuntu:noble` (24.04 LTS) as that distribution has official stable support
for RISC-V, which isn't yet available in Debian Stable (12 'Bookworm'). That
should change when Debian 13 'Trixie' is released, but at that stage it should
be possible to get RISC-V support into the official image and once again
deprecate this repo and associated images.

## dartshowplatform

Trivial application that prints out version information, including platform.

Used for testing multi stage, multi arch builds.

Manual build:

```bash
DART_VERSION="3.5.2"
ARCH="arm"
sudo docker build -t atsigncompany/dartshowplatform:"$DART_VERSION-$ARCH" \
--build-arg IMAGE_TAG="$DART_VERSION-$ARCH" -f dartshowplatform/Dockerfile .
```

Run:

```bash
sudo docker run -it atsigncompany/dartshowplatform:"$DART_VERSION-$ARCH"
```

Example output:

```log
3.5.2 (stable) (Wed Aug 28 10:01:20 2024 +0000) on "linux_riscv64"
```

Available on Dockerhub as
[atsigncompany/dartshowplatform](https://hub.docker.com/r/atsigncompany/dartshowplatform)

## valgrind

A container meant to be run locally which contains Linux only tools for C
development. Useful for development, memcheck testing, and debugging on MacOS
and Windows.

Run an ephemeral container for tests:

```sh
PROJECT_DIR="$PWD" # change to your project's working directory
docker run --rm --platform linux/amd64 \
  --mount type=bind,src=$PROJECT_DIR,dst=/mnt/workdir \
  --mount type=bind,src=$HOME/.atsign/keys,dst=/root/.atsign/keys \
  atsigncompany/valgrind:latest \
  <your test command>
```

Run a persistent shell in the container:

```sh
PROJECT_DIR="$PWD" # change to your project's working directory
docker run --rm --platform linux/amd64 -ti \
  --mount type=bind,src=$PROJECT_DIR,dst=/mnt/workdir \
  --mount type=bind,src=$HOME/.atsign/keys,dst=/root/.atsign/keys \
  atsigncompany/valgrind:latest \
  /bin/bash
```

Available on Dockerhub as
[atsigncompany/valgrind](https://hub.docker.com/r/atsigncompany/valgrind)

## Automation

There are two GitHub Actions workflows:

1. [autobuildall.yml](.github/workflows/autobuildall.yml) uses docker_build
to build and push at-buildimage and dartshowplatform for amd64, arm, arm64 &
riscv64 platforms.

2. [valgrind.yml](.github/workflows/valgrind.yml) uses docker_build
to build and push the valgrind image for amd64, arm & arm64 platforms.

## License

The contents of this repository are licensed using the [Apache 2.0 License](LICENSE)
