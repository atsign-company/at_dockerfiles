# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:9780b126deae015b2c262fa9f4f1f951577e1f6a5fe4d88c0573aeb622071b2d AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:3b2a0196e0687279c14c27adff9fc6b44acfa318dbb97eaebe385bdf99e5364c
COPY --from=builder /usr/bin/caddy /usr/bin/caddy