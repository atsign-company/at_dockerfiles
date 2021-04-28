# Dockerfiles

Repo for Dockerfiles to create build, run and test images across multiple 
architectures.

## Platform

Trivial application that prints out version information, including platform.

## at-buildimage

Our own version of google/dart that can run on multiple architectures (x86_64,
armv7, arm64)

Takes two build time ARGs - DART_VERSION and ARCH [x64:arm:arm64]:

```bash
sudo docker build -t atsigncompany/buildimage --build-arg DART_VERSION=2.12.4 --build-arg ARCH=arm .
```

## at-runimage

Our own version of subfuzion/dart-docker-slim that can run on multiple architectures
(x86_64, armv7, arm64).

There are separate Dockerfiles for each architecture as each COPYs completely different libraries.

```bash
sudo docker build -t atsigncompany/runimage:2.12.4-arm -f Dockerfile.arm .
```

### multi-arch manifest creation and push

```bash
sudo docker manifest create atsigncompany/runimage:latest \
  --amend atsigncompany/runimage:2.12.4-arm \
  --amend atsigncompany/runimage:2.12.4-arm64 \
  --amend atsigncompany/runimage:2.12.4-x64
  
sudo docker manifest push atsigncompany/runimage:2.12.4
```
