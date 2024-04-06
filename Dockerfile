FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/dnspod \
    --with github.com/caddy-dns/alidns \
    --with github.com/caddy-dns/cloudflare

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
