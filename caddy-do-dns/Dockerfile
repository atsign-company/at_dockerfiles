# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:403d237d0bb16d2e62b1f93ca9ebb4953ecbb78aee5986765713a39f9263a5b4 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:d8542f48d34a9cf4e4c11a478865229840e87e4c96ea3f439101f31a5d35f75f
COPY --from=builder /usr/bin/caddy /usr/bin/caddy