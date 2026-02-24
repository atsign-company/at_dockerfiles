# Based on https://github.com/caddy-dns/digitalocean
# but with SHA pinning rather than version ARG


FROM caddy:builder@sha256:d77a8c16fa27ac2ca567b3952480dd1bb21133fb543f7ad38d8e6b389c786d72 AS builder
RUN caddy-builder \
    github.com/caddy-dns/digitalocean

FROM caddy:alpine@sha256:0544c6c2fcdfefc8661828a3101906693af2267770bd5e93635f86557ff60188
COPY --from=builder /usr/bin/caddy /usr/bin/caddy