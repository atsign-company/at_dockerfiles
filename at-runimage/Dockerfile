# Originally based on subfuzion/dart-docker-slim
FROM atsigncompany/buildimage AS dart

# Do all the copying here first
RUN \
  mkdir -p /output \
  case `uname -m` in armv7l | armv7) ARCH="arm-linux-gnueabihf"; \
    cp /lib/ld-linux-armhf.so.3 /output/lib/ld-linux-armhf.so.3; \
    cp /lib/arm-linux-gnueabihf/ld-linux-armhf.so.3 /lib/arm-linux-gnueabihf/ld-linux-armhf.so.3;; \
    aarch64) ARCH="aarch64-linux-gnu"; \
    cp /lib/ld-linux-aarch64.so.1 /output/lib/ld-linux-aarch64.so.1; \
    cp /lib/aarch64-linux-gnu/ld-linux-aarch64.so.1 /output/lib/aarch64-linux-gnu/ld-linux-aarch64.so.1;; \
    *) ARCH="x86_64-linux-gnu"; \
    cp /lib64/ld-linux-x86-64.so.2 /output/lib64/ld-linux-x86-64.so.2;; esac && \
  cp /lib/$ARCH/libdl.so.2 /output/lib/$ARCH/libdl.so.2 && \
  cp /lib/$ARCH/libc.so.6 /output/lib/$ARCH/libc.so.6 && \
  cp /lib/$ARCH/libm.so.6 /output/lib/$ARCH/libm.so.6 && \
  cp /lib/$ARCH/librt.so.1 /output/lib/$ARCH/librt.so.1 && \
  cp /lib/$ARCH/libpthread.so.0 /output/lib/$ARCH/libpthread.so.0 && \
  cp /lib/$ARCH/libnss_dns.so.2 /output/lib/$ARCH/libnss_dns.so.2 && \
  cp /lib/$ARCH/libresolv.so.2 /output/lib/$ARCH/libresolv.so.2 && \
  cp /etc/nsswitch.conf /output/etc/nsswitch.conf && \
  cp /etc/resolv.conf /output/etc/resolv.conf && \
  cp /usr/share/ca-certificates /output/usr/share/ca-certificates && \
  cp /etc/ssl/certs /etc/ssl/certs

FROM scratch
COPY --from=dart /output /
COPY etc-hosts /etc/hosts