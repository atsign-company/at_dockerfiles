# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:00dfa5f39333243282c82d73de2acfe0609cb4a7879eb96946dcdfbf3a27ff87 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:d266901f6e0c9d74528463654b7e872e6af8f6bbe23ca13576a1fb601202f8da
COPY --from=builder /usr/bin/caddy /usr/bin/caddy