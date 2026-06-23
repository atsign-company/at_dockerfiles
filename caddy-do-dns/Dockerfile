# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:2cffe63dc72e3ea610f70a6bd4b11a4d1c873000e191f1bf59aae88d464906c5 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:c2af7d9004854180322ffd6f81b918874cee01f629084ab4d8ac0b96aa442432
COPY --from=builder /usr/bin/caddy /usr/bin/caddy