# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:a642fca0473850425b8b62c9ab33fe14306ec80eb27a007f5f893e7357569451 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:f2b257f20955d6be2229bed86bad24193eeb8c4dc962a4031a6eb42344ffa457
COPY --from=builder /usr/bin/caddy /usr/bin/caddy