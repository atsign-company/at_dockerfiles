# at_dockerfiles

Repo for Dockerfiles to create build, run and test images across multiple 
architectures.

## dartshowplatform

Trivial application that prints out version information, including platform.

Used for testing multi stage, multi arch builds.

```bash
sudo docker build -t atsigncompany/dartshowplatform -f dartshowplatform/Dockerfile .
```

## at-buildimage

Our own version of [google/dart](https://github.com/dart-lang/dart_docker) that
can run on multiple architectures (x86_64, armv7, arm64).

Crucially doesn't depend on apt to install dart (as packages not available for Arm)

Takes a build time ARG - DART_VERSION

```bash
sudo docker build -t atsigncompany/buildimage --build-arg DART_VERSION=2.12.4 -f at-buildimage/Dockerfile .
```

## at-runimage

Our own version of [subfuzion/dart-docker-slim](https://github.com/subfuzion/dart-docker-slim)
that can run on multiple architectures (x86_64, armv7, arm64).

```bash
DART_VERSION="2.12.4"
ARCH="arm64"
sudo docker build -t atsigncompany/runimage:$DART_VERSION-$ARCH -f at-runimage/Dockerfile .
```

### multi-arch manifest creation and push

```bash
sudo docker manifest create atsigncompany/runimage:latest \
  --amend atsigncompany/runimage:2.12.4-arm \
  --amend atsigncompany/runimage:2.12.4-arm64 \
  --amend atsigncompany/runimage:2.12.4-x64
  
sudo docker manifest push atsigncompany/runimage:2.12.4
```

## License

The contents of this repository are licensed using the [Apache 2.0 License](LICENSE)