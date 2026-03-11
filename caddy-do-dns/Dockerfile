# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:84dfc3479309c690643ada9279b3e0b4352ce56b0ec8fd802c668f42b546e98f AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:fce4f15aad23222c0ac78a1220adf63bae7b94355d5ea28eee53910624acedfa
COPY --from=builder /usr/bin/caddy /usr/bin/caddy