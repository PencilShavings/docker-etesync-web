# docker-etesync-web
An [EteSync web client](https://github.com/etesync/etesync-web) served using the [Caddy](https://hub.docker.com/_/caddy) webserver.


## Usage
### docker cmd
```bash
sudo docker run -p 80:80 docker.io/pencilshavings/etesync-web:0.6.1
```
### docker-compose
```yaml
version: '3.8'
services:
  etesync-web:
    image: docker.io/pencilshavings/etesync-web:0.6.1
    ports:
      - 80:80
    environment:
      - ETEBASE_URL=http://localhost:3735
    restart: unless-stopped
```

### Environment variables

| ENV | Value | Description |
| --- | ----- |----------- |
| ETEBASE_URL | http(s)://URL(:PORT) | Set the default URL to an address of a self-hosted EteBase server. Defaults to `api.etebase.com` |

## Mounting
Etesync-web is a standalone static site and does not require the need to mount any volumes.
That being said if you wish to access the files they can be found in `/usr/share/caddy`.

