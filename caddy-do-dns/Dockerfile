# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:c94501daf39b91da9d8dcda6efffc40b6ae011a2530407872abea2df9ea4365c AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:834468128c7696cec0ceea6172f7d692daf645ae51983ca76e39da54a97c570d
COPY --from=builder /usr/bin/caddy /usr/bin/caddy