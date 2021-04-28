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
