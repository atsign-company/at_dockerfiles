# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:47a19b0d310d09e226e9d7b9bcfb4bcc8fa7480d8903e2ebd40fa1512b9ce38c AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:224f38ecbc1996eb5c70d8c1c1aa28ea6821371278a0e971993d315e036ed734
COPY --from=builder /usr/bin/caddy /usr/bin/caddy