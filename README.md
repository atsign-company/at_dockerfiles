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

Takes a build time ARG - DART_VERSION (defaults to 2.18.4)

Manual build:

```bash
DART_VERSION="2.18.4"
ARCH="arm"
sudo docker build -t atsigncompany/buildimage:"$DART_VERSION"-"$ARCH" \
--build-arg DART_VERSION="$DART_VERSION" -f at-buildimage/Dockerfile .
```

Available on Dockerhub as
[atsigncompany/buildimage](https://hub.docker.com/r/atsigncompany/buildimage)

## dartshowplatform

Trivial application that prints out version information, including platform.

Used for testing multi stage, multi arch builds.

Manual build:

```bash
DART_VERSION="2.18.4"
ARCH="arm"
sudo docker build -t atsigncompany/dartshowplatform:"$DART_VERSION-$ARCH" \
--build-arg IMAGE_TAG="$DART_VERSION-$ARCH" -f dartshowplatform/Dockerfile .
```

Run:

```bash
sudo docker run -it atsigncompany/dartshowplatform:automated
```

Example output:

```log
2.18.4 (stable) (Tue Nov 1 15:15:07 2022 +0000) on "linux_arm64"
```

Available on Dockerhub as
[atsigncompany/dartshowplatform](https://hub.docker.com/r/atsigncompany/dartshowplatform)

## Automation

There's a single GitHub Actions workflows:

1. [autobuildall.yml](.github/workflows/autobuildall.yml) uses docker_build
to build and push at-buildimage and dartshowplatform for amd64, arm, arm64 &
riscv64 platforms.

## License

The contents of this repository are licensed using the [Apache 2.0 License](LICENSE)
