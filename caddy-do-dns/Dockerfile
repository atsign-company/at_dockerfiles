# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:472b384553e37f446d82d73c70340567da67fd6fb7386d4514dcb5d8c670c90d AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:7f4c19ed8c32f961644681823de1a2fe5b74c84a45d0f3995286010c84b6c554
COPY --from=builder /usr/bin/caddy /usr/bin/caddy