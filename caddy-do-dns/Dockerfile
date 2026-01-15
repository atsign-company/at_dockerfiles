# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:efb93f7af011ef86c2eea10700a1a6fa8d1d99228f2dd94f7c2a12192e44d3c9 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446
COPY --from=builder /usr/bin/caddy /usr/bin/caddy