#!/bin/sh

if [ -n "${ETEBASE_URL}" ]; then
    echo "Updating REACT_APP_DEFAULT_API_PATH to ${ETEBASE_URL}"
    find /usr/share/caddy -type f -exec sed -i "s|https://api.etebase.com|${ETEBASE_URL}|g" {} \;
fi

# entrypoint.sh overides Caddys CMD entry.
# This is the default CMD from the offical Caddy container.
# CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile

