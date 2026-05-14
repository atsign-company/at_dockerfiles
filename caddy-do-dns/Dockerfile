# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:c5ffb4c1f30a85b8895083d9826a72ffff318d75652c010dc8391d80827a2bd6 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:195776f0132302e6cebc592da06be51386d291db7f82e70caf954b564439c33b
COPY --from=builder /usr/bin/caddy /usr/bin/caddy