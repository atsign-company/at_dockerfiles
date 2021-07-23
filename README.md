# at_dockerfiles

Repo for Dockerfiles to create build, run and test images across multiple 
architectures.

## at-buildimage

Our own version of [dart](https://hub.docker.com/_/dart) that
can run on multiple architectures (x86_64, armv7, arm64).

Also adds git so that `dart pub get` works with git dependencies.

Takes a build time ARG - DART_VERSION (defaults to 2.13.0)

Manual build:

```bash
DART_VERSION="2.12.4"
ARCH="arm"
sudo docker build -t atsigncompany/buildimage:"$DART_VERSION"-"$ARCH" \
--build-arg DART_VERSION="$DART_VERSION" -f at-buildimage/Dockerfile .
```

Available on Dockerhub as [atsigncompany/buildimage](https://hub.docker.com/r/atsigncompany/buildimage)

### multi-arch manifest creation and push

```bash
DART_VERSION="2.12.4"
sudo docker manifest create atsigncompany/buildimage:"$DART_VERSION" \
  --amend atsigncompany/buildimage:"$DART_VERSION"-arm \
  --amend atsigncompany/buildimage:"$DART_VERSION"-arm64 \
  --amend atsigncompany/buildimage:"$DART_VERSION"-x64
  
sudo docker manifest push atsigncompany/buildimage:"$DART_VERSION"
```

## dartshowplatform

Trivial application that prints out version information, including platform.

Used for testing multi stage, multi arch builds.

Manual build:

```bash
DART_VERSION="2.12.4"
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
2.12.4 (stable) (Thu Apr 15 12:26:53 2021 +0200) on "linux_arm64"
```

Available on Dockerhub as [atsigncompany/dartshowplatform](https://hub.docker.com/r/atsigncompany/dartshowplatform)

## Automation

There's a single GitHub Actions workflows:

1. [buildall.yml](.github/workflows/buildall.yml) uses docker_build to 
build and push at-buildimage and dartshowplatform for amd64 and arm64
platforms. Then runs an arm build on a Raspberry Pi before bringing
all the builds together into a set of multi architecture manifests.

### Why isn't armv7 done in docker_build?

There are presently two issues with automating builds for armv7 in the buildx
action:

1. `buildimage.yml` fails to make a correct TLS connection to download Dart SDK.
2. `dartshowplatform.yml` gets `Unrecognized ARM CPU architecture.` coming from
`dart compile` not being happy about the QEMU environment it finds itself in.

## License

The contents of this repository are licensed using the [Apache 2.0 License](LICENSE)
