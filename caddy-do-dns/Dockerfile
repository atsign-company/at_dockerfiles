# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:403d237d0bb16d2e62b1f93ca9ebb4953ecbb78aee5986765713a39f9263a5b4 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:eb4d35b7452d1ab6171fbdbe8d9275b2301dad6dad92115d91e19fb9b24d510f
COPY --from=builder /usr/bin/caddy /usr/bin/caddy