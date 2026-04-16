# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:04453f802bb593790e8135ad1a33384c6efdd9b3db6a7bc95b31a8530bfaf14f AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:da4a361525d2beafe72351888897e63fa10b1462bb9b58145e21e601c876bd86
COPY --from=builder /usr/bin/caddy /usr/bin/caddy