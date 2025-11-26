# at_dockerfiles is deprecated again

This repo was deprecated for a while as it was no longer needed when Arm
support found its way into the
[official Dart Docker image](https://github.com/dart-lang/dart-docker)

It was brought back to support the RISC-V instruction set architecture, but
now that the official Dart image has riscv64 builds it's no longer needed.

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

Available on Dockerhub as
[atsigncompany/buildimage](https://hub.docker.com/r/atsigncompany/buildimage)

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

## caddy-do-dns

The [Caddy](https://caddyserver.com/) reverse proxy with
[DigitalOcean DNS](https://github.com/caddy-dns/digitalocean) so that we can
get certificates using ACME services like LetsEncrypt with a DNS validation
rather than opening up port 80 for HTTP.

Available on Dockerhub as
[atsigncompany/caddy-do-dns](https://hub.docker.com/r/atsigncompany/caddy-do-dns)

## Automation

There are three GitHub Actions workflows:

1. [autobuildall.yml](.github/workflows/autobuildall.yml) uses docker_build
to build and push at-buildimage and dartshowplatform for amd64, arm, arm64 &
riscv64 platforms.

2. [valgrind.yml](.github/workflows/valgrind.yml) uses docker_build
to build and push the valgrind image for amd64, arm & arm64 platforms.

3. [caddy.yml](.github/workflows/caddy.yml) uses docker_build
to build and push the caddy-do-dns image for amd64.


## License

The contents of this repository are licensed using the [Apache 2.0 License](LICENSE)

## Docker image signing

This repo is the source for a number of Docker images, and they're signed
during the build process so that you can verify their authenticity using
[cosign](https://github.com/sigstore/cosign):

```sh
cosign verify atsigncompany/buildimage:automated \
--certificate-oidc-issuer=https://token.actions.githubusercontent.com \
--certificate-identity-regexp='^https://github.com/atsign-company/at_dockerfiles/.+'
```
