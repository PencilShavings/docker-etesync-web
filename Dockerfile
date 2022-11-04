FROM caddy:2.6.2 AS builder
RUN apk add --no-cache yarn
RUN wget https://github.com/etesync/etesync-web/archive/refs/tags/v0.6.1.tar.gz \
    ; \
    tar --strip-components=1 -xf v0.6.1.tar.gz
RUN yarn && yarn build

FROM caddy:2.6.2
COPY --from=builder /srv/build/ /usr/share/caddy
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
