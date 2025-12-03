# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:fe404674d209455fdef351db5437758ee0e70a6b59abe770663c09cfa05dbddf AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446
COPY --from=builder /usr/bin/caddy /usr/bin/caddy