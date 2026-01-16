# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:f556cebc3c90b8fdc068364e13c320d460ed9b3445e46dda6589c7993a7d115c AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446
COPY --from=builder /usr/bin/caddy /usr/bin/caddy