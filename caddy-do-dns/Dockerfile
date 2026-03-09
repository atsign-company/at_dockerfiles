# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:d4f984844fc3b867ac88fd814285a38eaaf5b3ecadb9ca1b3b0397182ef60cfe AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:fce4f15aad23222c0ac78a1220adf63bae7b94355d5ea28eee53910624acedfa
COPY --from=builder /usr/bin/caddy /usr/bin/caddy