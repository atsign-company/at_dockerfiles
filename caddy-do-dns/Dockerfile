# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:27c8b3cb5de9e93685ad8b3302baf92b215e2fd413a86d090ba3c3fa427908d1 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:ad27e531c8b286ff153c0e6e16587a1583e4111bb58c4d83bd73d6d3ef0a0ce1
COPY --from=builder /usr/bin/caddy /usr/bin/caddy