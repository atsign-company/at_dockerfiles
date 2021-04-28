FROM debian:stable

ARG DART_VERSION="2.12.4"
ARG ARCH="x64"

WORKDIR /tmp/

RUN \
  apt-get -q update && apt-get install --no-install-recommends -y -q \
    gnupg2 curl git ca-certificates unzip openssh-client && \
  curl -O https://storage.googleapis.com/dart-archive/channels/stable/release/$DART_VERSION/sdk/dartsdk-linux-$ARCH-release.zip && \
  unzip dartsdk-linux-$ARCH-release.zip -d /usr/lib/ && \
  rm dartsdk-linux-$ARCH-release.zip && \
  mv /usr/lib/dart-sdk /usr/lib/dart

ENV DART_SDK /usr/lib/dart
ENV PATH $DART_SDK/bin:/root/.pub-cache/bin:$PATH
