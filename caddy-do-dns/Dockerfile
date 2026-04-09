# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:c54715e63a99f6bc427f6733749b71dd48fc036f9c4fcda10aa29fb278518ee0 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:fce4f15aad23222c0ac78a1220adf63bae7b94355d5ea28eee53910624acedfa
COPY --from=builder /usr/bin/caddy /usr/bin/caddy