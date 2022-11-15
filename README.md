# at_dockerfiles is deprecated

We no longer need a repo for Dockerfiles to create build, run and test images
across multiple architectures as the
[official Dart Docker image](https://github.com/dart-lang/dart-docker) now
[supports multiple architectures](https://github.com/dart-lang/dart-docker/pull/53).

We have switched to using `FROM dart` rather than 
`FROM atsigncompany/buildimage` for our own projects.

For now, the automation will be left in place to keep the buildimage updated.

Here's the history of what this did when we still needed it:

## at-buildimage

Our own version of [dart](https://hub.docker.com/_/dart) that
can run on multiple architectures (x86_64, armv7, arm64).

Also adds git so that `dart pub get` works with git dependencies.

Takes a build time ARG - DART_VERSION (defaults to 2.18.4)

Manual build:

```bash
DART_VERSION="2.18.4"
ARCH="arm"
sudo docker build -t atsigncompany/buildimage:"$DART_VERSION"-"$ARCH" \
--build-arg DART_VERSION="$DART_VERSION" -f at-buildimage/Dockerfile .
```

Available on Dockerhub as [atsigncompany/buildimage](https://hub.docker.com/r/atsigncompany/buildimage)

### multi-arch manifest creation and push

```bash
DART_VERSION="2.18.4"
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

Available on Dockerhub as [atsigncompany/dartshowplatform](https://hub.docker.com/r/atsigncompany/dartshowplatform)

## Automation

There's a single GitHub Actions workflows:

1. [autobuildall.yml](.github/workflows/autobuildall.yml) uses docker_build
to build and push at-buildimage and dartshowplatform for amd64, arm64 & arm
platforms.

## License

The contents of this repository are licensed using the [Apache 2.0 License](LICENSE)
