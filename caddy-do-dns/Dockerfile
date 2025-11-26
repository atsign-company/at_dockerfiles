# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:6e3ed727ce8695fc58e0a8de8e5d11888f6463c430ea5b40e0b5f679ab734868 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446
COPY --from=builder /usr/bin/caddy /usr/bin/caddy