# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:b96b5e7c1fc8bed78b81a80957e29bd581db9ed5b951c44bcb3a0c780ea23997 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:195776f0132302e6cebc592da06be51386d291db7f82e70caf954b564439c33b
COPY --from=builder /usr/bin/caddy /usr/bin/caddy