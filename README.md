# at_dockerfiles

Repo for Dockerfiles to create build, run and test images across multiple 
architectures.

## at-buildimage

Our own version of [google/dart](https://github.com/dart-lang/dart_docker) that
can run on multiple architectures (x86_64, armv7, arm64).

Crucially doesn't depend on apt to install dart (as packages not available for Arm)

Takes a build time ARG - DART_VERSION

Manual build:

```bash
DART_VERSION="2.12.4"
ARCH="arm"
sudo docker build -t atsigncompany/buildimage:$"DART_VERSION"-$"ARCH" \
--build-arg DART_VERSION=$"DART_VERSION" -f at-buildimage/Dockerfile .
```

Available on Dockerhub as [atsigncompany/buildimage](https://hub.docker.com/r/atsigncompany/buildimage)

## at-runimage

Our own version of [subfuzion/dart-docker-slim](https://github.com/subfuzion/dart-docker-slim)
that can run on multiple architectures (x86_64, armv7, arm64).

Manual build:

```bash
DART_VERSION="2.12.4"
ARCH="arm"
sudo docker build -t atsigncompany/runimage:$"DART_VERSION"-$"ARCH" \
-f at-runimage/Dockerfile .
```

Available on Dockerhub as [atsigncompany/runimage](https://hub.docker.com/r/atsigncompany/runimage)

### multi-arch manifest creation and push

```bash
DART_VERSION="2.12.4"
sudo docker manifest create atsigncompany/runimage:$"DART_VERSION" \
  --amend atsigncompany/runimage:$"DART_VERSION"-arm \
  --amend atsigncompany/runimage:$"DART_VERSION"-arm64 \
  --amend atsigncompany/runimage:$"DART_VERSION"-x64
  
sudo docker manifest push atsigncompany/runimage:$"DART_VERSION"
```

## dartshowplatform

Trivial application that prints out version information, including platform.

Used for testing multi stage, multi arch builds.

Manual build:

```bash
sudo docker build -t atsigncompany/dartshowplatform -f dartshowplatform/Dockerfile .
```

Run:

```bash
sudo docker run -it atsigncompany/dartshowplatform:automated
```

Expected output:

```log
2.12.4 (stable) (Thu Apr 15 12:26:53 2021 +0200) on "linux_arm64"
```

Available on Dockerhub as [atsigncompany/dartshowplatform](https://hub.docker.com/r/atsigncompany/dartshowplatform)

## Automation

There are three GitHub Actions workflows:

1. [buildimage.yml](.github/workflows/buildimage.yml) uses docker_build to build and push at-buildimage
for amd64 and arm64 platform.
2. [runimage.yml](.github/workflows/runimage.yml) uses docker_build to build and push at-runimage
for amd64 and arm64 platform.
3. [dartshowplatform.yml](.github/workflows/dartshowplatform.yml) uses docker_build to build and push dartshowplatform
for amd64 and arm64 platform.

### Why no armv7?

There are presently two issues with automating builds for armv7:

1. `buildimage.yml` fails to make a correct TLS connection to download Dart SDK.
2. `dartshowplatform.yml` gets `Unrecognized ARM CPU architecture.` coming from `dart2native` not being happy about the QEMU environment it finds itself in.

The Dockerfiles do work when run on a Raspberry Pi.

## Todo

Add parameters to automation for DART_VERSION to be passed in.

## License

The contents of this repository are licensed using the [Apache 2.0 License](LICENSE)
